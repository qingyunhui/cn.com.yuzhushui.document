CREATE TABLE `sys_bills` (
  `id` int(11) NOT NULL COMMENT '����id',
  `subject` varchar(50) NOT NULL COMMENT '����',
  `content` varchar(255) NOT NULL COMMENT '˵��',
  `debtor` varchar(16) NOT NULL COMMENT '�����',
  `debtor_id` int(11) NOT NULL COMMENT '���id',
  `money` bigint(20) NOT NULL COMMENT '�����',
  `lender` int(11) NOT NULL COMMENT '������',
  `keyword` int(2) NOT NULL COMMENT '�ؼ���(0.��,1.��,2.Ƿ,3.����)',
  `lender_id` int(11) NOT NULL COMMENT '������id',
  `status` int(11) DEFAULT NULL COMMENT '״̬',
  `trade_type` int(11) DEFAULT NULL COMMENT '��������',
  `ctime` datetime NOT NULL COMMENT '����ʱ��',
  `creater` varchar(16) NOT NULL COMMENT '������',
  `creater_id` int(11) NOT NULL COMMENT '������id',
  `etime` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  `editor` varchar(16) DEFAULT NULL COMMENT '�޸���',
  `editor_id` int(11) DEFAULT NULL COMMENT '�޸���id',
  `comments` varchar(128) DEFAULT NULL COMMENT '��ע',
  `deleted` int(11) NOT NULL COMMENT 'ɾ����ʶ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����˵���';

