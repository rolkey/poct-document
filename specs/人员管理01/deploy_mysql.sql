-- ============================================================
-- 考核功能完善 — MySQL 菜单脚本 (ry-cloud 库)
-- 日期: 2026-05-12
-- 
-- 连接: jdbc:mysql://192.168.168.128:3306/ry-cloud
-- 用户: ruoyi / Ruoyi@111
-- 
-- 执行: mysql -h 192.168.168.128 -u ruoyi -pRuoyi@111 ry-cloud < deploy_mysql.sql
-- ============================================================

-- Part 1: 考生端入口 — "可考试卷"页面（侧边栏可见）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000090, '可考试卷', 2043206936622604289, 14, 'personExamAvailable', 'person/personExam/available/index', 'C', '0', '0', '', '#', NOW());

-- Part 2: "在线考试"页面（隐藏，仅路由注册，由可考试卷页跳转进入）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000091, '在线考试', 2043206936622604289, 15, 'personExamTake', 'person/personExam/take/index', 'C', '1', '0', '', '#', NOW());

-- Part 3: 考试IP校验按钮（挂在考试记录页下）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000092, '考试IP校验', 2051973160156311554, 8, '#', 'F', '0', '0', 'his:personExam:validate', '#', NOW());

-- Part 4: "考试登录记录"页面（侧边栏可见）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000093, '考试登录记录', 2043206936622604289, 16, 'personExamLoginLog', 'person/personExamLoginLog/index', 'C', '0', '0', 'his:personExamLoginLog:list', '#', NOW());

-- Part 5: 按钮 — 查询
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000094, '考试登录记录查询', 2052000000000000093, 1, '#', 'F', '0', '0', 'his:personExamLoginLog:query', '#', NOW());

-- Part 6: 按钮 — 导出
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000095, '考试登录记录导出', 2052000000000000093, 2, '#', 'F', '0', '0', 'his:personExamLoginLog:export', '#', NOW());

-- ============================================================
-- 给角色分配新菜单（按实际 role_id 调整后取消注释执行）
-- ============================================================
-- INSERT INTO sys_role_menu (role_id, menu_id) VALUES (1, 2052000000000000090);
-- INSERT INTO sys_role_menu (role_id, menu_id) VALUES (1, 2052000000000000091);
-- INSERT INTO sys_role_menu (role_id, menu_id) VALUES (1, 2052000000000000093);

-- ============================================================
-- 验证
-- ============================================================
-- SELECT menu_id, menu_name, path, component, visible FROM sys_menu
-- WHERE menu_id BETWEEN 2052000000000000090 AND 2052000000000000095;
