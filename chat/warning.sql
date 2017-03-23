/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2017/3/23 13:44:24                           */
/*==============================================================*/

drop table if exists sys_warning;

/*==============================================================*/
/* Table: sys_warning                                           */
/*==============================================================*/
create table sys_warning 
(
   id                   bigint(18)                     not null comment '主键id',
   warning_date         date                           not null comment '预警日期',
   action               varchar(64)                    not null comment '动作(比如:标的还款..)',
   method_name          varchar(64)                    not null comment '方法名称',
   return_type          varchar(64)                    null comment '返回类型',
   retturn_value        text                           null comment '返回值',
   args                 varchar(1024)                  null comment '参数',
   annotations          varchar(512)                   null comment '注解',
   advice               varchar(512)                   null comment '通知对象(比如:张三,李四,王五..)',
   contact_way          varchar(512)                   null comment '联系方式(电话,邮箱都可以)',
   status               int(2)                         not null comment '状态(0:未通知,1.通知中,2.通知失败,3.已通知)',
   operator             varchar(50)                    null comment '操作人',
   gmt_create           datetime                       not null comment '创建时间',
   gmt_modify           datetime                       not null comment '修改时间',
   PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=100000000000570944 DEFAULT CHARSET=utf8 COMMENT='预警';
