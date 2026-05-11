# 仪器质控模块 — 实施规划

> **依据**: `RQ-001.md`（仪器质控模块需求规格说明书 v4.2）
> **基线评估**: 后端/前端/数据库 **均无** 任何质控相关代码，全新开发。
> **日期**: 2026-05-10

---

## 一、总览

### 1.1 模块范围（10个子模块）

| # | 子模块 | 复杂度 | 依赖 |
|---|--------|--------|------|
| 4.2.1 | 质控物（质控品）管理 | 中 | 无 |
| 4.2.2 | Westgard 质控规则管理 | 中 | 无 |
| 4.2.3 | 质控计划管理 | 低 | 4.2.1 |
| 4.2.4 | 质控执行与采集 | 高 | 4.2.1, 4.2.2, 4.2.3 |
| 4.2.5 | Levey-Jennings 质控图 | 高 | 4.2.4 |
| 4.2.6 | 失控处理闭环 | 高 | 4.2.4, 4.2.5 |
| 4.2.7 | 一致性比对 | 中 | 4.2.1 |
| 4.2.8 | 室间质评（EQA） | 中 | 无 |
| 4.2.9 | 质控统计报表 | 中 | 4.2.4, 4.2.6, 4.2.7 |
| 4.2.10 | 权限与日志 | 中 | 无 |

### 1.2 现有可复用资源

| 资源 | 用途 |
|------|------|
| `lis_comm_instrument` 表 + CRUD | 仪器基础数据，QC 绑定的仪器来源 |
| `lis_test_item` 表 + CRUD | 检验项目基础数据，QC 绑定的项目来源 |
| `lis_inspection_group` 表 + CRUD | 分组信息 |
| 现有 4 模块 CRUD 模式 | 代码生成模板参考 |
| `lis_change_log` 表 | 操作日志可复用 |
| qiankun 动态路由 | 前端路由由主壳推送，无需本地定义 |

---

## 二、数据库设计

### 2.1 新增表清单（预估 12 张）

#### 质控物管理 (4.2.1)

**`lis_qc_material`** — 质控品基础信息
| 字段 | 类型 | 说明 |
|------|------|------|
| material_id | BIGINT PK | 主键 |
| material_name | VARCHAR(100) | 质控品名称 |
| test_item_id | BIGINT | 关联检验项目 |
| level | VARCHAR(10) | 水平：LOW/MEDIUM/HIGH |
| manufacturer | VARCHAR(100) | 生产厂家 |
| reg_cert_no | VARCHAR(50) | 注册证号 |
| storage_temp | VARCHAR(50) | 储存温度要求 |
| status | CHAR(1) | 状态：0禁用 1启用 |

**`lis_qc_material_batch`** — 质控品批次（入库记录）
| 字段 | 类型 | 说明 |
|------|------|------|
| batch_id | BIGINT PK | 主键 |
| material_id | BIGINT FK | 关联质控品 |
| lot_no | VARCHAR(50) | 批号 |
| dept_id | BIGINT | 绑定科室 |
| instrument_id | VARCHAR(20) | 绑定仪器 |
| target_value | DECIMAL(10,4) | 靶值 |
| sd | DECIMAL(10,4) | 标准差 |
| cv | DECIMAL(10,4) | 变异系数 |
| range_low | DECIMAL(10,4) | 允许范围下限 |
| range_high | DECIMAL(10,4) | 允许范围上限 |
| expiry_date | DATE | 失效日期 |
| open_bottle_valid_days | INT | 开瓶效期（天） |
| open_date | DATE | 开瓶日期 |
| in_stock_date | DATE | 入库日期 |
| in_stock_person | VARCHAR(50) | 入库人 |
| batch_status | VARCHAR(20) | 状态：NORMAL/EXPIRED/OPEN_EXPIRED/LOCKED |
| UNIQUE KEY | (material_id, test_item_id, level, lot_no) | 防止重复入库 |

#### 质控规则管理 (4.2.2)

**`lis_qc_rule`** — Westgard 规则库
| 字段 | 类型 | 说明 |
|------|------|------|
| rule_id | BIGINT PK | 主键 |
| rule_code | VARCHAR(20) | 规则编码（W1_2S, W1_3S, W2_2S, R_4S, W4_1S, W10_X） |
| rule_name | VARCHAR(50) | 规则名称 |
| rule_type | VARCHAR(10) | WARNING / OOC（警告/失控） |
| description | VARCHAR(500) | 规则说明 |
| sort_order | INT | 排序 |

