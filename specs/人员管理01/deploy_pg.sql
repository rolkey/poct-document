-- ============================================================
-- 考核功能完善 — PostgreSQL 业务表脚本 (his-lis 库)
-- 日期: 2026-05-12
-- 
-- 连接: jdbc:postgresql://192.168.168.128:5432/his-lis
-- 用户: postgres / root
-- 
-- 执行: psql -h 192.168.168.128 -U postgres -d his-lis -f deploy_pg.sql
-- ============================================================

-- Part 1: his_person_exam_paper 新增字段
ALTER TABLE his_person_exam_paper ADD COLUMN IF NOT EXISTS allowed_ip VARCHAR(500);
COMMENT ON COLUMN his_person_exam_paper.allowed_ip IS '允许访问的IP，多IP逗号或CIDR分隔，空=不限制';

ALTER TABLE his_person_exam_paper ADD COLUMN IF NOT EXISTS start_time TIMESTAMP;
COMMENT ON COLUMN his_person_exam_paper.start_time IS '考试开始时间';

ALTER TABLE his_person_exam_paper ADD COLUMN IF NOT EXISTS end_time TIMESTAMP;
COMMENT ON COLUMN his_person_exam_paper.end_time IS '考试结束时间';

ALTER TABLE his_person_exam_paper ADD COLUMN IF NOT EXISTS paper_type VARCHAR(20) DEFAULT '正式';
COMMENT ON COLUMN his_person_exam_paper.paper_type IS '试卷类型: 正式/模拟';

-- Part 2: 新建 his_person_exam_login_log 表
CREATE TABLE IF NOT EXISTS his_person_exam_login_log (
    log_id          BIGINT NOT NULL,
    paper_id        BIGINT,
    person_id       BIGINT,
    client_ip       VARCHAR(100) NOT NULL,
    allowed_ip      VARCHAR(500),
    access_result   VARCHAR(20) NOT NULL DEFAULT '失败',
    failure_reason  VARCHAR(500),
    access_time     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    create_time     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_time     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    create_by       BIGINT,
    update_by       BIGINT,
    remark          VARCHAR(500),
    PRIMARY KEY (log_id)
);

COMMENT ON TABLE his_person_exam_login_log IS '考试登录访问记录表';
COMMENT ON COLUMN his_person_exam_login_log.log_id IS '记录ID';
COMMENT ON COLUMN his_person_exam_login_log.paper_id IS '试卷ID';
COMMENT ON COLUMN his_person_exam_login_log.person_id IS '人员ID';
COMMENT ON COLUMN his_person_exam_login_log.client_ip IS '客户端请求IP';
COMMENT ON COLUMN his_person_exam_login_log.allowed_ip IS '试卷允许的IP';
COMMENT ON COLUMN his_person_exam_login_log.access_result IS '访问结果: 成功/失败';
COMMENT ON COLUMN his_person_exam_login_log.failure_reason IS '失败原因';
COMMENT ON COLUMN his_person_exam_login_log.access_time IS '访问时间';
