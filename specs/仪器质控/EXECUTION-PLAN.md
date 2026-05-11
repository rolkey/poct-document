# 仪器质控模块 — 实施执行计划

> **状态**: 待审核 | **日期**: 2026-05-10 | **总工期**: ~15 人天

---

## 执行概览

| Phase | 产出 | 文件数 | 工期 |
|-------|------|--------|------|
| Phase 1 | PostgreSQL DDL + 种子数据 | 1 SQL 文件 | 0.5d |
| Phase 2 | MySQL 菜单 + 权限 | 1 SQL 文件 | 0.5d |
| Phase 3 | 后端 Java 代码 | ~60 文件 | 5d |
| Phase 4 | 前端 Vue/TS 代码 | ~20 文件 | 5d |
| Phase 5 | 构建验证 | — | 1d |

---

## Phase 1: PostgreSQL — 建表 + 种子数据

### 1.1 新建 SQL 文件

**路径**: `document/sql/qc-module-ddl.sql`

**内容**: 12 张表的完整 DDL（含注释、索引、唯一约束、外键）

> ⚠️ 所有 ID 用 `bigint` 匹配现有表（`lis_comm_instrument.instrument_id` 实际为 `bigint`）
> ⚠️ 所有表包含 6 个公共字段：`create_dept bigint`, `create_by bigint`, `create_time timestamp`, `update_by bigint`, `update_time timestamp`, `tenant_id varchar(20)`

#### 表清单

```
lis_qc_material               — 4.2.1 质控品基础信息
lis_qc_material_batch         — 4.2.1 质控品批次/入库
lis_qc_rule                   — 4.2.2 Westgard 规则字典
lis_qc_rule_config            — 4.2.2 仪器/项目规则配置
lis_qc_plan                   — 4.2.3 质控计划
lis_qc_record                 — 4.2.4 质控执行记录
lis_qc_ooc_record             — 4.2.6 失控处理记录
lis_qc_ooc_cause_dict         — 4.2.6 失控原因字典
lis_qc_comparison             — 4.2.7 一致性比对主表
lis_qc_comparison_detail      — 4.2.7 比对样本明细
lis_qc_eqa_plan               — 4.2.8 EQA 计划
lis_qc_eqa_record             — 4.2.8 EQA 执行记录
```

### 1.2 种子数据

| 表 | 行数 | 内容 |
|----|------|------|
| `lis_qc_rule` | 6 | W1_2S(警告), W1_3S(失控), W2_2S(失控), R_4S(失控), W4_1S(失控), W10_X(失控) |
| `lis_qc_ooc_cause_dict` | 7 | 设备故障、定标漂移、质控品变质、试剂过期、操作误差、环境因素、其他 |

### 1.3 执行方式

```bash
docker exec -i cloud-postgres psql -U postgres -d his-lis < document/sql/qc-module-ddl.sql
```

---

## Phase 2: MySQL — 菜单 + 权限

### 2.1 新建 SQL 文件

**路径**: `document/sql/qc-module-menu.sql`

**内容**: 31 条 `INSERT INTO sys_menu`（1 目录 + 8 菜单 + 22 按钮）

### 2.2 菜单结构

```
parent_id=2043614171223891970（基础参数）, order_num=5
  ├── [M] 质控管理
  │     ├── [C] 质控品管理       — path=/lis/config/qcMaterial
  │     │     └── [F] × 5       :list / :add / :edit / :remove / :export
  │     ├── [C] 质控规则配置     — path=/lis/config/qcRule
  │     │     └── [F] × 2       :list / :edit
  │     ├── [C] 质控计划         — path=/lis/config/qcPlan
  │     │     └── [F] × 2       :list / :edit
  │     ├── [C] 质控执行         — path=/lis/config/qcExecution
  │     │     └── [F] × 3       :list / :add / :export
  │     ├── [C] 失控处理         — path=/lis/config/qcOoc
  │     │     └── [F] × 3       :list / :handle / :unlock
  │     ├── [C] 一致性比对       — path=/lis/config/qcComparison
  │     │     └── [F] × 3       :list / :edit / :export
  │     ├── [C] 室间质评         — path=/lis/config/qcEqa
  │     │     └── [F] × 2       :list / :edit
  │     └── [C] 质控报表         — path=/lis/config/qcReport
  │           └── [F] × 2       :view / :export
```