**`lis_qc_rule_config`** — 项目/仪器规则配置
| 字段 | 类型 | 说明 |
|------|------|------|
| config_id | BIGINT PK | 主键 |
| instrument_id | VARCHAR(20) | 关联仪器 |
| test_item_id | BIGINT | 关联项目 |
| rule_ids | VARCHAR(200) | 启用规则ID列表，逗号分隔 |
| mean | DECIMAL(10,4) | 均值 |
| sd | DECIMAL(10,4) | 标准差 |
| cv | DECIMAL(10,4) | 变异系数 |
| tea | DECIMAL(10,4) | 允许总误差 |
| allowable_bias | DECIMAL(10,4) | 允许偏倚 |
| status | CHAR(1) | 状态 |
| UNIQUE KEY | (instrument_id, test_item_id) | 一仪器一项目一套规则 |

#### 质控计划管理 (4.2.3)

**`lis_qc_plan`** — 质控执行计划
| 字段 | 类型 | 说明 |
|------|------|------|
| plan_id | BIGINT PK | 主键 |
| instrument_id | VARCHAR(20) | 关联仪器 |
| plan_type | VARCHAR(20) | 频率类型：DAILY/STARTUP/BATCH_CHANGE/MAINTENANCE |
| schedule_time | TIME | 每日固定时间（DAILY类型） |
| remind_before_min | INT | 提前提醒分钟数 |
| responsible_person | VARCHAR(50) | 责任人 |
| status | CHAR(1) | 启用状态 |

#### 质控执行与采集 (4.2.4)

**`lis_qc_record`** — 质控执行记录
| 字段 | 类型 | 说明 |
|------|------|------|
| record_id | BIGINT PK | 主键 |
| instrument_id | VARCHAR(20) | 仪器 |
| test_item_id | BIGINT | 项目 |
| batch_id | BIGINT | 关联批次 |
| test_value | DECIMAL(10,4) | 检测值 |
| judgment | VARCHAR(20) | 判定：IN_CONTROL/WARNING/OOC |
| triggered_rules | VARCHAR(200) | 触发的规则（逗号分隔） |
| collection_type | VARCHAR(10) | 采集方式：AUTO/MANUAL |
| operator | VARCHAR(50) | 操作员 |
| test_time | TIMESTAMP | 检测时间 |
| remark | VARCHAR(500) | 备注 |

#### 失控处理闭环 (4.2.6)

**`lis_qc_ooc_record`** — 失控处理记录
| 字段 | 类型 | 说明 |
|------|------|------|
| ooc_id | BIGINT PK | 主键 |
| record_id | BIGINT FK | 关联质控记录 |
| ooc_cause | VARCHAR(200) | 失控原因 |
| corrective_action | VARCHAR(200) | 纠正措施 |
| handler | VARCHAR(50) | 处理人 |
| handle_time | TIMESTAMP | 处理时间 |
| ooc_status | VARCHAR(20) | PENDING/RESOLVED/UNLOCKED |
| retest_record_id | BIGINT | 复查质控记录ID |
| unlock_time | TIMESTAMP | 解除锁定时间 |
| remark | VARCHAR(500) | 备注 |

**`lis_qc_ooc_cause_dict`** — 失控原因字典
| 字段 | 类型 | 说明 |
|------|------|------|
| cause_id | BIGINT PK | 主键 |
| cause_name | VARCHAR(100) | 原因名称 |
| cause_type | VARCHAR(20) | 分类：设备故障/定标漂移/质控品变质/试剂过期/操作误差/环境因素/其他 |

#### 一致性比对 (4.2.7)

**`lis_qc_comparison`** — 一致性比对记录
| 字段 | 类型 | 说明 |
|------|------|------|
| comparison_id | BIGINT PK | 主键 |
| comparison_type | VARCHAR(20) | POCT_POCT / POCT_LAB |
| instrument_id | VARCHAR(20) | 仪器 |
| reference_instrument_id | VARCHAR(20) | 参比仪器/实验室 |
| test_item_id | BIGINT | 项目 |
| comparison_date | DATE | 比对日期 |
| period_number | INT | 第几周期（每6月一次） |
| total_samples | INT | 样本总数 |
| pass_samples | INT | 合格样本数 |
| pass_rate | DECIMAL(5,2) | 合格率 |
| overall_result | VARCHAR(10) | PASS / FAIL |
| export_file | VARCHAR(500) | 导出报告路径 |

