CREATE TABLE `sys_bills` (
  `id` int(11) NOT NULL COMMENT '主键id',
  `subject` varchar(50) NOT NULL COMMENT '主题',
  `content` varchar(255) NOT NULL COMMENT '说明',
  `debtor` varchar(16) NOT NULL COMMENT '借款人',
  `debtor_id` int(11) NOT NULL COMMENT '借款id',
  `money` bigint(20) NOT NULL COMMENT '借款金额',
  `lender` int(11) NOT NULL COMMENT '出借人',
  `keyword` int(2) NOT NULL COMMENT '关键字(0.借,1.寄,2.欠,3.其它)',
  `lender_id` int(11) NOT NULL COMMENT '出借人id',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `trade_type` int(11) DEFAULT NULL COMMENT '交易类型',
  `ctime` datetime NOT NULL COMMENT '创建时间',
  `creater` varchar(16) NOT NULL COMMENT '创建人',
  `creater_id` int(11) NOT NULL COMMENT '创建人id',
  `etime` datetime DEFAULT NULL COMMENT '修改时间',
  `editor` varchar(16) DEFAULT NULL COMMENT '修改人',
  `editor_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `comments` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` int(11) NOT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易账单表';

