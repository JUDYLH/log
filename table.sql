prompt PL/SQL Developer import file
prompt Created on 2017年8月19日 by hasee
set feedback off
set define off
prompt Dropping PRIVILEGE...
drop table PRIVILEGE cascade constraints;
prompt Dropping ROLE...
drop table ROLE cascade constraints;
prompt Dropping ROLEPRIVILEGE...
drop table ROLEPRIVILEGE cascade constraints;
prompt Dropping USERROLE...
drop table USERROLE cascade constraints;
prompt Creating PRIVILEGE...
create table PRIVILEGE
(
  id     NUMBER(9) not null,
  name   VARCHAR2(20),
  remark VARCHAR2(255),
  fnpath VARCHAR2(100),
  pid    NUMBER(9)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRIVILEGE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRIVILEGE
  add unique (FNPATH)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRIVILEGE
  add constraint IK_PRIVILEGE foreign key (PID)
  references PRIVILEGE (ID);

prompt Creating ROLE...
create table ROLE
(
  id     NUMBER(9) not null,
  name   VARCHAR2(20),
  remark VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLEPRIVILEGE...
create table ROLEPRIVILEGE
(
  roleid      NUMBER(9) not null,
  privilegeid NUMBER(9) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ROLEPRIVILEGE
  add constraint PK_ROLEPRIVILEGE primary key (ROLEID, PRIVILEGEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ROLEPRIVILEGE
  add constraint FK_ROLEPRIVILEGE_REF_PRIVILEGE foreign key (PRIVILEGEID)
  references PRIVILEGE (ID);
alter table ROLEPRIVILEGE
  add constraint FK_ROLEPRIVILEGE_REF_ROLE foreign key (ROLEID)
  references ROLE (ID);

prompt Creating USERROLE...
create table USERROLE
(
  userid VARCHAR2(32) not null,
  roleid NUMBER(9) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERROLE
  add constraint PK_USERROLE primary key (USERID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERROLE
  add constraint FK_USERROLE_REFERENCES_ROLE foreign key (ROLEID)
  references ROLE (ID);
alter table USERROLE
  add constraint FK_USERROLE_REFERENCES_USER foreign key (USERID)
  references T_USER (ID);

prompt Disabling triggers for PRIVILEGE...
alter table PRIVILEGE disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for ROLEPRIVILEGE...
alter table ROLEPRIVILEGE disable all triggers;
prompt Disabling triggers for USERROLE...
alter table USERROLE disable all triggers;
prompt Disabling foreign key constraints for PRIVILEGE...
alter table PRIVILEGE disable constraint IK_PRIVILEGE;
prompt Disabling foreign key constraints for ROLEPRIVILEGE...
alter table ROLEPRIVILEGE disable constraint FK_ROLEPRIVILEGE_REF_PRIVILEGE;
alter table ROLEPRIVILEGE disable constraint FK_ROLEPRIVILEGE_REF_ROLE;
prompt Disabling foreign key constraints for USERROLE...
alter table USERROLE disable constraint FK_USERROLE_REFERENCES_ROLE;
alter table USERROLE disable constraint FK_USERROLE_REFERENCES_USER;
prompt Loading PRIVILEGE...
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (1001, '基础数据', null, null, null);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100101, '取派员设置', 'page_stuff_stuff', 'page_stuff_stuff', 1001);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100102, '区域设置', 'page_region_region', 'page_region_region', 1001);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100103, '管理定区/调度排班', 'page_decidezone_decidezone', 'page_decidezone_decidezonen', 1001);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (1002, '受理', null, null, null);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100201, '业务受理', null, 'page_qupai_noticebill_add.action', 1002);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100202, '工作单快速录入', null, 'page_qupai_workorderquickimport.action', 1002);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100203, '工作单导入', null, 'page_qupai_workorderimport.action', 1002);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (1003, '调度', null, null, null);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100301, '人工转单', null, 'page_qupai_zhundan.action', 1003);
insert into PRIVILEGE (id, name, remark, fnpath, pid)
values (100302, '人工调度', null, 'page_qupai_diaodu.action', 1003);
commit;
prompt 11 records loaded
prompt Loading ROLE...
insert into ROLE (id, name, remark)
values (1, '管理员', null);
insert into ROLE (id, name, remark)
values (2, '区域管理员', null);
insert into ROLE (id, name, remark)
values (3, '普通用户', null);
commit;
prompt 3 records loaded
prompt Loading ROLEPRIVILEGE...
prompt Table is empty
prompt Loading USERROLE...
insert into USERROLE (userid, roleid)
values ('4028b8815dc1c164015dc1c165340000', 1);
insert into USERROLE (userid, roleid)
values ('627D54E67092442DBB7459608A398CFD', 2);
insert into USERROLE (userid, roleid)
values ('627D54E67092442DBB7459608A398CFD', 3);
insert into USERROLE (userid, roleid)
values ('C3FA97CD624746DA8BBD303D207183A5', 2);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for PRIVILEGE...
alter table PRIVILEGE enable constraint IK_PRIVILEGE;
prompt Enabling foreign key constraints for ROLEPRIVILEGE...
alter table ROLEPRIVILEGE enable constraint FK_ROLEPRIVILEGE_REF_PRIVILEGE;
alter table ROLEPRIVILEGE enable constraint FK_ROLEPRIVILEGE_REF_ROLE;
prompt Enabling foreign key constraints for USERROLE...
alter table USERROLE enable constraint FK_USERROLE_REFERENCES_ROLE;
alter table USERROLE enable constraint FK_USERROLE_REFERENCES_USER;
prompt Enabling triggers for PRIVILEGE...
alter table PRIVILEGE enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for ROLEPRIVILEGE...
alter table ROLEPRIVILEGE enable all triggers;
prompt Enabling triggers for USERROLE...
alter table USERROLE enable all triggers;
set feedback on
set define on
prompt Done.