**`lis_qc_comparison_detail`** — 比对明细
| 字段 | 类型 | 说明 |
|------|------|------|
| detail_id | BIGINT PK | 主键 |
| comparison_id | BIGINT FK | 关联比对 |
| sample_no | VARCHAR(50) | 样本编号 |
| target_value | DECIMAL(10,4) | 靶值 |
| test_value | DECIMAL(10,4) | 检测值 |
| bias | DECIMAL(10,4) | 偏倚 |
| allow_deviation | DECIMAL(10,4) | 允许偏差 |
| sample_result | VARCHAR(10) | PASS / FAIL |

#### 室间质评 EQA (4.2.8)

**`lis_qc_eqa_plan`** — EQA 计划
| 字段 | 类型 | 说明 |
|------|------|------|
| eqa_plan_id | BIGINT PK | 主键 |
| plan_year | VARCHAR(4) | 年度 |
| organization | VARCHAR(100) | 组织机构 |
| test_item_id | BIGINT | 项目 |
| scheduled_date | DATE | 计划日期 |
| status | VARCHAR(20) | PENDING/COMPLETED |

**`lis_qc_eqa_record`** — EQA 执行记录
| 字段 | 类型 | 说明 |
|------|------|------|
| eqa_record_id | BIGINT PK | 主键 |
| eqa_plan_id | BIGINT FK | 关联计划 |
| result_value | VARCHAR(500) | 检测结果 |
| report_file | VARCHAR(500) | 回馈表附件路径 |
| score | VARCHAR(50) | 成绩 |
| result | VARCHAR(10) | PASS / FAIL |
| rectify_record | VARCHAR(1000) | 不合格整改记录 |
| report_date | DATE | 上报日期 |

### 2.2 实体关系概要

```
lis_qc_material 1──N lis_qc_material_batch
lis_qc_rule 1──N lis_qc_rule_config
lis_comm_instrument 1──N lis_qc_plan
lis_comm_instrument 1──N lis_qc_record
lis_qc_material_batch 1──N lis_qc_record
lis_qc_record 1──1 lis_qc_ooc_record
lis_comm_instrument 1──N lis_qc_comparison
lis_qc_comparison 1──N lis_qc_comparison_detail
lis_qc_eqa_plan 1──N lis_qc_eqa_record
```

---

## 三、后端架构

### 3.1 包结构

遵循现有模式，所有质控模块代码放在：

```
poct-lis/
├── his-modules/his-module-lis/src/main/java/org/rolkey/his/lis/controller/
│   └── qc/                                    # 质控控制器
│       ├── QcMaterialController.java           # 4.2.1 质控品 + 批次入库
│       ├── QcRuleController.java              # 4.2.2 规则配置
│       ├── QcPlanController.java              # 4.2.3 质控计划
│       ├── QcExecutionController.java         # 4.2.4 质控执行 + 判定
│       ├── QcOocController.java               # 4.2.6 失控处理
│       ├── QcComparisonController.java        # 4.2.7 一致性比对
│       ├── QcEqaController.java               # 4.2.8 室间质评
│       └── QcReportController.java            # 4.2.9 统计报表
│
├── his-common/his-common-lis/src/main/java/org/rolkey/his/lis/
│   ├── domain/
│   │   └── qc/                                # 实体类
│   │       ├── LisQcMaterial.java
│   │       ├── LisQcMaterialBatch.java
│   │       ├── LisQcRule.java
│   │       ├── LisQcRuleConfig.java
│   │       ├── LisQcPlan.java
│   │       ├── LisQcRecord.java
│   │       ├── LisQcOocRecord.java
│   │       ├── LisQcComparison.java
│   │       ├── LisQcComparisonDetail.java
│   │       ├── LisQcEqaPlan.java
│   │       └── LisQcEqaRecord.java
│   │   └── qc/bo/                             # 业务对象
│   │       └── ...Bo.java (一一对应)
│   │   └── qc/vo/                             # 视图对象
│   │       └── ...Vo.java (一一对应)
│   ├── mapper/
│   │   └── qc/
│   │       └── ...Mapper.java (一一对应)
│   └── service/
│       ├── qc/
│       │   └── I...Service.java (一一对应)
│       └── impl/qc/
│           └── ...ServiceImpl.java (一一对应)
```

