-- ============================================================
-- 人员管理模块 sys_menu 补充脚本
-- 功能:
--   1. 修正 PersonInfo/Cert 权限前缀 (his:person → person:)
--   2. 新增人员档案查询菜单
--   3. 新增所有新端点对应的按钮权限
-- ============================================================

-- ============================================================
-- Part 1: 修正示例错误的权限前缀 (his:personInfo → person:info)
-- ============================================================
UPDATE sys_menu SET perms = 'person:info:list'    WHERE menu_id = 2051949043604566018;
UPDATE sys_menu SET perms = 'person:info:query'   WHERE menu_id = 2051949043604566019;
UPDATE sys_menu SET perms = 'person:info:add'     WHERE menu_id = 2051949043604566020;
UPDATE sys_menu SET perms = 'person:info:edit'    WHERE menu_id = 2051949043604566021;
UPDATE sys_menu SET perms = 'person:info:remove'  WHERE menu_id = 2051949043604566022;
UPDATE sys_menu SET perms = 'person:info:export'  WHERE menu_id = 2051949043604566023;
UPDATE sys_menu SET perms = 'person:cert:list'    WHERE menu_id = 2051949175800639489;
UPDATE sys_menu SET perms = 'person:cert:query'   WHERE menu_id = 2051949175800639490;
UPDATE sys_menu SET perms = 'person:cert:add'     WHERE menu_id = 2051949175800639491;
UPDATE sys_menu SET perms = 'person:cert:edit'    WHERE menu_id = 2051949175800639492;
UPDATE sys_menu SET perms = 'person:cert:remove'  WHERE menu_id = 2051949175800639493;
UPDATE sys_menu SET perms = 'person:cert:export'  WHERE menu_id = 2051949175800639494;

-- ============================================================
-- Part 2: 新增菜单 — 人员档案查询 (page)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000001, '人员档案查询', 2043206936622604289, 25, 'personProfile', 'person/personProfile/index', 'C', '0', '0', 'his:personProfile:list', '#', NOW());

-- 按钮: 查询
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000002, '人员档案查询', 2052000000000000001, 1, '#', 'F', '0', '0', 'his:personProfile:query', '#', NOW());

-- 按钮: 导出
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000003, '人员档案导出', 2052000000000000001, 2, '#', 'F', '0', '0', 'his:personProfile:export', '#', NOW());

-- ============================================================
-- Part 3: PersonInfo 新增按钮 (预选管理、状态变更、导入)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000010, '预选人员列表', 2051949043604566018, 6, '#', 'F', '0', '0', 'person:info:preselection:list', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000011, '预选确认', 2051949043604566018, 7, '#', 'F', '0', '0', 'person:info:preselection:confirm', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000012, '预选驳回', 2051949043604566018, 8, '#', 'F', '0', '0', 'person:info:preselection:reject', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000013, '人员状态变更', 2051949043604566018, 9, '#', 'F', '0', '0', 'person:info:status', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000014, '人员导入', 2051949043604566018, 10, '#', 'F', '0', '0', 'person:info:import', '#', NOW());

-- ============================================================
-- Part 4: PersonCert 新增按钮 (上传、到期列表)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000020, '资质证书上传', 2051949175800639489, 6, '#', 'F', '0', '0', 'person:cert:upload', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000021, '即将到期证书', 2051949175800639489, 7, '#', 'F', '0', '0', 'person:cert:expiring', '#', NOW());

-- ============================================================
-- Part 5: PersonExam 新增按钮 (提交考试、统计)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000030, '考试提交', 2051973160156311554, 6, '#', 'F', '0', '0', 'his:personExam:submit', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000031, '考试统计', 2051973160156311554, 7, '#', 'F', '0', '0', 'his:personExam:statistics', '#', NOW());

-- ============================================================
-- Part 6: PersonExamPaper 新增按钮 (组卷、发布、确认)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000040, '自动组卷', 2051967528573382657, 6, '#', 'F', '0', '0', 'his:personExamPaper:generate', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000041, '组卷确认', 2051967528573382657, 7, '#', 'F', '0', '0', 'his:personExamPaper:confirm', '#', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000042, '试卷发布', 2051967528573382657, 8, '#', 'F', '0', '0', 'his:personExamPaper:publish', '#', NOW());

-- ============================================================
-- Part 7: PersonExamQuestion 新增按钮 (导入)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000050, '题目导入', 2051952181497606146, 6, '#', 'F', '0', '0', 'his:personExamQuestion:import', '#', NOW());

-- ============================================================
-- Part 8: PersonAuthorizeFlow 新增按钮 (审批审核)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000060, '审批审核', 2051966697274912769, 6, '#', 'F', '0', '0', 'his:personAuthorizeFlow:approve', '#', NOW());

-- ============================================================
-- Part 9: PersonTrainRecord 新增按钮 (签到)
-- ============================================================
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, menu_type, visible, status, perms, icon, create_time)
VALUES (2052000000000000070, '培训签到', 2051968450267492353, 6, '#', 'F', '0', '0', 'his:personTrainRecord:sign', '#', NOW());
