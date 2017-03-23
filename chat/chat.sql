/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2017/3/23 13:42:47                           */
/*==============================================================*/


drop table if exists sys_warning;

drop table if exists wallet_revenue;

/*==============================================================*/
/* Table: sys_warning                                           */
/*==============================================================*/
create table sys_warning 
(
   id                   bigint(18)                     not null,
   warning_date         date                           not null,
   action               varchar(64)                    not null,
   method_name          varchar(64)                    not null,
   return_type          varchar(64)                    null,
   retturn_value        text                           null,
   args                 varchar(1024)                  null,
   annotations          varchar(512)                   null,
   advice               varcahr(512)                   null,
   contact_way          varchar(512)                   null,
   status               int(2)                         not null,
   operator             varchar(50)                    null,
   gmt_create           datetime                       not null,
   gmt_modify           datetime                       not null,
   constraint PK_SYS_WARNING primary key clustered (id)
);

/*==============================================================*/
/* Table: wallet_revenue                                        */
/*==============================================================*/
create table wallet_revenue 
(
   id                   bigint                         not null,
   member_id            bigint                         not null,
   prod_id              bigint                         not null,
   wallet_amount        bigint                         not null,
   profit_date          date                           not null,
   base_profit          bigint                         not null,
   coupon_profit        bigint                         null,
   annual_rate          int                            null,
   coupon_rate          int                            null,
   note                 varchar(256)                   null,
   gmt_create           datetime                       null,
   gmt_modify           datetime                       null,
   constraint PK_WALLET_REVENUE primary key clustered (id)
);