### 3.2 核心业务逻辑

除了标准 CRUD 之外，以下模块需要特殊业务逻辑：

**4.2.1 质控品入库 (`QcMaterialBatchService.insertByBo`)**:
- 入库前检查：同 material_id + test_item_id + level + lot_no 唯一性
- 入库后自动计算 `open_bottle_expiry_date = open_date + open_bottle_valid_days`
- **定时任务**：每日扫描 `expiry_date` 和 `open_bottle_expiry_date`，自动标记 EXPIRED

**4.2.2 规则配置 (`QcRuleConfig`)**:
- 初始化脚本：预置 6 条 Westgard 规则到 `lis_qc_rule` 表

**4.2.4 质控执行判定 (`QcExecutionService.judge`)**:
- 核心算法：接收 `test_value`，根据对应 `lis_qc_rule_config` 中的 mean/SD 和启用的 rules
- 按 Westgard 多规则逻辑依次判定：
  1. 先检查 `1₂s` → 未触发则 IN_CONTROL
  2. 触发 `1₂s` → 继续检查 `1₃s`, `2₂s`, `R₄s`, `4₁s`, `10x`
  3. 任一失控规则触发 → OOC；仅 `1₂s` 触发 → WARNING
- 判定为 OOC 时：
  - 自动插入 `lis_qc_ooc_record`（状态 PENDING）
  - 锁定该 instrument 的报告发布权限（标记设备状态）

**4.2.6 失控解除**:
- handler 填写原因 + 纠正措施 → ooc_status 变为 RESOLVED
- 操作员执行复查质控 → 在控 → ooc_status 变为 UNLOCKED → 恢复仪器权限

**4.2.7 一致性比对结果计算**:
- 逐条 `lis_qc_comparison_detail`：`bias = |test_value - target_value|`
- `sample_result = bias <= allow_deviation ? PASS : FAIL`
- `pass_rate = pass_samples / total_samples * 100`

**4.2.9 统计报表**:
- 在控率 = IN_CONTROL 记录 / 总记录 × 100
- 失控率 = OOC 记录 / 总记录 × 100
- 月度报告：按 instrument_id + 月份分组聚合
- 趋势分析：按月统计 pass_rate 变化

### 3.3 定时任务

| 任务 | 频率 | 说明 |
|------|------|------|
| `qcExpiryCheckTask` | 每日 00:00 | 扫描过期质控品批次，自动标记 EXPIRED |
| `qcPlanRemindTask` | 每 30 分钟 | 检查质控计划，未执行则推送提醒 |
| `qcComparisonRemindTask` | 每日 08:00 | 检查比对周期（6个月），临期提醒 |
| `qcOocLockCheckTask` | 每 10 分钟 | 检查失控未处理/未解锁定记录，维护锁定状态 |

### 3.4 权限设计

```
lis:qc:material:list    # 质控品查看
lis:qc:material:add     # 质控品入库
lis:qc:material:edit    # 质控品编辑
lis:qc:material:remove  # 质控品删除
lis:qc:rule:list        # 规则查看
lis:qc:rule:edit        # 规则配置
lis:qc:plan:list        # 计划查看
lis:qc:plan:edit        # 计划管理
lis:qc:execution:list   # 执行记录查看
lis:qc:execution:add    # 手工录入质控
lis:qc:ooc:list         # 失控记录查看
lis:qc:ooc:handle       # 失控处理
lis:qc:ooc:unlock       # 解除锁定（审核员）
lis:qc:comparison:list  # 比对查看
lis:qc:comparison:edit  # 比对管理
lis:qc:eqa:list         # 室间质评查看
lis:qc:eqa:edit         # 室间质评管理
lis:qc:report:view      # 报表查看
lis:qc:mean:edit        # 均值/SD修改（需审核权限）
```

---

## 四、前端架构

### 4.1 文件结构

