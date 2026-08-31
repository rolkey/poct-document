-- 仪器通道配置表
CREATE TABLE lis_instrument_channel (
  channel_id BIGINT NOT NULL,
  instrument_id BIGINT NOT NULL,
  channel_no VARCHAR(20),
  channel_name VARCHAR(50),
  channel_type VARCHAR(20),
  state_flag VARCHAR(2) DEFAULT '1',
  remark VARCHAR(500),
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20),
  PRIMARY KEY (channel_id)
);
COMMENT ON TABLE lis_instrument_channel IS '仪器通道配置表';

-- 仪器通道检验项目关联表
CREATE TABLE lis_instrument_channel_item (
  item_id BIGINT NOT NULL,
  channel_id BIGINT NOT NULL,
  test_item_id BIGINT NOT NULL,
  sample_class VARCHAR(20),
  test_item_sort VARCHAR(20),
  state_flag VARCHAR(2) DEFAULT '1',
  create_dept BIGINT,
  create_by BIGINT,
  create_time TIMESTAMP,
  update_by BIGINT,
  update_time TIMESTAMP,
  tenant_id VARCHAR(20),
  PRIMARY KEY (item_id)
);
COMMENT ON TABLE lis_instrument_channel_item IS '仪器通道检验项目关联表';