> ⚠️ menu_id 使用雪花算法，参考现有最大值 `2052000000000000070`，从 `2053000000000000001` 开始递增。

### 2.3 权限码分配

后续将 `lis:qc:*` 权限码批量分配给管理员角色（`sys_role_menu`）。

### 2.4 执行方式

```bash
docker exec -i cloud-mysql8 mysql -u ruoyi -p'Ruoyi@111' ry-cloud < document/sql/qc-module-menu.sql
```

---

## Phase 3: 后端 Java 代码

### 3.1 模块拆分策略

12 张表 → 6 套标准 CRUD + 2 套特殊 Controller：

| # | 后端模块 | 对应表 | 特殊逻辑 |
|---|----------|--------|----------|
| 1 | QcMaterial | `lis_qc_material` + `lis_qc_material_batch` | 批次子表、唯一性校验 |
| 2 | QcRule | `lis_qc_rule` + `lis_qc_rule_config` | 规则配置子表 |
| 3 | QcPlan | `lis_qc_plan` | 纯 CRUD |
| 4 | QcRecord | `lis_qc_record` | 判定引擎、查询 API（供 LJ 图） |
| 5 | QcOoc | `lis_qc_ooc_record` + `lis_qc_ooc_cause_dict` | 状态流转逻辑 |
| 6 | QcComparison | `lis_qc_comparison` + `lis_qc_comparison_detail` | 偏倚计算 |
| 7 | QcEqa | `lis_qc_eqa_plan` + `lis_qc_eqa_record` | 文件上传 |
| 8 | QcReport | （只读查询） | 聚合统计、导出 |

### 3.2 文件清单（每套 7 文件）

以 QcMaterial 为例，每套遵循以下模板：

```
his-common/his-common-lis/src/main/java/org/rolkey/his/lis/
├── domain/qc/
│   ├── LisQcMaterial.java           # Entity (@TableName, @TableId, extends BaseEntity, String PK)
│   ├── LisQcMaterialBatch.java      # Entity
│   ├── bo/qc/
│   │   ├── LisQcMaterialBo.java     # BO (@AutoMapper, extends BaseEntity, @NotNull(EditGroup) on PK)
│   │   └── LisQcMaterialBatchBo.java
│   └── vo/qc/
│       ├── LisQcMaterialVo.java     # VO (@AutoMapper, @ExcelProperty, implements Serializable, String PK)
│       └── LisQcMaterialBatchVo.java
├── mapper/qc/
│   ├── LisQcMaterialMapper.java     # @DS("his-lis") extends BaseMapperPlus<Entity, Vo>
│   └── LisQcMaterialBatchMapper.java
├── service/qc/
│   ├── ILisQcMaterialService.java   # 6 方法接口
│   └── impl/qc/
│       └── LisQcMaterialServiceImpl.java  # @Slf4j @Service, buildQueryWrapper, validEntityBeforeSave
│
his-modules/his-module-lis/src/main/java/org/rolkey/his/lis/controller/qc/
└── LisQcMaterialController.java     # @Validated @RestController @RequestMapping("/qc/material"), 6 端点
```

> 🔑 **PK 类型规范**：DB 用 `bigint`，Java 层（Entity / BO / VO）统一用 `String`，前端 TS 用 `string`。MyBatis-Plus 自动处理 `bigint ↔ String` 映射，Jackson 序列化为 `String` 防 JS 大数精度丢失。这是已验证的正确模式。

