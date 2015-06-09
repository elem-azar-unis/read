------------------------------------------
-- Export file for user SCOTT           --
------------------------------------------

set define off
spool sql.log

prompt
prompt Creating table N_USER
prompt =====================
prompt
create table SCOTT.N_USER
(
  u_id      NUMBER(10) not null,
  u_name    VARCHAR2(50) not null,
  u_psw     VARCHAR2(50) not null,
  u_author  VARCHAR2(50),
  u_level   NUMBER(3),
  u_balance NUMBER(10),
  u_expense NUMBER(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCOTT.N_USER.u_id
  is '用户id';
comment on column SCOTT.N_USER.u_name
  is '用户登录名';
comment on column SCOTT.N_USER.u_psw
  is '用户登陆密码';
comment on column SCOTT.N_USER.u_author
  is '是否是作者';
comment on column SCOTT.N_USER.u_level
  is '作者级别';
comment on column SCOTT.N_USER.u_balance
  is '用户钱包余额';
comment on column SCOTT.N_USER.u_expense
  is '用户以往花销总额';
alter table SCOTT.N_USER
  add constraint U_ID primary key (U_ID)
  using index 
  tablespace SYSTEM
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

prompt
prompt Creating table N_BOOK
prompt =====================
prompt
create table SCOTT.N_BOOK
(
  b_id            NUMBER(10) not null,
  b_name          VARCHAR2(50) not null,
  b_type          VARCHAR2(50) not null,
  b_picture       VARCHAR2(50),
  b_intro         VARCHAR2(500),
  b_long          VARCHAR2(50),
  b_over          VARCHAR2(50),
  b_starttime     DATE,
  b_lasttime      DATE,
  b_flowernum     NUMBER(10),
  b_eggnum        NUMBER(10),
  u_id            NUMBER(10) not null,
  b_scannum       NUMBER(10),
  b_recommend     VARCHAR2(50),
  b_freescan      VARCHAR2(50),
  b_scanprice     NUMBER(10),
  b_candownload   VARCHAR2(50),
  b_downloadprice NUMBER(10),
  b_issale        VARCHAR2(50),
  b_saleprice     NUMBER(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCOTT.N_BOOK.b_id
  is '书ID';
comment on column SCOTT.N_BOOK.b_name
  is '书的名称';
comment on column SCOTT.N_BOOK.b_type
  is '书的类型';
comment on column SCOTT.N_BOOK.b_picture
  is '书的封面图片';
comment on column SCOTT.N_BOOK.b_intro
  is '书的简介';
comment on column SCOTT.N_BOOK.b_long
  is '是长篇还是短篇';
comment on column SCOTT.N_BOOK.b_over
  is '书是否已经完结';
comment on column SCOTT.N_BOOK.b_starttime
  is '开始写的时间';
comment on column SCOTT.N_BOOK.b_lasttime
  is '最近更新的时间';
comment on column SCOTT.N_BOOK.b_flowernum
  is '书获得的鲜花量';
comment on column SCOTT.N_BOOK.b_eggnum
  is '书获得的鸡蛋量';
comment on column SCOTT.N_BOOK.u_id
  is '书的作者';
comment on column SCOTT.N_BOOK.b_scannum
  is '书的浏览量';
comment on column SCOTT.N_BOOK.b_recommend
  is '是否是网站编辑推荐的书';
comment on column SCOTT.N_BOOK.b_freescan
  is '是否免费浏览';
comment on column SCOTT.N_BOOK.b_scanprice
  is '浏览价格';
comment on column SCOTT.N_BOOK.b_candownload
  is '是否可以下载';
comment on column SCOTT.N_BOOK.b_downloadprice
  is '下载付费额';
comment on column SCOTT.N_BOOK.b_issale
  is '商城是否有纸质书出售';
comment on column SCOTT.N_BOOK.b_saleprice
  is '书的销售价格';
alter table SCOTT.N_BOOK
  add constraint B_ID primary key (B_ID)
  using index 
  tablespace SYSTEM
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
alter table SCOTT.N_BOOK
  add constraint F_B_AUTHOR foreign key (U_ID)
  references SCOTT.N_USER (U_ID) on delete cascade;

prompt
prompt Creating table N_CONTENT
prompt ========================
prompt
create table SCOTT.N_CONTENT
(
  c_id             NUMBER(10) not null,
  b_id             NUMBER(10) not null,
  c_section        VARCHAR2(50),
  c_sectioncontent LONG
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCOTT.N_CONTENT.c_id
  is '书内容的id';
comment on column SCOTT.N_CONTENT.b_id
  is '内容所属的书的id';
comment on column SCOTT.N_CONTENT.c_section
  is '章节名';
comment on column SCOTT.N_CONTENT.c_sectioncontent
  is '章节内容';
alter table SCOTT.N_CONTENT
  add constraint C_ID primary key (C_ID)
  using index 
  tablespace SYSTEM
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
alter table SCOTT.N_CONTENT
  add constraint F_C_BOOKID foreign key (B_ID)
  references SCOTT.N_BOOK (B_ID) on delete cascade;

prompt
prompt Creating table N_DISCUSS
prompt ========================
prompt
create table SCOTT.N_DISCUSS
(
  d_id      NUMBER(10) not null,
  b_id      NUMBER(10) not null,
  d_content VARCHAR2(200) not null,
  u_id      NUMBER(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCOTT.N_DISCUSS.d_id
  is '评论的id';
comment on column SCOTT.N_DISCUSS.b_id
  is '评论的书的id';
comment on column SCOTT.N_DISCUSS.d_content
  is '评论的内容';
comment on column SCOTT.N_DISCUSS.u_id
  is '评论者的id';
alter table SCOTT.N_DISCUSS
  add constraint D_ID primary key (D_ID)
  using index 
  tablespace SYSTEM
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
alter table SCOTT.N_DISCUSS
  add constraint F_D_BOOKID foreign key (B_ID)
  references SCOTT.N_BOOK (B_ID) on delete cascade;
alter table SCOTT.N_DISCUSS
  add constraint F_D_USERID foreign key (U_ID)
  references SCOTT.N_USER (U_ID) on delete cascade;

prompt
prompt Creating table N_MANAGER
prompt ========================
prompt
create table SCOTT.N_MANAGER
(
  m_id   NUMBER(10) not null,
  m_name VARCHAR2(50) not null,
  m_psw  VARCHAR2(50) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column SCOTT.N_MANAGER.m_id
  is '管理员的ID';
comment on column SCOTT.N_MANAGER.m_name
  is '管理员登录名';
comment on column SCOTT.N_MANAGER.m_psw
  is '管理员的登录密码';
alter table SCOTT.N_MANAGER
  add constraint M_ID primary key (M_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table N_REPLY
prompt ======================
prompt
create table SCOTT.N_REPLY
(
  r_id      NUMBER(10) not null,
  d_id      NUMBER(10) not null,
  r_content VARCHAR2(200) not null,
  u_id      NUMBER(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCOTT.N_REPLY.r_id
  is '回复信息的id';
comment on column SCOTT.N_REPLY.d_id
  is '回复信息所属的评论的id';
comment on column SCOTT.N_REPLY.r_content
  is '回复信息的内容';
comment on column SCOTT.N_REPLY.u_id
  is '信息回复者的id';
alter table SCOTT.N_REPLY
  add constraint R_ID primary key (R_ID)
  using index 
  tablespace SYSTEM
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
alter table SCOTT.N_REPLY
  add constraint F_R_BOOKID foreign key (D_ID)
  references SCOTT.N_DISCUSS (D_ID) on delete cascade;
alter table SCOTT.N_REPLY
  add constraint F_R_USERID foreign key (U_ID)
  references SCOTT.N_USER (U_ID) on delete cascade;

prompt
prompt Creating table N_SHOP
prompt =====================
prompt
create table SCOTT.N_SHOP
(
  s_orderid NUMBER(10) not null,
  b_id      NUMBER(10),
  s_num     NUMBER(10),
  u_id      NUMBER(10),
  s_state   VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCOTT.N_SHOP.s_orderid
  is '订单ID';
comment on column SCOTT.N_SHOP.b_id
  is '图书ID';
comment on column SCOTT.N_SHOP.s_num
  is '购买件数';
comment on column SCOTT.N_SHOP.u_id
  is '用户ID';
comment on column SCOTT.N_SHOP.s_state
  is '付款状态';
alter table SCOTT.N_SHOP
  add constraint S_ORDERID primary key (S_ORDERID)
  using index 
  tablespace SYSTEM
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
alter table SCOTT.N_SHOP
  add constraint FK_SHOP_BOOK foreign key (B_ID)
  references SCOTT.N_BOOK (B_ID) on delete cascade;
alter table SCOTT.N_SHOP
  add constraint FK_SHOP_USER foreign key (U_ID)
  references SCOTT.N_USER (U_ID) on delete cascade;


spool off
