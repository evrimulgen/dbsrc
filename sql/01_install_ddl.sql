
--    Copyright 2019 Steve Rutledge
--    =========================================================================
--    This file is part of DBSRC Librarian.
--
--    DBSRC Librarian is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, version 3 of the License.
--
--    DBSRC Librarian is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with DBSRC Librarian (see file COPYING.txt).  
--    If not, see <https://www.gnu.org/licenses/>.
--    =========================================================================

-- ============================================================================
-- install the dbsrc tables, sequences and view
--
-- Note, this is a destructive install, that will drop anything pre-existing
-- that conflicts with what it installs.
-- ============================================================================

-- tables
create procedure drop_table(t varchar2) as
    not_exists exception;
    pragma exception_init(not_exists, -942);
begin
	execute immediate('drop table '||t);
exception 
	when not_exists then 
    	dbms_output.put_line('>>> info: table '||t||' does not exist.');
end drop_table;
/
exec drop_table('dbsrc_cfg_filter');
exec drop_table('dbsrc_cfg_post_prcs');
exec drop_table('dbsrc_cfg_transform');
exec drop_table('dbsrc');
exec drop_table('dbsrc_cfg_dbscript');
exec drop_table('dbsrc_cfg');
drop procedure drop_table;

-- sequences
create procedure drop_sequence(s varchar2) as
    not_exists exception;
    pragma exception_init(not_exists, -2289);
begin
	execute immediate('drop sequence '||s);
exception 
	when not_exists then 
    	dbms_output.put_line('>>> info: sequence '||s||' does not exist.');
end drop_sequence;
/
exec drop_sequence('sq_dbsrc_set_no');
exec drop_sequence('sq_dbsrc_cnt_no');
drop procedure drop_sequence;

-- =================================================================
-- dbsrc_cfg table
-- =================================================================

create table dbsrc_cfg (
    -- key columns
    cfg_name varchar2(80) not null,
    --
    -- nonkey columns
    cfg_desc varchar2(2000) not null,
    --
    -- standard maintenance columns
    create_date date default sysdate,
    create_user varchar2(80 char) default user,
    create_process varchar2(2000 char) 
        default sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name') not null
);

alter table dbsrc_cfg add constraint pk_dbsrc_cfg 
    primary key (cfg_name);

-- =================================================================
-- dbsrc_cfg_post_prcs table
-- =================================================================

create table dbsrc_cfg_post_prcs (
    -- key columns
    cfg_name varchar2(80) not null,
    order_no number not null,
    --
    -- nonkey columns
    post_prcs_sql_text clob not null,
    comment_text varchar2(2000) not null,
    --
    -- standard maintenance columns
    create_date date default sysdate,
    create_user varchar2(80 char) default user,
    create_process varchar2(2000 char) 
        default sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name') not null
);

-- declared pk as uk as object_type_path may have valid nulls
alter table dbsrc_cfg_post_prcs add constraint pk_dbsrc_cfg_post_prcs_01
    primary key (cfg_name, order_no);
alter table dbsrc_cfg_post_prcs add constraint fk_dbsrc_cfg_post_prcs_01
     foreign key (cfg_name) references dbsrc_cfg(cfg_name);

-- =================================================================
-- dbsrc_cfg_filter table
-- =================================================================

create table dbsrc_cfg_filter (
    -- key columns
    cfg_name varchar2(80) not null,
    filter_name varchar2(80) not null,
    filter_value varchar2(2000) not null,
    object_type_path varchar2(80),
    --
    -- nonkey columns
    comment_text varchar2(2000),
    --
    -- standard maintenance columns
    create_date date default sysdate,
    create_user varchar2(80 char) default user,
    create_process varchar2(2000 char) 
        default sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name') not null
);

-- declared pk as uk as object_type_path may have valid nulls
alter table dbsrc_cfg_filter add constraint uk_dbsrc_cfg_filter_01
    unique (cfg_name, filter_name, filter_value, object_type_path);
alter table dbsrc_cfg_filter add constraint fk_dbsrc_cfg_filter_01
     foreign key (cfg_name) references dbsrc_cfg(cfg_name);

-- =================================================================
-- dbsrc_cfg_transform table
-- =================================================================

create table dbsrc_cfg_transform (
    -- key columns
    cfg_name varchar2(80) not null,
    transform_name varchar2(80) not null,
    transform_value varchar2(2000) not null, 
    object_type_path varchar2(80),
    --
    -- nonkey columns
    comment_text varchar2(2000),
    --
    -- standard maintenance columns
    create_date date default sysdate,
    create_user varchar2(80 char) default user,
    create_process varchar2(2000 char) 
        default sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name') not null
);

-- declared pk as uk as object_type_path may have valid nulls
alter table dbsrc_cfg_transform add constraint uk_dbsrc_cfg_transform_01
    unique (cfg_name, transform_name, transform_value, object_type_path);