### 3.3 总计文件数

| 层 | 文件数 |
|----|--------|
| Entity | 12 |
| BO | 12 |
| VO | 12 |
| Mapper | 10（合并部分子表到同一 Mapper）|
| Service Interface | 8 |
| Service Impl | 8 |
| Controller | 8 |
| **合计** | **~70** |

### 3.4 Controller 端点清单

#### QcMaterialController (`/qc/material`)
```
GET    /list         — 分页查询质控品     (lis:qc:material:list)
GET    /{id}         — 查详情              (lis:qc:material:query)
POST                  — 新增质控品         (lis:qc:material:add)
PUT                   — 修改质控品         (lis:qc:material:edit)
DELETE /{ids}         — 删除质控品         (lis:qc:material:remove)
POST   /export       — 导出               (lis:qc:material:export)
GET    /batch/list   — 批次列表（子表）    (lis:qc:material:list)
POST   /batch        — 批次入库（子表）    (lis:qc:material:add)
```

#### QcRuleController (`/qc/rule`)
```
GET    /list         — 分页查询规则配置    (lis:qc:rule:list)
GET    /{id}         — 查详情
POST                  — 新增规则配置        (lis:qc:rule:edit)
PUT                   — 修改规则配置        (lis:qc:rule:edit)
DELETE /{ids}         — 删除
GET    /dict/list    — 规则字典（只读）     (lis:qc:rule:list)
```

#### QcPlanController (`/qc/plan`)
```
GET    /list         — 分页查询计划        (lis:qc:plan:list)
GET    /{id}         — 查详情
POST                  — 新增计划            (lis:qc:plan:edit)
PUT                   — 修改计划            (lis:qc:plan:edit)
DELETE /{ids}         — 删除
```

#### QcRecordController (`/qc/record`)
```
GET    /list         — 分页查询记录        (lis:qc:execution:list)
GET    /{id}         — 查详情
POST                  — 手工录入 + 自动判定  (lis:qc:execution:add)
GET    /chart/data   — LJ 质控图数据       (lis:qc:execution:list)
POST   /export       — 导出               (lis:qc:execution:export)
```

#### QcOocController (`/qc/ooc`)
```
GET    /list         — 分页查询失控记录    (lis:qc:ooc:list)
GET    /{id}         — 查详情
POST   /handle       — 填写原因+措施       (lis:qc:ooc:handle)
POST   /{id}/unlock  — 解除锁定            (lis:qc:ooc:unlock)
GET    /cause/list   — 失控原因字典        (lis:qc:ooc:list)
```

#### QcComparisonController (`/qc/comparison`)
```
GET    /list         — 分页查询比对        (lis:qc:comparison:list)
GET    /{id}         — 查详情
POST                  — 新增比对            (lis:qc:comparison:edit)
PUT                   — 修改比对            (lis:qc:comparison:edit)
DELETE /{ids}         — 删除
GET    /{id}/detail  — 比对明细列表        (lis:qc:comparison:list)
POST   /{id}/detail  — 录入比对明细        (lis:qc:comparison:edit)
POST   /export       — 导出比对报告        (lis:qc:comparison:export)
```

#### QcEqaController (`/qc/eqa`)
```
GET    /plan/list    — 分页查询计划        (lis:qc:eqa:list)
POST   /plan         — 新增计划            (lis:qc:eqa:edit)
PUT    /plan         — 修改计划            (lis:qc:eqa:edit)
DELETE /plan/{ids}   — 删除计划
GET    /record/list  — 分页查询记录        (lis:qc:eqa:list)
POST   /record       — 录入结果+上传文件    (lis:qc:eqa:edit)
```

#### QcReportController (`/qc/report`)
```
GET    /inControlRate     — 在控率/失控率统计    (lis:qc:report:view)
GET    /monthly           — 月度质控报告          (lis:qc:report:view)
GET    /trend             — 项目趋势分析          (lis:qc:report:view)
GET    /instrumentRate    — 设备合格率            (lis:qc:report:view)
POST   /export/pdf        — 导出 PDF              (lis:qc:report:export)
POST   /export/excel      — 导出 Excel            (lis:qc:report:export)
```

