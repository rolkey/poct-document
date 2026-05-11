# 仪器质控模块 — 数据库与菜单现状分析

> **分析日期**: 2026-05-10（修正版）
> **依据**: `RQ-001.md`（需求规格说明书） + 实际数据库探查

---

## 一、数据库现状

### 1.1 MySQL（cloud-mysql8 / ry-cloud）✅ 完整

29 张 RuoYi 框架表就绪：`sys_menu`, `sys_role`, `sys_user`, `sys_dict_*` 等。

**现有 LIS 菜单树：**

```
lis管理 (M, 2043205793171447809)
  └── 基础参数 (M, 2043614171223891970)
        ├── 仪器管理 (C)         → /lis/config/instrument
        │     └── 5 个按钮权限 (F)
        ├── 检验分组 (C)         → /lis/config/inspectionGroup
        │     └── 5 个按钮权限 (F)
        ├── 检验项目 (C)         → /lis/config/testItem
        │     └── 5 个按钮权限 (F)
        └── 诊疗项目 (C)         → /lis/config/chargeItem
              └── 5 个按钮权限 (F)
```

**QC 菜单：无** — 需新建 31 条菜单记录（含目录、菜单、按钮）。

### 1.2 PostgreSQL（cloud-postgres / his-lis）✅ 基础表完整，QC 表为空

| 分类 | 表数 | 说明 |
|------|------|------|
| `lis_*` LIS 业务表 | 20 张 | 仪器、项目、分组、样本、结果等 — 全部就绪 |
| `his_person_*` 人员管理 | 11 张 | 人员、证书、授权、考核等 |
| `bis_*` 血库 | 5 张 | 交叉配血、出入库等 |
| `his_requisition` | 1 张 | 医嘱申请 |
| `lis_qc_*` QC 表 | **0 张** | ⚠️ 全部缺失 |

**数据量**：各表 1 条测试数据。

---

## 二、QC 模块依赖的现有表（已就绪 ✅）

| 表名 | PK | PK 类型 | QC 引用方式 |
|------|-----|---------|-------------|
| `lis_comm_instrument` | `instrument_id` | `bigint` | FK: 所有 QC 表的仪器绑定 |
| `lis_test_item` | `test_item_id` | `bigint` (PK) | FK: 质控品/规则绑定的项目 |
| `lis_inspection_group` | `group_id` | `bigint` (PK) | FK: 分组关联 |
| `lis_charge_item` | `charge_item_id` | `bigint` (PK) | 间接引用 |
| `lis_change_log` | — | — | QC 操作日志复用或参考 |
| `lis_inspection_sample` | — | — | `patient_type='10'` 表示质控样本 |

> **重要**：实际 DB 中 `lis_comm_instrument.instrument_id` 是 `bigint`（非参考 DDL 中的 `varchar(20)`）。QC 表的 `instrument_id` 外键必须匹配为 `bigint`。

**公共字段模式（所有表统一）**：
```
create_dept  bigint
create_by    bigint
create_time  timestamp
update_by    bigint
update_time  timestamp
tenant_id    varchar(20)
```

---

## 三、需要新增的同级数据库内容

### 3.1 PostgreSQL — 12 张 QC 业务表

#### 质控物管理 (4.2.1)

**`lis_qc_material`** — 质控品基础信息

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| material_id | `bigint` | PK | 主键 |
| material_name | `varchar(100)` | NOT NULL | 质控品名称 |
| test_item_id | `bigint` | FK → lis_test_item | 关联检验项目 |
| level | `varchar(10)` | NOT NULL | LOW / MEDIUM / HIGH |
| manufacturer | `varchar(100)` | | 生产厂家 |
| reg_cert_no | `varchar(50)` | | 注册证号 |
| storage_temp | `varchar(50)` | | 储存温度要求 |
| status | `char(1)` | DEFAULT '1' | 0禁用 1启用 |
| + 公共字段 | | | create_dept, create_by, create_time, update_by, update_time, tenant_id |

**`lis_qc_material_batch`** — 质控品批次（入库记录）

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| batch_id | `bigint` | PK | 主键 |
| material_id | `bigint` | FK → lis_qc_material | 关联质控品 |
| lot_no | `varchar(50)` | NOT NULL | 批号 |
| dept_id | `bigint` | | 绑定科室 |
| instrument_id | `bigint` | FK → lis_comm_instrument | 绑定仪器 |
| target_value | `decimal(10,4)` | | 靶值 |
| sd | `decimal(10,4)` | | 标准差 |
| cv | `decimal(10,4)` | | 变异系数 |
| range_low | `decimal(10,4)` | | 允许范围下限 |
| range_high | `decimal(10,4)` | | 允许范围上限 |
| expiry_date | `date` | | 失效日期 |
| open_bottle_valid_days | `int` | | 开瓶效期（天） |
| open_date | `date` | | 开瓶日期 |
| in_stock_date | `date` | | 入库日期 |
| in_stock_person | `varchar(50)` | | 入库人 |
| batch_status | `varchar(20)` | DEFAULT 'NORMAL' | NORMAL / EXPIRED / LOCKED |
| + 公共字段 | | | |
| UNIQUE | (material_id, instrument_id, lot_no) | | 防重复入库 |