alter table dbsrc_cfg_transform add constraint fk_dbsrc_cfg_transform_01
    foreign key (cfg_name) references dbsrc_cfg(cfg_name);

-- =================================================================
-- dbsrc_cfg_dbscript table
-- =================================================================

create table dbsrc_cfg_dbscript (
    -- key columns
    cfg_name varchar2(80) not null,
    ddl_type varchar2(80) not null,
    --
    -- nonkey columns
    order_no number not null,
    display_name varchar2(80) not null,
    display_note varchar2(1000),
    display_header_text clob,
    comment_text varchar2(2000),
    --
    -- standard maintenance columns
    create_date date default sysdate,
    create_user varchar2(80 char) default user,
    create_process varchar2(2000 char) 
        default sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name') not null
);

alter table dbsrc_cfg_dbscript add constraint pk_dbsrc_cfg_dbscript 
    primary key (cfg_name, ddl_type);
alter table dbsrc_cfg_dbscript add constraint fk_dbsrc_cfg_dbscript_01
     foreign key (cfg_name) references dbsrc_cfg(cfg_name);

-- =================================================================
-- dbsrc table
-- =================================================================

create table dbsrc (
    -- key columns
    dbsrc_set_no number not null,
    cfg_name varchar2(80) not null,
    order_no number not null,
    --
    -- nonkey columns
    object_owner varchar2(200 char) not null,
    -- in some rare cases, dbms_metadata returns nulls for ddl_type
    ddl_type varchar2(200 char) null,
    object_name varchar2(200 char) not null,
    --
    dbsrc_text_raw clob null,
    dbsrc_text_cooked clob null,
    dbscript_include_flag varchar2(1 char) 
        default 'Y' not null,
    post_prcs_order_no_list varchar2(1000) null,
    dba_obj_created_date date null,
    dba_obj_last_ddl_time date null,
    dba_obj_status varchar2(7) null,
    --
    -- standard maintenance columns
    create_date date default sysdate not null,
    create_user varchar2(80 char) default user not null,
    create_process varchar2(200 char) 
        default sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name') not null
)
-- ddl can be bulky, this will help size+query perf
tablespace users
lob (dbsrc_text_raw) store as securefile (compress medium),
lob (dbsrc_text_cooked) store as securefile (compress medium)
--
-- this parittioning, along with the local indexes below is
-- optimizing for access of a single dbsrc_set_no at a time
-- in exchange for slower cross-dbsrc_set performance.
partition by range(dbsrc_set_no) interval(1) (
	partition p_first values less than (1000)
);

-- the surrogate key, delared as pk
alter table dbsrc add constraint pk_dbsrc primary key 
    (dbsrc_set_no, cfg_name, order_no);
alter table dbsrc add constraint fk_dbsrc_01 
    foreign key (cfg_name, ddl_type) 
    references dbsrc_cfg_dbscript (cfg_name, ddl_type);
alter table dbsrc add constraint ck_dbsrc_01 check (
    dbscript_include_flag in ('Y', 'N'));

create index x_dbsrc_01 on dbsrc (dbscript_include_flag) local;
create index x_dbsrc_02 on dbsrc (cfg_name) local;
create index x_dbsrc_03 on dbsrc (ddl_type, object_name) local;
create index x_dbsrc_04 on dbsrc (order_no) local;

create sequence sq_dbsrc_cnt_no
    start with 1000 increment by 1 noorder cache 30 nocycle;
create sequence sq_dbsrc_set_no
    start with 1000 increment by 1 noorder cache 30 nocycle;

-- =================================================================
-- crnt_dbsrc view
-- =================================================================

create or replace force view crnt_dbsrc as
    select 
        -- dbsrc
        s.dbsrc_set_no,
        s.cfg_name,
        s.order_no,
        s.object_owner,
        s.ddl_type,
        s.object_name,
        s.dbsrc_text_raw,
        s.dbsrc_text_cooked,
        s.dbscript_include_flag,
        s.post_prcs_order_no_list,
        s.dba_obj_created_date,
        s.dba_obj_last_ddl_time,
        s.dba_obj_status,
        s.create_date,
        s.create_user,
        s.create_process,
        --
        -- dbsrc_dbscript
        d.order_no dbscript_order_no,
        d.display_name dbscript_dsp_name,
        d.display_header_text dbscript_dsp_header_text
    from dbsrc s
        -- some ddl_types are not in dbsrc_cfg_dbscript, on purpose
        --  (epilogue, prologue)
        left outer join dbsrc_cfg_dbscript d
            on d.ddl_type = s.ddl_type and
                d.cfg_name = s.cfg_name
    where dbsrc_set_no = dbsrc_mgr.get_set_no;

-- disable fk during active development to allow easy reconfigurations without
--  needing to delete existing dbsrc sets
alter table dbsrc disable constraint fk_dbsrc_01;

