# QC 规则字典迁移计划

> **目标**: 将 Westgard 规则字典从 PostgreSQL `lis_qc_rule` 表迁至 MySQL `sys_dict_data`，移除 `qcRule` 页面双 Tab 结构。
> **日期**: 2026-05-10

---

## 一、变更范围

### 1.1 影响的表

| 数据库 | 表 | 操作 |
|--------|-----|------|
| MySQL | `sys_dict_type` | INSERT 1 行（dict_type='lis_qc_rule_type'） |
| MySQL | `sys_dict_data` | INSERT 6 行（Westgard 规则） |
| PostgreSQL | `lis_qc_rule` | 可保留或删除（迁移后不再被前端直接使用） |

### 1.2 影响的文件

| 层 | 文件 | 操作 |
|----|------|------|
| **Java** | `LisQcRule.java` | 保留（可能被 lis_qc_rule_config 的 rule_ids 引用使用） |
| **Java** | `LisQcRuleBo/Vo/Mapper` | 保留 |
| **Java** | `ILisQcRuleService` | 修改 — 移除 listQcRule 端点（或保留作为内部引用） |
| **Java** | `LisQcRuleServiceImpl` | 修改 |
| **Java** | `LisQcRuleController` | 修改 — 移除 /qc/rule/list 的 CRUD 端点（规则字典不再独立管理） |
| **TS** | `qcRule/types.ts` | 移除 `QcRuleDictVO` 别名（该类型现在来自 dict API） |
| **TS** | `qcRule/index.ts` | 移除 `listQcRuleDict` 别名 |
| **Vue** | `qcRule/index.vue` | **重点改造** — 移除 el-tabs，简化为单页 CRUD |

---

## 二、MySQL 字典数据

### 2.1 sys_dict_type

```sql
INSERT INTO sys_dict_type (dict_id, tenant_id, dict_name, dict_type, create_dept, create_by, create_time, remark)
VALUES (100, '000000', '质控规则类型', 'lis_qc_rule_type', 103, 1, NOW(), 'Westgard 多规则质控类型');
```

### 2.2 sys_dict_data（6 行）

```sql
INSERT INTO sys_dict_data (dict_code, tenant_id, dict_sort, dict_label, dict_value, dict_type, css_class, is_default, create_dept, create_by, create_time, remark) VALUES
(101, '000000', 1, '1₂s 警告规则', 'W1_2S', 'lis_qc_rule_type', 'warning', 'N', 103, 1, NOW(), '1个质控结果超过±2SD，触发警告（假失控率高，不作为失控判据）'),
(102, '000000', 2, '1₃s 失控规则', 'W1_3S', 'lis_qc_rule_type', 'danger', 'N', 103, 1, NOW(), '1个质控结果超过±3SD，判定失控（检测大随机误差）'),
(103, '000000', 3, '2₂s 失控规则', 'W2_2S', 'lis_qc_rule_type', 'danger', 'N', 103, 1, NOW(), '连续2个质控结果同方向超过±2SD，判定失控（检测系统偏移）'),
(104, '000000', 4, 'R₄s 失控规则', 'R_4S',  'lis_qc_rule_type', 'danger', 'N', 103, 1, NOW(), '同一批内最大与最小差值超过4SD，判定失控（检测批内精密度）'),
(105, '000000', 5, '4₁s 失控规则', 'W4_1S', 'lis_qc_rule_type', 'danger', 'N', 103, 1, NOW(), '连续4个质控结果同方向超过±1SD，判定失控（检测微小偏移）'),
(106, '000000', 6, '10x 失控规则', 'W10_X', 'lis_qc_rule_type', 'danger', 'N', 103, 1, NOW(), '连续10个质控结果落在均值同一侧，判定失控（检测长期漂移）');
```

> `dict_code` / `dict_id` 使用现有的雪花 ID 生成规则，此处为示意值。

---

## 三、前端 qcRule/index.vue 改造

### 3.1 改造前

```
┌──────────────────────────────────────┐
│ [规则字典] [规则配置]  ← el-tabs     │
├──────────────────────────────────────┤
│ Tab1: 规则字典（只读表）             │
│  ruleCode | ruleName | type | desc   │
│  从 lis_qc_rule API 获取             │
├──────────────────────────────────────┤
│ Tab2: 规则配置（CRUD）               │
│  搜索 → 表格 → 弹窗                  │
│  从 lis_qc_rule_config API 获取      │
└──────────────────────────────────────┘
```

### 3.2 改造后

