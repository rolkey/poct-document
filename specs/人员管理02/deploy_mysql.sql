-- ============================================================
-- 考题分类功能 — 字典数据 (MySQL ry-cloud 库)
-- 日期: 2026-05-12
--
-- 连接: jdbc:mysql://192.168.168.128:3306/ry-cloud
-- 用户: ruoyi / Ruoyi@111
--
-- 执行: mysql -h 192.168.168.128 -u ruoyi -p ry-cloud < deploy_mysql.sql
-- ============================================================

-- 字典类型
INSERT IGNORE INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time, remark)
VALUES ('设备类型', 'his_person_device_type', '0', 1, NOW(), '考题关联的设备分类');

-- 字典数据：POCT 常见设备类型
INSERT IGNORE INTO sys_dict_data (dict_type, dict_label, dict_value, css_class, list_class, is_default, status, create_by, create_time)
VALUES
  ('his_person_device_type', '血气分析仪',           'blood_gas',             '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '血糖仪',               'glucose_meter',         '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '凝血分析仪',           'coagulation',           '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '心肌标志物分析仪',     'cardiac_marker',        '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '糖化血红蛋白分析仪',   'hba1c',                 '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '尿干化学分析仪',       'urine_chemistry',       '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '传染病检测仪',         'infectious_disease',    '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '电解质分析仪',         'electrolyte',           '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '免疫层析分析仪',       'immuno_chromatography', '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '快速生化分析仪',       'rapid_chemistry',       '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '血常规分析仪',         'blood_cell_counter',    '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '尿沉渣分析仪',         'urine_sediment',        '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '便携超声',             'portable_ultrasound',   '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '核酸检测仪',           'nucleic_acid_test',     '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', 'C反应蛋白分析仪',      'crp',                   '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '降钙素原分析仪',       'pct',                   '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '血气电解质一体机',     'blood_gas_electrolyte', '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '床旁监护仪',           'bedside_monitor',       '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '快速病毒检测仪',       'rapid_virus',           '', 'default', 'N', '0', 1, NOW()),
  ('his_person_device_type', '通用',                 'general',               '', 'default', 'Y', '0', 1, NOW());