### 3.5 核心业务逻辑要点

| 逻辑 | 位置 | 说明 |
|------|------|------|
| 批次唯一性校验 | `LisQcMaterialBatchServiceImpl.validEntityBeforeSave()` | `material_id + instrument_id + lot_no` 三重唯一 |
| Westgard 判定引擎 | `LisQcRecordServiceImpl.judgeResult()` | 接收 test_value，查 rule_config，按规则顺序判定 |
| 失控自动锁定 | `LisQcRecordServiceImpl.insertByBo()` | 判定为 OOC → 插入 `lis_qc_ooc_record` + 标记仪器锁定 |
| 解除锁定 | `LisQcOocServiceImpl.unlock()` | 复查记录在控 → ooc_status=UNLOCKED → 恢复仪器权限 |
| 偏倚计算 | `LisQcComparisonServiceImpl.calcBias()` | bias = abs(test_value - target_value) |
| 合格率计算 | `LisQcComparisonServiceImpl.calcPassRate()` | pass_rate = pass_samples / total_samples * 100 |

---

## Phase 4: 前端 Vue/TS 代码

### 4.1 文件清单

```
poct-ui-lis/src/
├── api/lis/
│   ├── qcMaterial/index.ts + types.ts       # 4.2.1
│   ├── qcRule/index.ts + types.ts           # 4.2.2
│   ├── qcPlan/index.ts + types.ts           # 4.2.3
│   ├── qcRecord/index.ts + types.ts         # 4.2.4
│   ├── qcOoc/index.ts + types.ts            # 4.2.6
│   ├── qcComparison/index.ts + types.ts     # 4.2.7
│   ├── qcEqa/index.ts + types.ts            # 4.2.8
│   └── qcReport/index.ts + types.ts         # 4.2.9
│
├── views/config/qc/
│   ├── qcMaterial/index.vue                 # 质控品列表 + 批次子表
│   ├── qcRule/index.vue                     # 规则配置
│   ├── qcPlan/index.vue                     # 质控计划
│   ├── qcRecord/index.vue                   # 执行记录 + 手工录入弹窗
│   ├── qcOoc/index.vue                      # 失控处理列表 + 状态流转
│   ├── qcComparison/index.vue               # 比对主表 + 明细子表
│   ├── qcEqa/index.vue                      # EQA 计划 + 记录
│   └── qcReport/index.vue                   # 统计报表 + 图表
│
└── components/qc/
    ├── LjChart.vue                          # Levey-Jennings 质控图（ECharts）
    └── OocDialog.vue                        # 失控处理弹窗
```

### 4.2 页面复杂度

| 页面 | 模式 | 特殊组件 |
|------|------|----------|
| qcMaterial | 标准 CRUD + 子表 | 效期状态标签、水平颜色标签、批次子表弹窗 |
| qcRule | 标准 CRUD | 多选规则 checkbox、mean/SD 数值输入 |
| qcPlan | 标准 CRUD | 频率类型下拉多选 |
| qcRecord | 表格 + 录入弹窗 | 状态标签（绿/黄/红）、LJ 图嵌入 |
| qcOoc | 表格 + 流程 | `el-steps` 状态展示、处理弹窗 |
| qcComparison | 标准 CRUD + 明细 | 明细子表、自动计算偏倚/合格率 |
| qcEqa | 标准 CRUD | 文件上传组件 |
| qcReport | 纯查询 + 图表 | ECharts 折线图/柱状图 + 导出按钮 |

### 4.3 TypeScript 类型规范

