/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2017/3/7 17:28:05                            */
/*==============================================================*/


drop table if exists fenrun_party_config;

drop table if exists fenrun_profit_detail;

drop table if exists fenrun_profit_summary;

drop table if exists wallet_confirm_profit;

drop table if exists wallet_platform_profit;

/*==============================================================*/
/* Table: fenrun_party_config                                   */
/*==============================================================*/
create table fenrun_party_config 
(
   id                   bigint(18)                     not null,
   fenrun_party_name    varchar(50)                    not null,
   type                 tinyint                        not null,
   fenrun_ratio         bigint(22)                     not null,
   status               tinying                        not null,
   operator             varchar(50)                    null,
   gmt_create           datetime                       not null,
   gmt_modify           datetime                       null,
   constraint PK_FENRUN_PARTY_CONFIG primary key clustered (id)
);

comment on table fenrun_party_config is 
'分润方配置项';

comment on column fenrun_party_config.id is 
'分润方ID';

comment on column fenrun_party_config.fenrun_party_name is 
'分润方名称';

comment on column fenrun_party_config.type is 
'类型(1.牛钱包，2.牛钱罐)';

comment on column fenrun_party_config.fenrun_ratio is 
'分润比例';

comment on column fenrun_party_config.status is 
'状态(1.启用，2.禁用)';

comment on column fenrun_party_config.operator is 
'操作人';

comment on column fenrun_party_config.gmt_create is 
'创建时间';

comment on column fenrun_party_config.gmt_modify is 
'修改时间';

comment on primary key on fenrun_party_config is 
'Key_1';

/*==============================================================*/
/* Table: fenrun_profit_detail                                  */
/*==============================================================*/
create table fenrun_profit_detail 
(
   id                   bigint(18)                     not null,
   record_day           date                           not null,
   org_id               bigint(18)                     not null,
   org_name             varchar(50)                    null,
   fenrun_party         varchar(50)                    not null,
   fenrun_ratio         bigint(18)                     not null,
   fenrun_profit        bigint(22)                     not null,
   type                 tinyint                        not null,
   confirmed_profit_sum bigint(22)                     not null,
   stream_no            varchar(50)                    null,
   status               int(2)                         not null,
   operator             varchar(50)                    null,
   gmt_create           datetime                       not null,
   gmt_modify           datetime                       null,
   constraint PK_FENRUN_PROFIT_DETAIL primary key clustered (id)
);

comment on table fenrun_profit_detail is 
'分润收益明细';

comment on column fenrun_profit_detail.id is 
'主键id';

comment on column fenrun_profit_detail.record_day is 
'统计日期(T日跑job则记录为T日)';

comment on column fenrun_profit_detail.org_id is 
'机构id';

comment on column fenrun_profit_detail.org_name is 
'机构名称';

comment on column fenrun_profit_detail.fenrun_party is 
'分润方';

comment on column fenrun_profit_detail.fenrun_ratio is 
'分润比例';

comment on column fenrun_profit_detail.fenrun_profit is 
'分润收益';

comment on column fenrun_profit_detail.type is 
'类型(1.牛钱包，2.牛钱罐)';

comment on column fenrun_profit_detail.confirmed_profit_sum is 
'总确认收益';

comment on column fenrun_profit_detail.stream_no is 
'流水号';

comment on column fenrun_profit_detail.status is 
'状态(1.未领取，2.已领取)';

comment on column fenrun_profit_detail.operator is 
'操作人';

comment on column fenrun_profit_detail.gmt_create is 
'创建时间';

comment on column fenrun_profit_detail.gmt_modify is 
'修改时间';

comment on primary key on fenrun_profit_detail is 
'Key_1';

/*==============================================================*/
/* Table: fenrun_profit_summary                                 */
/*==============================================================*/
create table fenrun_profit_summary 
(
   id                   bigint(18)                     not null,
   record_day           date                           not null,
   type                 tinyint                        not null,
   org_id               bigint(22)                     not null,
   org_name             varchar(50)                    null,
   confirmed_profit     bigint(22)                     not null,
   confirmed_profit_sum bigint(22)                     not null,
   unconfirmed_profit   bigint(22)                     not null,
   un_confirmed_profit_sum bigint(22)                     not null,
   gmt_create           datetime                       not null,
   gmt_modify           datetime                       null,
   constraint PK_FENRUN_PROFIT_SUMMARY primary key clustered (id)
);

comment on table fenrun_profit_summary is 
'分润收益汇总';

comment on column fenrun_profit_summary.id is 
'主键id';

comment on column fenrun_profit_summary.record_day is 
'统计日期(T日跑job则记录为T日)';

comment on column fenrun_profit_summary.type is 
'类型(1.牛钱包，2.牛钱罐)';

comment on column fenrun_profit_summary.org_id is 
'机构ID';

comment on column fenrun_profit_summary.org_name is 
'机构名称';

comment on column fenrun_profit_summary.confirmed_profit is 
'T日确认收益';

comment on column fenrun_profit_summary.confirmed_profit_sum is 
'累计已确认收益';

