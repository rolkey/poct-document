-- ============================================
-- 仪器质控模块 — 菜单权限 DML
-- 数据库: ry-cloud (MySQL)
-- 日期: 2026-05-10
-- ============================================

-- 质控管理 目录 (M)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000001, '质控管理', 2043614171223891970, 5, 'qc', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'checkbox', 103, 1, NOW(), 1, NOW(), '');

-- 质控品管理 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000002, '质控品管理', 2053000000000000001, 1, 'qcMaterial', 'config/qc/qcMaterial', NULL, 1, 0, 'C', '0', '0', 'lis:qc:material:list', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000011, '质控品查询', 2053000000000000002, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:material:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000012, '质控品新增', 2053000000000000002, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:material:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000013, '质控品修改', 2053000000000000002, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:material:edit', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000014, '质控品删除', 2053000000000000002, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:material:remove', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000015, '质控品导出', 2053000000000000002, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:material:export', '#', 103, 1, NOW(), 1, NOW(), '');

-- 质控规则配置 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000003, '质控规则配置', 2053000000000000001, 2, 'qcRule', 'config/qc/qcRule', NULL, 1, 0, 'C', '0', '0', 'lis:qc:rule:list', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000016, '规则查询', 2053000000000000003, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:rule:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000017, '规则修改', 2053000000000000003, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:rule:edit', '#', 103, 1, NOW(), 1, NOW(), '');

-- 质控计划 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000004, '质控计划', 2053000000000000001, 3, 'qcPlan', 'config/qc/qcPlan', NULL, 1, 0, 'C', '0', '0', 'lis:qc:plan:list', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000018, '计划查询', 2053000000000000004, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:plan:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000019, '计划修改', 2053000000000000004, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:plan:edit', '#', 103, 1, NOW(), 1, NOW(), '');

-- 质控执行 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000005, '质控执行', 2053000000000000001, 4, 'qcExecution', 'config/qc/qcRecord', NULL, 1, 0, 'C', '0', '0', 'lis:qc:execution:list', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000020, '执行查询', 2053000000000000005, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:execution:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000021, '执行录入', 2053000000000000005, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:execution:add', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000022, '执行导出', 2053000000000000005, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:execution:export', '#', 103, 1, NOW(), 1, NOW(), '');

-- 失控处理 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000006, '失控处理', 2053000000000000001, 5, 'qcOoc', 'config/qc/qcOoc', NULL, 1, 0, 'C', '0', '0', 'lis:qc:ooc:list', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000023, '失控查询', 2053000000000000006, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:ooc:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000024, '失控处理', 2053000000000000006, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:ooc:handle', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000025, '解除锁定', 2053000000000000006, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:ooc:unlock', '#', 103, 1, NOW(), 1, NOW(), '');

-- 一致性比对 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000007, '一致性比对', 2053000000000000001, 6, 'qcComparison', 'config/qc/qcComparison', NULL, 1, 0, 'C', '0', '0', 'lis:qc:comparison:list', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000026, '比对查询', 2053000000000000007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:comparison:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000027, '比对修改', 2053000000000000007, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:comparison:edit', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000028, '比对导出', 2053000000000000007, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:comparison:export', '#', 103, 1, NOW(), 1, NOW(), '');

-- 室间质评 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000008, '室间质评', 2053000000000000001, 7, 'qcEqa', 'config/qc/qcEqa', NULL, 1, 0, 'C', '0', '0', 'lis:qc:eqa:list', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000029, '质评查询', 2053000000000000008, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:eqa:list', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000030, '质评修改', 2053000000000000008, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:eqa:edit', '#', 103, 1, NOW(), 1, NOW(), '');

-- 质控报表 (C)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000009, '质控报表', 2053000000000000001, 8, 'qcReport', 'config/qc/qcReport', NULL, 1, 0, 'C', '0', '0', 'lis:qc:report:view', '', 103, 1, NOW(), 1, NOW(), '');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES
(2053000000000000031, '报表查看', 2053000000000000009, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:report:view', '#', 103, 1, NOW(), 1, NOW(), ''),
(2053000000000000032, '报表导出', 2053000000000000009, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'lis:qc:report:export', '#', 103, 1, NOW(), 1, NOW(), '');