> 💡 PK 字段统一用 `string`。Java Entity/BO/VO 全部用 `String`（DB `bigint` 由 MyBatis-Plus 自动转换），JSON 输出直接为字符串，避免雪花 ID 精度丢失。这是已验证的正确模式。

```typescript
// types.ts 模板（以 qcMaterial 为例）
export interface QcMaterialVO {
  materialId: string;        // ✅ string（防大数精度丢失）
  materialName: string;
  testItemId: number;
  level: string;             // 'LOW' | 'MEDIUM' | 'HIGH'
  manufacturer: string;
  regCertNo: string;
  storageTemp: string;
  status: string;
  // ...公共字段
}

export interface QcMaterialForm {
  materialId?: number;
  materialName: string;
  // ...
}

export interface QcMaterialQuery extends PageQuery {
  materialName?: string;
  testItemId?: number;
  level?: string;
  // ...
}
```

### 4.4 API 调用模板

```typescript
// index.ts 模板
import request from "@/utils/request";
import { QcMaterialVO, QcMaterialForm, QcMaterialQuery } from "./types";
import { useServiceStore } from "@/store/modules/services";

const hisLis = () => useServiceStore().apiUrl.hisLis;
const BASE = () => `/${hisLis()}/qc/material`;

export const listQcMaterial = (query?: QcMaterialQuery) =>
  request({ url: `${BASE()}/list`, method: "get", params: query });

export const getQcMaterial = (id: number) =>
  request({ url: `${BASE()}/${id}`, method: "get" });

export const addQcMaterial = (data: QcMaterialForm) =>
  request({ url: BASE(), method: "post", data });

export const updateQcMaterial = (data: QcMaterialForm) =>
  request({ url: BASE(), method: "put", data });

export const delQcMaterial = (ids: number | number[]) =>
  request({ url: `${BASE()}/${ids}`, method: "delete" });
```

---

## Phase 5: 构建验证

### 5.1 后端构建

```bash
cd poct-lis && mvn clean package -pl his-modules/his-module-lis -am -DskipTests
```

### 5.2 前端构建

```bash
cd poct-ui-lis && pnpm build
```

### 5.3 验证清单

- [ ] PostgreSQL 12 张表创建成功（`\dt lis_qc_*` 返回 12 行）
- [ ] MySQL 31 条菜单插入成功（`SELECT count(*) FROM sys_menu WHERE perms LIKE 'lis:qc:%'` 返回 22）
- [ ] 后端编译通过（`mvn clean package` 无错误）
- [ ] 前端编译通过（`pnpm build` 无错误）
- [ ] 后端启动后 Swagger/Knife4j 可查看 QC API
- [ ] 前端 qiankun 加载后菜单可见

---

## 文件清单汇总

| 类型 | 路径 | 数量 |
|------|------|------|
| SQL DDL | `document/sql/qc-module-ddl.sql` | 1 |
| SQL Menu | `document/sql/qc-module-menu.sql` | 1 |
| Java Entity | `his-common/.../domain/qc/LisQc*.java` | 12 |
| Java BO | `his-common/.../domain/qc/bo/LisQc*Bo.java` | 12 |
| Java VO | `his-common/.../domain/qc/vo/LisQc*Vo.java` | 12 |
| Java Mapper | `his-common/.../mapper/qc/LisQc*Mapper.java` | 10 |
| Java Service | `his-common/.../service/qc/I*Service.java` | 8 |
| Java Service Impl | `his-common/.../service/impl/qc/*ServiceImpl.java` | 8 |
| Java Controller | `his-modules/.../controller/qc/*Controller.java` | 8 |
| TS API | `poct-ui-lis/src/api/lis/qc*/index.ts` | 8 |
| TS Types | `poct-ui-lis/src/api/lis/qc*/types.ts` | 8 |
| Vue Pages | `poct-ui-lis/src/views/config/qc/*/index.vue` | 8 |
| Vue Components | `poct-ui-lis/src/components/qc/*.vue` | 2 |
| **合计** | | **~98** |
