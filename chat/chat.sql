CREATE TABLE `wallet_confirm_profit` (
  `id` bigint(18) NOT NULL COMMENT '主键ID',
  `record_day` date NOT NULL COMMENT '统计日期(T日跑job则记录为T-1日)',
  `prod_id` bigint(18) NOT NULL COMMENT '产品id',
  `prod_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `org_id` bigint(18) NOT NULL COMMENT '机构id',
  `org_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `type` int(2) NOT NULL COMMENT '统计类型(统计类型：1.日,2.月,3.年)',
  `yesterday_confirmed_profit` bigint(22) NOT NULL COMMENT '昨日确认收益',
  `yesterday_member_gold` bigint(22) NOT NULL COMMENT '昨日用户本金',
  `yesterday_member_redeem_gold` bigint(22) NOT NULL COMMENT '用户昨日赎回金额',
  `fee_rate` int(6) DEFAULT NULL COMMENT '服务费率',
  `status` int(2) NOT NULL COMMENT '状态(1.未领取，2.已领取)',
  `yesterday_platform_profit` bigint(22) NOT NULL COMMENT '昨日平台收益',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='牛钱包确认收益';


CREATE TABLE `wallet_platform_profit` (
  `id` bigint(18) NOT NULL COMMENT '主键id',
  `record_day` date NOT NULL COMMENT '统计日期(T日跑job则记录为T-1日)',
  `prod_id` bigint(18) NOT NULL COMMENT '产品id',
  `prod_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `org_id` bigint(22) NOT NULL COMMENT '机构id',
  `org_name` varchar(50) NOT NULL COMMENT '机构名称',
  `yesterday_platform_profit` bigint(22) NOT NULL COMMENT '昨日平台收益',
  `yesterday_member_gold` bigint(22) NOT NULL COMMENT '昨日用户本金',
  `yesterday_member_gold_profit` bigint(22) NOT NULL COMMENT '昨日用户本金的利息',
  `un_confirmed_sum` bigint(22) NOT NULL COMMENT '累计未确认收益',
  `fee_rate` int(6) NOT NULL COMMENT '服务费率',
  `interest_rate` bigint(22) NOT NULL COMMENT '利率',
  `yesterday_unconfirmed_profit` bigint(22) NOT NULL COMMENT '昨日未确认收益',
  `yesterday_confirmed_profit` bigint(22) NOT NULL COMMENT '昨日确认收益',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='牛钱包平台收益';

