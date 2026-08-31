# Phase 1 收尾 — 前端菜单配置与补全计划

> **日期**: 2026-05-13
> **状态**: 分析完成，待确认

---

## 0. 现状诊断

### 后端 ✅ 已就绪

Phase 1 所有后端 Controller 已创建，权限注解就绪：

| Controller | 路由 | 权限前缀 |
|------------|------|----------|
| `LisBaseDataController` | `/baseData` | `lis:baseData:*` |
| `LisTestItemGroupController` | `/testItemGroup` | `lis:testItemGroup:*` |
| `LisInstrumentChannelController` | `/instrumentChannel` | `lis:instrumentChannel:*` |
| `LisInstrumentChannelItemController` | `/instrumentChannelItem` | `lis:instrumentChannelItem:*` |

### 前端 ✅ 大部分已就绪

| 页面/组件 | 路径 | 状态 |
|-----------|------|------|
| 基础数据字典 CRUD | `views/config/baseData/index.vue` (419行) | ✅ |
| 仪器详情页（3 Tab） | `views/config/instrument/index.vue` (986行) | ✅ 含通道配置+检验项目 |
| baseData API | `api/lis/baseData/` | ✅ |
| testItemGroup API | `api/lis/testItemGroup/` | ✅ |
| instrumentChannel API | `api/lis/instrumentChannel/` | ✅ |
| instrumentChannelItem API | `api/lis/instrumentChannelItem/` | ✅ |

### ❌ 缺失：菜单配置

RuoYi 菜单系统通过 `sys_menu` 表（MySQL `ry-cloud` 库）配置。前端通过 qiankun 从后端拉取菜单数据，`routerLoader.ts` 动态注册路由。

**当前问题**：新页面已写好，但 `sys_menu` 表中没有对应记录，导致：
1. 侧边栏看不到"基础数据字典"
2. 导航到 `/lis/baseData` 返回 404（路由未注册）
3. 权限校验 `lis:baseData:list` 无对应菜单记录

### ⚠️ 额外发现：QC 模块前端缺失

QC 模块有 8 个后端 Controller，但前端 **0 个 QC 页面**（`views/` 下无 qc 目录）。QC 模块虽然菜单 SQL 已写好（`document/sql/qc-module-menu.sql`），但对应的 Vue 页面从未开发。

---

## 1. 需要做的事情

### 1.1 菜单 SQL（P0 — 阻塞用户使用）

为 `baseData` 创建菜单记录。参照 QC 模块的 `qc-module-menu.sql` 格式。

需要确定父菜单 ID：
- 现有配置页面（诊疗项目/检验项目/仪器/分组）的父菜单是哪个 `menu_id`？
- 选项 A：放在现有"检验配置"目录下
- 选项 B：新建"基础数据"目录

**如果父菜单 ID 可以确定，执行以下 SQL（MySQL `ry-cloud` 库）**：

```sql
-- 基础数据字典 (C) — 挂载到检验配置目录下
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(<新menu_id>, '基础数据字典', <父menu_id>, 5, 'baseData', 'config/baseData', NULL, 1, 0, 'C', '0', '0', 'lis:baseData:list', '', 103, 1, NOW(), 1, NOW(), '');

-- 权限按钮 (F)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(<新menu_id+1>, '基础数据查询', <新menu_id>, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(<新menu_id+2>, '基础数据新增', <新menu_id>, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(<新menu_id+3>, '基础数据修改', <新menu_id>, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:edit', '#', 103, 1, NOW(), 1, NOW(), ''),
(<新menu_id+4>, '基础数据删除', <新menu_id>, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:remove', '#', 103, 1, NOW(), 1, NOW(), ''),
(<新menu_id+5>, '基础数据导出', <新menu_id>, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:export', '#', 103, 1, NOW(), 1, NOW(), '');
```

> **注意**：`<新menu_id>` 和 `<父menu_id>` 需要从现有数据库中查询确定。`<父menu_id>` 应该是现有检验配置目录（诊疗项目/检验项目/仪器/分组的父节点）的 `menu_id`。

### 1.2 instrumentChannel / testItemGroup — 不需要独立菜单

这两个功能已集成到仪器详情页的 Tab 中，不需要独立菜单入口：
- **通道配置** → 仪器详情页 → "通道配置" Tab
- **检验项目** → 仪器详情页 → "检验项目" Tab

但权限按钮仍需要注册（用于 `v-hasPermi` 指令）：
```sql
-- instrumentChannel 权限按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(<mid+1>, '通道查询', <仪器menu_id>, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(<mid+2>, '通道新增', <仪器menu_id>, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(<mid+3>, '通道修改', <仪器menu_id>, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:edit', '#', 103, 1, NOW(), 1, NOW(), ''),
(<mid+4>, '通道删除', <仪器menu_id>, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:remove', '#', 103, 1, NOW(), 1, NOW(), '');

-- testItemGroup 权限按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(<mid+5>, '项目关联查询', <仪器menu_id>, 15, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:testItemGroup:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(<mid+6>, '项目关联新增', <仪器menu_id>, 16, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:testItemGroup:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(<mid+7>, '项目关联删除', <仪器menu_id>, 17, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:testItemGroup:remove', '#', 103, 1, NOW(), 1, NOW(), '');
```

### 1.3 QC 前端页面（P1 — 后续迭代）

QC 模块现状：
- 后端：8 个 Controller ✅
- 菜单 SQL：`document/sql/qc-module-menu.sql` ✅
- 前端页面：**0 个** ❌

需要创建 8 个 Vue CRUD 页面（参照 `config/chargeItem/index.vue` 模式）：
- `views/qc/material/index.vue` → 质控品管理
- `views/qc/rule/index.vue` → 质控规则配置
- `views/qc/plan/index.vue` → 质控计划
- `views/qc/record/index.vue` → 质控执行
- `views/qc/ooc/index.vue` → 失控处理
- `views/qc/comparison/index.vue` → 一致性比对
- `views/qc/eqa/index.vue` → 室间质评
- `views/qc/report/index.vue` → 质控报表

以及对应的 API 层（8 组 types.ts + index.ts）。

---

## 2. 执行顺序

| 步骤 | 任务 | 优先级 | 预估 |
|------|------|--------|------|
| 1 | 查询现有数据库中检验配置目录的 `menu_id` | P0 | 5min |
| 2 | 生成并执行 baseData 菜单 SQL | P0 | 10min |
| 3 | 生成并执行 instrumentChannel/testItemGroup 权限按钮 SQL | P0 | 10min |
| 4 | 重启前端验证菜单出现 | P0 | 5min |
| 5 | QC 前端页面 + API 层（8 组 CRUD） | P1 | 后续 |
