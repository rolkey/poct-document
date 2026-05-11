-- ============================================
-- 仪器质控模块 (QC Module) — 建表 DDL
-- 数据库: his-lis (PostgreSQL)
-- 日期: 2026-05-10
-- ============================================

-- 4.2.1 质控物（质控品）管理 --------------------------------------------------

-- 质控品基础信息
CREATE TABLE lis_qc_material (
  material_id BIGINT,
  material_name VARCHAR(100),
  test_item_id BIGINT,
  level VARCHAR(10),
  manufacturer VARCHAR(100),
  reg_cert_no VARCHAR(50),
  storage_temp VARCHAR(50),
  status CHAR(1) DEFAULT '1',
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_material IS '质控品基础信息';
COMMENT ON COLUMN lis_qc_material.material_id IS '质控品ID';
COMMENT ON COLUMN lis_qc_material.material_name IS '质控品名称';
COMMENT ON COLUMN lis_qc_material.test_item_id IS '关联检验项目ID';
COMMENT ON COLUMN lis_qc_material.level IS '水平(LOW/MEDIUM/HIGH)';
COMMENT ON COLUMN lis_qc_material.manufacturer IS '生产厂家';
COMMENT ON COLUMN lis_qc_material.reg_cert_no IS '注册证号';
COMMENT ON COLUMN lis_qc_material.storage_temp IS '储存温度要求';
COMMENT ON COLUMN lis_qc_material.status IS '状态(0禁用 1启用)';
COMMENT ON COLUMN lis_qc_material.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_material.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_material.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_material.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_material.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_material.tenant_id IS '分院ID';

-- 质控品批次（入库记录）
CREATE TABLE lis_qc_material_batch (
  batch_id BIGINT,
  material_id BIGINT,
  lot_no VARCHAR(50),
  dept_id BIGINT,
  instrument_id BIGINT,
  target_value DECIMAL(10,4),
  sd DECIMAL(10,4),
  cv DECIMAL(10,4),
  range_low DECIMAL(10,4),
  range_high DECIMAL(10,4),
  expiry_date DATE,
  open_bottle_valid_days INTEGER,
  open_date DATE,
  in_stock_date DATE,
  in_stock_person VARCHAR(50),
  batch_status VARCHAR(20) DEFAULT 'NORMAL',
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_material_batch IS '质控品批次（入库记录）';
COMMENT ON COLUMN lis_qc_material_batch.batch_id IS '批次ID';
COMMENT ON COLUMN lis_qc_material_batch.material_id IS '关联质控品ID';
COMMENT ON COLUMN lis_qc_material_batch.lot_no IS '批号';
COMMENT ON COLUMN lis_qc_material_batch.dept_id IS '绑定科室';
COMMENT ON COLUMN lis_qc_material_batch.instrument_id IS '绑定仪器ID';
COMMENT ON COLUMN lis_qc_material_batch.target_value IS '靶值';
COMMENT ON COLUMN lis_qc_material_batch.sd IS '标准差';
COMMENT ON COLUMN lis_qc_material_batch.cv IS '变异系数';
COMMENT ON COLUMN lis_qc_material_batch.range_low IS '允许范围下限';
COMMENT ON COLUMN lis_qc_material_batch.range_high IS '允许范围上限';
COMMENT ON COLUMN lis_qc_material_batch.expiry_date IS '失效日期';
COMMENT ON COLUMN lis_qc_material_batch.open_bottle_valid_days IS '开瓶效期（天）';
COMMENT ON COLUMN lis_qc_material_batch.open_date IS '开瓶日期';
COMMENT ON COLUMN lis_qc_material_batch.in_stock_date IS '入库日期';
COMMENT ON COLUMN lis_qc_material_batch.in_stock_person IS '入库人';
COMMENT ON COLUMN lis_qc_material_batch.batch_status IS '批次状态(NORMAL/EXPIRED/LOCKED)';
COMMENT ON COLUMN lis_qc_material_batch.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_material_batch.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_material_batch.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_material_batch.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_material_batch.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_material_batch.tenant_id IS '分院ID';
CREATE UNIQUE INDEX idx_qc_material_batch_unique ON lis_qc_material_batch(material_id, instrument_id, lot_no);

-- 4.2.2 质控规则管理（Westgard）----------------------------------------------

-- Westgard 规则字典
CREATE TABLE lis_qc_rule (
  rule_id BIGINT,
  rule_code VARCHAR(20),
  rule_name VARCHAR(50),
  rule_type VARCHAR(10),
  description VARCHAR(500),
  sort_order INTEGER,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_rule IS 'Westgard质控规则字典';
COMMENT ON COLUMN lis_qc_rule.rule_id IS '规则ID';
COMMENT ON COLUMN lis_qc_rule.rule_code IS '规则编码(W1_2S/W1_3S/W2_2S/R_4S/W4_1S/W10_X)';
COMMENT ON COLUMN lis_qc_rule.rule_name IS '规则名称';
COMMENT ON COLUMN lis_qc_rule.rule_type IS '规则类型(WARNING/OOC)';
COMMENT ON COLUMN lis_qc_rule.description IS '规则说明';
COMMENT ON COLUMN lis_qc_rule.sort_order IS '排序';
COMMENT ON COLUMN lis_qc_rule.tenant_id IS '分院ID';

-- 项目/仪器规则配置
CREATE TABLE lis_qc_rule_config (
  config_id BIGINT,
  instrument_id BIGINT,
  test_item_id BIGINT,
  rule_ids VARCHAR(200),
  mean DECIMAL(10,4),
  sd DECIMAL(10,4),
  cv DECIMAL(10,4),
  tea DECIMAL(10,4),
  allowable_bias DECIMAL(10,4),
  status CHAR(1) DEFAULT '1',
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_rule_config IS '仪器/项目质控规则配置';
COMMENT ON COLUMN lis_qc_rule_config.config_id IS '配置ID';
COMMENT ON COLUMN lis_qc_rule_config.instrument_id IS '关联仪器ID';
COMMENT ON COLUMN lis_qc_rule_config.test_item_id IS '关联项目ID';
COMMENT ON COLUMN lis_qc_rule_config.rule_ids IS '启用规则ID列表(逗号分隔)';
COMMENT ON COLUMN lis_qc_rule_config.mean IS '均值';
COMMENT ON COLUMN lis_qc_rule_config.sd IS '标准差';
COMMENT ON COLUMN lis_qc_rule_config.cv IS '变异系数';
COMMENT ON COLUMN lis_qc_rule_config.tea IS '允许总误差';
COMMENT ON COLUMN lis_qc_rule_config.allowable_bias IS '允许偏倚';
COMMENT ON COLUMN lis_qc_rule_config.status IS '状态(0禁用 1启用)';
COMMENT ON COLUMN lis_qc_rule_config.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_rule_config.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_rule_config.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_rule_config.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_rule_config.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_rule_config.tenant_id IS '分院ID';
CREATE UNIQUE INDEX idx_qc_rule_config_unique ON lis_qc_rule_config(instrument_id, test_item_id);

-- 4.2.3 质控计划管理 ---------------------------------------------------------

CREATE TABLE lis_qc_plan (
  plan_id BIGINT,
  instrument_id BIGINT,
  plan_type VARCHAR(20),
  schedule_time TIME,
  remind_before_min INTEGER,
  responsible_person VARCHAR(50),
  status CHAR(1) DEFAULT '1',
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_plan IS '质控执行计划';
COMMENT ON COLUMN lis_qc_plan.plan_id IS '计划ID';
COMMENT ON COLUMN lis_qc_plan.instrument_id IS '关联仪器ID';
COMMENT ON COLUMN lis_qc_plan.plan_type IS '频率类型(DAILY/STARTUP/BATCH_CHANGE/MAINTENANCE)';
COMMENT ON COLUMN lis_qc_plan.schedule_time IS '每日固定时间';
COMMENT ON COLUMN lis_qc_plan.remind_before_min IS '提前提醒分钟数';
COMMENT ON COLUMN lis_qc_plan.responsible_person IS '责任人';
COMMENT ON COLUMN lis_qc_plan.status IS '启用状态(0禁用 1启用)';
COMMENT ON COLUMN lis_qc_plan.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_plan.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_plan.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_plan.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_plan.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_plan.tenant_id IS '分院ID';

-- 4.2.4 质控执行与采集 -------------------------------------------------------

CREATE TABLE lis_qc_record (
  record_id BIGINT,
  instrument_id BIGINT,
  test_item_id BIGINT,
  batch_id BIGINT,
  test_value DECIMAL(10,4),
  judgment VARCHAR(20),
  triggered_rules VARCHAR(200),
  collection_type VARCHAR(10),
  operator VARCHAR(50),
  test_time TIMESTAMP,
  remark VARCHAR(500),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_record IS '质控执行记录';
COMMENT ON COLUMN lis_qc_record.record_id IS '记录ID';
COMMENT ON COLUMN lis_qc_record.instrument_id IS '仪器ID';
COMMENT ON COLUMN lis_qc_record.test_item_id IS '项目ID';
COMMENT ON COLUMN lis_qc_record.batch_id IS '关联批次ID';
COMMENT ON COLUMN lis_qc_record.test_value IS '检测值';
COMMENT ON COLUMN lis_qc_record.judgment IS '判定(IN_CONTROL/WARNING/OOC)';
COMMENT ON COLUMN lis_qc_record.triggered_rules IS '触发的规则编码列表';
COMMENT ON COLUMN lis_qc_record.collection_type IS '采集方式(AUTO/MANUAL)';
COMMENT ON COLUMN lis_qc_record.operator IS '操作员';
COMMENT ON COLUMN lis_qc_record.test_time IS '检测时间';
COMMENT ON COLUMN lis_qc_record.remark IS '备注';
COMMENT ON COLUMN lis_qc_record.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_record.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_record.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_record.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_record.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_record.tenant_id IS '分院ID';
CREATE INDEX idx_qc_record_query ON lis_qc_record(instrument_id, test_item_id, test_time);

-- 4.2.6 失控处理闭环 ---------------------------------------------------------

-- 失控原因字典
CREATE TABLE lis_qc_ooc_cause_dict (
  cause_id BIGINT,
  cause_name VARCHAR(100),
  cause_type VARCHAR(20),
  sort_order INTEGER,
  status CHAR(1) DEFAULT '1',
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_ooc_cause_dict IS '失控原因字典';
COMMENT ON COLUMN lis_qc_ooc_cause_dict.cause_id IS '原因ID';
COMMENT ON COLUMN lis_qc_ooc_cause_dict.cause_name IS '原因名称';
COMMENT ON COLUMN lis_qc_ooc_cause_dict.cause_type IS '原因分类(设备故障/定标漂移/质控品变质/试剂过期/操作误差/环境因素/其他)';
COMMENT ON COLUMN lis_qc_ooc_cause_dict.sort_order IS '排序';
COMMENT ON COLUMN lis_qc_ooc_cause_dict.status IS '状态(0禁用 1启用)';
COMMENT ON COLUMN lis_qc_ooc_cause_dict.tenant_id IS '分院ID';

-- 失控处理记录
CREATE TABLE lis_qc_ooc_record (
  ooc_id BIGINT,
  record_id BIGINT,
  ooc_cause VARCHAR(200),
  corrective_action VARCHAR(200),
  handler VARCHAR(50),
  handle_time TIMESTAMP,
  ooc_status VARCHAR(20) DEFAULT 'PENDING',
  retest_record_id BIGINT,
  unlock_time TIMESTAMP,
  remark VARCHAR(500),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_ooc_record IS '失控处理记录';
COMMENT ON COLUMN lis_qc_ooc_record.ooc_id IS '失控处理ID';
COMMENT ON COLUMN lis_qc_ooc_record.record_id IS '关联质控记录ID';
COMMENT ON COLUMN lis_qc_ooc_record.ooc_cause IS '失控原因';
COMMENT ON COLUMN lis_qc_ooc_record.corrective_action IS '纠正措施';
COMMENT ON COLUMN lis_qc_ooc_record.handler IS '处理人';
COMMENT ON COLUMN lis_qc_ooc_record.handle_time IS '处理时间';
COMMENT ON COLUMN lis_qc_ooc_record.ooc_status IS '处理状态(PENDING/RESOLVED/UNLOCKED)';
COMMENT ON COLUMN lis_qc_ooc_record.retest_record_id IS '复查质控记录ID';
COMMENT ON COLUMN lis_qc_ooc_record.unlock_time IS '解除锁定时间';
COMMENT ON COLUMN lis_qc_ooc_record.remark IS '备注';
COMMENT ON COLUMN lis_qc_ooc_record.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_ooc_record.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_ooc_record.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_ooc_record.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_ooc_record.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_ooc_record.tenant_id IS '分院ID';

-- 4.2.7 一致性比对 -----------------------------------------------------------

-- 比对主表
CREATE TABLE lis_qc_comparison (
  comparison_id BIGINT,
  comparison_type VARCHAR(20),
  instrument_id BIGINT,
  reference_instrument_id BIGINT,
  test_item_id BIGINT,
  comparison_date DATE,
  period_number INTEGER,
  total_samples INTEGER,
  pass_samples INTEGER,
  pass_rate DECIMAL(5,2),
  overall_result VARCHAR(10),
  export_file VARCHAR(500),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_comparison IS '一致性比对主表';
COMMENT ON COLUMN lis_qc_comparison.comparison_id IS '比对ID';
COMMENT ON COLUMN lis_qc_comparison.comparison_type IS '比对类型(POCT_POCT/POCT_LAB)';
COMMENT ON COLUMN lis_qc_comparison.instrument_id IS '仪器ID';
COMMENT ON COLUMN lis_qc_comparison.reference_instrument_id IS '参比仪器/实验室ID';
COMMENT ON COLUMN lis_qc_comparison.test_item_id IS '项目ID';
COMMENT ON COLUMN lis_qc_comparison.comparison_date IS '比对日期';
COMMENT ON COLUMN lis_qc_comparison.period_number IS '第几周期';
COMMENT ON COLUMN lis_qc_comparison.total_samples IS '样本总数';
COMMENT ON COLUMN lis_qc_comparison.pass_samples IS '合格样本数';
COMMENT ON COLUMN lis_qc_comparison.pass_rate IS '合格率(%)';
COMMENT ON COLUMN lis_qc_comparison.overall_result IS '总体结果(PASS/FAIL)';
COMMENT ON COLUMN lis_qc_comparison.export_file IS '导出报告路径';
COMMENT ON COLUMN lis_qc_comparison.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_comparison.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_comparison.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_comparison.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_comparison.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_comparison.tenant_id IS '分院ID';

-- 比对样本明细
CREATE TABLE lis_qc_comparison_detail (
  detail_id BIGINT,
  comparison_id BIGINT,
  sample_no VARCHAR(50),
  target_value DECIMAL(10,4),
  test_value DECIMAL(10,4),
  bias DECIMAL(10,4),
  allow_deviation DECIMAL(10,4),
  sample_result VARCHAR(10),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_comparison_detail IS '一致性比对样本明细';
COMMENT ON COLUMN lis_qc_comparison_detail.detail_id IS '明细ID';
COMMENT ON COLUMN lis_qc_comparison_detail.comparison_id IS '关联比对ID';
COMMENT ON COLUMN lis_qc_comparison_detail.sample_no IS '样本编号';
COMMENT ON COLUMN lis_qc_comparison_detail.target_value IS '靶值';
COMMENT ON COLUMN lis_qc_comparison_detail.test_value IS '检测值';
COMMENT ON COLUMN lis_qc_comparison_detail.bias IS '偏倚';
COMMENT ON COLUMN lis_qc_comparison_detail.allow_deviation IS '允许偏差';
COMMENT ON COLUMN lis_qc_comparison_detail.sample_result IS '样本结果(PASS/FAIL)';
COMMENT ON COLUMN lis_qc_comparison_detail.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_comparison_detail.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_comparison_detail.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_comparison_detail.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_comparison_detail.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_comparison_detail.tenant_id IS '分院ID';

-- 4.2.8 室间质评（EQA）-------------------------------------------------------

-- EQA 计划
CREATE TABLE lis_qc_eqa_plan (
  eqa_plan_id BIGINT,
  plan_year VARCHAR(4),
  organization VARCHAR(100),
  test_item_id BIGINT,
  scheduled_date DATE,
  status VARCHAR(20) DEFAULT 'PENDING',
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_eqa_plan IS '室间质评计划';
COMMENT ON COLUMN lis_qc_eqa_plan.eqa_plan_id IS '计划ID';
COMMENT ON COLUMN lis_qc_eqa_plan.plan_year IS '年度';
COMMENT ON COLUMN lis_qc_eqa_plan.organization IS '组织机构';
COMMENT ON COLUMN lis_qc_eqa_plan.test_item_id IS '项目ID';
COMMENT ON COLUMN lis_qc_eqa_plan.scheduled_date IS '计划日期';
COMMENT ON COLUMN lis_qc_eqa_plan.status IS '状态(PENDING/COMPLETED)';
COMMENT ON COLUMN lis_qc_eqa_plan.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_eqa_plan.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_eqa_plan.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_eqa_plan.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_eqa_plan.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_eqa_plan.tenant_id IS '分院ID';

-- EQA 执行记录
CREATE TABLE lis_qc_eqa_record (
  eqa_record_id BIGINT,
  eqa_plan_id BIGINT,
  result_value VARCHAR(500),
  report_file VARCHAR(500),
  score VARCHAR(50),
  result VARCHAR(10),
  rectify_record VARCHAR(1000),
  report_date DATE,
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20) DEFAULT '000000'
);
COMMENT ON TABLE lis_qc_eqa_record IS '室间质评执行记录';
COMMENT ON COLUMN lis_qc_eqa_record.eqa_record_id IS '记录ID';
COMMENT ON COLUMN lis_qc_eqa_record.eqa_plan_id IS '关联计划ID';
COMMENT ON COLUMN lis_qc_eqa_record.result_value IS '检测结果';
COMMENT ON COLUMN lis_qc_eqa_record.report_file IS '回馈表附件路径';
COMMENT ON COLUMN lis_qc_eqa_record.score IS '成绩';
COMMENT ON COLUMN lis_qc_eqa_record.result IS '结果(PASS/FAIL)';
COMMENT ON COLUMN lis_qc_eqa_record.rectify_record IS '不合格整改记录';
COMMENT ON COLUMN lis_qc_eqa_record.report_date IS '上报日期';
COMMENT ON COLUMN lis_qc_eqa_record.create_dept IS '创建部门';
COMMENT ON COLUMN lis_qc_eqa_record.create_by IS '创建人';
COMMENT ON COLUMN lis_qc_eqa_record.create_time IS '创建时间';
COMMENT ON COLUMN lis_qc_eqa_record.update_by IS '修改人';
COMMENT ON COLUMN lis_qc_eqa_record.update_time IS '修改时间';
COMMENT ON COLUMN lis_qc_eqa_record.tenant_id IS '分院ID';

-- ============================================
-- 种子数据
-- ============================================

-- Westgard 规则（6条）
INSERT INTO lis_qc_rule (rule_id, rule_code, rule_name, rule_type, description, sort_order) VALUES
(1, 'W1_2S', '1₂s 警告规则', 'WARNING', '1个质控结果超过±2SD，触发警告', 1),
(2, 'W1_3S', '1₃s 失控规则', 'OOC', '1个质控结果超过±3SD，判定失控（检测大随机误差）', 2),
(3, 'W2_2S', '2₂s 失控规则', 'OOC', '连续2个质控结果同方向超过±2SD，判定失控（检测系统误差）', 3),
(4, 'R_4S', 'R₄s 失控规则', 'OOC', '同一批内最大与最小差值超过4SD，判定失控（检测批内精密度）', 4),
(5, 'W4_1S', '4₁s 失控规则', 'OOC', '连续4个质控结果同方向超过±1SD，判定失控（检测微小偏移）', 5),
(6, 'W10_X', '10x 失控规则', 'OOC', '连续10个质控结果落在均值同一侧，判定失控（检测长期漂移）', 6);

-- 失控原因字典（7条）
INSERT INTO lis_qc_ooc_cause_dict (cause_id, cause_name, cause_type, sort_order, status) VALUES
(1, '设备故障', '设备故障', 1, '1'),
(2, '定标漂移', '定标漂移', 2, '1'),
(3, '质控品变质', '质控品变质', 3, '1'),
(4, '试剂过期', '试剂过期', 4, '1'),
(5, '操作误差', '操作误差', 5, '1'),
(6, '环境因素', '环境因素', 6, '1'),
(7, '其他', '其他', 7, '1');
