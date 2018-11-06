-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."XDB$RCLIST_V" ("RCLIST") AS
  (select rclist from xdb.xdb$root_info);

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."XDB$ROOT_INFO_V" ("RESOURCE_ROOT",
"RCLIST",
"FTP_PORT",
"FTP_PROTOCOL",
"HTTP_PORT",
"HTTP_PROTOCOL",
"HTTP_HOST",
"HTTP2_PORT",
"HTTP2_PROTOCOL",
"HTTP2_HOST",
"NFS_PORT",
"NFS_PROTOCOL") AS
  select "RESOURCE_ROOT",
"RCLIST",
"FTP_PORT",
"FTP_PROTOCOL",
"HTTP_PORT",
"HTTP_PROTOCOL",
"HTTP_HOST",
"HTTP2_PORT",
"HTTP2_PROTOCOL",
"HTTP2_HOST",
"NFS_PORT",
"NFS_PROTOCOL" from xdb.xdb$root_info;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."RESOURCE_VIEW" ("RES",
"ANY_PATH",
"RESID") AS
  select value(p) res, abspath(8888) any_path, sys_nc_oid$ resid
  from xdb.xdb$resource p
  where under_path(value(p), '/', 8888) = 1 ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."PATH_VIEW" ("PATH",
"RES",
"LINK",
"RESID") AS
  select /*+ ORDERED */ t2.path path, t.res res,
      xmltype.createxml(xdb.xdb_link_type(NULL, r2.xmldata.dispname, t.name,
                        h.name, h.flags, h.parent_oid, h.child_oid,
                        decode(bitand(sys_op_rawtonum(h.flags), 1024), 1024,
                              xdb.xdb$enum_t(hextoraw('01')),
                              decode(bitand(sys_op_rawtonum(h.flags), 512), 512,
                                xdb.xdb$enum_t(hextoraw('02')),
                                xdb.xdb$enum_t(hextoraw('00'))))),
                   'http://xmlns.oracle.com/xdb/XDBStandard.xsd', 'LINK') link,
      t.resid
  from  ( select xdb.all_path(9999) paths, value(p) res, p.sys_nc_oid$ resid,
          decode(bitand(sys_op_rawtonum(p.xmldata.flags), 8388608), 8388608,
                 utl_raw.cast_to_varchar2(dbms_lob.substr(p.xmldata.xmllob, 4000)),
                 p.xmldata.dispname) name
          from xdb.xdb$resource p
          where xdb.under_path(value(p), '/', 9999)=1 ) t,
        TABLE( cast (t.paths as xdb.path_array) ) t2,
        xdb.xdb$h_link h, xdb.xdb$resource r2
   where t2.parent_oid = h.parent_oid and t2.childname = h.name and
         t2.parent_oid = r2.sys_nc_oid$;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."DOCUMENT_LINKS" ("SOURCE_ID",
"TARGET_ID",
"TARGET_PATH",
"LINK_TYPE",
"LINK_FORM",
"SOURCE_TYPE") AS
  SELECT
dl.source_id,
dl.target_id,
dl.target_path,
decode(bitand(sys_op_rawtonum(dl.flags),1),1, 'Weak',
       decode(bitand(sys_op_rawtonum(dl.flags),2),2,'Symbolic','Hard')),
decode(bitand(sys_op_rawtonum(dl.flags),4),4, 'XInclude', 'XLink'),
decode(bitand(sys_op_rawtonum(dl.flags),8),8, 'Resource Metadata',
       'Resource Content')
from xdb.xdb$d_link dl, xdb.xdb$resource r
where dl.source_id = r.object_id
and sys_checkacl(r.xmldata.acloid, r.xmldata.ownerid,
xmltype('<privilege
      xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
                          http://xmlns.oracle.com/xdb/acl.xsd
                          DAV: http://xmlns.oracle.com/xdb/dav.xsd">
      <read-properties/>
      <read-contents/>
 </privilege>')) = 1;