#### 质控规则管理 (4.2.2)

**`lis_qc_rule`** — Westgard 规则字典

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| rule_id | `bigint` | PK | 主键 |
| rule_code | `varchar(20)` | NOT NULL UNIQUE | W1_2S / W1_3S / W2_2S / R_4S / W4_1S / W10_X |
| rule_name | `varchar(50)` | NOT NULL | 规则名称 |
| rule_type | `varchar(10)` | NOT NULL | WARNING / OOC |
| description | `varchar(500)` | | 规则说明 |
| sort_order | `int` | | 排序 |

**`lis_qc_rule_config`** — 项目/仪器规则配置

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| config_id | `bigint` | PK | 主键 |
| instrument_id | `bigint` | FK → lis_comm_instrument | 关联仪器 |
| test_item_id | `bigint` | FK → lis_test_item | 关联项目 |
| rule_ids | `varchar(200)` | | 启用规则ID列表 |
| mean | `decimal(10,4)` | | 均值 |
| sd | `decimal(10,4)` | | 标准差 |
| cv | `decimal(10,4)` | | 变异系数 |
| tea | `decimal(10,4)` | | 允许总误差 |
| allowable_bias | `decimal(10,4)` | | 允许偏倚 |
| status | `char(1)` | DEFAULT '1' | 状态 |
| + 公共字段 | | | |
| UNIQUE | (instrument_id, test_item_id) | | 一仪器一项目一套规则 |

#### 质控计划管理 (4.2.3)

**`lis_qc_plan`** — 质控计划

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| plan_id | `bigint` | PK | 主键 |
| instrument_id | `bigint` | FK → lis_comm_instrument | |
| plan_type | `varchar(20)` | NOT NULL | DAILY / STARTUP / BATCH_CHANGE / MAINTENANCE |
| schedule_time | `time` | | 每日固定时间 |
| remind_before_min | `int` | | 提前提醒分钟数 |
| responsible_person | `varchar(50)` | | 责任人 |
| status | `char(1)` | DEFAULT '1' | 启用状态 |
| + 公共字段 | | | |

#### 质控执行与采集 (4.2.4)

**`lis_qc_record`** — 质控执行记录

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| record_id | `bigint` | PK | 主键 |
| instrument_id | `bigint` | FK → lis_comm_instrument | |
| test_item_id | `bigint` | FK → lis_test_item | |
| batch_id | `bigint` | FK → lis_qc_material_batch | |
| test_value | `decimal(10,4)` | NOT NULL | 检测值 |
| judgment | `varchar(20)` | NOT NULL | IN_CONTROL / WARNING / OOC |
| triggered_rules | `varchar(200)` | | 触发的规则编码列表 |
| collection_type | `varchar(10)` | NOT NULL | AUTO / MANUAL |
| operator | `varchar(50)` | | 操作员 |
| test_time | `timestamp` | NOT NULL | 检测时间 |
| remark | `varchar(500)` | | 备注 |
| + 公共字段 | | | |
| INDEX | (instrument_id, test_item_id, test_time) | | 质控图查询优化 |

#### 失控处理闭环 (4.2.6)

**`lis_qc_ooc_record`** — 失控处理记录

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| ooc_id | `bigint` | PK | 主键 |
| record_id | `bigint` | FK → lis_qc_record (UNIQUE) | 一记录一处理 |
| ooc_cause | `varchar(200)` | | 失控原因 |
| corrective_action | `varchar(200)` | | 纠正措施 |
| handler | `varchar(50)` | | 处理人 |
| handle_time | `timestamp` | | 处理时间 |
| ooc_status | `varchar(20)` | DEFAULT 'PENDING' | PENDING / RESOLVED / UNLOCKED |
| retest_record_id | `bigint` | | 复查质控记录ID |
| unlock_time | `timestamp` | | 解除锁定时间 |
| remark | `varchar(500)` | | 备注 |
| + 公共字段 | | | |

**`lis_qc_ooc_cause_dict`** — 失控原因字典

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| cause_id | `bigint` | PK | |
| cause_name | `varchar(100)` | NOT NULL | 原因名称 |
| cause_type | `varchar(20)` | | 设备故障/定标漂移/质控品变质/试剂过期/操作误差/环境因素/其他 |
| sort_order | `int` | | 排序 |
| status | `char(1)` | DEFAULT '1' | |

#### 一致性比对 (4.2.7)

**`lis_qc_comparison`** — 比对主表

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| comparison_id | `bigint` | PK | |
| comparison_type | `varchar(20)` | NOT NULL | POCT_POCT / POCT_LAB |
| instrument_id | `bigint` | FK → lis_comm_instrument | |
| reference_instrument_id | `bigint` | | 参比仪器/实验室 |
| test_item_id | `bigint` | FK → lis_test_item | |
| comparison_date | `date` | NOT NULL | |
| period_number | `int` | | 第几周期 |
| total_samples | `int` | | 样本总数 |
| pass_samples | `int` | | 合格数 |
| pass_rate | `decimal(5,2)` | | 合格率% |
| overall_result | `varchar(10)` | | PASS / FAIL |
| export_file | `varchar(500)` | | 报告路径 |
| + 公共字段 | | | |

