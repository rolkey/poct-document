-- ============================================
-- Phase 1 菜单权限 DML
-- 数据库: ry-cloud (MySQL)
-- 日期: 2026-05-13
-- 说明: 为检验系统 Phase 1 新功能创建菜单和权限按钮
-- ============================================

-- 基础数据字典 (C) — 挂载到"基础参数"目录下
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000050, '基础数据字典', 2043614171223891970, 50, 'baseData', 'config/baseData', NULL, 1, 0, 'C', '0', '0', 'lis:baseData:list', 'tree-table', 103, 1, NOW(), 1, NOW(), '');

-- baseData 权限按钮 (F)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000051, '基础数据查询', 2053000000000000050, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000052, '基础数据新增', 2053000000000000050, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000053, '基础数据修改', 2053000000000000050, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:edit', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000054, '基础数据删除', 2053000000000000050, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:remove', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000055, '基础数据导出', 2053000000000000050, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:baseData:export', '#', 103, 1, NOW(), 1, NOW(), '');

-- ============================================
-- instrumentChannel 权限按钮 (挂载到"仪器管理"下)
-- 注：通道配置已集成到仪器详情页的 Tab 中，无需独立菜单
-- ============================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000060, '通道查询', 2043665371159928834, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000061, '通道新增', 2043665371159928834, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000062, '通道修改', 2043665371159928834, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:edit', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000063, '通道删除', 2043665371159928834, 14, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:instrumentChannel:remove', '#', 103, 1, NOW(), 1, NOW(), '');

-- ============================================
-- testItemGroup 权限按钮 (挂载到"仪器管理"下)
-- 注：检验项目关联已集成到仪器详情页的 Tab 中，无需独立菜单
-- ============================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000070, '项目关联查询', 2043665371159928834, 21, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:testItemGroup:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000071, '项目关联新增', 2043665371159928834, 22, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:testItemGroup:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000072, '项目关联删除', 2043665371159928834, 23, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:testItemGroup:remove', '#', 103, 1, NOW(), 1, NOW(), '');
