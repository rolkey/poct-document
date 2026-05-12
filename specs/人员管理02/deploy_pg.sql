-- ============================================================
-- 考题分类功能 — 设备分类 (PostgreSQL his-lis 库)
-- 日期: 2026-05-12
--
-- 连接: jdbc:postgresql://192.168.168.128:5432/his-lis
-- 用户: postgres / root
--
-- 执行: psql -h 192.168.168.128 -U postgres -d his-lis -f deploy_pg.sql
-- ============================================================

-- 考题-设备类型关联表（多对多）
CREATE TABLE IF NOT EXISTS his_person_exam_question_device (
    question_id  BIGINT       NOT NULL,
    device_type  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (question_id, device_type)
);

COMMENT ON TABLE  his_person_exam_question_device IS '考题设备分类关联表';
COMMENT ON COLUMN his_person_exam_question_device.question_id IS '题目ID FK->his_person_exam_question';
COMMENT ON COLUMN his_person_exam_question_device.device_type IS '设备类型（字典值）';
