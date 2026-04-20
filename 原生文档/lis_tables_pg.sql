-- 表: bis_blood_cross_list (bis_blood_cross_list)
CREATE TABLE bis_blood_cross_list (
  cross_id BIGINT,
  inspection_id BIGINT,
  in_credit_id BIGINT,
  method_type_id BIGINT,
  cross_date VARCHAR(255),
  cross_result1 VARCHAR(255),
  cross_result2 VARCHAR(255),
  cross_result3 VARCHAR(255),
  cross_result4 VARCHAR(255),
  cross_person VARCHAR(255),
  charge VARCHAR(255),
  workload VARCHAR(255),
  charge_date VARCHAR(255),
  charge_person VARCHAR(255),
  charge_state VARCHAR(255),
  cross_state VARCHAR(255),
  print_flag VARCHAR(255),
  print_number VARCHAR(255),
  check_person VARCHAR(255),
  check_time VARCHAR(255),
  cross_remark VARCHAR(255),
  cross_amount VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE bis_blood_cross_list IS '交叉配血记录';
COMMENT ON COLUMN bis_blood_cross_list.create_dept IS '创建部门';
COMMENT ON COLUMN bis_blood_cross_list.create_by IS '创建人';
COMMENT ON COLUMN bis_blood_cross_list.create_time IS '创建时间';
COMMENT ON COLUMN bis_blood_cross_list.update_by IS '修改人';
COMMENT ON COLUMN bis_blood_cross_list.update_time IS '修改时间';
COMMENT ON COLUMN bis_blood_cross_list.tenant_id IS '分院ID';
COMMENT ON COLUMN bis_blood_cross_list.cross_id IS '交叉ID';
COMMENT ON COLUMN bis_blood_cross_list.inspection_id IS '检验ID';
COMMENT ON COLUMN bis_blood_cross_list.in_credit_id IS '血液入库库存ID';
COMMENT ON COLUMN bis_blood_cross_list.method_type_id IS '检验方法';
COMMENT ON COLUMN bis_blood_cross_list.cross_date IS '交叉日期';
COMMENT ON COLUMN bis_blood_cross_list.cross_result1 IS '交叉结果1';
COMMENT ON COLUMN bis_blood_cross_list.cross_result2 IS '交叉结果2';
COMMENT ON COLUMN bis_blood_cross_list.cross_result3 IS '交叉结果3';
COMMENT ON COLUMN bis_blood_cross_list.cross_result4 IS '交叉结果4';
COMMENT ON COLUMN bis_blood_cross_list.cross_person IS '交叉人员';
COMMENT ON COLUMN bis_blood_cross_list.charge IS '金额';
COMMENT ON COLUMN bis_blood_cross_list.workload IS '工作量';
COMMENT ON COLUMN bis_blood_cross_list.charge_date IS '收费时间';
COMMENT ON COLUMN bis_blood_cross_list.charge_person IS '收费人员';
COMMENT ON COLUMN bis_blood_cross_list.charge_state IS '收费状态';
COMMENT ON COLUMN bis_blood_cross_list.cross_state IS '交叉状态';
COMMENT ON COLUMN bis_blood_cross_list.print_flag IS '打印状态';
COMMENT ON COLUMN bis_blood_cross_list.print_number IS '打印次数';
COMMENT ON COLUMN bis_blood_cross_list.check_person IS '审核人员';
COMMENT ON COLUMN bis_blood_cross_list.check_time IS '审核时间';
COMMENT ON COLUMN bis_blood_cross_list.cross_remark IS '交叉备注';
COMMENT ON COLUMN bis_blood_cross_list.cross_amount IS '交叉次数';

-- 表: bis_blood_input (血液出入库信息表)
CREATE TABLE bis_blood_input (
  in_credit_id BIGINT,
  blood_type_id BIGINT,
  blood_bag_id VARCHAR(255),
  in_date VARCHAR(255),
  blood_donor VARCHAR(255),
  sex VARCHAR(255),
  abo_blood_group VARCHAR(255),
  rh_blood_group VARCHAR(255),
  blood_amount VARCHAR(255),
  blood_unit VARCHAR(255),
  blood_charge VARCHAR(255),
  preparation_type VARCHAR(255),
  preparation_date VARCHAR(255),
  atterm_date VARCHAR(255),
  alarm_date VARCHAR(255),
  input_person VARCHAR(255),
  output_person VARCHAR(255),
  output_date VARCHAR(255),
  state_flag VARCHAR(255),
  scrap_date VARCHAR(255),
  scrap_cause VARCHAR(255),
  scrap_person VARCHAR(255),
  charge_state VARCHAR(255),
  charge_date VARCHAR(255),
  charge_person VARCHAR(255),
  inspection_id BIGINT,
  print_state VARCHAR(255),
  destroy_person VARCHAR(255),
  destroy_date VARCHAR(255),
  destroy_position VARCHAR(255),
  receive_person VARCHAR(255),
  abo_blood_check VARCHAR(255),
  rh_blood_check VARCHAR(255),
  inspection_person VARCHAR(255),
  check_person VARCHAR(255),
  check_time VARCHAR(255),
  blood_source VARCHAR(255),
  in_location VARCHAR(255),
  cross_date VARCHAR(255),
  remark VARCHAR(255),
  transport_condition VARCHAR(255),
  external_appearance VARCHAR(255),
  blood_type_code VARCHAR(255),
  blood_group_code VARCHAR(255),
  blood_atterm_code VARCHAR(255),
  blood_antibody_check VARCHAR(255),
  sampling_time VARCHAR(255),
  sampling_person VARCHAR(255),
  charge_num VARCHAR(255),
  receive_time VARCHAR(255),
  lastmodify VARCHAR(255),
blood_id VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE bis_blood_input IS '血液出入库信息表';
COMMENT ON COLUMN bis_blood_input.create_dept IS '创建部门';
COMMENT ON COLUMN bis_blood_input.create_by IS '创建人';
COMMENT ON COLUMN bis_blood_input.create_time IS '创建时间';
COMMENT ON COLUMN bis_blood_input.update_by IS '修改人';
COMMENT ON COLUMN bis_blood_input.update_time IS '修改时间';
COMMENT ON COLUMN bis_blood_input.tenant_id IS '分院ID';
COMMENT ON COLUMN bis_blood_input.in_credit_id IS '血液入库库存ID';
COMMENT ON COLUMN bis_blood_input.blood_type_id IS '血液类型id';
COMMENT ON COLUMN bis_blood_input.blood_bag_id IS '血袋号';
COMMENT ON COLUMN bis_blood_input.in_date IS '入库日期';
COMMENT ON COLUMN bis_blood_input.blood_donor IS '献血员';
COMMENT ON COLUMN bis_blood_input.sex IS '性别';
COMMENT ON COLUMN bis_blood_input.abo_blood_group IS 'ABO血型';
COMMENT ON COLUMN bis_blood_input.rh_blood_group IS 'RH血型';
COMMENT ON COLUMN bis_blood_input.blood_amount IS '入库血量';
COMMENT ON COLUMN bis_blood_input.blood_unit IS '单位';
COMMENT ON COLUMN bis_blood_input.blood_charge IS '血液费用';
COMMENT ON COLUMN bis_blood_input.preparation_type IS '制备方式';
COMMENT ON COLUMN bis_blood_input.preparation_date IS '制备日期';
COMMENT ON COLUMN bis_blood_input.atterm_date IS '到期日期';
COMMENT ON COLUMN bis_blood_input.alarm_date IS '报警日期';
COMMENT ON COLUMN bis_blood_input.input_person IS '入库人员';
COMMENT ON COLUMN bis_blood_input.output_person IS '出库人员';
COMMENT ON COLUMN bis_blood_input.output_date IS '出库时间';
COMMENT ON COLUMN bis_blood_input.state_flag IS '状态';
COMMENT ON COLUMN bis_blood_input.scrap_date IS '报废日期';
COMMENT ON COLUMN bis_blood_input.scrap_cause IS '报废原因';
COMMENT ON COLUMN bis_blood_input.scrap_person IS '报废人';
COMMENT ON COLUMN bis_blood_input.charge_state IS '收费状态';
COMMENT ON COLUMN bis_blood_input.charge_date IS '收费日期';
COMMENT ON COLUMN bis_blood_input.charge_person IS '收费人员';
COMMENT ON COLUMN bis_blood_input.inspection_id IS '检验单ID';
COMMENT ON COLUMN bis_blood_input.print_state IS '打印状态';
COMMENT ON COLUMN bis_blood_input.destroy_person IS '销毁人员';
COMMENT ON COLUMN bis_blood_input.destroy_date IS '销毁时间';
COMMENT ON COLUMN bis_blood_input.destroy_position IS '销毁地点';
COMMENT ON COLUMN bis_blood_input.receive_person IS '领取人员';
COMMENT ON COLUMN bis_blood_input.abo_blood_check IS '复查ABO血型';
COMMENT ON COLUMN bis_blood_input.rh_blood_check IS '复查RH血型';
COMMENT ON COLUMN bis_blood_input.inspection_person IS '复检者';
COMMENT ON COLUMN bis_blood_input.check_person IS '审核者';
COMMENT ON COLUMN bis_blood_input.check_time IS '审核时间';
COMMENT ON COLUMN bis_blood_input.blood_source IS '血液来源';
COMMENT ON COLUMN bis_blood_input.in_location IS '存储位置';
COMMENT ON COLUMN bis_blood_input.cross_date IS '交叉日期';
COMMENT ON COLUMN bis_blood_input.remark IS '备注';
COMMENT ON COLUMN bis_blood_input.transport_condition IS '运输条件';
COMMENT ON COLUMN bis_blood_input.external_appearance IS '运输外观';
COMMENT ON COLUMN bis_blood_input.blood_type_code IS '产品码';
COMMENT ON COLUMN bis_blood_input.blood_group_code IS '血型码';
COMMENT ON COLUMN bis_blood_input.blood_atterm_code IS '失效日期码';
COMMENT ON COLUMN bis_blood_input.blood_antibody_check IS '抗体复查';
COMMENT ON COLUMN bis_blood_input.sampling_time IS '采集时间';
COMMENT ON COLUMN bis_blood_input.sampling_person IS '采集人员';
COMMENT ON COLUMN bis_blood_input.charge_num IS '收费数量';
COMMENT ON COLUMN bis_blood_input.receive_time IS '接收时间';
COMMENT ON COLUMN bis_blood_input.lastmodify IS '最后修改时间';
COMMENT ON COLUMN bis_blood_input.blood_id IS '血站ID';

-- 表: bis_blood_packing_class (bis_blood_packing_class)
CREATE TABLE bis_blood_packing_class (
  pack_class_id BIGINT,
  blood_type_id BIGINT,
  pack_class_sort VARCHAR(255),
  packing_amount VARCHAR(255),
  corresponding_id VARCHAR(255),
  cost VARCHAR(255),
  charge VARCHAR(255),
  state_flag VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE bis_blood_packing_class IS '血液包装分类';
COMMENT ON COLUMN bis_blood_packing_class.create_dept IS '创建部门';
COMMENT ON COLUMN bis_blood_packing_class.create_by IS '创建人';
COMMENT ON COLUMN bis_blood_packing_class.create_time IS '创建时间';
COMMENT ON COLUMN bis_blood_packing_class.update_by IS '修改人';
COMMENT ON COLUMN bis_blood_packing_class.update_time IS '修改时间';
COMMENT ON COLUMN bis_blood_packing_class.tenant_id IS '分院ID';
COMMENT ON COLUMN bis_blood_packing_class.pack_class_id IS 'ID';
COMMENT ON COLUMN bis_blood_packing_class.blood_type_id IS '血液类型id';
COMMENT ON COLUMN bis_blood_packing_class.pack_class_sort IS '排序号';
COMMENT ON COLUMN bis_blood_packing_class.packing_amount IS '包装量';
COMMENT ON COLUMN bis_blood_packing_class.corresponding_id IS '血站对照ID';
COMMENT ON COLUMN bis_blood_packing_class.cost IS '成本';
COMMENT ON COLUMN bis_blood_packing_class.charge IS '收费';
COMMENT ON COLUMN bis_blood_packing_class.state_flag IS '状态';

-- 表: bis_blood_type (bis_blood_type)
CREATE TABLE bis_blood_type (
  sort VARCHAR(255),
  blood_name VARCHAR(255),
  blood_unit VARCHAR(255),
  whole_blood_correspond VARCHAR(255),
  blood_adscription VARCHAR(255),
  validity VARCHAR(255),
  prompt VARCHAR(255),
  if_cross VARCHAR(255),
  his_id BIGINT,
  interdependent_charge VARCHAR(255),
  corresponding_id VARCHAR(255),
  standard_id VARCHAR(255),
  custom_code VARCHAR(255),
  spell_code VARCHAR(255),
  state_flag VARCHAR(255),
  blood_type_id VARCHAR(10),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE bis_blood_type IS '血液类型';
COMMENT ON COLUMN bis_blood_type.create_dept IS '创建部门';
COMMENT ON COLUMN bis_blood_type.create_by IS '创建人';
COMMENT ON COLUMN bis_blood_type.create_time IS '创建时间';
COMMENT ON COLUMN bis_blood_type.update_by IS '修改人';
COMMENT ON COLUMN bis_blood_type.update_time IS '修改时间';
COMMENT ON COLUMN bis_blood_type.tenant_id IS '分院ID';
COMMENT ON COLUMN bis_blood_type.sort IS '排序号';
COMMENT ON COLUMN bis_blood_type.blood_name IS '血液单位';
COMMENT ON COLUMN bis_blood_type.blood_unit IS '血液名称';
COMMENT ON COLUMN bis_blood_type.whole_blood_correspond IS '全血当量';
COMMENT ON COLUMN bis_blood_type.blood_adscription IS '血液归属';
COMMENT ON COLUMN bis_blood_type.validity IS '保质期(天)';
COMMENT ON COLUMN bis_blood_type.prompt IS '报价提示期限';
COMMENT ON COLUMN bis_blood_type.if_cross IS '是否交叉';
COMMENT ON COLUMN bis_blood_type.his_id IS 'hid代码';
COMMENT ON COLUMN bis_blood_type.interdependent_charge IS '互助金额';
COMMENT ON COLUMN bis_blood_type.corresponding_id IS '血站代码';
COMMENT ON COLUMN bis_blood_type.standard_id IS '标准ID';
COMMENT ON COLUMN bis_blood_type.custom_code IS '自定义码';
COMMENT ON COLUMN bis_blood_type.spell_code IS '拼音码';
COMMENT ON COLUMN bis_blood_type.state_flag IS '使用状态';
COMMENT ON COLUMN bis_blood_type.blood_type_id IS '血液类型id';

-- 表: bis_test_method_type (bis_test_method_type)
CREATE TABLE bis_test_method_type (
  type_id BIGINT,
  sort VARCHAR(255),
  chinese_name VARCHAR(255),
  his_id BIGINT,
  charge VARCHAR(255),
  workload VARCHAR(255),
  custom_code VARCHAR(255),
  spell_code VARCHAR(255),
  reside_class VARCHAR(255),
  state_flag VARCHAR(255),
  method_type_id VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE bis_test_method_type IS '配血方法类型';
COMMENT ON COLUMN bis_test_method_type.create_dept IS '创建部门';
COMMENT ON COLUMN bis_test_method_type.create_by IS '创建人';
COMMENT ON COLUMN bis_test_method_type.create_time IS '创建时间';
COMMENT ON COLUMN bis_test_method_type.update_by IS '修改人';
COMMENT ON COLUMN bis_test_method_type.update_time IS '修改时间';
COMMENT ON COLUMN bis_test_method_type.tenant_id IS '分院ID';
COMMENT ON COLUMN bis_test_method_type.type_id IS '配血类型ID（3配血法，血液处理法）';
COMMENT ON COLUMN bis_test_method_type.sort IS '排序号';
COMMENT ON COLUMN bis_test_method_type.chinese_name IS '配血方法名称';
COMMENT ON COLUMN bis_test_method_type.his_id IS 'HIS代码';
COMMENT ON COLUMN bis_test_method_type.charge IS '金额';
COMMENT ON COLUMN bis_test_method_type.workload IS '工作量';
COMMENT ON COLUMN bis_test_method_type.custom_code IS '自定义码';
COMMENT ON COLUMN bis_test_method_type.spell_code IS '拼音码';
COMMENT ON COLUMN bis_test_method_type.reside_class IS '所属类型';
COMMENT ON COLUMN bis_test_method_type.state_flag IS '使用状态';
COMMENT ON COLUMN bis_test_method_type.method_type_id IS 'ID';

-- 表: his_requisition (his_requisition)
CREATE TABLE his_requisition (
  his_id BIGINT,
  requisition_id VARCHAR(255),
  patient_type VARCHAR(255),
  outpatient_id VARCHAR(255),
  inpatient_id VARCHAR(255),
  charge_type VARCHAR(255),
  patient_name VARCHAR(255),
  patient_sex VARCHAR(255),
  patient_age VARCHAR(255),
  patient_nation VARCHAR(255),
  bloodtype_abo VARCHAR(255),
  bloodtype_rh VARCHAR(255),
  patient_dept VARCHAR(255),
  patient_dept_name VARCHAR(255),
  patient_ward VARCHAR(255),
  patient_ward_name VARCHAR(255),
  patient_bed VARCHAR(255),
  especial_condition VARCHAR(255),
  inspected_info VARCHAR(255),
  infection VARCHAR(255),
  clinical_diagnoses VARCHAR(255),
  medical_record VARCHAR(255),
  requisition_dept VARCHAR(255),
  requisition_time VARCHAR(255),
  requisition_person VARCHAR(255),
  execute_dept VARCHAR(255),
  execute_time VARCHAR(255),
  execute_person VARCHAR(255),
  print_dept VARCHAR(255),
  print_time VARCHAR(255),
  print_person VARCHAR(255),
  sample_class VARCHAR(255),
  id VARCHAR(255),
  sampling_position VARCHAR(255),
  sampling_dept VARCHAR(255),
  sampling_time VARCHAR(255),
  sampling_person VARCHAR(255),
  receive_dept VARCHAR(255),
  receive_time VARCHAR(255),
  receive_person VARCHAR(255),
  charge_item_id BIGINT,
  charge_name VARCHAR(255),
  charge VARCHAR(255),
  charge_state VARCHAR(255),
  charge_time VARCHAR(255),
  charge_person VARCHAR(255),
  requisition_state VARCHAR(255),
  remark VARCHAR(255),
  requisition_from VARCHAR(255),
  return_person VARCHAR(255),
  return_cause VARCHAR(255),
  return_time VARCHAR(255),
  Document_type VARCHAR(255),
  outpatinet_times VARCHAR(255),
  delivery_person VARCHAR(255),
  delivery_time VARCHAR(255),
  send_person VARCHAR(255),
  send_time VARCHAR(255),
  Residential_address VARCHAR(255),
  Residential_address2 VARCHAR(255),
  mobile_no VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE his_requisition IS '医嘱申请';
COMMENT ON COLUMN his_requisition.create_dept IS '创建部门';
COMMENT ON COLUMN his_requisition.create_by IS '创建人';
COMMENT ON COLUMN his_requisition.create_time IS '创建时间';
COMMENT ON COLUMN his_requisition.update_by IS '修改人';
COMMENT ON COLUMN his_requisition.update_time IS '修改时间';
COMMENT ON COLUMN his_requisition.tenant_id IS '分院ID';
COMMENT ON COLUMN his_requisition.his_id IS '医嘱代码';
COMMENT ON COLUMN his_requisition.requisition_id IS '申请单ID';
COMMENT ON COLUMN his_requisition.patient_type IS '病人类别（1住院、2门诊、3住院急诊、4门诊急诊、5体检、10质控）';
COMMENT ON COLUMN his_requisition.outpatient_id IS '病人ID';
COMMENT ON COLUMN his_requisition.inpatient_id IS '就诊唯一号';
COMMENT ON COLUMN his_requisition.charge_type IS '收费类型';
COMMENT ON COLUMN his_requisition.patient_name IS '病人姓名';
COMMENT ON COLUMN his_requisition.patient_sex IS 'patient_sex';
COMMENT ON COLUMN his_requisition.patient_age IS '输入年龄';
COMMENT ON COLUMN his_requisition.patient_nation IS '民族代码';
COMMENT ON COLUMN his_requisition.bloodtype_abo IS 'ABO血型';
COMMENT ON COLUMN his_requisition.bloodtype_rh IS 'RH血型';
COMMENT ON COLUMN his_requisition.patient_dept IS '申请科室代码';
COMMENT ON COLUMN his_requisition.patient_dept_name IS 'patient_dept_name';
COMMENT ON COLUMN his_requisition.patient_ward IS '申请病区代码';
COMMENT ON COLUMN his_requisition.patient_ward_name IS '申请病区名称';
COMMENT ON COLUMN his_requisition.patient_bed IS '病人床号';
COMMENT ON COLUMN his_requisition.especial_condition IS '特殊说明';
COMMENT ON COLUMN his_requisition.inspected_info IS '检查信息';
COMMENT ON COLUMN his_requisition.infection IS '传染标记';
COMMENT ON COLUMN his_requisition.clinical_diagnoses IS '临床诊断';
COMMENT ON COLUMN his_requisition.medical_record IS '病例档案';
COMMENT ON COLUMN his_requisition.requisition_dept IS '申请科室';
COMMENT ON COLUMN his_requisition.requisition_time IS '申请时间';
COMMENT ON COLUMN his_requisition.requisition_person IS '申请人员';
COMMENT ON COLUMN his_requisition.execute_dept IS '执行科室';
COMMENT ON COLUMN his_requisition.execute_time IS '执行时间';
COMMENT ON COLUMN his_requisition.execute_person IS '执行人员';
COMMENT ON COLUMN his_requisition.print_dept IS '打印时间';
COMMENT ON COLUMN his_requisition.print_time IS '打印时间';
COMMENT ON COLUMN his_requisition.print_person IS '打印人员';
COMMENT ON COLUMN his_requisition.sample_class IS '样本类型';
COMMENT ON COLUMN his_requisition.id IS 'id';
COMMENT ON COLUMN his_requisition.sampling_position IS '采样地点';
COMMENT ON COLUMN his_requisition.sampling_dept IS '采样科室';
COMMENT ON COLUMN his_requisition.sampling_time IS '采样时间';
COMMENT ON COLUMN his_requisition.sampling_person IS '采样人员';
COMMENT ON COLUMN his_requisition.receive_dept IS '接收科室';
COMMENT ON COLUMN his_requisition.receive_time IS '接收时间';
COMMENT ON COLUMN his_requisition.receive_person IS '接收人员';
COMMENT ON COLUMN his_requisition.charge_item_id IS '项目代码';
COMMENT ON COLUMN his_requisition.charge_name IS '收费名称';
COMMENT ON COLUMN his_requisition.charge IS '收费金额';
COMMENT ON COLUMN his_requisition.charge_state IS '收费状态';
COMMENT ON COLUMN his_requisition.charge_time IS '收费时间';
COMMENT ON COLUMN his_requisition.charge_person IS '收费人员';
COMMENT ON COLUMN his_requisition.requisition_state IS '申请单状态';
COMMENT ON COLUMN his_requisition.remark IS '备注';
COMMENT ON COLUMN his_requisition.requisition_from IS '申请单来源';
COMMENT ON COLUMN his_requisition.return_person IS '退回人员';
COMMENT ON COLUMN his_requisition.return_cause IS '退回原因';
COMMENT ON COLUMN his_requisition.return_time IS '退回时间';
COMMENT ON COLUMN his_requisition.Document_type IS '证件类型';
COMMENT ON COLUMN his_requisition.outpatinet_times IS '就诊次数';
COMMENT ON COLUMN his_requisition.delivery_person IS '送达人员';
COMMENT ON COLUMN his_requisition.delivery_time IS '送达时间';
COMMENT ON COLUMN his_requisition.send_person IS '送达人员';
COMMENT ON COLUMN his_requisition.send_time IS '送达时间';
COMMENT ON COLUMN his_requisition.Residential_address IS '家庭地址';
COMMENT ON COLUMN his_requisition.Residential_address2 IS '现居住地址';
COMMENT ON COLUMN his_requisition.mobile_no IS '手机号码';

-- 表: lis_base_data (基础数据表（科别、医生、标本种类）)
CREATE TABLE lis_base_data (
  base_data_id VARCHAR(10) NOT NULL,
  class_id VARCHAR(20),
  base_data_sort VARCHAR(20),
  chinese_name VARCHAR(400),
  english_name VARCHAR(50),
  lis_id VARCHAR(20),
  his_id VARCHAR(20),
  standart_id VARCHAR(20),
  custom_code VARCHAR(20),
  spell_code VARCHAR(20),
  stroke_code VARCHAR(20),
  state_flag VARCHAR(2),
  custom01 VARCHAR(50),
  custom02 VARCHAR(50),
  custom03 VARCHAR(50),
  custom04 VARCHAR(50),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20),
  PRIMARY KEY (base_data_id)
);
COMMENT ON TABLE lis_base_data IS '基础数据表（科别、医生、标本种类）';
COMMENT ON COLUMN lis_base_data.create_dept IS '创建部门';
COMMENT ON COLUMN lis_base_data.create_by IS '创建人';
COMMENT ON COLUMN lis_base_data.create_time IS '创建时间';
COMMENT ON COLUMN lis_base_data.update_by IS '修改人';
COMMENT ON COLUMN lis_base_data.update_time IS '修改时间';
COMMENT ON COLUMN lis_base_data.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_base_data.base_data_id IS '基础数据ID';
COMMENT ON COLUMN lis_base_data.class_id IS '字典类型';
COMMENT ON COLUMN lis_base_data.base_data_sort IS '排序号';
COMMENT ON COLUMN lis_base_data.chinese_name IS '中文名称';
COMMENT ON COLUMN lis_base_data.english_name IS '英文名称';
COMMENT ON COLUMN lis_base_data.lis_id IS '老系统代码';
COMMENT ON COLUMN lis_base_data.his_id IS 'HIS代码';
COMMENT ON COLUMN lis_base_data.standart_id IS '标准代码';
COMMENT ON COLUMN lis_base_data.custom_code IS '自定义码';
COMMENT ON COLUMN lis_base_data.spell_code IS '拼音码';
COMMENT ON COLUMN lis_base_data.stroke_code IS '五笔码';
COMMENT ON COLUMN lis_base_data.state_flag IS '状态';
COMMENT ON COLUMN lis_base_data.custom01 IS '分类1';
COMMENT ON COLUMN lis_base_data.custom02 IS '分类2';
COMMENT ON COLUMN lis_base_data.custom03 IS '分类3';
COMMENT ON COLUMN lis_base_data.custom04 IS '统计分类(检验科室)';

-- 表: lis_base_data_group (各分组基础数据表)
CREATE TABLE lis_base_data_group (
  spell_code VARCHAR(255),
  stroke_code VARCHAR(255),
  standard_name VARCHAR(255),
  group_id BIGINT,
  custom_code VARCHAR(255),
  base_data_sort VARCHAR(255),
  base_data_id VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_base_data_group IS '各分组基础数据表';
COMMENT ON COLUMN lis_base_data_group.create_dept IS '创建部门';
COMMENT ON COLUMN lis_base_data_group.create_by IS '创建人';
COMMENT ON COLUMN lis_base_data_group.create_time IS '创建时间';
COMMENT ON COLUMN lis_base_data_group.update_by IS '修改人';
COMMENT ON COLUMN lis_base_data_group.update_time IS '修改时间';
COMMENT ON COLUMN lis_base_data_group.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_base_data_group.spell_code IS '拼音码';
COMMENT ON COLUMN lis_base_data_group.stroke_code IS '五笔码';
COMMENT ON COLUMN lis_base_data_group.standard_name IS '标准名称';
COMMENT ON COLUMN lis_base_data_group.group_id IS '检验分组ID';
COMMENT ON COLUMN lis_base_data_group.custom_code IS '自定义码';
COMMENT ON COLUMN lis_base_data_group.base_data_sort IS '排序号';
COMMENT ON COLUMN lis_base_data_group.base_data_id IS '基础数据ID';

-- 表: lis_change_log (一般检验修改日志表)
CREATE TABLE lis_change_log (
  serial_no VARCHAR(255),
  module_type VARCHAR(255),
  change_type VARCHAR(255),
  change_class VARCHAR(255),
  inspection_id BIGINT,
  change_content VARCHAR(255),
  change_cause VARCHAR(255),
  change_person VARCHAR(255),
  change_time VARCHAR(255),
  change_place VARCHAR(255),
  remark VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_change_log IS '一般检验修改日志表';
COMMENT ON COLUMN lis_change_log.create_dept IS '创建部门';
COMMENT ON COLUMN lis_change_log.create_by IS '创建人';
COMMENT ON COLUMN lis_change_log.create_time IS '创建时间';
COMMENT ON COLUMN lis_change_log.update_by IS '修改人';
COMMENT ON COLUMN lis_change_log.update_time IS '修改时间';
COMMENT ON COLUMN lis_change_log.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_change_log.serial_no IS '日志ID';
COMMENT ON COLUMN lis_change_log.module_type IS '操作模块类型';
COMMENT ON COLUMN lis_change_log.change_type IS '日志类型';
COMMENT ON COLUMN lis_change_log.change_class IS '操作类型';
COMMENT ON COLUMN lis_change_log.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_change_log.change_content IS '操作内容';
COMMENT ON COLUMN lis_change_log.change_cause IS '操作原因';
COMMENT ON COLUMN lis_change_log.change_person IS '操作人员';
COMMENT ON COLUMN lis_change_log.change_time IS '操作时间';
COMMENT ON COLUMN lis_change_log.change_place IS '操作电脑';
COMMENT ON COLUMN lis_change_log.remark IS '备注信息';

-- 表: lis_change_log_micro (微生物系统修改日志表)
CREATE TABLE lis_change_log_micro (
  id BIGINT,
  change_id VARCHAR(255),
  change_soft VARCHAR(255),
  change_person VARCHAR(255),
  change_time VARCHAR(255),
  change_where VARCHAR(255),
  change_content VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_change_log_micro IS '微生物系统修改日志表';
COMMENT ON COLUMN lis_change_log_micro.create_dept IS '创建部门';
COMMENT ON COLUMN lis_change_log_micro.create_by IS '创建人';
COMMENT ON COLUMN lis_change_log_micro.create_time IS '创建时间';
COMMENT ON COLUMN lis_change_log_micro.update_by IS '修改人';
COMMENT ON COLUMN lis_change_log_micro.update_time IS '修改时间';
COMMENT ON COLUMN lis_change_log_micro.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_change_log_micro.id IS '日志ID';
COMMENT ON COLUMN lis_change_log_micro.change_id IS '诊疗项目代码';
COMMENT ON COLUMN lis_change_log_micro.change_soft IS '修改模块';
COMMENT ON COLUMN lis_change_log_micro.change_person IS '修改人员';
COMMENT ON COLUMN lis_change_log_micro.change_time IS '修改时间';
COMMENT ON COLUMN lis_change_log_micro.change_where IS '修改条件';
COMMENT ON COLUMN lis_change_log_micro.change_content IS '修改内容';

-- 表: lis_charge_item (诊疗项目对照项目表)
CREATE TABLE lis_charge_item (
  charge_item_id BIGINT NOT NULL,
  chinese_name VARCHAR(50),
  chinese_name_short VARCHAR(50),
  english_name VARCHAR(50),
  his_id BIGINT,
  medicare_id VARCHAR(20),
  standart_id VARCHAR(20),
  barcode_seq CHAR(2),
  charge_item_sort VARCHAR(20),
  charge_item_class VARCHAR(20),
  charge DECIMAL(10,2),
  sample_class VARCHAR(20),
  patient_type VARCHAR(20),
  sampling_request VARCHAR(50),
  sampling_time VARCHAR(50),
  sampling_place VARCHAR(50),
  report_time VARCHAR(50),
  report_place VARCHAR(50),
  report_time_sort VARCHAR(20),
  inspection_time VARCHAR(50),
  workload INT,
  test_item_count INT,
  unite_flag VARCHAR(20),
  expand_flag VARCHAR(2),
  custom_code VARCHAR(20),
  spell_code VARCHAR(20),
  stroke_code VARCHAR(20),
  lab_class VARCHAR(50),
  used_flag VARCHAR(10),
  state_flag CHAR(2),
  number_from INT,
  number_to INT,
  number_priority VARCHAR(10),
  save_term INT,
  group_id BIGINT,
  send_flag VARCHAR(10),
  tube_flag VARCHAR(20),
  queue_flag VARCHAR(10),
  item_code BIGINT,
  tjxmbh VARCHAR(10),
  police_minute INT,
  his_name VARCHAR(100),
  number_print SMALLINT,
  tube_number INT,
  sampling_person_rule CHAR(1),
  pes_id VARCHAR(20),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20),
  PRIMARY KEY (charge_item_id)
);
COMMENT ON TABLE lis_charge_item IS '诊疗项目对照项目表';
COMMENT ON COLUMN lis_charge_item.create_dept IS '创建部门';
COMMENT ON COLUMN lis_charge_item.create_by IS '创建人';
COMMENT ON COLUMN lis_charge_item.create_time IS '创建时间';
COMMENT ON COLUMN lis_charge_item.update_by IS '修改人';
COMMENT ON COLUMN lis_charge_item.update_time IS '修改时间';
COMMENT ON COLUMN lis_charge_item.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_charge_item.charge_item_id IS '诊疗项目ID';
COMMENT ON COLUMN lis_charge_item.chinese_name IS '诊疗项目名称';
COMMENT ON COLUMN lis_charge_item.chinese_name_short IS '诊疗项目简称';
COMMENT ON COLUMN lis_charge_item.english_name IS '诊疗项目英文名称';
COMMENT ON COLUMN lis_charge_item.his_id IS 'HIS代码';
COMMENT ON COLUMN lis_charge_item.medicare_id IS '医保代码（对应惠桥代码）';
COMMENT ON COLUMN lis_charge_item.standart_id IS '标准代码（返回给体检系统代码）';
COMMENT ON COLUMN lis_charge_item.barcode_seq IS '条码规则序号';
COMMENT ON COLUMN lis_charge_item.charge_item_sort IS '排序号';
COMMENT ON COLUMN lis_charge_item.charge_item_class IS '诊疗项目分类';
COMMENT ON COLUMN lis_charge_item.charge IS '诊疗项目金额（与HIS对应）';
COMMENT ON COLUMN lis_charge_item.sample_class IS '默认标本种类';
COMMENT ON COLUMN lis_charge_item.patient_type IS '项目开展类型';
COMMENT ON COLUMN lis_charge_item.sampling_request IS '采样要求';
COMMENT ON COLUMN lis_charge_item.sampling_time IS '允许采样时间';
COMMENT ON COLUMN lis_charge_item.sampling_place IS '采样地点';
COMMENT ON COLUMN lis_charge_item.report_time IS '报告时间';
COMMENT ON COLUMN lis_charge_item.report_place IS '报告地点';
COMMENT ON COLUMN lis_charge_item.report_time_sort IS '报告时间序号';
COMMENT ON COLUMN lis_charge_item.inspection_time IS '开展时间（默认每天都开展）';
COMMENT ON COLUMN lis_charge_item.workload IS '工作量';
COMMENT ON COLUMN lis_charge_item.test_item_count IS '项目数量';
COMMENT ON COLUMN lis_charge_item.unite_flag IS '合并标记（共管标识）';
COMMENT ON COLUMN lis_charge_item.expand_flag IS '展开标记';
COMMENT ON COLUMN lis_charge_item.custom_code IS '自定义码';
COMMENT ON COLUMN lis_charge_item.spell_code IS '拼音码';
COMMENT ON COLUMN lis_charge_item.stroke_code IS '五笔码';
COMMENT ON COLUMN lis_charge_item.lab_class IS '实验室分类';
COMMENT ON COLUMN lis_charge_item.used_flag IS '是否常用：1是，空不是';
COMMENT ON COLUMN lis_charge_item.state_flag IS '使用状态：1使用，0禁用';
COMMENT ON COLUMN lis_charge_item.number_from IS '起始编号';
COMMENT ON COLUMN lis_charge_item.number_to IS '结束编号';
COMMENT ON COLUMN lis_charge_item.number_priority IS '编号规则';
COMMENT ON COLUMN lis_charge_item.save_term IS '标本保留天数';
COMMENT ON COLUMN lis_charge_item.group_id IS '所属检验分组';
COMMENT ON COLUMN lis_charge_item.send_flag IS '发送标记';
COMMENT ON COLUMN lis_charge_item.tube_flag IS '试管标记';
COMMENT ON COLUMN lis_charge_item.queue_flag IS '队列标记';
COMMENT ON COLUMN lis_charge_item.item_code IS '项目代码';
COMMENT ON COLUMN lis_charge_item.tjxmbh IS '体检代码（未使用）';
COMMENT ON COLUMN lis_charge_item.police_minute IS '危急值超时分钟';
COMMENT ON COLUMN lis_charge_item.his_name IS 'HIS名称';
COMMENT ON COLUMN lis_charge_item.number_print IS '检验条码打印份数';
COMMENT ON COLUMN lis_charge_item.tube_number IS '试管数量';
COMMENT ON COLUMN lis_charge_item.sampling_person_rule IS '采样人员规则';
COMMENT ON COLUMN lis_charge_item.pes_id IS '体检关联码';

-- 表: lis_charge_item_charge (lis_charge_item_charge)
CREATE TABLE lis_charge_item_charge (
  charge_class VARCHAR(255),
  his_id BIGINT,
  charge_name VARCHAR(255),
  charge VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_charge_item_charge IS '收费项目收费明细';
COMMENT ON COLUMN lis_charge_item_charge.create_dept IS '创建部门';
COMMENT ON COLUMN lis_charge_item_charge.create_by IS '创建人';
COMMENT ON COLUMN lis_charge_item_charge.create_time IS '创建时间';
COMMENT ON COLUMN lis_charge_item_charge.update_by IS '修改人';
COMMENT ON COLUMN lis_charge_item_charge.update_time IS '修改时间';
COMMENT ON COLUMN lis_charge_item_charge.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_charge_item_charge.charge_class IS '收费类型';
COMMENT ON COLUMN lis_charge_item_charge.his_id IS 'HIS代码';
COMMENT ON COLUMN lis_charge_item_charge.charge_name IS '收费名称';
COMMENT ON COLUMN lis_charge_item_charge.charge IS '收费金额';

-- 表: lis_charge_item_inspectiontime (lis_charge_item_inspectiontime)
CREATE TABLE lis_charge_item_inspectiontime (
  time_type VARCHAR(255),
  patient_type VARCHAR(255),
  id VARCHAR(255),
  charge_item_id BIGINT,
  inspection_time VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_charge_item_inspectiontime IS '诊疗项目检验时间';
COMMENT ON COLUMN lis_charge_item_inspectiontime.create_dept IS '创建部门';
COMMENT ON COLUMN lis_charge_item_inspectiontime.create_by IS '创建人';
COMMENT ON COLUMN lis_charge_item_inspectiontime.create_time IS '创建时间';
COMMENT ON COLUMN lis_charge_item_inspectiontime.update_by IS '修改人';
COMMENT ON COLUMN lis_charge_item_inspectiontime.update_time IS '修改时间';
COMMENT ON COLUMN lis_charge_item_inspectiontime.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_charge_item_inspectiontime.time_type IS '超时类型';
COMMENT ON COLUMN lis_charge_item_inspectiontime.patient_type IS '病人类型';
COMMENT ON COLUMN lis_charge_item_inspectiontime.id IS '主键';
COMMENT ON COLUMN lis_charge_item_inspectiontime.charge_item_id IS '诊疗项目ID';
COMMENT ON COLUMN lis_charge_item_inspectiontime.inspection_time IS '检验时间（超时提醒）';

-- 表: lis_charge_item_reporttime (lis_charge_item_reporttime)
CREATE TABLE lis_charge_item_reporttime (
  charge_item_id BIGINT,
  from_time VARCHAR(255),
  to_time VARCHAR(255),
  week_date VARCHAR(255),
  report_time VARCHAR(255),
  from_date VARCHAR(255),
  to_date VARCHAR(255),
  id VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_charge_item_reporttime IS '诊疗项目报告时间';
COMMENT ON COLUMN lis_charge_item_reporttime.create_dept IS '创建部门';
COMMENT ON COLUMN lis_charge_item_reporttime.create_by IS '创建人';
COMMENT ON COLUMN lis_charge_item_reporttime.create_time IS '创建时间';
COMMENT ON COLUMN lis_charge_item_reporttime.update_by IS '修改人';
COMMENT ON COLUMN lis_charge_item_reporttime.update_time IS '修改时间';
COMMENT ON COLUMN lis_charge_item_reporttime.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_charge_item_reporttime.charge_item_id IS '诊疗项目ID';
COMMENT ON COLUMN lis_charge_item_reporttime.from_time IS '开始时间';
COMMENT ON COLUMN lis_charge_item_reporttime.to_time IS '结束时间';
COMMENT ON COLUMN lis_charge_item_reporttime.week_date IS '星期几出报告';
COMMENT ON COLUMN lis_charge_item_reporttime.report_time IS '报告时间';
COMMENT ON COLUMN lis_charge_item_reporttime.from_date IS '开始日期';
COMMENT ON COLUMN lis_charge_item_reporttime.to_date IS '结束日期';
COMMENT ON COLUMN lis_charge_item_reporttime.id IS '主键';

-- 表: lis_comm_instrument (lis_comm_instrument)
CREATE TABLE lis_comm_instrument (
  instrument_id VARCHAR(20),
  instrument_name VARCHAR(50),
  instrument_commport VARCHAR(10),
  instrument_key VARCHAR(20),
  instrument_key_date TIMESTAMP,
  instrument_type VARCHAR(20),
  interface_name VARCHAR(50),
  interface_type VARCHAR(10),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_comm_instrument IS '仪器表';
COMMENT ON COLUMN lis_comm_instrument.create_dept IS '创建部门';
COMMENT ON COLUMN lis_comm_instrument.create_by IS '创建人';
COMMENT ON COLUMN lis_comm_instrument.create_time IS '创建时间';
COMMENT ON COLUMN lis_comm_instrument.update_by IS '修改人';
COMMENT ON COLUMN lis_comm_instrument.update_time IS '修改时间';
COMMENT ON COLUMN lis_comm_instrument.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_comm_instrument.instrument_id IS '仪器代码';
COMMENT ON COLUMN lis_comm_instrument.instrument_name IS '仪器名称';
COMMENT ON COLUMN lis_comm_instrument.instrument_commport IS '端口配置';
COMMENT ON COLUMN lis_comm_instrument.instrument_key IS 'key';
COMMENT ON COLUMN lis_comm_instrument.instrument_key_date IS '注册时间';
COMMENT ON COLUMN lis_comm_instrument.instrument_type IS '仪器类型';
COMMENT ON COLUMN lis_comm_instrument.interface_name IS '接口程序';
COMMENT ON COLUMN lis_comm_instrument.interface_type IS '通讯方式';

-- 表: lis_inspection_group (检验分组信息表)
CREATE TABLE lis_inspection_group (
  group_id BIGINT NOT NULL,
  group_code VARCHAR(20),
  group_sort VARCHAR(20),
  group_name VARCHAR(50),
  inspection_dept VARCHAR(20),
  group_class VARCHAR(20),
  lis_id VARCHAR(20),
  test_item_append VARCHAR(20),
  item_display VARCHAR(20),
  start_no VARCHAR(2),
  start_focus VARCHAR(20),
  result_review VARCHAR(20),
  same_group VARCHAR(100),
  graph_format VARCHAR(50),
  graph_switch_file VARCHAR(50),
  state_flag VARCHAR(2),
  default_result VARCHAR(50),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20),
  PRIMARY KEY (group_id)
);
COMMENT ON TABLE lis_inspection_group IS '检验分组信息表';
COMMENT ON COLUMN lis_inspection_group.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_group.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_group.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_group.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_group.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_group.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_group.group_id IS '分组ID';
COMMENT ON COLUMN lis_inspection_group.group_code IS '分组代码';
COMMENT ON COLUMN lis_inspection_group.group_sort IS '排序号';
COMMENT ON COLUMN lis_inspection_group.group_name IS '分组名称';
COMMENT ON COLUMN lis_inspection_group.inspection_dept IS '检验科室';
COMMENT ON COLUMN lis_inspection_group.group_class IS '分组类型';
COMMENT ON COLUMN lis_inspection_group.lis_id IS '老系统代码';
COMMENT ON COLUMN lis_inspection_group.test_item_append IS '项目显示格式';
COMMENT ON COLUMN lis_inspection_group.item_display IS '项目显示';
COMMENT ON COLUMN lis_inspection_group.start_no IS '起诉样本号';
COMMENT ON COLUMN lis_inspection_group.start_focus IS '开始焦点';
COMMENT ON COLUMN lis_inspection_group.result_review IS '回顾条件设置';
COMMENT ON COLUMN lis_inspection_group.same_group IS '同类分组';
COMMENT ON COLUMN lis_inspection_group.graph_format IS '结果图形类型';
COMMENT ON COLUMN lis_inspection_group.graph_switch_file IS '对应老系统仪器';
COMMENT ON COLUMN lis_inspection_group.state_flag IS '状态';
COMMENT ON COLUMN lis_inspection_group.default_result IS '默认结果';

-- 表: lis_inspection_report (检验报告单信息表)
CREATE TABLE lis_inspection_report (
  inspection_id BIGINT,
  report_id VARCHAR(255),
  report_format VARCHAR(255),
  report_file VARCHAR(255),
  report_title VARCHAR(255),
  create_time VARCHAR(255),
  create_person VARCHAR(255),
  inspection_class VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_inspection_report IS '检验报告单信息表';
COMMENT ON COLUMN lis_inspection_report.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_report.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_report.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_report.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_report.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_report.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_report.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_inspection_report.report_id IS '报告序号（页码）';
COMMENT ON COLUMN lis_inspection_report.report_format IS '报告单模板';
COMMENT ON COLUMN lis_inspection_report.report_file IS '报告单文件';
COMMENT ON COLUMN lis_inspection_report.report_title IS '报告单抬头';
COMMENT ON COLUMN lis_inspection_report.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_report.create_person IS '创建人员';
COMMENT ON COLUMN lis_inspection_report.inspection_class IS '检验类型';

-- 表: lis_inspection_result (常规检验结果表)
CREATE TABLE lis_inspection_result (
  inspection_id BIGINT,
  test_item_id BIGINT,
  group_id BIGINT,
  inspection_date VARCHAR(255),
  inspection_time VARCHAR(255),
  sample_number VARCHAR(255),
  test_item_sort VARCHAR(255),
  english_name VARCHAR(255),
  chinese_name VARCHAR(255),
  original_result VARCHAR(255),
  quantitative_result VARCHAR(255),
  qualitative_result VARCHAR(255),
  test_item_reference VARCHAR(255),
  test_item_unit VARCHAR(255),
  test_item_charge VARCHAR(255),
  workload VARCHAR(255),
  test_count VARCHAR(255),
  test_order VARCHAR(255),
  inspection_instrument VARCHAR(255),
  inspection_person VARCHAR(255),
  inspection_position VARCHAR(255),
  report_id VARCHAR(255),
  col_position VARCHAR(255),
  print_id VARCHAR(255),
  remark VARCHAR(255),
  check_person VARCHAR(255),
  check_time VARCHAR(255),
  result_type VARCHAR(255),
  test_method VARCHAR(255),
  read_doctor VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_inspection_result IS '常规检验结果表';
COMMENT ON COLUMN lis_inspection_result.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_result.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_result.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_result.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_result.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_result.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_result.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_inspection_result.test_item_id IS '项目代码';
COMMENT ON COLUMN lis_inspection_result.group_id IS '分组ID';
COMMENT ON COLUMN lis_inspection_result.inspection_date IS '检验日期';
COMMENT ON COLUMN lis_inspection_result.inspection_time IS '检验时间';
COMMENT ON COLUMN lis_inspection_result.sample_number IS '样本编号';
COMMENT ON COLUMN lis_inspection_result.test_item_sort IS '排序号';
COMMENT ON COLUMN lis_inspection_result.english_name IS '英文名称';
COMMENT ON COLUMN lis_inspection_result.chinese_name IS '中文名称';
COMMENT ON COLUMN lis_inspection_result.original_result IS '原始结果';
COMMENT ON COLUMN lis_inspection_result.quantitative_result IS '结果';
COMMENT ON COLUMN lis_inspection_result.qualitative_result IS '异常标识';
COMMENT ON COLUMN lis_inspection_result.test_item_reference IS '参考范围';
COMMENT ON COLUMN lis_inspection_result.test_item_unit IS '项目单位';
COMMENT ON COLUMN lis_inspection_result.test_item_charge IS '收费价格';
COMMENT ON COLUMN lis_inspection_result.workload IS '工作量';
COMMENT ON COLUMN lis_inspection_result.test_count IS '项目数';
COMMENT ON COLUMN lis_inspection_result.test_order IS '测试代码';
COMMENT ON COLUMN lis_inspection_result.inspection_instrument IS '检验仪器';
COMMENT ON COLUMN lis_inspection_result.inspection_person IS '检验人员';
COMMENT ON COLUMN lis_inspection_result.inspection_position IS '检验位置';
COMMENT ON COLUMN lis_inspection_result.report_id IS '报告序号';
COMMENT ON COLUMN lis_inspection_result.col_position IS '报告位置';
COMMENT ON COLUMN lis_inspection_result.print_id IS '打印页码';
COMMENT ON COLUMN lis_inspection_result.remark IS '备注';
COMMENT ON COLUMN lis_inspection_result.check_person IS '审核人员';
COMMENT ON COLUMN lis_inspection_result.check_time IS '审核时间';
COMMENT ON COLUMN lis_inspection_result.result_type IS '结果类型';
COMMENT ON COLUMN lis_inspection_result.test_method IS '检测方法';
COMMENT ON COLUMN lis_inspection_result.read_doctor IS '阅读医生';

-- 表: lis_inspection_result_micro (微生物检验结果表)
CREATE TABLE lis_inspection_result_micro (
  inspection_id BIGINT,
  group_id BIGINT,
  inspection_date VARCHAR(255),
  inspection_time VARCHAR(255),
  sample_number VARCHAR(255),
  result_type VARCHAR(255),
  result_method VARCHAR(255),
  micro_data_id VARCHAR(255),
  micro_data_id_sort VARCHAR(255),
  micro_data_id_name VARCHAR(255),
  micro_data_id_result1 VARCHAR(255),
  micra_data_id2 VARCHAR(255),
  micra_data_id2_sort VARCHAR(255),
  micro_data_id2_name VARCHAR(255),
  micro_data_id2_result1 VARCHAR(255),
  micro_data_id2_result2 VARCHAR(255),
  micro_data_id2_range VARCHAR(255),
  inspection_instrument VARCHAR(255),
  inspection_position VARCHAR(255),
  inspection_person VARCHAR(255),
  remark VARCHAR(255),
  esbl VARCHAR(255),
  read_doctor VARCHAR(255),
  report_id VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_inspection_result_micro IS '微生物检验结果表';
COMMENT ON COLUMN lis_inspection_result_micro.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_result_micro.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_result_micro.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_result_micro.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_result_micro.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_result_micro.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_result_micro.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_inspection_result_micro.group_id IS '分组ID';
COMMENT ON COLUMN lis_inspection_result_micro.inspection_date IS '检验日期';
COMMENT ON COLUMN lis_inspection_result_micro.inspection_time IS '检验时间';
COMMENT ON COLUMN lis_inspection_result_micro.sample_number IS '样本编号';
COMMENT ON COLUMN lis_inspection_result_micro.result_type IS '结果类型，ya阳性,tp涂片，py拼音';
COMMENT ON COLUMN lis_inspection_result_micro.result_method IS '检测方法';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id IS '微生物代码';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id_sort IS '微生物类型排序';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id_name IS '微生物名称';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id_result1 IS '菌落技术';
COMMENT ON COLUMN lis_inspection_result_micro.micra_data_id2 IS '抗生素代码';
COMMENT ON COLUMN lis_inspection_result_micro.micra_data_id2_sort IS '抗生素类型排序';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id2_name IS '抗生素名称（药敏）';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id2_result1 IS '药敏定量结果';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id2_result2 IS '药敏定性结果';
COMMENT ON COLUMN lis_inspection_result_micro.micro_data_id2_range IS '抗生素（药敏）参考值';
COMMENT ON COLUMN lis_inspection_result_micro.inspection_instrument IS '药敏检测仪器';
COMMENT ON COLUMN lis_inspection_result_micro.inspection_position IS '检验位置';
COMMENT ON COLUMN lis_inspection_result_micro.inspection_person IS '检验人员';
COMMENT ON COLUMN lis_inspection_result_micro.remark IS '备注';
COMMENT ON COLUMN lis_inspection_result_micro.esbl IS 'esbl';
COMMENT ON COLUMN lis_inspection_result_micro.read_doctor IS '临床阅读医生';
COMMENT ON COLUMN lis_inspection_result_micro.report_id IS '打印序号';

-- 表: lis_inspection_sample (样本信息表（主表）)
CREATE TABLE lis_inspection_sample (
  inspection_id BIGINT,
  group_id BIGINT,
  inspection_date VARCHAR(255),
  inspection_time VARCHAR(255),
  sample_number VARCHAR(255),
  requisition_id VARCHAR(255),
  patient_type VARCHAR(255),
  outpatient_id VARCHAR(255),
  inpatient_id VARCHAR(255),
  invoice_id VARCHAR(255),
  charge_type VARCHAR(255),
  patient_name VARCHAR(255),
  patient_sex VARCHAR(255),
  age_type VARCHAR(255),
  age_input VARCHAR(255),
  age_save VARCHAR(255),
  patient_nation VARCHAR(255),
  patient_nation_name VARCHAR(255),
  bloodtype_abo VARCHAR(255),
  bloodtype_rh VARCHAR(255),
  patient_dept VARCHAR(255),
  patient_dept_name VARCHAR(255),
  patient_ward VARCHAR(255),
  patient_ward_name VARCHAR(255),
  patient_bed VARCHAR(255),
  especial_condition VARCHAR(255),
  clinical_diagnoses VARCHAR(255),
  clinical_diagnoses_name VARCHAR(255),
  sample_class VARCHAR(255),
  sample_class_name VARCHAR(255),
  infect_status VARCHAR(255),
  sample_status VARCHAR(255),
  sample_status_name VARCHAR(255),
  sampling_position VARCHAR(255),
  sampling_position_name VARCHAR(255),
  test_order VARCHAR(255),
  test_order_name VARCHAR(255),
  sample_charge VARCHAR(255),
  item_count VARCHAR(255),
  workload VARCHAR(255),
  sampling_time VARCHAR(255),
  sampling_person VARCHAR(255),
  requisition_time VARCHAR(255),
  requisition_person VARCHAR(255),
  deliver_hospital VARCHAR(255),
  incept_time VARCHAR(255),
  incept_person VARCHAR(255),
  input_person VARCHAR(255),
  input_time VARCHAR(255),
  inspection_person VARCHAR(255),
  check_person VARCHAR(255),
  check_time VARCHAR(255),
  print_person VARCHAR(255),
  print_time VARCHAR(255),
  print_count VARCHAR(255),
  expert_rule VARCHAR(255),
  id_card VARCHAR(255),
  charge_state VARCHAR(255),
  inspection_state VARCHAR(255),
  rerun_state VARCHAR(255),
  read_state VARCHAR(255),
  remark VARCHAR(255),
  remark_name VARCHAR(255),
  confirm_time VARCHAR(255),
  confirm_person VARCHAR(255),
  instrument VARCHAR(255),
  mobileno VARCHAR(255),
  send_state VARCHAR(255),
  send_date VARCHAR(255),
  patient_birthday VARCHAR(255),
  blood_mode VARCHAR(255),
  read_doctor VARCHAR(255),
  read_time VARCHAR(255),
  check_temp_time VARCHAR(255),
  InspectionTime VARCHAR(255),
  result_incept_state VARCHAR(255),
  blood_output_print_time VARCHAR(255),
  receive_person VARCHAR(255),
  police_state VARCHAR(255),
  readed_state VARCHAR(255),
  police_time VARCHAR(255),
  police_person VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_inspection_sample IS '样本信息表（主表）';
COMMENT ON COLUMN lis_inspection_sample.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_sample.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_sample.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_sample.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_sample.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_sample.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_sample.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_inspection_sample.group_id IS '分组ID';
COMMENT ON COLUMN lis_inspection_sample.inspection_date IS '检验日期（样本编号时自动生成）';
COMMENT ON COLUMN lis_inspection_sample.inspection_time IS '检验时间（样本编号时自动生成）';
COMMENT ON COLUMN lis_inspection_sample.sample_number IS '样本编号';
COMMENT ON COLUMN lis_inspection_sample.requisition_id IS '申请单ID';
COMMENT ON COLUMN lis_inspection_sample.patient_type IS '病人类别（1住院、2门诊、3住院急诊、4门诊急诊、5体检、10质控）';
COMMENT ON COLUMN lis_inspection_sample.outpatient_id IS '病人ID';
COMMENT ON COLUMN lis_inspection_sample.inpatient_id IS '就诊唯一号';
COMMENT ON COLUMN lis_inspection_sample.invoice_id IS '发票号码';
COMMENT ON COLUMN lis_inspection_sample.charge_type IS '收费类型';
COMMENT ON COLUMN lis_inspection_sample.patient_name IS '病人姓名';
COMMENT ON COLUMN lis_inspection_sample.patient_sex IS '病人性别（1男，2女，3不详）';
COMMENT ON COLUMN lis_inspection_sample.age_type IS '年龄类型';
COMMENT ON COLUMN lis_inspection_sample.age_input IS '输入年龄';
COMMENT ON COLUMN lis_inspection_sample.age_save IS '保存年龄（换算分钟）';
COMMENT ON COLUMN lis_inspection_sample.patient_nation IS '民族代码';
COMMENT ON COLUMN lis_inspection_sample.patient_nation_name IS '民族名称';
COMMENT ON COLUMN lis_inspection_sample.bloodtype_abo IS 'ABO血型';
COMMENT ON COLUMN lis_inspection_sample.bloodtype_rh IS 'RH血型';
COMMENT ON COLUMN lis_inspection_sample.patient_dept IS '申请科室代码';
COMMENT ON COLUMN lis_inspection_sample.patient_dept_name IS '申请科室名称';
COMMENT ON COLUMN lis_inspection_sample.patient_ward IS '申请病区代码';
COMMENT ON COLUMN lis_inspection_sample.patient_ward_name IS '申请病区名称';
COMMENT ON COLUMN lis_inspection_sample.patient_bed IS '病人床号';
COMMENT ON COLUMN lis_inspection_sample.especial_condition IS '特殊说明';
COMMENT ON COLUMN lis_inspection_sample.clinical_diagnoses IS '临床诊断代码';
COMMENT ON COLUMN lis_inspection_sample.clinical_diagnoses_name IS '临床诊断名称';
COMMENT ON COLUMN lis_inspection_sample.sample_class IS '标本种类代码';
COMMENT ON COLUMN lis_inspection_sample.sample_class_name IS '标本种类名称';
COMMENT ON COLUMN lis_inspection_sample.infect_status IS '传染标记';
COMMENT ON COLUMN lis_inspection_sample.sample_status IS '标本形状代码';
COMMENT ON COLUMN lis_inspection_sample.sample_status_name IS '标本形状名称';
COMMENT ON COLUMN lis_inspection_sample.sampling_position IS '取样位置';
COMMENT ON COLUMN lis_inspection_sample.sampling_position_name IS '取样位置';
COMMENT ON COLUMN lis_inspection_sample.test_order IS '检验目的代码';
COMMENT ON COLUMN lis_inspection_sample.test_order_name IS '检验目的名称';
COMMENT ON COLUMN lis_inspection_sample.sample_charge IS '样本金额';
COMMENT ON COLUMN lis_inspection_sample.item_count IS '样本数量';
COMMENT ON COLUMN lis_inspection_sample.workload IS '工作量';
COMMENT ON COLUMN lis_inspection_sample.sampling_time IS '采样时间';
COMMENT ON COLUMN lis_inspection_sample.sampling_person IS '采样人员';
COMMENT ON COLUMN lis_inspection_sample.requisition_time IS '开单时间';
COMMENT ON COLUMN lis_inspection_sample.requisition_person IS '开单人员';
COMMENT ON COLUMN lis_inspection_sample.deliver_hospital IS '送检单位';
COMMENT ON COLUMN lis_inspection_sample.incept_time IS '接收时间';
COMMENT ON COLUMN lis_inspection_sample.incept_person IS '接收人员';
COMMENT ON COLUMN lis_inspection_sample.input_person IS '录入人员';
COMMENT ON COLUMN lis_inspection_sample.input_time IS '录入时间';
COMMENT ON COLUMN lis_inspection_sample.inspection_person IS '检验人员';
COMMENT ON COLUMN lis_inspection_sample.check_person IS '审核人员';
COMMENT ON COLUMN lis_inspection_sample.check_time IS '审核时间';
COMMENT ON COLUMN lis_inspection_sample.print_person IS '打印人员';
COMMENT ON COLUMN lis_inspection_sample.print_time IS '打印时间';
COMMENT ON COLUMN lis_inspection_sample.print_count IS '打印次数';
COMMENT ON COLUMN lis_inspection_sample.expert_rule IS '专家规则';
COMMENT ON COLUMN lis_inspection_sample.id_card IS '身份证号';
COMMENT ON COLUMN lis_inspection_sample.charge_state IS '收费状态';
COMMENT ON COLUMN lis_inspection_sample.inspection_state IS '检验状态';
COMMENT ON COLUMN lis_inspection_sample.rerun_state IS '复查状态';
COMMENT ON COLUMN lis_inspection_sample.read_state IS '临床阅读状态';
COMMENT ON COLUMN lis_inspection_sample.remark IS '备注代码';
COMMENT ON COLUMN lis_inspection_sample.remark_name IS '备注名称';
COMMENT ON COLUMN lis_inspection_sample.confirm_time IS '批准时间';
COMMENT ON COLUMN lis_inspection_sample.confirm_person IS '批准人员';
COMMENT ON COLUMN lis_inspection_sample.instrument IS '仪器';
COMMENT ON COLUMN lis_inspection_sample.mobileno IS '手机号码';
COMMENT ON COLUMN lis_inspection_sample.send_state IS '发送状态';
COMMENT ON COLUMN lis_inspection_sample.send_date IS '发送时间';
COMMENT ON COLUMN lis_inspection_sample.patient_birthday IS '出生日期';
COMMENT ON COLUMN lis_inspection_sample.blood_mode IS '血缘关系';
COMMENT ON COLUMN lis_inspection_sample.read_doctor IS '阅读医生';
COMMENT ON COLUMN lis_inspection_sample.read_time IS '阅读时间';
COMMENT ON COLUMN lis_inspection_sample.check_temp_time IS '初步报告时间';
COMMENT ON COLUMN lis_inspection_sample.InspectionTime IS '检验审核时间';
COMMENT ON COLUMN lis_inspection_sample.result_incept_state IS '结果接收状态';
COMMENT ON COLUMN lis_inspection_sample.blood_output_print_time IS '血液出库打印时间';
COMMENT ON COLUMN lis_inspection_sample.receive_person IS '接收人员';
COMMENT ON COLUMN lis_inspection_sample.police_state IS '危急值提醒状态';
COMMENT ON COLUMN lis_inspection_sample.readed_state IS 'lis42报告单是否已经看过';
COMMENT ON COLUMN lis_inspection_sample.police_time IS '下次提醒时间';
COMMENT ON COLUMN lis_inspection_sample.police_person IS '未指定检验人员时，检验提示信息不再提示人员序号，用","分隔';

-- 表: lis_inspection_sample_charge (标本收费记录表)
CREATE TABLE lis_inspection_sample_charge (
  sample_charge_id BIGINT,
  requisition_id VARCHAR(255),
  inspection_id BIGINT,
  charge_item_id BIGINT,
  chinese_name_short VARCHAR(255),
  amount VARCHAR(255),
  charge VARCHAR(255),
  workload VARCHAR(255),
  charge_person VARCHAR(255),
  charge_time VARCHAR(255),
  charge_postion VARCHAR(255),
  charge_state VARCHAR(255),
  charge_type VARCHAR(255),
  his_id BIGINT,
  charge_num VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_inspection_sample_charge IS '标本收费记录表';
COMMENT ON COLUMN lis_inspection_sample_charge.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_sample_charge.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_sample_charge.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_sample_charge.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_sample_charge.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_sample_charge.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_sample_charge.sample_charge_id IS '收费ID';
COMMENT ON COLUMN lis_inspection_sample_charge.requisition_id IS '申请单ID';
COMMENT ON COLUMN lis_inspection_sample_charge.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_inspection_sample_charge.charge_item_id IS '收费项目ID';
COMMENT ON COLUMN lis_inspection_sample_charge.chinese_name_short IS '项目简称';
COMMENT ON COLUMN lis_inspection_sample_charge.amount IS '项目数';
COMMENT ON COLUMN lis_inspection_sample_charge.charge IS '收费金额';
COMMENT ON COLUMN lis_inspection_sample_charge.workload IS '工作量';
COMMENT ON COLUMN lis_inspection_sample_charge.charge_person IS '收费人员';
COMMENT ON COLUMN lis_inspection_sample_charge.charge_time IS '收费时间';
COMMENT ON COLUMN lis_inspection_sample_charge.charge_postion IS '计算机名称';
COMMENT ON COLUMN lis_inspection_sample_charge.charge_state IS '收费状态';
COMMENT ON COLUMN lis_inspection_sample_charge.charge_type IS '收费类型';
COMMENT ON COLUMN lis_inspection_sample_charge.his_id IS 'HIS代码';
COMMENT ON COLUMN lis_inspection_sample_charge.charge_num IS '备用字段';

-- 表: lis_inspection_sample_explain (备注信息表)
CREATE TABLE lis_inspection_sample_explain (
  inspection_id BIGINT,
  explain_id VARCHAR(255),
  explain VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_inspection_sample_explain IS '备注信息表';
COMMENT ON COLUMN lis_inspection_sample_explain.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_sample_explain.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_sample_explain.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_sample_explain.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_sample_explain.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_sample_explain.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_sample_explain.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_inspection_sample_explain.explain_id IS '解释ID，跟lis_base_data关联';
COMMENT ON COLUMN lis_inspection_sample_explain.explain IS '结果解释';

-- 表: lis_inspection_sample_graph (样本图形信息表)
CREATE TABLE lis_inspection_sample_graph (
  inspection_id BIGINT,
  inspection_date VARCHAR(255),
  inspection_instrument VARCHAR(255),
  graph_format VARCHAR(255),
  remark VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_inspection_sample_graph IS '样本图形信息表';
COMMENT ON COLUMN lis_inspection_sample_graph.create_dept IS '创建部门';
COMMENT ON COLUMN lis_inspection_sample_graph.create_by IS '创建人';
COMMENT ON COLUMN lis_inspection_sample_graph.create_time IS '创建时间';
COMMENT ON COLUMN lis_inspection_sample_graph.update_by IS '修改人';
COMMENT ON COLUMN lis_inspection_sample_graph.update_time IS '修改时间';
COMMENT ON COLUMN lis_inspection_sample_graph.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_inspection_sample_graph.inspection_id IS '检验单ID';
COMMENT ON COLUMN lis_inspection_sample_graph.inspection_date IS '检验日期';
COMMENT ON COLUMN lis_inspection_sample_graph.inspection_instrument IS '检验仪器';
COMMENT ON COLUMN lis_inspection_sample_graph.graph_format IS '图片格式';
COMMENT ON COLUMN lis_inspection_sample_graph.remark IS '备注';

-- 表: lis_test_item (检验项目明细字典表)
CREATE TABLE lis_test_item (
  test_item_id BIGINT NOT NULL,
  test_item_code CHAR(10),
  test_item_sort VARCHAR(20),
  chinese_name VARCHAR(50),
  chinese_short_name VARCHAR(50),
  english_name VARCHAR(50),
  english_short_name VARCHAR(20),
  standard_id VARCHAR(20),
  his_id VARCHAR(20),
  lis_id VARCHAR(50),
  medical_id VARCHAR(20),
  test_item_type CHAR(2),
  test_item_class VARCHAR(50),
  expressions VARCHAR(100),
  test_item_charge DECIMAL(5,2),
  test_item_unit VARCHAR(20),
  test_item_precision CHAR(2),
  modulus VARCHAR(20),
  correlative_equation VARCHAR(50),
  display_type VARCHAR(20),
  correspond_key VARCHAR(10),
  regulation_file VARCHAR(100),
  repository_file VARCHAR(50),
  test_method VARCHAR(255),
  reagent_dosage DECIMAL(5,2),
  custom_code VARCHAR(20),
  spell_code VARCHAR(20),
  stroke_code VARCHAR(20),
  state_flag CHAR(2),
  standard_name VARCHAR(50),
  test_item_total_class VARCHAR(50),
  pes_id VARCHAR(20),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20),
  PRIMARY KEY (test_item_id)
);
COMMENT ON TABLE lis_test_item IS '检验项目明细字典表';
COMMENT ON COLUMN lis_test_item.create_dept IS '创建部门';
COMMENT ON COLUMN lis_test_item.create_by IS '创建人';
COMMENT ON COLUMN lis_test_item.create_time IS '创建时间';
COMMENT ON COLUMN lis_test_item.update_by IS '修改人';
COMMENT ON COLUMN lis_test_item.update_time IS '修改时间';
COMMENT ON COLUMN lis_test_item.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_test_item.test_item_id IS '项目ID';
COMMENT ON COLUMN lis_test_item.test_item_code IS '项目代码';
COMMENT ON COLUMN lis_test_item.test_item_sort IS '排序号';
COMMENT ON COLUMN lis_test_item.chinese_name IS '中文名称';
COMMENT ON COLUMN lis_test_item.chinese_short_name IS '中文简称';
COMMENT ON COLUMN lis_test_item.english_name IS '英文名称';
COMMENT ON COLUMN lis_test_item.english_short_name IS '英文简称';
COMMENT ON COLUMN lis_test_item.standard_id IS '标准代码';
COMMENT ON COLUMN lis_test_item.his_id IS 'HIS代码（HIS关联码）';
COMMENT ON COLUMN lis_test_item.lis_id IS '老系统代码';
COMMENT ON COLUMN lis_test_item.medical_id IS '医保代码';
COMMENT ON COLUMN lis_test_item.test_item_type IS '项目类型:计算类、非计算类';
COMMENT ON COLUMN lis_test_item.test_item_class IS '项目分类（按检验科室分类）';
COMMENT ON COLUMN lis_test_item.expressions IS '计算公式';
COMMENT ON COLUMN lis_test_item.test_item_charge IS '收费金额';
COMMENT ON COLUMN lis_test_item.test_item_unit IS '单位';
COMMENT ON COLUMN lis_test_item.test_item_precision IS '结果精度（小数点保留）';
COMMENT ON COLUMN lis_test_item.modulus IS '项目系数';
COMMENT ON COLUMN lis_test_item.correlative_equation IS '相关方程';
COMMENT ON COLUMN lis_test_item.display_type IS '显示类型';
COMMENT ON COLUMN lis_test_item.correspond_key IS '对照Key';
COMMENT ON COLUMN lis_test_item.regulation_file IS '操作规程文件';
COMMENT ON COLUMN lis_test_item.repository_file IS '知识库文件';
COMMENT ON COLUMN lis_test_item.test_method IS '检验方法';
COMMENT ON COLUMN lis_test_item.reagent_dosage IS '试剂用量';
COMMENT ON COLUMN lis_test_item.custom_code IS '自定义码';
COMMENT ON COLUMN lis_test_item.spell_code IS '拼音码';
COMMENT ON COLUMN lis_test_item.stroke_code IS '五笔码';
COMMENT ON COLUMN lis_test_item.state_flag IS '状态';
COMMENT ON COLUMN lis_test_item.standard_name IS '标准名称';
COMMENT ON COLUMN lis_test_item.test_item_total_class IS '项目总分类';
COMMENT ON COLUMN lis_test_item.pes_id IS '体检关联码';

-- 表: lis_test_item_combination (lis_test_item_combination)
CREATE TABLE lis_test_item_combination (
  serial_no VARCHAR(255),
  combination_id VARCHAR(255),
  combination_sort VARCHAR(255),
  sample_class VARCHAR(255),
  test_item_id BIGINT,
  base_data_sort VARCHAR(255),
  default_result VARCHAR(255),
  combination_name VARCHAR(255),
  standart_id VARCHAR(255),
  custom_code VARCHAR(255),
  spell_code VARCHAR(255),
  stroke_code VARCHAR(255),
  state_flag VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_test_item_combination IS '检验项目组合';
COMMENT ON COLUMN lis_test_item_combination.create_dept IS '创建部门';
COMMENT ON COLUMN lis_test_item_combination.create_by IS '创建人';
COMMENT ON COLUMN lis_test_item_combination.create_time IS '创建时间';
COMMENT ON COLUMN lis_test_item_combination.update_by IS '修改人';
COMMENT ON COLUMN lis_test_item_combination.update_time IS '修改时间';
COMMENT ON COLUMN lis_test_item_combination.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_test_item_combination.serial_no IS '排序';
COMMENT ON COLUMN lis_test_item_combination.combination_id IS '组合ID';
COMMENT ON COLUMN lis_test_item_combination.combination_sort IS '排序号';
COMMENT ON COLUMN lis_test_item_combination.sample_class IS '标本类型代码';
COMMENT ON COLUMN lis_test_item_combination.test_item_id IS '项目ID';
COMMENT ON COLUMN lis_test_item_combination.base_data_sort IS '项目排序';
COMMENT ON COLUMN lis_test_item_combination.default_result IS '默认结果';
COMMENT ON COLUMN lis_test_item_combination.combination_name IS '组合名称';
COMMENT ON COLUMN lis_test_item_combination.standart_id IS '标准ID';
COMMENT ON COLUMN lis_test_item_combination.custom_code IS '自定义码';
COMMENT ON COLUMN lis_test_item_combination.spell_code IS '拼音码';
COMMENT ON COLUMN lis_test_item_combination.stroke_code IS '五笔码';
COMMENT ON COLUMN lis_test_item_combination.state_flag IS '状态';

-- 表: lis_test_item_group (各仪器开展检验项目明细表)
CREATE TABLE lis_test_item_group (
  group_id BIGINT,
  test_item_id BIGINT,
  test_item_sort VARCHAR(255),
  test_item_type VARCHAR(255),
  expressions VARCHAR(255),
  modulus VARCHAR(255),
  custom_code VARCHAR(255),
  spell_code VARCHAR(255),
  stroke_code VARCHAR(255),
  flag VARCHAR(255),
  sample_class VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE lis_test_item_group IS '各仪器开展检验项目明细表';
COMMENT ON COLUMN lis_test_item_group.create_dept IS '创建部门';
COMMENT ON COLUMN lis_test_item_group.create_by IS '创建人';
COMMENT ON COLUMN lis_test_item_group.create_time IS '创建时间';
COMMENT ON COLUMN lis_test_item_group.update_by IS '修改人';
COMMENT ON COLUMN lis_test_item_group.update_time IS '修改时间';
COMMENT ON COLUMN lis_test_item_group.tenant_id IS '分院ID';
COMMENT ON COLUMN lis_test_item_group.group_id IS '分组ID';
COMMENT ON COLUMN lis_test_item_group.test_item_id IS '项目ID';
COMMENT ON COLUMN lis_test_item_group.test_item_sort IS '排序';
COMMENT ON COLUMN lis_test_item_group.test_item_type IS '项目类型';
COMMENT ON COLUMN lis_test_item_group.expressions IS '计算公式';
COMMENT ON COLUMN lis_test_item_group.modulus IS '项目系数';
COMMENT ON COLUMN lis_test_item_group.custom_code IS '自定义码';
COMMENT ON COLUMN lis_test_item_group.spell_code IS '拼音码';
COMMENT ON COLUMN lis_test_item_group.stroke_code IS '五笔码';
COMMENT ON COLUMN lis_test_item_group.flag IS '状态';
COMMENT ON COLUMN lis_test_item_group.sample_class IS '标本类型代码';

-- 表: sys_user (用户信息表)
CREATE TABLE sys_user (
  user_no VARCHAR(255),
  logid VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  his_id BIGINT,
  ime VARCHAR(255),
  dept_code VARCHAR(255),
  tech_post VARCHAR(255),
  select_group VARCHAR(255),
  state_flag VARCHAR(255),
  material_dept VARCHAR(255),
  mobileno VARCHAR(255),
  ime_chinese_name VARCHAR(255),
  tmis_id VARCHAR(255),
  id_card VARCHAR(255),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20)
);
COMMENT ON TABLE sys_user IS '用户信息表';
COMMENT ON COLUMN sys_user.create_dept IS '创建部门';
COMMENT ON COLUMN sys_user.create_by IS '创建人';
COMMENT ON COLUMN sys_user.create_time IS '创建时间';
COMMENT ON COLUMN sys_user.update_by IS '修改人';
COMMENT ON COLUMN sys_user.update_time IS '修改时间';
COMMENT ON COLUMN sys_user.tenant_id IS '分院ID';
COMMENT ON COLUMN sys_user.user_no IS '用户id';
COMMENT ON COLUMN sys_user.logid IS '登录名';
COMMENT ON COLUMN sys_user.username IS '用户名称';
COMMENT ON COLUMN sys_user.password IS '密码';
COMMENT ON COLUMN sys_user.his_id IS 'HIS代码';
COMMENT ON COLUMN sys_user.ime IS '默认输入法';
COMMENT ON COLUMN sys_user.dept_code IS '所属科室';
COMMENT ON COLUMN sys_user.tech_post IS '职务';
COMMENT ON COLUMN sys_user.select_group IS '可操作分组';
COMMENT ON COLUMN sys_user.state_flag IS '状态';
COMMENT ON COLUMN sys_user.material_dept IS '物质部门';
COMMENT ON COLUMN sys_user.mobileno IS '手机号码';
COMMENT ON COLUMN sys_user.ime_chinese_name IS '输入法类型';
COMMENT ON COLUMN sys_user.tmis_id IS '血站中心ID';
COMMENT ON COLUMN sys_user.id_card IS '身份证号码';

-- 仪器科室关联表
CREATE TABLE lis_instrument_dept (
  id BIGINT PRIMARY KEY,
  instrument_id BIGINT NOT NULL,
  dept_base_data_id BIGINT NOT NULL,
  sort INTEGER,
  state_flag VARCHAR(1) DEFAULT '1',
  create_time TIMESTAMP,
  create_person VARCHAR(100),
  remark VARCHAR(500)
);

COMMENT ON TABLE lis_instrument_dept IS '仪器科室关联表';
COMMENT ON COLUMN lis_instrument_dept.id IS '主键ID';
COMMENT ON COLUMN lis_instrument_dept.instrument_id IS '仪器ID，关联lis_comm_instrument';
COMMENT ON COLUMN lis_instrument_dept.dept_base_data_id IS '科室基础数据ID，关联lis_base_data';
COMMENT ON COLUMN lis_instrument_dept.sort IS '排序号';
COMMENT ON COLUMN lis_instrument_dept.state_flag IS '状态：1启用，0禁用';
COMMENT ON COLUMN lis_instrument_dept.create_time IS '创建时间';
COMMENT ON COLUMN lis_instrument_dept.create_person IS '创建人员';
COMMENT ON COLUMN lis_instrument_dept.remark IS '备注';

-- 仪器通道项目配置表（静态配置：仪器→通道→检验项目）
CREATE TABLE lis_instrument_channel_item (
  id BIGINT PRIMARY KEY,
  instrument_id BIGINT NOT NULL,
  channel_no VARCHAR(50) NOT NULL,
  channel_name VARCHAR(100),
  test_item_id BIGINT NOT NULL,
  sample_class VARCHAR(50),
  test_item_sort INTEGER,
  default_result VARCHAR(500),
  state_flag VARCHAR(1) DEFAULT '1',
  create_time TIMESTAMP,
  create_person VARCHAR(100),
  modify_time TIMESTAMP,
  modify_person VARCHAR(100),
  remark VARCHAR(500)
);

COMMENT ON TABLE lis_instrument_channel_item IS '仪器通道项目配置表';
COMMENT ON COLUMN lis_instrument_channel_item.id IS '主键ID';
COMMENT ON COLUMN lis_instrument_channel_item.instrument_id IS '仪器ID，关联lis_comm_instrument';
COMMENT ON COLUMN lis_instrument_channel_item.channel_no IS '通道号';
COMMENT ON COLUMN lis_instrument_channel_item.channel_name IS '通道名称';
COMMENT ON COLUMN lis_instrument_channel_item.test_item_id IS '检验项目ID，关联lis_test_item';
COMMENT ON COLUMN lis_instrument_channel_item.sample_class IS '标本类型代码';
COMMENT ON COLUMN lis_instrument_channel_item.test_item_sort IS '项目排序号';
COMMENT ON COLUMN lis_instrument_channel_item.default_result IS '默认结果';
COMMENT ON COLUMN lis_instrument_channel_item.state_flag IS '状态：1启用，0禁用';
COMMENT ON COLUMN lis_instrument_channel_item.create_time IS '创建时间';
COMMENT ON COLUMN lis_instrument_channel_item.create_person IS '创建人员';
COMMENT ON COLUMN lis_instrument_channel_item.modify_time IS '修改时间';
COMMENT ON COLUMN lis_instrument_channel_item.modify_person IS '修改人员';
COMMENT ON COLUMN lis_instrument_channel_item.remark IS '备注';

-- 联合唯一索引：同一仪器同一通道同一项目只能有一条配置
CREATE UNIQUE INDEX idx_instrument_channel_item_unique 
ON lis_instrument_channel_item(instrument_id, channel_no, test_item_id);

-- 索引：按仪器查询
CREATE INDEX idx_instrument_channel_item_instrument 
ON lis_instrument_channel_item(instrument_id);

-- 索引：按检验项目查询
CREATE INDEX idx_instrument_channel_item_testitem 
ON lis_instrument_channel_item(test_item_id);

-- 诊疗项目分组关联表（支持多对多）
CREATE TABLE lis_charge_item_group_rel (
  id BIGINT PRIMARY KEY,
  charge_item_id BIGINT NOT NULL,
  group_id BIGINT NOT NULL,
  sort INTEGER,
  state_flag VARCHAR(1) DEFAULT '1',
  create_time TIMESTAMP,
  create_person VARCHAR(100),
  remark VARCHAR(500)
);

COMMENT ON TABLE lis_charge_item_group_rel IS '诊疗项目分组关联表';
COMMENT ON COLUMN lis_charge_item_group_rel.id IS '主键ID';
COMMENT ON COLUMN lis_charge_item_group_rel.charge_item_id IS '诊疗项目ID，关联lis_charge_item';
COMMENT ON COLUMN lis_charge_item_group_rel.group_id IS '检验分组ID，关联lis_inspection_group';
COMMENT ON COLUMN lis_charge_item_group_rel.sort IS '排序号';
COMMENT ON COLUMN lis_charge_item_group_rel.state_flag IS '状态：1启用，0禁用';
COMMENT ON COLUMN lis_charge_item_group_rel.create_time IS '创建时间';
COMMENT ON COLUMN lis_charge_item_group_rel.create_person IS '创建人员';
COMMENT ON COLUMN lis_charge_item_group_rel.remark IS '备注';

-- 联合唯一索引
CREATE UNIQUE INDEX idx_charge_item_group_unique 
ON lis_charge_item_group_rel(charge_item_id, group_id);