```
poct-ui-lis/src/
├── api/lis/
│   ├── qcMaterial/index.ts + types.ts         # 4.2.1
│   ├── qcRule/index.ts + types.ts             # 4.2.2
│   ├── qcPlan/index.ts + types.ts             # 4.2.3
│   ├── qcExecution/index.ts + types.ts        # 4.2.4
│   ├── qcOoc/index.ts + types.ts              # 4.2.6
│   ├── qcComparison/index.ts + types.ts       # 4.2.7
│   ├── qcEqa/index.ts + types.ts              # 4.2.8
│   └── qcReport/index.ts + types.ts           # 4.2.9
│
├── views/
│   └── config/
│       └── qc/                                # 质控模块所有页面
│           ├── qcMaterial/index.vue            # 质控品列表 + 入库
│           ├── qcRule/index.vue               # 规则配置
│           ├── qcPlan/index.vue               # 质控计划
│           ├── qcExecution/index.vue           # 质控执行 + 手工录入
│           ├── qcOoc/index.vue                # 失控处理列表
│           ├── qcComparison/index.vue          # 一致性比对
│           ├── qcEqa/index.vue                # 室间质评
│           └── qcReport/index.vue             # 统计报表
│
├── components/
│   └── qc/
│       ├── LjChart.vue                        # Levey-Jennings 质控图组件
│       ├── OocDialog.vue                      # 失控原因/纠正措施弹窗
│       └── ComparisonDetail.vue               # 比对明细录入组件
```

### 4.2 页面复杂度分级

| 页面 | CRUD 模式 | 特殊组件/逻辑 |
|------|-----------|---------------|
| qcMaterial | 标准 CRUD | 效期状态标签、颜色标签（低/中/高）、自动过期标记 |
| qcMaterialBatch | 子表 CRUD | 入库表单验证（唯一性检查）、lot_no 自动去重提醒 |
| qcRule | 标准 CRUD + 多选规则 | CheckBox 规则选择器、mean/SD 输入 |
| qcPlan | 标准 CRUD | 频率类型下拉（多选）、时间选择器 |
| qcExecution | 表格 + 手工录入弹窗 | 结果状态标签（在控/警告/失控，绿/黄/红）、采集方式标签 |
| qcChart (嵌入) | 非 CRUD | **ECharts Levey-Jennings 图**：均值线、±2SD线、±3SD线、数据散点 |
| qcOoc | 表格 + 流水线操作 | 状态流转按钮：处理→待复查→复查通过→解除锁定 |
| qcComparison | CRUD + 明细子表 | 比对明细表录入、自动计算偏倚/合格率 |
| qcEqa | 标准 CRUD | 文件上传（回馈表 PDF/图片） |
| qcReport | 非 CRUD（纯查询） | 多维度筛选 + ECharts 趋势图表 + 导出 |

### 4.3 关键前端技术选型

- **质控图 (4.2.5)**: 使用 ECharts（项目已集成）绘制 Levey-Jennings 散点图，横轴为时间序列，纵轴为检测值，叠加 Mean/±2SD/±3SD 参考线
- **失控流水线**: 状态流转通过 `el-steps` 展示当前阶段，配合 `el-dialog` 进行操作（填写原因、上传图片等）
- **报表可视化**: ECharts 折线图/柱状图展示趋势，`el-table` 展示明细
- **权限控制**: 沿用 `v-hasPermi` 指令控制按钮/操作可见性

---

## 五、实施阶段

### Phase 0: 基础设施（1-2天）

| 任务 | 内容 |
|------|------|
| DB 脚本 | 编写 12 张表的 DDL，添加索引和约束 |
| 基础数据初始化 | 预置 6 条 Westgard 规则 + 失控原因字典 |
| 后端包结构 | 创建 `controller/qc/`, `domain/qc/`, `mapper/qc/`, `service/qc/` 目录 |
| 前端包结构 | 创建 `api/lis/qc*/`, `views/config/qc/`, `components/qc/` 目录 |
| 菜单配置 | 在 qiankun 主壳中配置 8 个 QC 菜单项 |

### Phase 1: 核心基础 — 4.2.1 + 4.2.2 + 4.2.10（3-5天）

| 模块 | 后端 | 前端 |
|------|------|------|
| 4.2.1 质控品管理 | Entity + BO + VO + Mapper + Service（含唯一性校验、效期计算）+ Controller | 标准 CRUD 页面 + 入库表单 + 效期标识 |
| 4.2.2 Westgard规则 | Entity + BO + VO + Mapper + Service + Controller | 规则配置页面 + 多规则勾选 |
| 4.2.10 权限日志 | 权限码定义 + 复用 `lis_change_log` 记录 QC 操作 | `v-hasPermi` 集成 |