```
┌──────────────────────────────────────┐
│ 质控规则配置  ← 标题（无 tabs）      │
├──────────────────────────────────────┤
│ [搜索区]                             │
│  仪器: [select]  项目: [select]      │
│  [搜索] [重置]                       │
├──────────────────────────────────────┤
│ [新增] [导出]                        │
├──────────────────────────────────────┤
│ 表格                                 │
│ configId | 仪器 | 项目 | 规则 | ...  │
├──────────────────────────────────────┤
│ [弹窗表单]                           │
│  仪器: [select]                      │
│  项目: [select]                      │
│  规则: ☑ W1_2S ☑ W1_3S ...          │
│        ↑ 从 getDicts('lis_qc_rule_type') 获取  │
│  均值: [input-number]   SD: [...]    │
└──────────────────────────────────────┘
```

### 3.3 关键代码变更

#### 移除的内容

```diff
- <el-tabs v-model="activeTab" @tab-change="handleTabChange">
-   <el-tab-pane label="规则字典" name="dict" />
-   <el-tab-pane label="规则配置" name="config" />
- </el-tabs>

- <!-- 规则字典 Tab → 整个 v-show="activeTab === 'dict'" 块 -->
- <div v-show="activeTab === 'dict'" ...>
-   <el-table :data="ruleDictList" ...>
-     ...
-   </el-table>
- </div>

- import { listQcRuleDict } from "@/api/lis/qcRule";
- import { QcRuleDictVO } from "@/api/lis/qcRule/types";
- const activeTab = ref("dict");
- const ruleDictList = ref([]);
- const dictLoading = ref(false);
```

#### 新增的内容

```diff
+ import { getDicts } from "@/api/system/dict/data";

+ // 获取可选规则列表（来自系统字典）
+ const ruleOptions = ref<{label: string, value: string}[]>([]);
+ const fetchRuleDict = async () => {
+   const res = await getDicts("lis_qc_rule_type");
+   ruleOptions.value = (res.data || []).map((d: any) => ({
+     label: d.dictLabel,
+     value: d.dictValue,
+   }));
+ };
+ onMounted(() => { fetchRuleDict(); ... });

  // 表单中规则选择改为 el-checkbox-group
- 原有: el-select multiple from ruleDictList
+ 改为: <el-checkbox-group v-model="form.ruleIds">
+         <el-checkbox v-for="item in ruleOptions" :key="item.value" :label="item.value">
+           {{ item.label }}
+         </el-checkbox>
+       </el-checkbox-group>
```

#### 页面结构调整

- 移除 `<el-tabs>`，页面直接以单卡片开始
- 移除 `v-show="activeTab === 'config'"`，因为只有一个 Tab
- 移除所有 `dict` 相关的 ref、computed、方法
- 保留搜索区 + 表格 + 弹窗的 CRUD 结构不变

---

## 四、后端变更

### 4.1 LisQcRuleController 简化

移除字典相关的 CRUD 端点（规则字典不再由 QC 模块管理）：

```diff
- @GetMapping("/list")      // 查询规则字典
- @GetMapping("/{ruleId}")  // 查单条规则
- @PostMapping              // 新增规则
- @PutMapping               // 修改规则
- @DeleteMapping("/{ids}")  // 删除规则
+ 保留: /config/list, /config/{id}, /config(POST/PUT/DELETE) — 规则配置 CRUD 不变
```

### 4.2 可删除的文件

| 文件 | 说明 |
|------|------|
| `ILisQcRuleService.java` | 合并到 `ILisQcRuleConfigService`，或重命名为仅服务 RuleConfig |
| `LisQcRuleServiceImpl.java` | 同上 |

> 保守策略：保留 `lis_qc_rule` 相关后端代码不变，仅前端停止使用。`lis_qc_rule` 表仍可作为数据引用（不通过 UI 管理）。

---

## 五、种子数据迁移

`lis_qc_rule` 表中的 6 条规则数据已在上方 sys_dict_data 中重新定义。PostgreSQL 中的 `lis_qc_rule` 表和种子数据可保留（作为向后兼容），或在下线时一并清理。

---

## 六、执行步骤

```
[1] MySQL: INSERT sys_dict_type + sys_dict_data（6 条规则）
[2] 前端: qcRule/index.vue 改造
      - 移除 el-tabs
      - 移除规则字典 Tab
      - 规则配置 form 改为从 getDicts() 获取 checkbox 选项
      - 清理 import（移除 listQcRuleDict, QcRuleDictVO）
[3] 前端: qcRule API 清理（移除 listQcRuleDict 别名）
[4] 后端: LisQcRuleController 移除字典 CRUD 端点（可选，保守策略可保留）
```
