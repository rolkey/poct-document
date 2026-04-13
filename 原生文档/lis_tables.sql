-- 表: bis_blood_cross_list (bis_blood_cross_list)
CREATE TABLE bis_blood_cross_list (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  cross_id VARCHAR(255) COMMENT '交叉ID',
  inspection_id VARCHAR(255) COMMENT '检验ID',
  in_credit_id VARCHAR(255) COMMENT '血液入库库存ID',
  method_type_id VARCHAR(255) COMMENT '检验方法',
  cross_date VARCHAR(255) COMMENT '交叉日期',
  cross_result1 VARCHAR(255) COMMENT '交叉结果1',
  cross_result2 VARCHAR(255) COMMENT '交叉结果2',
  cross_result3 VARCHAR(255) COMMENT '交叉结果3',
  cross_result4 VARCHAR(255) COMMENT '交叉结果4',
  cross_person VARCHAR(255) COMMENT '交叉人员',
  charge VARCHAR(255) COMMENT '金额',
  workload VARCHAR(255) COMMENT '工作量',
  charge_date VARCHAR(255) COMMENT '收费时间',
  charge_person VARCHAR(255) COMMENT '收费人员',
  charge_state VARCHAR(255) COMMENT '收费状态',
  cross_state VARCHAR(255) COMMENT '交叉状态',
  print_flag VARCHAR(255) COMMENT '打印状态',
  print_number VARCHAR(255) COMMENT '打印次数',
  check_person VARCHAR(255) COMMENT '审核人员',
  check_time VARCHAR(255) COMMENT '审核时间',
  cross_remark VARCHAR(255) COMMENT '交叉备注',
  cross_amount VARCHAR(255) COMMENT '交叉次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交叉配血记录';

-- 表: bis_blood_input (血液出入库信息表)
CREATE TABLE bis_blood_input (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  in_credit_id VARCHAR(255) COMMENT '血液入库库存ID',
  blood_type_id VARCHAR(255) COMMENT '血液类型id',
  blood_bag_id VARCHAR(255) COMMENT '血袋号',
  in_date VARCHAR(255) COMMENT '入库日期',
  blood_donor VARCHAR(255) COMMENT '献血员',
  sex VARCHAR(255) COMMENT '性别',
  abo_blood_group VARCHAR(255) COMMENT 'ABO血型',
  rh_blood_group VARCHAR(255) COMMENT 'RH血型',
  blood_amount VARCHAR(255) COMMENT '入库血量',
  blood_unit VARCHAR(255) COMMENT '单位',
  blood_charge VARCHAR(255) COMMENT '血液费用',
  preparation_type VARCHAR(255) COMMENT '制备方式',
  preparation_date VARCHAR(255) COMMENT '制备日期',
  atterm_date VARCHAR(255) COMMENT '到期日期',
  alarm_date VARCHAR(255) COMMENT '报警日期',
  input_person VARCHAR(255) COMMENT '入库人员',
  output_person VARCHAR(255) COMMENT '出库人员',
  output_date VARCHAR(255) COMMENT '出库时间',
  state_flag VARCHAR(255) COMMENT '状态',
  scrap_date VARCHAR(255) COMMENT '报废日期',
  scrap_cause VARCHAR(255) COMMENT '报废原因',
  scrap_person VARCHAR(255) COMMENT '报废人',
  charge_state VARCHAR(255) COMMENT '收费状态',
  charge_date VARCHAR(255) COMMENT '收费日期',
  charge_person VARCHAR(255) COMMENT '收费人员',
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  print_state VARCHAR(255) COMMENT '打印状态',
  destroy_person VARCHAR(255) COMMENT '销毁人员',
  destroy_date VARCHAR(255) COMMENT '销毁时间',
  destroy_position VARCHAR(255) COMMENT '销毁地点',
  receive_person VARCHAR(255) COMMENT '领取人员',
  abo_blood_check VARCHAR(255) COMMENT '复查ABO血型',
  rh_blood_check VARCHAR(255) COMMENT '复查RH血型',
  inspection_person VARCHAR(255) COMMENT '复检者',
  check_person VARCHAR(255) COMMENT '审核者',
  check_time VARCHAR(255) COMMENT '审核时间',
  blood_source VARCHAR(255) COMMENT '血液来源',
  in_location VARCHAR(255) COMMENT '存储位置',
  cross_date VARCHAR(255) COMMENT '交叉日期',
  remark VARCHAR(255) COMMENT '备注',
  transport_condition VARCHAR(255) COMMENT '运输条件',
  external_appearance VARCHAR(255) COMMENT '运输外观',
  blood_type_code VARCHAR(255) COMMENT '产品码',
  blood_group_code VARCHAR(255) COMMENT '血型码',
  blood_atterm_code VARCHAR(255) COMMENT '失效日期码',
  blood_antibody_check VARCHAR(255) COMMENT '抗体复查',
  sampling_time VARCHAR(255) COMMENT '采集时间',
  sampling_person VARCHAR(255) COMMENT '采集人员',
  charge_num VARCHAR(255) COMMENT '收费数量',
  receive_time VARCHAR(255) COMMENT '接收时间',
  lastmodify VARCHAR(255) COMMENT '最后修改时间',
  blood_id VARCHAR(255) COMMENT '血站ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='血液出入库信息表';

-- 表: bis_blood_packing_class (bis_blood_packing_class)
CREATE TABLE bis_blood_packing_class (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  pack_class_id VARCHAR(255) COMMENT 'ID',
  blood_type_id VARCHAR(255) COMMENT '血液类型id',
  pack_class_sort VARCHAR(255) COMMENT '排序号',
  packing_amount VARCHAR(255) COMMENT '包装量',
  corresponding_id VARCHAR(255) COMMENT '血站对照ID',
  cost VARCHAR(255) COMMENT '成本',
  charge VARCHAR(255) COMMENT '收费',
  state_flag VARCHAR(255) COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='血液包装分类';

-- 表: bis_blood_type (bis_blood_type)
CREATE TABLE bis_blood_type (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  sort VARCHAR(255) COMMENT '排序号',
  blood_name VARCHAR(255) COMMENT '血液单位',
  blood_unit VARCHAR(255) COMMENT '血液名称',
  whole_blood_correspond VARCHAR(255) COMMENT '全血当量',
  blood_adscription VARCHAR(255) COMMENT '血液归属',
  validity VARCHAR(255) COMMENT '保质期(天)',
  prompt VARCHAR(255) COMMENT '报价提示期限',
  if_cross VARCHAR(255) COMMENT '是否交叉',
  his_id VARCHAR(255) COMMENT 'hid代码',
  interdependent_charge VARCHAR(255) COMMENT '互助金额',
  corresponding_id VARCHAR(255) COMMENT '血站代码',
  standard_id VARCHAR(255) COMMENT '标准ID',
  custom_code VARCHAR(255) COMMENT '自定义码',
  spell_code VARCHAR(255) COMMENT '拼音码',
  state_flag VARCHAR(255) COMMENT '使用状态',
  blood_type_id VARCHAR(255) COMMENT '血液类型id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='血液类型';

-- 表: bis_test_method_type (bis_test_method_type)
CREATE TABLE bis_test_method_type (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  type_id VARCHAR(255) COMMENT '配血类型ID（3配血法，血液处理法）',
  sort VARCHAR(255) COMMENT '排序号',
  chinese_name VARCHAR(255) COMMENT '配血方法名称',
  his_id VARCHAR(255) COMMENT 'HIS代码',
  charge VARCHAR(255) COMMENT '金额',
  workload VARCHAR(255) COMMENT '工作量',
  custom_code VARCHAR(255) COMMENT '自定义码',
  spell_code VARCHAR(255) COMMENT '拼音码',
  reside_class VARCHAR(255) COMMENT '所属类型',
  state_flag VARCHAR(255) COMMENT '使用状态',
  method_type_id VARCHAR(255) COMMENT 'ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配血方法类型';

-- 表: his_requisition (his_requisition)
CREATE TABLE his_requisition (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  his_id VARCHAR(255) COMMENT '医嘱代码',
  requisition_id VARCHAR(255) COMMENT '申请单ID',
  patient_type VARCHAR(255) COMMENT '病人类别（1住院、2门诊、3住院急诊、4门诊急诊、5体检、10质控）',
  outpatient_id VARCHAR(255) COMMENT '病人ID',
  inpatient_id VARCHAR(255) COMMENT '就诊唯一号',
  charge_type VARCHAR(255) COMMENT '收费类型',
  patient_name VARCHAR(255) COMMENT '病人姓名',
  patient_sex VARCHAR(255) COMMENT 'patient_sex',
  patient_age VARCHAR(255) COMMENT '输入年龄',
  patient_nation VARCHAR(255) COMMENT '民族代码',
  bloodtype_abo VARCHAR(255) COMMENT 'ABO血型',
  bloodtype_rh VARCHAR(255) COMMENT 'RH血型',
  patient_dept VARCHAR(255) COMMENT '申请科室代码',
  patient_dept_name VARCHAR(255) COMMENT 'patient_dept_name',
  patient_ward VARCHAR(255) COMMENT '申请病区代码',
  patient_ward_name VARCHAR(255) COMMENT '申请病区名称',
  patient_bed VARCHAR(255) COMMENT '病人床号',
  especial_condition VARCHAR(255) COMMENT '特殊说明',
  inspected_info VARCHAR(255) COMMENT '检查信息',
  infection VARCHAR(255) COMMENT '传染标记',
  clinical_diagnoses VARCHAR(255) COMMENT '临床诊断',
  medical_record VARCHAR(255) COMMENT '病例档案',
  requisition_dept VARCHAR(255) COMMENT '申请科室',
  requisition_time VARCHAR(255) COMMENT '申请时间',
  requisition_person VARCHAR(255) COMMENT '申请人员',
  execute_dept VARCHAR(255) COMMENT '执行科室',
  execute_time VARCHAR(255) COMMENT '执行时间',
  execute_person VARCHAR(255) COMMENT '执行人员',
  print_dept VARCHAR(255) COMMENT '打印时间',
  print_time VARCHAR(255) COMMENT '打印时间',
  print_person VARCHAR(255) COMMENT '打印人员',
  sample_class VARCHAR(255) COMMENT '样本类型',
  id VARCHAR(255) COMMENT 'id',
  sampling_position VARCHAR(255) COMMENT '采样地点',
  sampling_dept VARCHAR(255) COMMENT '采样科室',
  sampling_time VARCHAR(255) COMMENT '采样时间',
  sampling_person VARCHAR(255) COMMENT '采样人员',
  receive_dept VARCHAR(255) COMMENT '接收科室',
  receive_time VARCHAR(255) COMMENT '接收时间',
  receive_person VARCHAR(255) COMMENT '接收人员',
  charge_item_id VARCHAR(255) COMMENT '项目代码',
  charge_name VARCHAR(255) COMMENT '收费名称',
  charge VARCHAR(255) COMMENT '收费金额',
  charge_state VARCHAR(255) COMMENT '收费状态',
  charge_time VARCHAR(255) COMMENT '收费时间',
  charge_person VARCHAR(255) COMMENT '收费人员',
  requisition_state VARCHAR(255) COMMENT '申请单状态',
  remark VARCHAR(255) COMMENT '备注',
  requisition_from VARCHAR(255) COMMENT '申请单来源',
  return_person VARCHAR(255) COMMENT '退回人员',
  return_cause VARCHAR(255) COMMENT '退回原因',
  return_time VARCHAR(255) COMMENT '退回时间',
  Document_type VARCHAR(255) COMMENT '证件类型',
  outpatinet_times VARCHAR(255) COMMENT '就诊次数',
  delivery_person VARCHAR(255) COMMENT '送达人员',
  delivery_time VARCHAR(255) COMMENT '送达时间',
  send_person VARCHAR(255) COMMENT '送达人员',
  send_time VARCHAR(255) COMMENT '送达时间',
  Residential_address VARCHAR(255) COMMENT '家庭地址',
  Residential_address2 VARCHAR(255) COMMENT '现居住地址',
  mobile_no VARCHAR(255) COMMENT '手机号码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医嘱申请';

-- 表: lis_base_data (基础数据表（科别、医生、标本种类）)
CREATE TABLE lis_base_data (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  base_data_id VARCHAR(255) COMMENT '基础数据ID',
  class_id VARCHAR(255) COMMENT '字典类型',
  base_data_sort VARCHAR(255) COMMENT '排序号',
  chinese_name VARCHAR(255) COMMENT '中文名称',
  english_name VARCHAR(255) COMMENT '英文名称',
  his_id VARCHAR(255) COMMENT 'HIS代码',
  standart_id VARCHAR(255) COMMENT '标准代码',
  custom_code VARCHAR(255) COMMENT '自定义码',
  spell_code VARCHAR(255) COMMENT '拼音码',
  stroke_code VARCHAR(255) COMMENT '五笔码',
  state_flag VARCHAR(255) COMMENT '状态',
  custom01 VARCHAR(255) COMMENT '分类1',
  custom02 VARCHAR(255) COMMENT '分类2',
  custom03 VARCHAR(255) COMMENT '分类3',
  custom04 VARCHAR(255) COMMENT '统计分类(检验科室)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础数据表（科别、医生、标本种类）';

-- 表: lis_base_data_group (各分组基础数据表)
CREATE TABLE lis_base_data_group (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  spell_code VARCHAR(255) COMMENT '拼音码',
  stroke_code VARCHAR(255) COMMENT '五笔码',
  standard_name VARCHAR(255) COMMENT '标准名称',
  group_id VARCHAR(255) COMMENT '检验分组ID',
  custom_code VARCHAR(255) COMMENT '自定义码',
  base_data_sort VARCHAR(255) COMMENT '排序号',
  base_data_id VARCHAR(255) COMMENT '基础数据ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='各分组基础数据表';

-- 表: lis_change_log (一般检验修改日志表)
CREATE TABLE lis_change_log (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  serial_no VARCHAR(255) COMMENT '日志ID',
  module_type VARCHAR(255) COMMENT '操作模块类型',
  change_type VARCHAR(255) COMMENT '日志类型',
  change_class VARCHAR(255) COMMENT '操作类型',
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  change_content VARCHAR(255) COMMENT '操作内容',
  change_cause VARCHAR(255) COMMENT '操作原因',
  change_person VARCHAR(255) COMMENT '操作人员',
  change_time VARCHAR(255) COMMENT '操作时间',
  change_place VARCHAR(255) COMMENT '操作电脑',
  remark VARCHAR(255) COMMENT '备注信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='一般检验修改日志表';

-- 表: lis_change_log_micro (微生物系统修改日志表)
CREATE TABLE lis_change_log_micro (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  id VARCHAR(255) COMMENT '日志ID',
  change_id VARCHAR(255) COMMENT '诊疗项目代码',
  change_soft VARCHAR(255) COMMENT '修改模块',
  change_person VARCHAR(255) COMMENT '修改人员',
  change_time VARCHAR(255) COMMENT '修改时间',
  change_where VARCHAR(255) COMMENT '修改条件',
  change_content VARCHAR(255) COMMENT '修改内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微生物系统修改日志表';

-- 表: lis_charge_item (诊疗项目对照项目表)
CREATE TABLE lis_charge_item (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  charge_item_id VARCHAR(255) COMMENT '诊疗项目ID',
  chinese_name VARCHAR(255) COMMENT '诊疗项目名称',
  chinese_name_short VARCHAR(255) COMMENT '诊疗项目简称',
  english_name VARCHAR(255) COMMENT '诊疗项目英文名称',
  his_id VARCHAR(255) COMMENT 'HIS代码',
  medicare_id VARCHAR(255) COMMENT '医保代码（对应惠桥代码）',
  standart_id VARCHAR(255) COMMENT '标准代码（返回给体检系统代码）',
  barcode_seq VARCHAR(255) COMMENT '条码规则序号',
  charge_item_sort VARCHAR(255) COMMENT '诊疗项目分类（免疫、生化、体液）',
  charge VARCHAR(255) COMMENT '诊疗项目金额（与HIS对应）',
  sample_class VARCHAR(255) COMMENT '默认标本种类',
  patient_type VARCHAR(255) COMMENT '项目开展类型',
  sampling_request VARCHAR(255) COMMENT '采样要求',
  sampling_time VARCHAR(255) COMMENT '允许采样时间',
  sampling_place VARCHAR(255) COMMENT '采样地点',
  report_time VARCHAR(255) COMMENT '报告时间',
  report_place VARCHAR(255) COMMENT '报告地点',
  report_time_sort VARCHAR(255) COMMENT '报告时间序号',
  inspection_time VARCHAR(255) COMMENT '开展时间（默认每天都开展）',
  workload VARCHAR(255) COMMENT '工作量',
  test_item_count VARCHAR(255) COMMENT '项目数量',
  unite_flag VARCHAR(255) COMMENT '合并标记（共管标识）',
  custom_code VARCHAR(255) COMMENT '自定义码',
  spell_code VARCHAR(255) COMMENT '拼音码',
  stroke_code VARCHAR(255) COMMENT '五笔码',
  used_flag VARCHAR(255) COMMENT '是否常用：1是，空不是',
  state_flag VARCHAR(255) COMMENT '使用状态：1使用，0禁用',
  number_priority VARCHAR(255) COMMENT '编号规则',
  save_term VARCHAR(255) COMMENT '标本保留天数',
  group_id VARCHAR(255) COMMENT '所属检验分组',
  tjxmbh VARCHAR(255) COMMENT '体检代码（未使用）',
  number_print VARCHAR(255) COMMENT '检验条码打印份数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='诊疗项目对照项目表';

-- 表: lis_charge_item_charge (lis_charge_item_charge)
CREATE TABLE lis_charge_item_charge (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  charge_class VARCHAR(255) COMMENT '收费类型',
  his_id VARCHAR(255) COMMENT 'HIS代码',
  charge_name VARCHAR(255) COMMENT '收费名称',
  charge VARCHAR(255) COMMENT '收费金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收费项目收费明细';

-- 表: lis_charge_item_inspectiontime (lis_charge_item_inspectiontime)
CREATE TABLE lis_charge_item_inspectiontime (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  time_type VARCHAR(255) COMMENT '超时类型',
  patient_type VARCHAR(255) COMMENT '病人类型',
  id VARCHAR(255) COMMENT '主键',
  charge_item_id VARCHAR(255) COMMENT '诊疗项目ID',
  inspection_time VARCHAR(255) COMMENT '检验时间（超时提醒）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='诊疗项目检验时间';

-- 表: lis_charge_item_reporttime (lis_charge_item_reporttime)
CREATE TABLE lis_charge_item_reporttime (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  charge_item_id VARCHAR(255) COMMENT '诊疗项目ID',
  from_time VARCHAR(255) COMMENT '开始时间',
  to_time VARCHAR(255) COMMENT '结束时间',
  week_date VARCHAR(255) COMMENT '星期几出报告',
  report_time VARCHAR(255) COMMENT '报告时间',
  from_date VARCHAR(255) COMMENT '开始日期',
  to_date VARCHAR(255) COMMENT '结束日期',
  id VARCHAR(255) COMMENT '主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='诊疗项目报告时间';

-- 表: lis_comm_instrument (lis_comm_instrument)
CREATE TABLE lis_comm_instrument (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  instrument_id VARCHAR(255) COMMENT '仪器代码',
  instrument_key_date VARCHAR(255) COMMENT '注册时间',
  instrument_type VARCHAR(255) COMMENT '仪器类型',
  interface_name VARCHAR(255) COMMENT '接口程序',
  interface_type VARCHAR(255) COMMENT '通讯方式',
  instrument_name VARCHAR(255) COMMENT '仪器名称',
  instrument_commport VARCHAR(255) COMMENT '使用端口号',
  instrument_key VARCHAR(255) COMMENT 'key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仪器通讯配置';

-- 表: lis_inspection_group (检验分组信息表)
CREATE TABLE lis_inspection_group (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  group_id VARCHAR(255) COMMENT '分组ID',
  group_code VARCHAR(255) COMMENT '分组代码',
  group_sort VARCHAR(255) COMMENT '排序号',
  group_name VARCHAR(255) COMMENT '分组名称',
  inspection_dept VARCHAR(255) COMMENT '检验科室',
  group_class VARCHAR(255) COMMENT '分组类型',
  lis_id VARCHAR(255) COMMENT '老系统代码',
  test_item_append VARCHAR(255) COMMENT '项目显示格式',
  start_no VARCHAR(255) COMMENT '起诉样本号',
  start_focus VARCHAR(255) COMMENT '开始焦点',
  result_review VARCHAR(255) COMMENT '回顾条件设置',
  same_group VARCHAR(255) COMMENT '同类分组',
  graph_format VARCHAR(255) COMMENT '结果图形类型',
  graph_switch_file VARCHAR(255) COMMENT '对应老系统仪器',
  state_flag VARCHAR(255) COMMENT '状态',
  default_result VARCHAR(255) COMMENT '默认结果'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检验分组信息表';

-- 表: lis_inspection_report (检验报告单信息表)
CREATE TABLE lis_inspection_report (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  report_id VARCHAR(255) COMMENT '报告序号（页码）',
  report_format VARCHAR(255) COMMENT '报告单模板',
  report_file VARCHAR(255) COMMENT '报告单文件',
  report_title VARCHAR(255) COMMENT '报告单抬头',
  create_time VARCHAR(255) COMMENT '创建时间',
  create_person VARCHAR(255) COMMENT '创建人员',
  inspection_class VARCHAR(255) COMMENT '检验类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检验报告单信息表';

-- 表: lis_inspection_result (常规检验结果表)
CREATE TABLE lis_inspection_result (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  test_item_id VARCHAR(255) COMMENT '项目代码',
  group_id VARCHAR(255) COMMENT '分组ID',
  inspection_date VARCHAR(255) COMMENT '检验日期',
  inspection_time VARCHAR(255) COMMENT '检验时间',
  sample_number VARCHAR(255) COMMENT '样本编号',
  test_item_sort VARCHAR(255) COMMENT '排序号',
  english_name VARCHAR(255) COMMENT '英文名称',
  chinese_name VARCHAR(255) COMMENT '中文名称',
  original_result VARCHAR(255) COMMENT '原始结果',
  quantitative_result VARCHAR(255) COMMENT '结果',
  qualitative_result VARCHAR(255) COMMENT '异常标识',
  test_item_reference VARCHAR(255) COMMENT '参考范围',
  test_item_unit VARCHAR(255) COMMENT '项目单位',
  test_item_charge VARCHAR(255) COMMENT '收费价格',
  workload VARCHAR(255) COMMENT '工作量',
  test_count VARCHAR(255) COMMENT '项目数',
  test_order VARCHAR(255) COMMENT '测试代码',
  inspection_instrument VARCHAR(255) COMMENT '检验仪器',
  inspection_person VARCHAR(255) COMMENT '检验人员',
  inspection_position VARCHAR(255) COMMENT '检验位置',
  report_id VARCHAR(255) COMMENT '报告序号',
  col_position VARCHAR(255) COMMENT '报告位置',
  print_id VARCHAR(255) COMMENT '打印页码',
  remark VARCHAR(255) COMMENT '备注',
  check_person VARCHAR(255) COMMENT '审核人员',
  check_time VARCHAR(255) COMMENT '审核时间',
  result_type VARCHAR(255) COMMENT '结果类型',
  test_method VARCHAR(255) COMMENT '检测方法',
  read_doctor VARCHAR(255) COMMENT '阅读医生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='常规检验结果表';

-- 表: lis_inspection_result_micro (微生物检验结果表)
CREATE TABLE lis_inspection_result_micro (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  group_id VARCHAR(255) COMMENT '分组ID',
  inspection_date VARCHAR(255) COMMENT '检验日期',
  inspection_time VARCHAR(255) COMMENT '检验时间',
  sample_number VARCHAR(255) COMMENT '样本编号',
  result_type VARCHAR(255) COMMENT '结果类型，ya阳性,tp涂片，py拼音',
  result_method VARCHAR(255) COMMENT '检测方法',
  micro_data_id VARCHAR(255) COMMENT '微生物代码',
  micro_data_id_sort VARCHAR(255) COMMENT '微生物类型排序',
  micro_data_id_name VARCHAR(255) COMMENT '微生物名称',
  micro_data_id_result1 VARCHAR(255) COMMENT '菌落技术',
  micra_data_id2 VARCHAR(255) COMMENT '抗生素代码',
  micra_data_id2_sort VARCHAR(255) COMMENT '抗生素类型排序',
  micro_data_id2_name VARCHAR(255) COMMENT '抗生素名称（药敏）',
  micro_data_id2_result1 VARCHAR(255) COMMENT '药敏定量结果',
  micro_data_id2_result2 VARCHAR(255) COMMENT '药敏定性结果',
  micro_data_id2_range VARCHAR(255) COMMENT '抗生素（药敏）参考值',
  inspection_instrument VARCHAR(255) COMMENT '药敏检测仪器',
  inspection_position VARCHAR(255) COMMENT '检验位置',
  inspection_person VARCHAR(255) COMMENT '检验人员',
  remark VARCHAR(255) COMMENT '备注',
  esbl VARCHAR(255) COMMENT 'esbl',
  read_doctor VARCHAR(255) COMMENT '临床阅读医生',
  report_id VARCHAR(255) COMMENT '打印序号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微生物检验结果表';

-- 表: lis_inspection_sample (样本信息表（主表）)
CREATE TABLE lis_inspection_sample (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  group_id VARCHAR(255) COMMENT '分组ID',
  inspection_date VARCHAR(255) COMMENT '检验日期（样本编号时自动生成）',
  inspection_time VARCHAR(255) COMMENT '检验时间（样本编号时自动生成）',
  sample_number VARCHAR(255) COMMENT '样本编号',
  requisition_id VARCHAR(255) COMMENT '申请单ID',
  patient_type VARCHAR(255) COMMENT '病人类别（1住院、2门诊、3住院急诊、4门诊急诊、5体检、10质控）',
  outpatient_id VARCHAR(255) COMMENT '病人ID',
  inpatient_id VARCHAR(255) COMMENT '就诊唯一号',
  invoice_id VARCHAR(255) COMMENT '发票号码',
  charge_type VARCHAR(255) COMMENT '收费类型',
  patient_name VARCHAR(255) COMMENT '病人姓名',
  patient_sex VARCHAR(255) COMMENT '病人性别（1男，2女，3不详）',
  age_type VARCHAR(255) COMMENT '年龄类型',
  age_input VARCHAR(255) COMMENT '输入年龄',
  age_save VARCHAR(255) COMMENT '保存年龄（换算分钟）',
  patient_nation VARCHAR(255) COMMENT '民族代码',
  patient_nation_name VARCHAR(255) COMMENT '民族名称',
  bloodtype_abo VARCHAR(255) COMMENT 'ABO血型',
  bloodtype_rh VARCHAR(255) COMMENT 'RH血型',
  patient_dept VARCHAR(255) COMMENT '申请科室代码',
  patient_dept_name VARCHAR(255) COMMENT '申请科室名称',
  patient_ward VARCHAR(255) COMMENT '申请病区代码',
  patient_ward_name VARCHAR(255) COMMENT '申请病区名称',
  patient_bed VARCHAR(255) COMMENT '病人床号',
  especial_condition VARCHAR(255) COMMENT '特殊说明',
  clinical_diagnoses VARCHAR(255) COMMENT '临床诊断代码',
  clinical_diagnoses_name VARCHAR(255) COMMENT '临床诊断名称',
  sample_class VARCHAR(255) COMMENT '标本种类代码',
  sample_class_name VARCHAR(255) COMMENT '标本种类名称',
  infect_status VARCHAR(255) COMMENT '传染标记',
  sample_status VARCHAR(255) COMMENT '标本形状代码',
  sample_status_name VARCHAR(255) COMMENT '标本形状名称',
  sampling_position VARCHAR(255) COMMENT '取样位置',
  sampling_position_name VARCHAR(255) COMMENT '取样位置',
  test_order VARCHAR(255) COMMENT '检验目的代码',
  test_order_name VARCHAR(255) COMMENT '检验目的名称',
  sample_charge VARCHAR(255) COMMENT '样本金额',
  item_count VARCHAR(255) COMMENT '样本数量',
  workload VARCHAR(255) COMMENT '工作量',
  sampling_time VARCHAR(255) COMMENT '采样时间',
  sampling_person VARCHAR(255) COMMENT '采样人员',
  requisition_time VARCHAR(255) COMMENT '开单时间',
  requisition_person VARCHAR(255) COMMENT '开单人员',
  deliver_hospital VARCHAR(255) COMMENT '送检单位',
  incept_time VARCHAR(255) COMMENT '接收时间',
  incept_person VARCHAR(255) COMMENT '接收人员',
  input_person VARCHAR(255) COMMENT '录入人员',
  input_time VARCHAR(255) COMMENT '录入时间',
  inspection_person VARCHAR(255) COMMENT '检验人员',
  check_person VARCHAR(255) COMMENT '审核人员',
  check_time VARCHAR(255) COMMENT '审核时间',
  print_person VARCHAR(255) COMMENT '打印人员',
  print_time VARCHAR(255) COMMENT '打印时间',
  print_count VARCHAR(255) COMMENT '打印次数',
  expert_rule VARCHAR(255) COMMENT '专家规则',
  id_card VARCHAR(255) COMMENT '身份证号',
  charge_state VARCHAR(255) COMMENT '收费状态',
  inspection_state VARCHAR(255) COMMENT '检验状态',
  rerun_state VARCHAR(255) COMMENT '复查状态',
  read_state VARCHAR(255) COMMENT '临床阅读状态',
  remark VARCHAR(255) COMMENT '备注代码',
  remark_name VARCHAR(255) COMMENT '备注名称',
  confirm_time VARCHAR(255) COMMENT '批准时间',
  confirm_person VARCHAR(255) COMMENT '批准人员',
  instrument VARCHAR(255) COMMENT '仪器',
  mobileno VARCHAR(255) COMMENT '手机号码',
  send_state VARCHAR(255) COMMENT '发送状态',
  send_date VARCHAR(255) COMMENT '发送时间',
  patient_birthday VARCHAR(255) COMMENT '出生日期',
  blood_mode VARCHAR(255) COMMENT '血缘关系',
  read_doctor VARCHAR(255) COMMENT '阅读医生',
  read_time VARCHAR(255) COMMENT '阅读时间',
  check_temp_time VARCHAR(255) COMMENT '初步报告时间',
  InspectionTime VARCHAR(255) COMMENT '检验审核时间',
  result_incept_state VARCHAR(255) COMMENT '结果接收状态',
  blood_output_print_time VARCHAR(255) COMMENT '血液出库打印时间',
  receive_person VARCHAR(255) COMMENT '接收人员',
  police_state VARCHAR(255) COMMENT '危急值提醒状态',
  readed_state VARCHAR(255) COMMENT 'lis42报告单是否已经看过',
  police_time VARCHAR(255) COMMENT '下次提醒时间',
  police_person VARCHAR(255) COMMENT '未指定检验人员时，检验提示信息不再提示人员序号，用“,”分隔'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='样本信息表（主表）';

-- 表: lis_inspection_sample_charge (标本收费记录表)
CREATE TABLE lis_inspection_sample_charge (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  sample_charge_id VARCHAR(255) COMMENT '收费ID',
  requisition_id VARCHAR(255) COMMENT '申请单ID',
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  charge_item_id VARCHAR(255) COMMENT '收费项目ID',
  chinese_name_short VARCHAR(255) COMMENT '项目简称',
  amount VARCHAR(255) COMMENT '项目数',
  charge VARCHAR(255) COMMENT '收费金额',
  workload VARCHAR(255) COMMENT '工作量',
  charge_person VARCHAR(255) COMMENT '收费人员',
  charge_time VARCHAR(255) COMMENT '收费时间',
  charge_postion VARCHAR(255) COMMENT '计算机名称',
  charge_state VARCHAR(255) COMMENT '收费状态',
  charge_type VARCHAR(255) COMMENT '收费类型',
  his_id VARCHAR(255) COMMENT 'HIS代码',
  charge_num VARCHAR(255) COMMENT '备用字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标本收费记录表';

-- 表: lis_inspection_sample_explain (备注信息表)
CREATE TABLE lis_inspection_sample_explain (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  explain_id VARCHAR(255) COMMENT '解释ID，跟lis_base_data关联',
  explain VARCHAR(255) COMMENT '结果解释'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='备注信息表';

-- 表: lis_inspection_sample_graph (样本图形信息表)
CREATE TABLE lis_inspection_sample_graph (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  inspection_id VARCHAR(255) COMMENT '检验单ID',
  inspection_date VARCHAR(255) COMMENT '检验日期',
  inspection_instrument VARCHAR(255) COMMENT '检验仪器',
  graph_format VARCHAR(255) COMMENT '图片格式',
  remark VARCHAR(255) COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='样本图形信息表';

-- 表: lis_test_item (检验项目明细字典表)
CREATE TABLE lis_test_item (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  test_item_id VARCHAR(255) COMMENT '项目ID',
  test_item_code VARCHAR(255) COMMENT '项目代码',
  test_item_sort VARCHAR(255) COMMENT '排序号',
  chinese_name VARCHAR(255) COMMENT '中文名称',
  chinese_short_name VARCHAR(255) COMMENT '中文简称',
  english_name VARCHAR(255) COMMENT '英文名称',
  english_short_name VARCHAR(255) COMMENT '英文简称',
  standard_id VARCHAR(255) COMMENT '标准代码',
  his_id VARCHAR(255) COMMENT 'HIS代码（HIS关联码）',
  lis_id VARCHAR(255) COMMENT '老系统代码',
  medical_id VARCHAR(255) COMMENT '医保代码',
  test_item_type VARCHAR(255) COMMENT '项目类型:计算类、非计算类',
  test_item_class VARCHAR(255) COMMENT '项目分类（按检验科室分类）',
  expressions VARCHAR(255) COMMENT '计算公式',
  test_item_charge VARCHAR(255) COMMENT '收费金额',
  test_item_unit VARCHAR(255) COMMENT '单位',
  test_item_precision VARCHAR(255) COMMENT '结果精度（小数点保留）',
  modulus VARCHAR(255) COMMENT '项目系数',
  correlative_equation VARCHAR(255) COMMENT '相关方程',
  display_type VARCHAR(255) COMMENT '显示类型',
  regulation_file VARCHAR(255) COMMENT '操作规程文件',
  repository_file VARCHAR(255) COMMENT '知识库文件',
  test_method VARCHAR(255) COMMENT '检验方法',
  reagent_dosage VARCHAR(255) COMMENT '试剂用量',
  custom_code VARCHAR(255) COMMENT '自定义码',
  spell_code VARCHAR(255) COMMENT '拼音码',
  stroke_code VARCHAR(255) COMMENT '五笔码',
  state_flag VARCHAR(255) COMMENT '状态',
  standard_name VARCHAR(255) COMMENT '标准名称',
  pes_id VARCHAR(255) COMMENT '体检关联码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检验项目明细字典表';

-- 表: lis_test_item_combination (lis_test_item_combination)
CREATE TABLE lis_test_item_combination (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  serial_no VARCHAR(255) COMMENT '排序',
  combination_id VARCHAR(255) COMMENT '组合ID',
  combination_sort VARCHAR(255) COMMENT '排序号',
  sample_class VARCHAR(255) COMMENT '标本类型代码',
  test_item_id VARCHAR(255) COMMENT '项目ID',
  base_data_sort VARCHAR(255) COMMENT '项目排序',
  default_result VARCHAR(255) COMMENT '默认结果',
  combination_name VARCHAR(255) COMMENT '组合名称',
  standart_id VARCHAR(255) COMMENT '标准ID',
  custom_code VARCHAR(255) COMMENT '自定义码',
  spell_code VARCHAR(255) COMMENT '拼音码',
  stroke_code VARCHAR(255) COMMENT '五笔码',
  state_flag VARCHAR(255) COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检验项目组合';

-- 表: lis_test_item_group (各仪器开展检验项目明细表)
CREATE TABLE lis_test_item_group (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  group_id VARCHAR(255) COMMENT '分组ID',
  test_item_id VARCHAR(255) COMMENT '项目ID',
  test_item_sort VARCHAR(255) COMMENT '排序',
  test_item_type VARCHAR(255) COMMENT '项目类型',
  expressions VARCHAR(255) COMMENT '计算公式',
  modulus VARCHAR(255) COMMENT '项目系数',
  custom_code VARCHAR(255) COMMENT '自定义码',
  spell_code VARCHAR(255) COMMENT '拼音码',
  stroke_code VARCHAR(255) COMMENT '五笔码',
  flag VARCHAR(255) COMMENT '状态',
  sample_class VARCHAR(255) COMMENT '标本类型代码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='各仪器开展检验项目明细表';

-- 表: sys_user (用户信息表)
CREATE TABLE sys_user (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_no VARCHAR(255) COMMENT '用户id',
  logid VARCHAR(255) COMMENT '登录名',
  username VARCHAR(255) COMMENT '用户名称',
  password VARCHAR(255) COMMENT '密码',
  his_id VARCHAR(255) COMMENT 'HIS代码',
  ime VARCHAR(255) COMMENT '默认输入法',
  dept_code VARCHAR(255) COMMENT '所属科室',
  tech_post VARCHAR(255) COMMENT '职务',
  select_group VARCHAR(255) COMMENT '可操作分组',
  state_flag VARCHAR(255) COMMENT '状态',
  material_dept VARCHAR(255) COMMENT '物质部门',
  mobileno VARCHAR(255) COMMENT '手机号码',
  ime_chinese_name VARCHAR(255) COMMENT '输入法类型',
  tmis_id VARCHAR(255) COMMENT '血站中心ID',
  id_card VARCHAR(255) COMMENT '身份证号码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';