comment on column fenrun_profit_summary.unconfirmed_profit is 
'T日未确认收益';

comment on column fenrun_profit_summary.un_confirmed_profit_sum is 
'累计未确认收益';

comment on column fenrun_profit_summary.gmt_create is 
'创建时间';

comment on column fenrun_profit_summary.gmt_modify is 
'修改时间';

comment on primary key on fenrun_profit_summary is 
'Key_1';

/*==============================================================*/
/* Table: wallet_confirm_profit                                 */
/*==============================================================*/
create table wallet_confirm_profit 
(
   id                   bigint(18)                     not null,
   record_day           date                           not null,
   prod_id              bigint(18)                     not null,
   prod_name            varchar(50)                    null,
   org_id               bigint(18)                     not null,
   org_name             varchar(50)                    null,
   type                 int(2)                         not null,
   confirmed_profit     bigint(22)                     not null,
   member_gold          bigint(22)                     not null,
   member_redeem_gold   bigint(22)                     not null,
   service_fee_rate     tinyint                        null,
   status               int(2)                         not null,
   platform_profit      bigint(22)                     not null,
   operator             varchar(50)                    null,
   gmt_create           datetime                       not null,
   gmt_modify           datetime                       not null,
   constraint PK_WALLET_CONFIRM_PROFIT primary key clustered (id)
);

comment on table wallet_confirm_profit is 
'牛钱包确认收益';

comment on column wallet_confirm_profit.id is 
'主键id';

comment on column wallet_confirm_profit.record_day is 
'统计日期(T日跑job则记录为T日)';

comment on column wallet_confirm_profit.prod_id is 
'产品id';

comment on column wallet_confirm_profit.prod_name is 
'产品名称';

comment on column wallet_confirm_profit.org_id is 
'机构id';

comment on column wallet_confirm_profit.org_name is 
'机构名称';

comment on column wallet_confirm_profit.type is 
'统计类型(统计类型：1.日,2.月,3.年)';

comment on column wallet_confirm_profit.confirmed_profit is 
'确认收益';

comment on column wallet_confirm_profit.member_gold is 
'用户本金';

comment on column wallet_confirm_profit.member_redeem_gold is 
'用户赎回金额';

comment on column wallet_confirm_profit.service_fee_rate is 
'服务费率';

comment on column wallet_confirm_profit.status is 
'状态(1.未领取，2.已领取)';

comment on column wallet_confirm_profit.platform_profit is 
'平台收益';

comment on column wallet_confirm_profit.operator is 
'操作人';

comment on column wallet_confirm_profit.gmt_create is 
'创建时间';

comment on column wallet_confirm_profit.gmt_modify is 
'修改时间';

comment on primary key on wallet_confirm_profit is 
'Key_1';

/*==============================================================*/
/* Table: wallet_platform_profit                                */
/*==============================================================*/
create table wallet_platform_profit 
(
   id                   bigint(18)                     not null,
   record_day           date                           not null,
   prod_id              bigint(18)                     not null,
   prod_name            varchar(50)                    null,
   org_id               bigint(22)                     not null,
   org_name             varchar(50)                    not null,
   platform_profit      bigint(22)                     not null,
   member_gold          bigint(22)                     not null,
   member_gold_profit   bigint(22)                     not null,
   un_confirmed_profit_sum bigint(22)                     not null,
   service_fee_rate     tinyint                        null,
   interest_rate        bigint(22)                     not null,
   unconfirmed_profit   bigint(22)                     not null,
   confirmed_profit     bigint(22)                     not null,
   gmt_create           datetime                       not null,
   gmt_modify           datetime                       not null,
   constraint PK_WALLET_PLATFORM_PROFIT primary key clustered (id)
);

comment on table wallet_platform_profit is 
'牛钱包平台收益';

comment on column wallet_platform_profit.id is 
'主键id';

comment on column wallet_platform_profit.record_day is 
'统计日期(T日跑job则记录为T-1日)';

comment on column wallet_platform_profit.prod_id is 
'产品id';

comment on column wallet_platform_profit.prod_name is 
'产品名称';

comment on column wallet_platform_profit.org_id is 
'机构ID';

comment on column wallet_platform_profit.org_name is 
'机构名称';

comment on column wallet_platform_profit.platform_profit is 
'平台收益';

comment on column wallet_platform_profit.member_gold is 
'用户本金';

comment on column wallet_platform_profit.member_gold_profit is 
'用户本金的利息';

comment on column wallet_platform_profit.un_confirmed_profit_sum is 
'累计未确认收益';

comment on column wallet_platform_profit.service_fee_rate is 
'服务费率';

comment on column wallet_platform_profit.interest_rate is 
'利率';

comment on column wallet_platform_profit.unconfirmed_profit is 
'未确认收益';

comment on column wallet_platform_profit.confirmed_profit is 
'确认收益';

comment on column wallet_platform_profit.gmt_create is 
'创建时间';

comment on column wallet_platform_profit.gmt_modify is 
'修改时间';

comment on primary key on wallet_platform_profit is 
'Key_1';