**里程碑**: 质控品可入库、批次可管理、规则可配置。

### Phase 2: 执行核心 — 4.2.3 + 4.2.4 + 4.2.5 + 4.2.6（5-8天）

| 模块 | 后端 | 前端 |
|------|------|------|
| 4.2.3 质控计划 | Entity + Service（含提醒逻辑）+ Controller | 计划配置页面 |
| 4.2.4 质控执行 | Entity + **判定引擎** + Controller（含手工录入 + 设备直连接口） | 执行记录列表 + 手工录入弹窗 + 状态标签 |
| 4.2.5 LJ 质控图 | 查询 API（按 instrument + item + 时间范围返回数据） | **ECharts Levey-Jennings 图组件** |
| 4.2.6 失控闭环 | Entity + 流水线 Service + 锁定/解锁逻辑 | 失控列表 + 处理弹窗 + `el-steps` 状态展示 |

**里程碑**: 质控可执行、结果可自动判定、失控可闭环处理。

### Phase 3: 高级功能 — 4.2.7 + 4.2.8 + 4.2.9（5-7天）

| 模块 | 后端 | 前端 |
|------|------|------|
| 4.2.7 一致性比对 | Entity + 偏倚计算 + Controller | 比对主表 + 明细子表 + 自动计算 |
| 4.2.8 室间质评 | Entity + 文件上传 + Controller | EQA 计划/记录管理 + 文件上传 |
| 4.2.9 统计报表 | 聚合查询 API（按维度统计）+ Excel 导出 | 报表筛选 + ECharts 图表 + 导出按钮 |

**里程碑**: 全模块功能完成。

### Phase 4: 定时任务 + 集成测试（2-3天）

| 任务 | 内容 |
|------|------|
| 定时任务 | 实现 4 个 `@Scheduled` 任务（见 3.3） |
| Nacos 配置 | 定时任务 cron 表达式外置配置 |
| 集成测试 | 端到端流程：入库 → 定规则 → 做计划 → 执行 → 判定 → 失控处理 → 解除 → 比对 → EQA → 报表 |
| 文档 | 更新 `AGENTS.md`，补充 QC 模块说明 |

---

## 六、风险与注意事项

### 6.1 已知风险

| 风险 | 影响 | 缓解 |
|------|------|------|
| `@AutoMapper` String/Long 不一致 | 运行时转换失败 | **Java 层全部用 String**（Entity/BO/VO），DB 用 bigint，MyBatis-Plus 自动转换 — 项目已验证模式 |
| 设备直连采集接口未定义 | 4.2.4 采集功能不完整 | 第一版先实现手工录入 + 预留接口，直连由仪器接口团队后续对接 |
| qiankun 路由由主壳控制 | 前端路由无法本地调试 | 开发时在主壳中注册临时路由；或本地 mock 路由加载器 |
| 定时任务在集群环境重复执行 | 重复提醒 | 使用分布式锁（Redisson）或 Nacos 服务注册控制单节点执行 |
| Westgard 判定逻辑复杂度高 | 规则判错导致误报/漏报 | 编写单元测试覆盖所有 6 条规则 + 典型组合场景 |

### 6.2 反模式规避

- **PK 类型统一 String** — Entity/BO/VO 全部用 `String`，DB 用 `bigint`（MyBatis-Plus 自动转换），前端 TS 用 `string`
- **BO 的 PK 字段加 `@NotNull(EditGroup.class)`** — 编辑时必须校验主键非空
- **`buildQueryWrapper` 覆盖所有可搜索字段** — 不要遗漏 like/eq 条件
- **不用 `=` 做 `@ExcelDictFormat` 的分隔符** — 中文文本中可能含有 `=`

### 6.3 预估总工时

| 阶段 | 后端 | 前端 | 数据库 | 合计 |
|------|------|------|--------|------|
| Phase 0 | 2d | 1d | 2d | 3d |
| Phase 1 | 3d | 3d | — | 5d |
| Phase 2 | 5d | 5d | — | 8d |
| Phase 3 | 4d | 5d | — | 7d |
| Phase 4 | 2d | 1d | — | 2d |
| **合计** | **16d** | **15d** | **2d** | **~25d** |

> 注：以上为单人全栈预估，前后端并行开发可压缩至 **~15 工作日**。