**`lis_qc_comparison_detail`** — 比对明细

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| detail_id | `bigint` | PK | |
| comparison_id | `bigint` | FK → lis_qc_comparison | |
| sample_no | `varchar(50)` | NOT NULL | 样本编号 |
| target_value | `decimal(10,4)` | NOT NULL | 靶值 |
| test_value | `decimal(10,4)` | NOT NULL | 检测值 |
| bias | `decimal(10,4)` | | 偏倚 |
| allow_deviation | `decimal(10,4)` | | 允许偏差 |
| sample_result | `varchar(10)` | | PASS / FAIL |
| + 公共字段 | | | |

#### 室间质评 EQA (4.2.8)

**`lis_qc_eqa_plan`** — EQA 计划

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| eqa_plan_id | `bigint` | PK | |
| plan_year | `varchar(4)` | NOT NULL | 年度 |
| organization | `varchar(100)` | NOT NULL | 组织机构 |
| test_item_id | `bigint` | FK → lis_test_item | |
| scheduled_date | `date` | | 计划日期 |
| status | `varchar(20)` | DEFAULT 'PENDING' | PENDING / COMPLETED |
| + 公共字段 | | | |

**`lis_qc_eqa_record`** — EQA 执行记录

| 列 | 类型 | 约束 | 说明 |
|----|------|------|------|
| eqa_record_id | `bigint` | PK | |
| eqa_plan_id | `bigint` | FK → lis_qc_eqa_plan | |
| result_value | `varchar(500)` | | 检测结果 |
| report_file | `varchar(500)` | | 回馈表附件路径 |
| score | `varchar(50)` | | 成绩 |
| result | `varchar(10)` | | PASS / FAIL |
| rectify_record | `varchar(1000)` | | 不合格整改 |
| report_date | `date` | | 上报日期 |
| + 公共字段 | | | |

### 3.2 MySQL — 31 条菜单/权限记录

需要在 `sys_menu` 中插入以下菜单树（挂在 `基础参数` 下）：

```
lis管理 (2043205793171447809) → 基础参数 (2043614171223891970)
  └── 【NEW】质控管理 (M, parent_id=2043614171223891970, order_num=5)
        ├── 质控品管理 (C)      → /lis/config/qcMaterial
        │     └── 5 个按钮 (F)  :list/:add/:edit/:remove/:export
        ├── 质控规则配置 (C)    → /lis/config/qcRule
        │     └── 2 个按钮 (F)  :list/:edit
        ├── 质控计划 (C)        → /lis/config/qcPlan
        │     └── 2 个按钮 (F)  :list/:edit
        ├── 质控执行 (C)        → /lis/config/qcExecution
        │     └── 3 个按钮 (F)  :list/:add/:export
        ├── 失控处理 (C)        → /lis/config/qcOoc
        │     └── 3 个按钮 (F)  :list/:handle/:unlock
        ├── 一致性比对 (C)      → /lis/config/qcComparison
        │     └── 3 个按钮 (F)  :list/:edit/:export
        ├── 室间质评 (C)        → /lis/config/qcEqa
        │     └── 2 个按钮 (F)  :list/:edit
        └── 质控报表 (C)        → /lis/config/qcReport
              └── 2 个按钮 (F)  :view/:export
```

### 3.3 初始化数据

**PostgreSQL — 预置字典数据：**

| 表 | 数据 |
|----|------|
| `lis_qc_rule` | 6 条 Westgard 规则（W1_2S, W1_3S, W2_2S, R_4S, W4_1S, W10_X） |
| `lis_qc_ooc_cause_dict` | 7 条失控原因（设备故障、定标漂移、质控品变质、试剂过期、操作误差、环境因素、其他） |

---

## 四、修正说明

| 项目 | 初版分析 | 修正 |
|------|----------|------|
| PostgreSQL 数据库 | `postgres` | **`his-lis`**（URL 中指定） |
| PostgreSQL 表数量 | 0 张 | **38 张**（含 20 张 `lis_*` 基础表） |
| `lis_comm_instrument.instrument_id` 类型 | 参考 DDL 的 `varchar(20)` | 实际 DB 为 **`bigint`** |
| 依赖表状态 | 需全部创建 | **全部就绪 ✅** |

---

## 五、执行清单

```
[ ] 1. PostgreSQL — 创建 12 张 QC 表 DDL（含索引、唯一约束、FK）
[ ] 2. PostgreSQL — 初始化 6 条 Westgard 规则 + 7 条失控原因
[ ] 3. MySQL — 插入 QC 菜单树（1 目录 + 8 菜单 + 22 按钮 = 31 条记录）
[ ] 4. MySQL — 将 QC 权限码分配给管理员角色（sys_role_menu）
[ ] 5. 后端 — Entity/BO/VO/Mapper/Service/Controller（12 套 × 7 文件）
[ ] 6. 前端 — API 模块 + Vue 页面 + LJ 质控图组件
```
