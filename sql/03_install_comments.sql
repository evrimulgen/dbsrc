
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
-- comments.sql
--
-- comments for all dbsrc tables and columns
-- ============================================================================

--===========================================================
-- Comments on table dbsrc_cfg and its columns
--===========================================================

comment on table dbsrc_cfg is 'Database Source Configuration: a configuration of dbms_metadata api calls and custom post-processing for extracting database source.';
comment on column dbsrc_cfg.cfg_name is 'Database Source Configuration Name: primary key: uniquely identifies a configuration for extracting database source.';
comment on column dbsrc_cfg.cfg_desc is 'Configuration Description: Textual description of a configuration, suitable for display.';
comment on column dbsrc_cfg.create_date is 'Create Date: Date when record created in the table. Standard maintenance column.';
comment on column dbsrc_cfg.create_user is 'Create User: Who created the record. Standard maintenance column.';
comment on column dbsrc_cfg.create_process is 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';

--===========================================================
-- Comments on table dbsrc_cfg_post_prcs and its columns
--===========================================================

comment on table dbsrc_cfg_post_prcs is 'Database Source Configuration Post-Processing: custom post-processing applied using sql to dbms_metadata output to create a database script. This post-processing is intended for handling filtering and transformations not currently possible with dbms_metadata filters and transforms.';
comment on column dbsrc_cfg_post_prcs.cfg_name is 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source.';
comment on column dbsrc_cfg_post_prcs.order_no is 'Order Number: part of primary key. Unique within a configuration name. The order in which the post-processing sql should be applied when creating a database script.';
comment on column dbsrc_cfg_post_prcs.post_prcs_sql_text is 'Post-processing SQL Text: a sql statement, typically an update to the dbsrc table of a subset of rows within a configuration name.';
comment on column dbsrc_cfg_post_prcs.comment_text is 'Comment Text: Textual description of a post-processing sql item, suitable for display.';
comment on column dbsrc_cfg_post_prcs.create_date is 'Create Date: Date when record created in the table. Standard maintenance column.';
comment on column dbsrc_cfg_post_prcs.create_user is 'Create User: Who created the record. Standard maintenance column.';
comment on column dbsrc_cfg_post_prcs.create_process is 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';

--===========================================================
-- Comments on table dbsrc_cfg_filter and its columns
--===========================================================

comment on table dbsrc_cfg_filter is 'Database Source Configuration dbms_metadata.set_filter(): parameter values and associated information necessary to assemble a call to dbms_metadata.set_filter(). set_filter() specifies restrictions on the objects to be retrieved, for example, the object name or schema. See Oracle doc for more information: https://docs.oracle.com/database/121/ARPLS/d_metada.htm#ARPLS66903';
comment on column dbsrc_cfg_filter.cfg_name is 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source.';
comment on column dbsrc_cfg_filter.filter_name is 'dbms_metadata.set_filter() name parameter. Part of the primary key.';
comment on column dbsrc_cfg_filter.filter_value is 'dbms_metadata.set_filter() value parameter. Part of the primary key.';
comment on column dbsrc_cfg_filter.object_type_path is 'dbms_metadata.set_filter() object_type_path parameter. Part of the primary key.';
comment on column dbsrc_cfg_filter.comment_text is 'Comment Text: Textual description of a set_filter() call, suitable for display.';
comment on column dbsrc_cfg_filter.create_date is 'Create Date: Date when record created in the table. Standard maintenance column.';
comment on column dbsrc_cfg_filter.create_user is 'Create User: Who created the record. Standard maintenance column.';
comment on column dbsrc_cfg_filter.create_process is 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';

--===========================================================
-- Comments on table dbsrc_cfg_transform and its columns
--===========================================================

