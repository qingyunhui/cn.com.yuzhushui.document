/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/11/20 15:07:43                          */
/*==============================================================*/


drop table if exists sys_account;

drop table if exists sys_account_role_rel;

drop table if exists sys_attachment;

drop table if exists sys_data;

drop table if exists sys_dict;

drop table if exists sys_menu;

drop table if exists sys_message;

drop table if exists sys_opration_log;

drop table if exists sys_resource;

drop table if exists sys_role;

drop table if exists sys_role_resource_rel;

drop table if exists sys_user;

/*==============================================================*/
/* Table: sys_account                                           */
/*==============================================================*/
create table sys_account
(
   account_id           int not null comment 'account_id',
   account              varchar(16) not null comment '账号',
   password             varchar(128) not null comment '密码(加密后)',
   status               int not null comment '状态(0.未审核、1.审核不通过、2.审核通过、3.停用)',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '删除标识',
   primary key (account_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_account comment '账号表';

/*==============================================================*/
/* Table: sys_account_role_rel                                  */
/*==============================================================*/
create table sys_account_role_rel
(
   id                   int not null comment 'id',
   account_id           int not null comment 'account_id',
   role_id              int not null comment 'role_id',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '删除标识',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_account_role_rel comment '账号角色关联表';

/*==============================================================*/
/* Table: sys_attachment                                        */
/*==============================================================*/
create table sys_attachment
(
   id                   int not null comment 'id',
   target_table         varchar(32) comment '目标表',
   target_field         varchar(32) comment '目标字段',
   target_id            varchar(32) not null comment '目标记录ID',
   attachment_type      varchar(32) not null comment '附件类型(附件类型:(text/html,image/jpeg等)',
   classify             int not null comment '分类(相册、音乐、头像、视频)',
   url                  varchar(64) not null comment '访问的相对或绝对路径url',
   comments             varchar(1024) not null comment '描述',
   physical_path        varchar(64) not null comment '文件在磁盘上所在的绝对路径',
   origin_name          varchar(128) not null comment '文件名称',
   suffix               varchar(64) not null comment '后缀',
   size                 bigint not null comment '文件大小',
   data                 blob not null comment '数据(转换二进制文件)',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   deleted              int not null comment '删除标识',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_attachment comment '附件';

/*==============================================================*/
/* Table: sys_data                                              */
/*==============================================================*/
create table sys_data
(
   data_id              int not null,
   target_table         varchar(32) not null,
   target_id            int not null,
   ctime                datetime not null,
   creater              varchar(16) not null,
   creater_id           int not null,
   lose_efficacy_date   datetime not null,
   comment              varchar(512),
   primary key (data_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_data comment '数据包(主要用来记录删除的表，定时删除)';

/*==============================================================*/
/* Table: sys_dict                                              */
/*==============================================================*/
create table sys_dict
(
   id                   int not null comment 'id',
   pid                  int comment 'pid',
   item_key             varchar(32) not null comment '键',
   item_value           varchar(64) not null comment '值',
   name                 varchar(32) not null comment '名称',
   order_value          int not null comment '排序',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '删除标识',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_dict comment '字典表';

/*==============================================================*/
/* Table: sys_menu                                              */
/*==============================================================*/
create table sys_menu
(
   menu_id              int not null comment 'menu_id',
   menu_pid             int not null comment 'menu_pid',
   menu_name            varchar(32) not null comment '菜单名称',
   sys_resource_id      int not null comment '资源ID',
   url                  varchar(64) not null comment '连接地址',
   style                varchar(64) comment '样式',
   level                int not null comment '级别',
   is_leaf              int not null comment '是否叶子',
   order_value          int not null comment '排序',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '是否删除',
   primary key (menu_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_menu comment '菜单表';

/*==============================================================*/
/* Table: sys_message                                           */
/*==============================================================*/
create table sys_message
(
   id                   int not null comment 'id',
   title                varchar(128) not null comment '标题',
   content              varchar(1024) not null comment '内容',
   type                 int not null comment '消息类型(0.系统消息、1.用户消息.)',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '删除标识',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_message comment '系统消息';

/*==============================================================*/
/* Table: sys_opration_log                                      */
/*==============================================================*/
create table sys_opration_log
(
   id                   int comment 'id',
   type                 int comment '操作类型',
   content              varchar(1024) comment '操作内容',
   ip                   varchar(16) comment '操作人IP地址',
   ctime                datetime comment '创建时间',
   creater              varchar(16) comment '操作人',
   creater_id           int comment '操作人ID',
   etime                datetime comment '修改时间',
   editor               varchar(16) comment '修改人',
   editor_id            int comment '修改人ID',
   deleted              int comment '删除标识'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_opration_log comment '操作日记';

/*==============================================================*/
/* Table: sys_resource                                          */
/*==============================================================*/
create table sys_resource
(
   resource_id          int not null comment 'resource_id',
   pid                  int not null comment 'pid',
   resource_name        varchar(32) not null comment '资源名称',
   url                  varchar(64) not null comment '资源地址',
   type                 int not null comment '类型(1.系统、2.用户、3.权限)',
   status               int not null comment '状态(待定)',
   order_value          int not null comment '排序',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '是否删除',
   primary key (resource_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_resource comment '资源表';

/*==============================================================*/
/* Table: sys_role                                              */
/*==============================================================*/
create table sys_role
(
   role_id              int not null comment 'role_id',
   role_name            varchar(32) not null comment '角色名称',
   resource_id          varchar(64) comment '默认主页url',
   status               int not null comment '状态(0.停用、1.启用)',
   type                 int not null comment '角色类型(0.普通、1.VIP、2.管理员)',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '是否删除',
   primary key (role_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_role comment '角色表';

/*==============================================================*/
/* Table: sys_role_resource_rel                                 */
/*==============================================================*/
create table sys_role_resource_rel
(
   id                   int not null comment 'id',
   role_id              int not null comment 'role_id',
   resource_id          int not null comment 'resource_id',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人ID',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '删除标识',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_role_resource_rel comment '角色资源关联表';

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
   id                   int not null comment 'id',
   account_id           int not null comment 'account_id',
   name                 varchar(16) not null comment '姓名',
   sex                  int not null comment '性别(0.男、1.女、2.其它)',
   age                  int not null comment '年龄',
   telephone            varchar(16) comment '联系电话',
   mobilephone          varchar(16) not null comment '移动电话',
   job                  int comment '职务(1.IT、2.农业、3.其它)',
   qq                   int comment 'QQ',
   wechat               varchar(16) comment '微信',
   microblog            varchar(16) comment '微博',
   email                varchar(16) not null comment '电子邮箱',
   office_addr          varchar(64) comment '办公地址',
   ctime                datetime not null comment '创建时间',
   creater              varchar(16) not null comment '创建人',
   creater_id           int not null comment '创建人ID',
   etime                datetime not null comment '修改时间',
   editor               varchar(16) not null comment '修改人',
   editor_id            int not null comment '修改人_id',
   comments             varchar(128) comment '备注',
   deleted              int not null comment '删除标识',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_user comment '用户表';

