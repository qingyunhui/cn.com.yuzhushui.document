/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2016/10/19 23:21:17                          */
/*==============================================================*/


drop table if exists movie_account_rel;

drop table if exists movie_file;

/*==============================================================*/
/* Table: movie_account_rel                                     */
/*==============================================================*/
create table movie_account_rel 
(
   id                   integer                        not null,
   movie_file_id        integer                        not null,
   account_id           integer                        not null,
   ctime                timestamp                      not null,
   creater              varchar(16)                    not null,
   creater_id           integer                        not null,
   etime                timestamp                      not null,
   editor               varchar(16)                    not null,
   editor_id            integer                        not null,
   comments             varchar(128)                   null,
   deleted              integer                        not null,
   constraint PK_MOVIE_ACCOUNT_REL primary key (id)
);

alter table movie_account_rel comment '用户下载电影记录表';

alter table movie_account_rel modify column id integer comment 'id';

alter table movie_account_rel modify column movie_file_id integer comment '电影文件id';

alter table movie_account_rel modify column account_id integer comment '用户id';

alter table movie_account_rel modify column ctime timestamp comment '创建时间';

alter table movie_account_rel modify column creater varchar(16) comment '创建人';

alter table movie_account_rel modify column creater_id integer comment '创建人ID';

alter table movie_account_rel modify column etime timestamp comment '修改时间';

alter table movie_account_rel modify column editor varchar(16) comment '修改人';

alter table movie_account_rel modify column editor_id integer comment '修改人ID';

alter table movie_account_rel modify column comments varchar(128) comment '备注';

alter table movie_account_rel modify column deleted integer comment '删除标识';

comment on primary key on movie_account_rel is 
'Key_1';

/*==============================================================*/
/* Table: movie_file                                            */
/*==============================================================*/
create table movie_file 
(
   id                   integer                        not null,
   file_name            varchar(128)                   not null,
   file_size            integer                        not null,
   file_suffix          varchar(16)                    not null,
   absolute_path        varchar(128)                   not null,
   file_type            integer                        not null,
   file_status          integer                        not null,
   ctime                timestamp                      not null,
   creater              varchar(16)                    not null,
   creater_id           integer                        not null,
   etime                timestamp                      not null,
   editor               varchar(16)                    not null,
   editor_id            integer                        not null,
   comments             varchar(128)                   not null,
   deleted              integer                        not null,
   constraint PK_MOVIE_FILE primary key (id)
);

alter table movie_file comment '电影-文件';

alter table movie_file modify column id integer comment 'id';

alter table movie_file modify column file_name varchar(128) comment '文件名';

alter table movie_file modify column file_size integer comment '文件大小';

alter table movie_file modify column file_suffix varchar(16) comment '文件后缀';

alter table movie_file modify column absolute_path varchar(128) comment '文件绝对路径';

alter table movie_file modify column file_type integer comment '文件类型(1.动漫、2.好莱坞电影、...)';

alter table movie_file modify column file_status integer comment '文件状态(1.未审核、2.审核不通过、3.审核通过)';

alter table movie_file modify column ctime timestamp comment '创建时间';

alter table movie_file modify column creater varchar(16) comment '创建人';

alter table movie_file modify column creater_id integer comment '创建人ID';

alter table movie_file modify column etime timestamp comment '修改时间';

alter table movie_file modify column editor varchar(16) comment '修改人';

alter table movie_file modify column editor_id integer comment '修改人ID';

alter table movie_file modify column comments varchar(128) comment '备注';

alter table movie_file modify column deleted integer comment '删除标识';

comment on primary key on movie_file is 
'Key_1';