comment on table dbsrc_cfg_transform is 'Database Source Configuration dbms_metadata.set_transform_param(): parameter values and associated information necessary to assemble a call to dbms_metadata.set_transform_param(). set_transform_param() specifies parameters to the XSLT stylesheet used to modify or customize the output of the transform.  See Oracle doc for more information: https://docs.oracle.com/database/121/ARPLS/d_metada.htm#ARPLS66903';
comment on column dbsrc_cfg_transform.cfg_name is 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source';
comment on column dbsrc_cfg_transform.transform_name is 'dbms_metadata.set_transform_param() name parameter. Part of the primary key.';
comment on column dbsrc_cfg_transform.transform_value is 'dbms_metadata.set_transform_param() value parameter. Part of the primary key.';
comment on column dbsrc_cfg_transform.object_type_path is 'dbms_metadata.set_transform_param() object_type_path parameter. Part of the primary key.';
comment on column dbsrc_cfg_transform.comment_text is 'Comment Text: Textual description of a set_transform_param() call, suitable for display.';
comment on column dbsrc_cfg_transform.create_date is 'Create Date: Date when record created in the table. Standard maintenance column.';
comment on column dbsrc_cfg_transform.create_user is 'Create User: Who created the record. Standard maintenance column.';
comment on column dbsrc_cfg_transform.create_process is 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';

--===========================================================
-- Comments on table dbsrc_cfg_dbscript and its columns
--===========================================================

comment on table dbsrc_cfg_dbscript is 'Database Source Configuration Database Script. This is a template for creating a database script from the database source code found in the dbsrc table.';
comment on column dbsrc_cfg_dbscript.cfg_name is 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source.';
comment on column dbsrc_cfg_dbscript.ddl_type is 'DDL Type:  The type of ddl as reported by dbms_metadata.get_ddl().';
comment on column dbsrc_cfg_dbscript.order_no is 'Order Number: part of primary key. Unique within a configuration name. The order in which the ddl_type is will be rendered in an explicitly ordered dbscript.';
comment on column dbsrc_cfg_dbscript.display_name is 'Display Name: Descriptive name for a ddl type.';
comment on column dbsrc_cfg_dbscript.display_note is 'Display Note: Optional note for a ddl_type.';
comment on column dbsrc_cfg_dbscript.display_header_text is 'Display Header Text: a header comment block derived from display_name and display_note.';
comment on column dbsrc_cfg_dbscript.comment_text is 'Comment Text: Textual description of a XXXX, suitable for display.';
comment on column dbsrc_cfg_dbscript.create_date is 'Create Date: Date when record created in the table. Standard maintenance column.';
comment on column dbsrc_cfg_dbscript.create_user is 'Create User: Who created the record. Standard maintenance column.';
comment on column dbsrc_cfg_dbscript.create_process is 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';

--===========================================================
-- Comments on table dbsrc and its columns
--===========================================================

comment on table dbsrc is 'Database Source: Database Source exported by dbms_metadata.';
comment on column dbsrc.dbsrc_set_no is 'Database Source Set Number: part of primary key: sequence-number-based identifier for a set of related database source exported together.';
comment on column dbsrc.cfg_name is 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source';
comment on column dbsrc.order_no is 'Order Number: part of primary key. Unique within a configuration name. The order in which the ddl will be rendered in a dbscript.';
comment on column dbsrc.object_owner is 'Object Owner:  The owner for the database object.';
comment on column dbsrc.ddl_type is 'DDL Type:  The type of ddl as reported by dbms_metadata.get_ddl().';
comment on column dbsrc.object_name is 'Object Name: The name for the database object.';
comment on column dbsrc.dbsrc_text_raw is '"Raw" Database Source Text:  the database source (ddl, dcl, etc.) for the database object; raw as-is from dbms_metadata.';
comment on column dbsrc.dbsrc_text_cooked is '"Cooked" Database Source Text:  the database source (ddl, dcl, etc.) for the database object; after post-processing.';
comment on column dbsrc.dbscript_include_flag is 'Database Script Include Flag: defaults to Y, can be set no N by post-processing to exclude objects from dbscripts.';
comment on column dbsrc.post_prcs_order_no_list is 'Post-process Order Number List: a series of zero to many numbers, delimited by colons; ex '':1::2:''. Indicates which post-processing steps were applied to this ddl.';
comment on column dbsrc.create_date is 'Create Date: Date when record created in the table. Standard maintenance column.';
comment on column dbsrc.create_user is 'Create User: Who created the record. Standard maintenance column.';
comment on column dbsrc.create_process is 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';
comment on column dbsrc.dba_obj_created_date is 'DBA Object Created Date: timestamp for creation of object. Value is null if not an object.';
comment on column dbsrc.dba_obj_last_ddl_time is 'DBA Object Last DDL Time: timestamp for the last modification resulting from a DDL statement. Value is null if not an object.';
comment on column dbsrc.dba_obj_status is 'DBA Object Status: status of the object (VALID, INVALID, N/A). Value is null if not an object.';
 
