CREATE OR REPLACE NONEDITIONABLE PACKAGE "GSMADMIN_INTERNAL"."DBMS_GSM_COMMON" AS


--*****************************************************************************
-- Package Public Types
--*****************************************************************************

-- generic TRUE/FALSE indicators for integer parameters.
-- NOTE: This is necesary because Java/JDBC does not deal well with boolean
--       parameters in PL/SQL procedures. Something we should look sometime.
isFalse  constant  number := 0;
isTrue   constant  number := 1;

-- Update modes for catalog lock
noUpdate constant  number := 0;  -- catalog is not updated
updNoGSM constant  number := 1;  -- catalog Update does not require running GSM
updGSM   constant  number := 2;  -- catalog update requires running GSM

--*****************************************************************************
-- Package Public Constants
--*****************************************************************************

max_inst_param_name     constant    varchar2(25) := '_gsm_max_instances_per_db';
max_inst_default        constant    number := 10;

max_regions_param_name  constant    varchar2(20) := '_gsm_max_num_regions';
max_regions_default     constant    number := 10;

gsm_parameter_name           constant varchar2(10) := '_gsm';
region_list_parameter_name   constant varchar2(16) := '_gsm_region_list';

cpu_thresh_param_name        constant varchar2(15) := '_gsm_cpu_thresh';
default_cpu_thresh           constant    number := 75;

srlat_thresh_param_name      constant varchar2(17) := '_gsm_srlat_thresh';
default_srlat_thresh         constant    number := 20;

-------------------------------------------------------------------------------
-- Service definitions
-- These constants are stored in the 'service' table and used in the
-- 'addService' routines in the dbms_gsm_pooladmin and dbms_gsm_dbadmin
-- packages.
-------------------------------------------------------------------------------

-- DB Role
db_role_none           constant  number := 0;
db_role_primary        constant  number := 1;
db_role_phys_stby      constant  number := 2;
db_role_log_stby       constant  number := 3;
db_role_snap_stby      constant  number := 4;

-- RLB Goal
rlb_goal_none          constant  number := 0;
rlb_goal_service_time  constant  number := 1;
rlb_goal_throughput    constant  number := 2;

-- CLB Goal
clb_goal_none          constant  number := 0;
clb_goal_short         constant  number := 1;
clb_goal_long          constant  number := 2;

-- TAF policy
taf_none               constant  number := 0;
taf_basic              constant  number := 1;
taf_preconnect         constant  number := 2;

-- Policy
policy_manual          constant  number := 1;
policy_automatic       constant  number := 2;

-- Failover Method
failover_none          constant  varchar2(5) := 'NONE';
failover_basic         constant  varchar2(6) := 'BASIC';

-- Failover Type
failover_type_none     constant  varchar2(5)  := 'NONE';
failover_type_session  constant  varchar2(8)  := 'SESSION';
failover_type_select   constant  varchar2(7)  := 'SELECT';
failover_type_transact constant  varchar2(12) := 'TRANSACTION';

-- Commit Outcome
commit_outcome_off     constant  number := 0;
commit_outcome_on      constant  number := 1;

-- Session State Consistency
session_state_static   constant  varchar2(7)  := 'STATIC';
session_state_dynamic  constant  varchar2(8)  := 'DYNAMIC';

-- Distributed Transaction
dtp_off                constant  number := 0;
dtp_on                 constant  number := 1;

-- Preferred ALL DBS?
select_dbs             constant  number := 0;
prefer_all_dbs         constant  number := 1;

-- Failover Primary
failover_primary_off   constant  number := 0;
failover_primary_on    constant  number := 1;

-- HA Notification
ha_notification_off    constant  number := 0;
ha_notification_on     constant  number := 1;

-- AQ FAN Notification
aq_off                 constant  number := 0;
aq_on                  constant  number := 1;

-- Lag
any_lag                constant  number := 1;
specified_lag          constant  number := 0;

-- GSM_FLAGS - handy bitfield to pass several attributes to the db
-- attribute positions are specified here
gsmflagpos_locality    constant  number := 0;
gsmflagpos_regionfo    constant  number := 1;

-- Locality
service_anywhere       constant  number := 0;
service_local_only     constant  number := 1;

-- Region Failover
region_failover_off    constant  number := 0;
region_failover_on     constant  number := 1;

-- Instance Cardinality on RAC
cardinality_uniform    constant  varchar2(8)  := 'UNIFORM';
cardinality_singleton  constant  varchar2(10) := 'SINGLETON';

-- Service Reference while calling dbms_service_prvt to control whether
--  the call applies to the service definition in the DB &/or OCR
srvc_context_is_db     constant number := 1;
srvc_context_is_ocr    constant number := 2;


--*****************************************************************************
-- Package Public Exceptions
--*****************************************************************************


--*****************************************************************************
-- Package Public Procedures
--*****************************************************************************

-------------------------------------------------------------------------------
--
-- PROCEDURE     setGSMParameter
--
-- Description:
--       Changes the value of the _gsm parameter on a database.
--
-- Parameters:
--       operation: "add_gsms" -> appends the input list to the current
--                                parameter value
--                  "replace_all_gsms" -> replaces the current parameter
--                                value with the input list
--                  "remove_gsms" -> removes the input list from the
--                                current parameter value
--                  "modify_gsms" -> modify one or more gsm entries
--       gsms: a list of GSMS to add/replace/remove
--
-- Notes:
--
-------------------------------------------------------------------------------

add_gsms                constant number := 0;
replace_all_gsms        constant number := 1;
remove_gsms             constant number := 2;
modify_gsms             constant number := 3;

PROCEDURE setGSMParameter( operation IN number,
                           gsms      IN gsm_list_t );

-------------------------------------------------------------------------------
--
-- PROCEDURE     setRegionListParameter
--
-- Description:
--       Changes the value of the _gsm_region_list parameter on a database.
--
-- Parameters:
--       operation: "add_regions" -> appends the input list to the current
--                                   parameter value
--                  "remove_regions" -> removes the input list from the
--                                      current parameter value
--                  "modify_regions" -> modify one or more region entries
--       regions: a list of regions to add/replace/remove
--
-- Notes:
--
-------------------------------------------------------------------------------

add_regions                constant number := 0;
remove_regions             constant number := 1;
modify_regions             constant number := 2;

PROCEDURE setRegionListParameter( operation IN number,
                                  regions   IN region_list_t );

-------------------------------------------------------------------------------
--
-- FUNCTION    existGSM
--
-- Description:
--       Checks if a gsm_alias already in the _gsm parameter on a database.
--
-- Parameters:
--       gsm_alias: the name of the GSM.
--
-- Returns :
--   TRUE : if the gsm_alias exists.
--   FALSE : otherwise.
--
-- Notes:
-------------------------------------------------------------------------------

FUNCTION existGSM( gsm_alias varchar2) RETURN boolean;

-------------------------------------------------------------------------------
--
-- FUNCTION    isGWMTracing
--
-- Description:
--       Checks if GWM module tracing is enabled.
--
-- Parameters:
--       Nome
--
-- Returns :
--   TRUE : if the GWM sql tracing is enabled.
--   FALSE : otherwise.
--
-- Notes:
-------------------------------------------------------------------------------

FUNCTION isGWMTracing RETURN boolean;

-------------------------------------------------------------------------------
--
-- FUNCTION    reRegisterDB
--
-- Description:
--       Re-registers database with GSM listeners after some change
--
-- Parameters:
--       Nome
--
-- Returns :
--       NONE
--
-- Notes:
-------------------------------------------------------------------------------

PROCEDURE reRegisterDB;

-------------------------------------------------------------------------------
--
-- FUNCTION    checkDBCompat
--
-- Description:
--       Check that database level is compatible with GDS
--
-- Parameters:
--       None
--
-- Returns :
--       BOOLEAN
--
-- Notes:
-------------------------------------------------------------------------------
FUNCTION checkDBCompat
RETURN BOOLEAN;

-------------------------------------------------------------------------------
--
-- PROCEDURE    writeToGWMTracing
--
-- Description:
--       prints using the GWM tracing mechanism.
--
-- Parameters:
--      phrase : text to write
--
-- Returns :
--      None.
--
-- Notes:
-------------------------------------------------------------------------------

PROCEDURE writeToGWMTracing(phrase IN varchar2);

----------------------------------------------------------------------
-- Factoring. Is GDS licensed? (currently requires enterprise edition)
----------------------------------------------------------------------
PROCEDURE gwmFactor;

PROCEDURE region_params_to_region_list( region_list    OUT    region_list_t );
PROCEDURE gsm_params_to_gsm_list( gsm_list    OUT    gsm_list_t );
--------------------------------------------------------------
-- gets Message text given message number and parameters
--------------------------------------------------------------
PROCEDURE getMsg (message_number IN     binary_integer,
                  message_text   OUT    varchar2,
                  params         IN     message_param_list);
----------------------------------------------------------
--
-- PROCEDURE    serviceChange
--
-- Description:
--       Signal a service change for registration
--
-- Parameters:
--      NONE
--
-- Returns :
--      None.
--
-- Notes:
----------------------------------------------------------
PROCEDURE  serviceChange;

----------------------------------------------------------
--
-- PROCEDURE     gwmSubnet
--
-- Description:
--        Get subnet string for this host (RAC only)
--
-- Parameters:
--      subnet       OUT    returned subnet string
--
-- Returns :
--      None.
--
-- Notes:
----------------------------------------------------------

PROCEDURE gwmSubnet (subnet OUT varchar2);

----------------------------------------------------------
--
-- FUNCTION     DBIsDowngradeable
--
-- Description:
--        Is Database downgradeable?
--
-- Parameters:
--      None
--
-- Returns :
--      TRUE - DB is downgradeable
--      FALSE - DB is not downgradeable
--
-- Notes:
----------------------------------------------------------

FUNCTION DBIsDowngradeable
  RETURN boolean;

----------------------------------------------------------
--
-- FUNCTION     params_to_dbparam_list
--
-- Description:
--        Converts params string in NVP format to dbparams_list type
--
-- Parameters:
--      params       IN     params string in NVP format
--      dbname       OUT    name of the database
--      dbparams     OUT    parameter collection in dbparams_list type
--
-- Returns :
--      TRUE - List was created
--      FALSE - string not in correct format (list not created)
--
-- Notes:
----------------------------------------------------------
FUNCTION params_to_dbparam_list ( params        IN        varchar2,
                                  dbname        OUT       varchar2,
                                  dbparams      OUT       dbparams_list )
RETURN boolean;

----------------------------------------------------------
--
-- PROCEDURE    setDBParameter
--
-- Description:
--        Sets a gsm parameter in the database.
--
-- Parameters:
--     pname             IN   parameter name
--     pvalue            IN   parameter value
--
-- Returns :
--      None.
--
-- Notes:
----------------------------------------------------------

PROCEDURE setDBParameter (pname IN varchar2, pvalue IN varchar2);
PROCEDURE setDBParameter (pname IN varchar2, pvalues IN region_list_t);
PROCEDURE setDBParameter (pname IN varchar2, pvalues IN param_value_list_t);

PROCEDURE resetDBParameter (pname varchar2);
 ----------------------------------------------------------------------------
PROCEDURE gsm_list_to_gsm_params( gsm_list    IN    gsm_list_t,
                                  gsm_params  OUT   param_value_list_t );

----------------------------------------------------------
--
-- FUNCTION    inst_list_to_inst_string
--
-- Description:
--        convert instance_list to a string format.
--
-- Parameters:
--     instances         IN   list of instances to convert
--
-- Returns :
--      Instance string in varchar2
--
-- Notes:
----------------------------------------------------------
FUNCTION inst_list_to_inst_string (instances     IN  instance_list)
RETURN varchar2;

----------------------------------------------------------
--
-- FUNCTION   isCDB
--
-- Description:
--        Check if the database is a consolidated one.
--
-- Parameters:
--       None.
--
-- Returns :
--       TRUE if the database is a consolidated one, FALSE otherwise.
--
-- Notes:
----------------------------------------------------------
FUNCTION isCDB RETURN boolean;

--*****************************************************************************
-- End of Package Public Procedures
--*****************************************************************************

END dbms_gsm_common;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "GSMADMIN_INTERNAL"."DBMS_GSM_UTILITY" AS

--*****************************************************************************
-- Package Public Variables
--*****************************************************************************

--version of GDSCTL connected to this session
gdsctl_vers    number DEFAULT NULL;

-- sessioninfo    gsm_session;


--*****************************************************************************
-- Package Public Types
--*****************************************************************************


--*****************************************************************************
-- Package Public Constants
--*****************************************************************************

------------------------------------------------------------------------------
-- Catalog version lookup. This table is used to translate database version
-- string into catalog version (a number). Each time a new database release is
-- supported, we need to add a new record to this lookup table. Several
-- database releases may resolve to the same catalog version if nothing
-- in the catalog interface changed between database releases (highly
-- unlikely, but possible). Changes in catalog interface will be:
--
--   - any changes to existing database objects or additions of new
--     database objects
--
--   - any changes to existing external PL/SQL procedure interfaces
--     executed in the catalog, or additions of new external PL/SQL
--     procedures executed in the catalog. This includes
--     all external functions and procedures in DBMS_GSM_POOLADMIN
--     and DBMS_GSM_CLOUDADMIN, and some procedures in DBMS_GSM_UTILITY
--     and DBMS_GSM_COMMON. If you are unsure, bump the catalog version.
--
-- NOTE: Adding a new catalog version may require new entries in the version
--       compatibility tables below
--
--       Making changes in minor patches is not allowed because they will
--       not be installed correctly
------------------------------------------------------------------------------
catvers_lookup    constant   tvers_lookup_t := tvers_lookup_t(
--        Database Version       Catalog Version
--------------------------------------------------
tvers_rec('12.1.0.1',                 1),
tvers_rec('12.1.0.2',                 2)
);

------------------------------------------------------------------------------
-- GSM version lookup. This table is used to translate GSM version
-- string into GSM version (a number). Each time a new GSM release is
-- supported, we need to add a new record to this lookup table. Several
-- GSM releases may resolve to the same GSM version number if nothing
-- in the GSM interface changed between database releases (highly
-- unlikely, but possible).
--
-- NOTE: Adding a new GSM version may require new entries in the version
--       compatibility tables below
--
--       Making changes in minor patches will require addding another level
--       to the version string
------------------------------------------------------------------------------
gsmvers_lookup    constant   tvers_lookup_t := tvers_lookup_t(
--     GSM Version String      GSM Version number
--------------------------------------------------
tvers_rec('12.1.0.1',                 1),
tvers_rec('12.1.0.2',                 2)
);

------------------------------------------------------------------------------
-- cloud database version lookup. This table is used to translate DB version
-- string into database version (a number). Each time a new DB release is
-- supported, we need to add a new record to this lookup table. Several
-- DB releases may resolve to the same DB version number if nothing
-- in the Database interface changed between database releases (highly
-- unlikely, but possible); but be aware that this would preclude a reverse
-- lookup (which we already use in the code) since a single version number
-- would resolve to several version strings.
--
-- Changes to the database interface will be:
--
--   - any changes to existing external PL/SQL procedure interfaces
--     executed in the cloud database, or additions of new external PL/SQL
--     procedures executed in the cloud database. This includes
--     all external functions and procedures in DBMS_GSM_DBADMIN
--     and some procedures in DBMS_GSM_UTILITY
--     and DBMS_GSM_COMMON. If you are unsure, bump the database version.
--
-- NOTE: Adding a new DB version may require new entries in the version
--       compatibility tables below
--
--       Making changes in minor patches is not allowed because they will
--       not be installed correctly
------------------------------------------------------------------------------
dbvers_lookup    constant   tvers_lookup_t := tvers_lookup_t(
--      DB Version String      DB Version number
--------------------------------------------------
tvers_rec('12.1.0.1',                 1),
tvers_rec('12.1.0.2',                 2)
);

------------------------------------------------------------------------------
-- GDSCTL version lookup. This table is used to translate GDSCTL version
-- string into GDSCTL version (a number). Each time a new GDSCTL release is
-- supported, we need to add a new record to this lookup table. Several
-- GDSCTL releases may resolve to the same GDSCTL version number if nothing
-- in the GDSCTL interface changed between database releases (highly
-- unlikely, but possible).
--
-- NOTE: Adding a new GDSCTL version may require new entries in the version
--       compatibility tables below
--
--       Making changes in minor patches will require addding another level
--       to the version string
------------------------------------------------------------------------------
gdsctlvers_lookup    constant   tvers_lookup_t := tvers_lookup_t(
--  GDSCTL Version String     GDSCTL Version number
--------------------------------------------------
tvers_rec('12.1.0.1',                 1),
tvers_rec('12.1.0.2',                 2)
);

-------------------------------------------------------------------------------
-- GDSCTL <=> catalog version compatibility lookup
-- Each known GDSCTL version will have a list of compatible catalog versions
-- Current versioning rule:
--     - catalog version should always be greater than or equal to
--       GDSCTL version
-------------------------------------------------------------------------------
gdsctl_catalog_lookup    constant   vers_lookup_t := vers_lookup_t(
--          GDSCTL VERSION       Compatible catalog versions
------------------------------------------------------------------------
vers_lookup_rec(   1,                  vers_list(1,2) ),
vers_lookup_rec(   2,                  vers_list(2)   )
);

-------------------------------------------------------------------------------
-- GSM <=> catalog version compatibility lookup
-- Each known GSM version will have a list of compatible catalog versions
-- Current versioning rule:
--     - catalog version should always be greater than or equal to
--       GSM version
-------------------------------------------------------------------------------
gsm_catalog_lookup    constant   vers_lookup_t := vers_lookup_t(
--             GSM VERSION       Compatible catalog versions
------------------------------------------------------------------------
vers_lookup_rec(   1,                  vers_list(1,2) ),
vers_lookup_rec(   2,                  vers_list(2)   )
);

-------------------------------------------------------------------------------
-- Default Names
-------------------------------------------------------------------------------
default_cloud_name      constant   varchar2(10) := 'oradbcloud';


-------------------------------------------------------------------------------
-- Identifier lengths
-------------------------------------------------------------------------------

-- Must honor max service name lengths defined by database
max_service_name_len     constant  number := 64;
max_net_service_name_len constant  number := 250;

-- max length of an instance name
max_inst_name_len        constant  number := 16;

-- max length of AQ parameters
-- (matches size of additional_params in
--  type gsm_change_message, see catgwm.sql)
max_param_len            constant  number := 4000;

-- Max number of VNCRs
max_vncr_number constant  number :=300;

-- Max number of services
max_services    constant  number := 1000;

-- Maximum number of database pools
max_dbpools       constant  number := 20;

-------------------------------------------------------------------------------
-- Change Log Queue and generateChangeLogEntry() definitions.
-- These constants are defined for use with generateChangeLogEntry().
-- They are also the values stored in a gsm_change_message.
--
-- NOTE: The values are used to identify AQ messages that are sent to the GSM.
--       This is the primary way in which the catalog communicates with the GSM
--       servers. We currently allow the GSM server to be at a lower level than
--       the catalog (but not vice-versa). Be *VERY* careful not to change
--       the format of any existing AQ message in such a way that a prior
--       version of the GSM will not understand it. If there is a requirement,
--       add a new AQ message type, and be aware that new AQ message types
--       that are not understood by old GSM servers will simply be ignored.
--       Use the "version" field in the "gsm" table to work out how to handle
--       different situations.
-------------------------------------------------------------------------------

-- "adminId" values for generateChangeLogEntry().
-- These constants define the package that generated the change entry.
-- Also stored in the the change log queue in gsm_change_message.admin_id.

cloud_admin            constant   number := 1;
pool_admin             constant   number := 2;

-- special gsm_requests sequence ID for pending GDSCTL warnings
pendingWarning         constant   number := -1;

-- "changeId" values for generateChangeLogEntry() when adminId is cloud_admin.
-- "target" of command is always the object name (e.g. GSM name).
--  Also stored in the change log queue in gsm_change_message.change_id.

add_gsm                constant   number := 1;
modify_gsm             constant   number := 2;
drop_gsm               constant   number := 3;
start_gsm              constant   number := 4;
stop_gsm               constant   number := 5;

add_region             constant   number := 10;
modify_region          constant   number := 11;
drop_region            constant   number := 12;

add_database_pool      constant   number := 20;
modify_database_pool   constant   number := 21;
drop_database_pool     constant   number := 22;

-- "changeId" values for generateChangeLogEntry() when adminId is pool_admin.
-- "target" of command is always the object name (e.g. database or service name)
-- Also stored in the change log queue in gsm_change_message.change_id.

add_database           constant   number := 30;
modify_database        constant   number := 31;
drop_database          constant   number := 32;
start_database         constant   number := 33;
stop_database          constant   number := 34;
drop_db_phys           constant   number := 35;
add_broker_config      constant   number := 36;
mod_db_status          constant   number := 37;
add_db_done            constant   number := 38;
sync_database          constant   number := 39;

add_service            constant   number := 50;
modify_service         constant   number := 51;
drop_service           constant   number := 52;
relocate_service       constant   number := 53;
start_service          constant   number := 54;
stop_service           constant   number := 55;
enable_service         constant   number := 56;
disable_service        constant   number := 57;
add_service_to_dbs     constant   number := 58;
move_service_to_db     constant   number := 59;
make_dbs_preferred     constant   number := 60;
modify_service_config  constant   number := 61;
modify_service_on_db   constant   number := 62;
update_service_state   constant   number := 63;
add_vncr               constant   number := 70;
remove_vncr            constant   number := 71;
drop_service_ph        constant   number := 72;
drop_broker_config     constant   number := 73;
drop_bc_phys           constant   number := 74;
sync_broker_config     constant   number := 75;
mod_db_vers            constant   number := 76;
-- Special number for warning messages
plsql_warning          constant   number := 77;


-- catalog rollback IDs. There should be a matching "do it" ID above
-- for simplicity, we are just adding 100 to the "do it" counterpart
rb_drop_service           constant  number := 152;
rb_modify_service_on_db   constant  number := 162;

--*****************************************************************************
-- Package Public Exceptions
--*****************************************************************************


--*****************************************************************************
-- Package Public Procedures
--*****************************************************************************
-------------------------------------------------------------------------------
--
-- PROCEDURE     getCatalogLock
--
-- Description:
--       Gets the catalog lock prior to making a change to the cloud catalog.
--
-- Parameters:
--       currentChangeSeq -    The current value of cloud.change_seq#
--                             This is the sequence # of the last committed
--                             change.
--
-------------------------------------------------------------------------------

PROCEDURE getCatalogLock( currentChangeSeq OUT number);


-------------------------------------------------------------------------------
--
-- PROCEDURE     releaseCatalogLock
--
-- Description:
--      Releases the catalog lock and commits or rolls back the changes
--      made under the lock.
--
-- Parameters:
--      action:  "releaseLockCommit" -> release lock and commit all
--                             changes
--               "releaseLockRollback" -> release lock and rollback
--                             all changes
--      changeSeq: If "action" = "releaseLockCommit" this is the change
--                 sequence number of the the last change made under this lock.
--                 If "action" = "releaseLockRollback" then will be set to 0.
--
--
-- Notes:
--
-------------------------------------------------------------------------------

releaseLockCommit           constant  number := 1;
releaseLockRollback         constant  number := 2;


PROCEDURE releaseCatalogLock( action    IN number default releaseLockCommit,
                              changeSeq OUT number );

-------------------------------------------------------------------------------
--
-- FUNCTION     regionExists
--
-- Description:
--    Checks if the specified region exists in the cloud catalog.
--
-- Parameters:
--    region_name:   The region to check.
--    region_num:    If the region exists, returns its number
--
-- Returns:
--    TRUE if the region is in the cloud catalog.
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION regionExists( region_name IN  varchar2,
                       region_num  OUT number )
  RETURN boolean;

-------------------------------------------------------------------------------
--
-- FUNCTION     databasePoolExists
--
-- Description:
--   Checks if the specified database pool exists in the cloud catalog.
--
-- Parameters:
--   database_pool_name:  The pool to check.
--
-- Returns:
--   TRUE if the database pool is in the cloud catalog.
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION databasePoolExists( database_pool_name IN varchar2 )
  RETURN boolean;

-------------------------------------------------------------------------------
--
-- FUNCTION     prepareName
--
-- Description:
--       Verifies the length of a (service, GSM, etc) name and prepares
--       it for use by the GSM package.
--
--       Trims off leading and trailing spaces and converts it to lower
--       case.
--
-- Parameters:
--       in_name:     The name to check and and prepare for use.
--       out_name:    The prepared name.
--       max_length:  The maximum allowable length for out_name.
--
-- Returns:
--    TRUE if the name is the correct length.
--    FALSE otherwise (out_name will not be set).
--
-- Notes:
--   Names of GSM objects (services, GSMs, regions, etc) are stored in the
--   catalog in lower case.
--
-------------------------------------------------------------------------------
FUNCTION prepareName( in_name     IN  varchar2,
                      out_name    OUT varchar2,
                      max_length  IN  number )
  RETURN boolean;

-------------------------------------------------------------------------------
--
-- FUNCTION     prepareRegionName
--
-- Description:
--     Returns the region name to use on a dbms_gsm_* call when the region
--     name in the routine call can be NULL.
--
--     If the supplied name is NULL will determine if a default region name
--     can be used and returns it.  A default only exists if a single
--     region has been defined.  The default is that region.  If more than one
--     region has been defined, then a default cannot be picked and FALSE is
--     returned.
--
--     If the supplied name is not NULL, then verifies that it is the right
--     length and prepares it for use: trims off leading and trailing spaces
--     and converts to upper case.
--
--
-- Parameters:
--       input_name  (INPUT)  - the supplied name (can be NULL)
--       region_name (OUTPUT) - the region name to use
--
-- Returns:
--       TRUE if a valid region name can be returned
--       FALSE if not
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION prepareRegionName( input_name IN varchar2,
                            region_name OUT varchar2 )
  RETURN boolean;

-------------------------------------------------------------------------------
--
-- FUNCTION     prepareDBPoolName
--
-- Description:
--     Returns the database pool name to use on a dbms_gsm_* call when the
--     database pool name in the routine call can be NULL.
--
--     If the supplied name is NULL will determine if a default database pool
--     name can be used and returns it.  A default only exists if a single
--     pool has been defined.  The default is that pool.  If more than one
--     pool has been defined, then a default cannot be picked and FALSE is
--     returned.
--
--     If the supplied name is not NULL, then verifies that it is the right
--     length and prepares it for use: trims off leading and trailing spaces
--     and converts to upper case.
--
--
-- Parameters:
--       input_name         (INPUT)  - the supplied name (can be NULL)
--       database_pool_name (OUTPUT) - the database pool name to use
--
-- Returns:
--       TRUE if a valid database pool name can be returned
--       FALSE if not
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION prepareDBPoolName( input_name         IN  varchar2,
                            database_pool_name OUT varchar2 )
  RETURN boolean;


-------------------------------------------------------------------------------
--
-- PROCEDURE     generateChangeLogEntry
--
-- Description:
--       Generates a description of a change and puts it into the
--       change log queue.
--
-- Parameters:
--       adminId:   package that is calling this routine
--                  "cloud_admin" - dbms_gsm_cloudadmin package
--                  "pool_admin"  - dbms_gsm_pooladmin package
--       changeId:  the change made (see constant definitions above)
--       target:    command target (e.g. gsm name for "add gsm")
--       poolName:  database pool (only if adminId = pool_admin)
--       params:    additional parameters for the change
--       updateRequestTable: whether or not to also put the change into
--                   gsm_requests table
--
--
-- Notes:
--   See constant definitions above for "adminId" and "changeId" parameters.
--
-------------------------------------------------------------------------------

updateFalse  constant  number := 0;
updateTrue   constant  number := 1;

PROCEDURE generateChangeLogEntry( adminId             IN number,
                                  changeId            IN number,
                                  target              IN varchar2,
                                  poolName            IN varchar2 default NULL,
                                  params              IN varchar2 default NULL,
                                  updateRequestTable  IN number
                                     default updateTrue,
                                  old_instances       IN instance_list
                                     default NULL);


-------------------------------------------------------------------------------
--
-- PROCEDURE     raise_gsm_warning
--
-- Description:
--       Causes a warning message to display on GDSCTL session. Can be used
--       during catalog processing only
--
-- Parameters:
--       message_id: numeric value of warning message
--       parms       message parameters (if any)
--
-- Notes:
--   causes a warning message to be sent to GDSCTL by adding a new record
--   to gsm_requests. Does not interrupt processing
--
-------------------------------------------------------------------------------
PROCEDURE raise_gsm_warning (message_id     IN   number,
                             parms          IN   message_param_list
                                DEFAULT message_param_list());

-------------------------------------------------------------------------------
--
-- PROCEDURE     removeStaleRequests
--
-- Description:
--       Removes stale entries from gsm_requests
--
-- Parameters:
--       age:    IN    Requests older than this are removed
--
--
-- Notes:
-------------------------------------------------------------------------------
PROCEDURE removeStaleRequests; --(age IN INTERVAL DAY TO SECOND
--                                          default '10 minutes');

------------------------------------------------------------------------------
--
-- PROCEDURE isLockedByMaster
--
-- Description:
--      Determines if master locak is already taken
--
-- Parameters:
--      None
--
-- Returns:
--      0 - Master lock is not taken
--      1 - Master Lock is taken
--
------------------------------------------------------------------------------
FUNCTION isLockedByMaster
  RETURN integer;

------------------------------------------------------------------------------
--
-- PROCEDURE RSAEncoder
--
-- Description:
--      Encrypt input string to byte array using PKCS
--
-- Parameters:
--      input:      IN    String to be encrypted
--      keybyte:    IN    PKI public key bytes
--      output:     OUT   Encrypted bytes
--
--
------------------------------------------------------------------------------

PROCEDURE RSAEncoder( input      IN    varchar2,
                      keybyte    IN    RAW,
                      output     OUT   RAW);

-------------------------------------------------------------------------------
--
-- FUNCTION     maxDBInstances
--
-- Description:
--       Queries the database parameter setting for the maximum number of
--       instances to reserve for a cloud database.
--
-- Parameters:
--       None
--
-- Returns:
--       The maximum.
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION maxDBInstances
  RETURN number;

------------------------------------------------------------------------------
--
-- PROCEDURE reserveInstNums
--
-- Description:
--    Reserve reserve_count database numbers from cloud
--
-- Notes:
--   Only useful for PL/SQL calls, current value should be known already
--   otherwise this function has no good use.
--
------------------------------------------------------------------------------
PROCEDURE reserveInstNums( reserve_count IN number );

------------------------------------------------------------------------------
--
-- FUNCTION reserveNextDBNum
--
-- Description:
--   Reserves the next available DB number for use.
--
-- Returns:
--   The next available number
--
-- Notes:
--   This function updates the cloud table, but does not commit. The caller
--   is expected to commit (if the number is used), or rollback (if the
--   number can be re-used). An update lock on the cloud table will be held
--   until the caller either commits or rolls back.
--
------------------------------------------------------------------------------
FUNCTION reserveNextDBNum( reserve_count   IN number default NULL)
  RETURN number;

------------------------------------------------------------------------------
--
-- FUNCTION getFieldSize
--
-- Description:
--   gets the size of a database field
--
-- Returns:
--   size
--
-- Notes:
--   Used internally by PL/SQL to verify the size of input strings
--
------------------------------------------------------------------------------
FUNCTION getFieldSize( tab_name   IN varchar2,
                       col_name   IN varchar2)
  RETURN number;

------------------------------------------------------------------------------
--
-- FUNCTION getCatalogVersion
--
-- Description:
--   returns the version of this catalog
--
-- Returns:
--   catalog version (number)
--
-- Notes:
--    Catalog version is calculated from RDBMS version using a lookup table
--    (see description at the top of this file)
--
------------------------------------------------------------------------------
FUNCTION getCatalogVersion
  RETURN number;

------------------------------------------------------------------------------
--
-- FUNCTION getDBVersion
--
-- Description:
--   returns the version of this cloud database
--
-- Returns:
--   cloud database version (number)
--
-- Notes:
--    Database version is calculated from RDBMS version using a lookup table
--    (see description at the top of this file)
--
------------------------------------------------------------------------------
FUNCTION getDBVersion
  RETURN number;

------------------------------------------------------------------------------
--
-- FUNCTION DBVersRevLookup
--
-- Description:
--   returns the database version string given version number (reverse lookup)
--
-- Parameters:
--      dbvers - Database version number to look up
--
-- Returns:
--   cloud database version string
--
-- Notes:
--    Database version string is calculated from input using a lookup table
--    (see description at the top of this file)
--
------------------------------------------------------------------------------
FUNCTION DBVersRevLookup (dbvers    IN    number)
   RETURN varchar2;

------------------------------------------------------------------------------
--
-- FUNCTION GSMVersLookup
--
-- Description:
--   returns the numeric version of the GSM given version string
--
-- Parameters:
--      gsm_vers - GSM version to lookup
--
-- Returns:
--   GSM version (number)
--
-- Notes:
--    GSM version is calculated from version string using a lookup table
--    (see description at the top of this file)
--
------------------------------------------------------------------------------
FUNCTION GSMVersLookup (gsm_vers    IN    varchar2)
   RETURN number;

------------------------------------------------------------------------------
--
-- FUNCTION GDSCTLVersLookup
--
-- Description:
--   returns the numeric version of GDSCTL given version string
--
-- Parameters:
--      gdsctl_vers - GDSCTL version to lookup
--
-- Returns:
--   GDSCTL version (number)
--
-- Notes:
--    GDSCTL version is calculated from version string using a lookup table
--    (see description at the top of this file)
--
------------------------------------------------------------------------------
FUNCTION GDSCTLVersLookup (gdsctl_vers    IN    varchar2)
   RETURN number;

------------------------------------------------------------------------------
--
-- FUNCTION compatibleVersion
--
-- Description:
--   determines if provided versions are compatible with each other
--
-- Returns:
--   TRUE/FALSE - are versions compatible
--
-- Notes:
--   Compatible versions are determined from a lookup table (see description
--   at the top of this file)
--
------------------------------------------------------------------------------
FUNCTION compatibleVersion (gdsctl_version    number default NULL,
                            catalog_version   number default NULL,
                            gsm_version       number default NULL,
                            db_version        number default NULL)
  RETURN boolean;

--*****************************************************************************
-- End of Package Public Procedures
--*****************************************************************************

  -------------------------
  --  ERRORS AND EXCEPTIONS
  --
  --  When adding errors remember to add a corresponding exception below.
err_generic_gsm      constant number := -44850;
err_bad_db_name      constant number := -44851;
err_region_max       constant number := -44852;
err_vncr_max         constant number := -44853;
err_exist_cld        constant number := -44854;
err_invalid_cld      constant number := -44855;
err_invalid_cldsvc   constant number := -44856;
err_nfound_cld       constant number := -44857;
err_remove_cld       constant number := -44858;
err_exist_GSM        constant number := -44859;
err_nfound_region    constant number := -44860;
err_remove_vncr      constant number := -44861;
err_buddy_region     constant number := -44862;
err_last_region      constant number := -44863;
err_remove_rgn_gsm   constant number := -44864;
err_remove_pool      constant number := -44865;
err_non_broker       constant number := -44866;
err_already_in_pool  constant number := -44867;
err_is_broker        constant number := -44868;
err_net_name         constant number := -44869;
err_svc_non_bc       constant number := -44870;
err_svc_non_pa       constant number := -44871;
err_db_same          constant number := -44872;
err_db_offer         constant number := -44873;
err_db_not_offer     constant number := -44874;
err_invalid_param    constant number := -44875;
err_svc_is_rng       constant number := -44876;
err_svc_is_dis       constant number := -44877;
err_svc_is_lag       constant number := -44878;
err_no_region        constant number := -44879;
err_no_cld           constant number := -44880;
err_nonempty_pool    constant number := -44881;
err_bad_dbp_name     constant number := -44882;
err_bad_region_name  constant number := -44883;
err_bad_svc_name     constant number := -44884;
err_bad_vncr_name    constant number := -44885;
err_bad_vncrgrp_name constant number := -44886;
err_bad_gsm_name     constant number := -44887;
err_bad_gsmu_name    constant number := -44888;
err_exist_region     constant number := -44889;
err_exist_dbpool     constant number := -44890;
err_nfound_gsm       constant number := -44891;
err_nfound_dbpool    constant number := -44892;
err_nfound_database  constant number := -44893;
err_nfound_service   constant number := -44894;
err_remove_rgn_db    constant number := -44895;
err_svc_in_pool      constant number := -44896;
err_svc_lag          constant number := -44897;
err_svc_failover     constant number := -44898;
err_exist_vncr       constant number := -44899;
err_string_size      constant number := -44900;
err_rem_db           constant number := -45500;
err_max_gsm          constant number := -45501;
err_no_priv          constant number := -45502;
err_db_incloud       constant number := -45503;
err_nopref_all       constant number := -45504;
err_max_service      constant number := -45505;
err_max_pools        constant number := -45506;
-- information messages for VerifyCatalog
err_no_buddy         constant number := -45507;
err_no_dbregion      constant number := -45508;
err_bad_dbstatus     constant number := -45509;
err_gsm_request      constant number := -45510;
err_no_preferred     constant number := -45511;
err_no_lcl_pref      constant number := -45512;
err_no_service       constant number := -45513;
err_no_dbreg         constant number := -45514;
err_no_gsm_reg       constant number := -45515;
err_pool_db          constant number := -45516;
err_pool_svc         constant number := -45517;
-- end information messages for VerifyCatalog
err_lag_lgsdby       constant number := -45518;
err_empty_dbpool     constant number := -45519;
err_loc_failover     constant number := -45520;
err_role_failover    constant number := -45521;
err_svc_relocate     constant number := -45522;
err_service_stopped  constant number := -45523;
err_need_dbp_name    constant number := -45524;
err_bad_retention    constant number := -45525;
err_bad_replay       constant number := -45526;
err_db_incompat      constant number := -45527;
err_svc_stopped      constant number := -45528;
err_db_spfile        constant number := -45529;
err_local_exists     constant number := -45530;
err_in_cloud         constant number := -45531;
err_is_cat           constant number := -45532;
err_service_change   constant number := -45533;
err_gsm_running      constant number := -45534;
err_unknown_catvers  constant number := -45535;
err_bad_gdscl_vers   constant number := -45536;
err_bad_gsmvers      constant number := -45537;
err_bad_dbvers       constant number := -45538;
err_add_to_pool      constant number := -45539;
err_srvctl_failed    constant number := -45540;
err_invalid_admin    constant number := -45541;
err_invalid_norac    constant number := -45542;
err_invalid_policy   constant number := -45543;
err_invalid_weight   constant number := -45544;
err_no_inst          constant number := -45545;
err_noproc           constant number := -45546;
err_srvctl_parms     constant number := -45547;
err_downg_db         constant number := -45548; -- Warning
err_no_curgsm        constant number := -45549;
err_nonexist_svc     constant number := -45550;
err_noexist_inst     constant number := -45551; -- Warning
err_no_del           constant number := -45552;
err_no_svc_inst      constant number := -45553;
err_no_svcs          constant number := -45554;
err_npa_db           constant number := -45555;
err_bad_disable      constant number := -45556;
err_empty_pool       constant number := -45557;
err_no_pools         constant number := -45558;
err_no_gsm_vers      constant number := -45559;
err_no_prefs         constant number := -45560;
err_no_region_name   constant number := -45561;
err_pdb_catalog      constant number := -45562;
err_pdb_pooldb       constant number := -45563;
err_cont_sleep       constant number := -45564;
err_old_gdsctl       constant number := -45568;

generic_gsm       EXCEPTION;
PRAGMA EXCEPTION_INIT(generic_gsm,      -44850);
bad_db_name      EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_db_name,      -44851);
region_max        EXCEPTION;
PRAGMA EXCEPTION_INIT(region_max,       -44852);
vncr_max          EXCEPTION;
PRAGMA EXCEPTION_INIT(vncr_max,         -44853);
exist_cld         EXCEPTION;
PRAGMA EXCEPTION_INIT(exist_cld,        -44854);
invalid_cld       EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_cld,      -44855);
invalid_cldsvc    EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_cldsvc,   -44856);
nfound_cld        EXCEPTION;
PRAGMA EXCEPTION_INIT(nfound_cld,       -44857);
remove_cld        EXCEPTION;
PRAGMA EXCEPTION_INIT(remove_cld,       -44858);
exist_GSM      EXCEPTION;
PRAGMA EXCEPTION_INIT(exist_GSM   ,     -44859);
nfound_region     EXCEPTION;
PRAGMA EXCEPTION_INIT(nfound_region,    -44860);
exremove_vncr     EXCEPTION;
PRAGMA EXCEPTION_INIT(exremove_vncr,    -44861);
buddy_region      EXCEPTION;
PRAGMA EXCEPTION_INIT(buddy_region,     -44862);
last_region       EXCEPTION;
PRAGMA EXCEPTION_INIT(last_region,      -44863);
remove_rgn_gsm        EXCEPTION;
PRAGMA EXCEPTION_INIT(remove_rgn_gsm,   -44864);
remove_pool       EXCEPTION;
PRAGMA EXCEPTION_INIT(remove_pool,      -44865);
non_broker        EXCEPTION;
PRAGMA EXCEPTION_INIT(non_broker,       -44866);
already_in_pool   EXCEPTION;
PRAGMA EXCEPTION_INIT(already_in_pool,  -44867);
is_broker         EXCEPTION;
PRAGMA EXCEPTION_INIT(is_broker,        -44868);
net_name          EXCEPTION;
PRAGMA EXCEPTION_INIT(net_name,         -44869);
svc_non_bc        EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_non_bc,       -44870);
svc_non_pa        EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_non_pa,       -44871);
db_same           EXCEPTION;
PRAGMA EXCEPTION_INIT(db_same,          -44872);
db_offer          EXCEPTION;
PRAGMA EXCEPTION_INIT(db_offer,         -44873);
db_not_offer      EXCEPTION;
PRAGMA EXCEPTION_INIT(db_not_offer,     -44874);
invalid_param     EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_param,    -44875);
svc_is_rng        EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_is_rng,       -44876);
svc_is_dis        EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_is_dis,       -44877);
svc_is_lag        EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_is_lag,       -44878);
no_region         EXCEPTION;
PRAGMA EXCEPTION_INIT(no_region,        -44879);
no_cld         EXCEPTION;
PRAGMA EXCEPTION_INIT(no_cld   ,        -44880);
nonempty_pool         EXCEPTION;
PRAGMA EXCEPTION_INIT(nonempty_pool ,   -44881);
bad_dbp_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_dbp_name  ,   -44882);
bad_region_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_region_name , -44883);
bad_svc_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_svc_name  ,   -44884);
bad_vncr_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_vncr_name  ,  -44885);
bad_vncrgrp_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_vncrgrp_name, -44886);
bad_gsm_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_gsm_name  ,   -44887);
bad_gsmu_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_gsmu_name  ,  -44888);
exist_region         EXCEPTION;
PRAGMA EXCEPTION_INIT(exist_region   ,  -44889);
exist_dbpool         EXCEPTION;
PRAGMA EXCEPTION_INIT(exist_dbpool   ,  -44890);
nfound_gsm         EXCEPTION;
PRAGMA EXCEPTION_INIT(nfound_gsm     ,  -44891);
nfound_dbpool         EXCEPTION;
PRAGMA EXCEPTION_INIT(nfound_dbpool  ,  -44892);
nfound_database         EXCEPTION;
PRAGMA EXCEPTION_INIT(nfound_database,  -44893);
nfound_service        EXCEPTION;
PRAGMA EXCEPTION_INIT(nfound_service ,  -44894);
remove_rgn_db            EXCEPTION;
PRAGMA EXCEPTION_INIT(remove_rgn_db ,   -44895);
svc_in_pool            EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_in_pool   ,   -44896);
svc_lag            EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_lag       ,   -44897);
svc_failover            EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_failover  ,   -44898);
exist_vncr            EXCEPTION;
PRAGMA EXCEPTION_INIT(exist_vncr    ,   -44899);
string_size            EXCEPTION;
PRAGMA EXCEPTION_INIT(string_size    ,  -44900);
rem_db            EXCEPTION;
PRAGMA EXCEPTION_INIT(rem_db    ,       -45500);
max_gsm            EXCEPTION;
PRAGMA EXCEPTION_INIT(max_gsm    ,      -45501);
no_priv            EXCEPTION;
PRAGMA EXCEPTION_INIT(no_priv    ,      -45502);
db_incloud            EXCEPTION;
PRAGMA EXCEPTION_INIT(db_incloud    ,   -45503);
nopref_all            EXCEPTION;
PRAGMA EXCEPTION_INIT(nopref_all    ,   -45504);
max_service            EXCEPTION;
PRAGMA EXCEPTION_INIT(max_service    ,  -45505);
max_pools          EXCEPTION;
PRAGMA EXCEPTION_INIT(max_pools    ,  -45506);
empty_dbpool          EXCEPTION;
PRAGMA EXCEPTION_INIT(empty_dbpool    ,  -45519);
loc_failover          EXCEPTION;
PRAGMA EXCEPTION_INIT(loc_failover    ,  -45520);
role_failover          EXCEPTION;
PRAGMA EXCEPTION_INIT(role_failover    ,  -45521);
svc_relocate          EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_relocate    ,  -45522);
svc_stopped          EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_stopped    ,  -45523);
need_dbp_name         EXCEPTION;
PRAGMA EXCEPTION_INIT(need_dbp_name   ,  -45524);
bad_retention          EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_retention    ,  -45525);
bad_replay        EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_replay    ,  -45526);
db_incompat        EXCEPTION;
PRAGMA EXCEPTION_INIT(db_incompat    ,  -45527);
svc_stopped        EXCEPTION;
PRAGMA EXCEPTION_INIT(svc_stopped    ,  -45528);
db_spfile        EXCEPTION;
PRAGMA EXCEPTION_INIT(db_spfile    ,  -45529);
local_exists        EXCEPTION;
PRAGMA EXCEPTION_INIT(local_exists    ,  -45530);
in_cloud        EXCEPTION;
PRAGMA EXCEPTION_INIT(in_cloud    ,  -45531);
is_cat        EXCEPTION;
PRAGMA EXCEPTION_INIT(is_cat    ,  -45532);
service_change        EXCEPTION;
PRAGMA EXCEPTION_INIT(service_change ,  -45533);
gsm_running        EXCEPTION;
PRAGMA EXCEPTION_INIT(gsm_running ,  -45534);
unknown_catvers        EXCEPTION;
PRAGMA EXCEPTION_INIT(unknown_catvers ,  -45535);
bad_gdsctl_vers        EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_gdsctl_vers ,  -45536);
bad_gsmvers        EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_gsmvers ,  -45537);
bad_dbvers        EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_dbvers ,  -45538);
add_to_pool       EXCEPTION;
PRAGMA EXCEPTION_INIT(add_to_pool,       -45539);
srvctl_failed       EXCEPTION;
PRAGMA EXCEPTION_INIT(srvctl_failed,       -45540);
invalid_admin       EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_admin,       -45541);
invalid_norac       EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_norac,       -45542);
invalid_policy      EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_policy,       -45543);
invalid_weight      EXCEPTION;
PRAGMA EXCEPTION_INIT(invalid_weight,       -45544);
no_inst      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_inst,       -45545);
noproc      EXCEPTION;
PRAGMA EXCEPTION_INIT(noproc,       -45546);
srvctl_parms      EXCEPTION;
PRAGMA EXCEPTION_INIT(srvctl_parms,       -45547);
downg_db      EXCEPTION;
PRAGMA EXCEPTION_INIT(downg_db,       -45548);
no_curgsm      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_curgsm,       -45549);
nonexist_svc      EXCEPTION;
PRAGMA EXCEPTION_INIT(nonexist_svc,       -45550);
noexist_inst      EXCEPTION;
PRAGMA EXCEPTION_INIT(noexist_inst,       -45551);
no_del      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_del,       -45552);
no_svc_inst      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_svc_inst,       -45553);
no_svcs     EXCEPTION;
PRAGMA EXCEPTION_INIT(no_svcs,       -45554);
npa_db      EXCEPTION;
PRAGMA EXCEPTION_INIT(npa_db,       -45555);
bad_disable      EXCEPTION;
PRAGMA EXCEPTION_INIT(bad_disable,       -45556);
empty_pool      EXCEPTION;
PRAGMA EXCEPTION_INIT(empty_pool,       -45557);
no_pools      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_pools,       -45558);
no_gsm_vers      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_gsm_vers,       -45559);
no_prefs      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_prefs,       -45560);
no_region_name      EXCEPTION;
PRAGMA EXCEPTION_INIT(no_region_name,       -45561);
pdb_catalog        EXCEPTION;
PRAGMA EXCEPTION_INIT(pdb_catalog,       -45562);
pdb_pooldb        EXCEPTION;
PRAGMA EXCEPTION_INIT(pdb_pooldb,       -45563);
cont_sleep            EXCEPTION;
PRAGMA EXCEPTION_INIT(cont_sleep    ,      -45564);
END dbms_gsm_utility;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "GSMADMIN_INTERNAL"."DBMS_GSM_NOPRIV" AS

--*****************************************************************************
-- NOTE: This package is executeable by public. We *MUST* ensure that the
-- calling user has the correct catalog privileges at the start of every
-- procedure before executing any other code with the package.
--*****************************************************************************


--*****************************************************************************
-- Package Public Types
--*****************************************************************************

-- Update modes for catalog lock
noUpdate constant  number := 0;  -- catalog is not updated
updNoGSM constant  number := 1;  -- catalog Update does not require running GSM
updGSM   constant  number := 2;  -- catalog update requires running GSM

--*****************************************************************************
-- Package Public Constants
--*****************************************************************************

--*****************************************************************************
-- Package Public Exceptions
--*****************************************************************************


--*****************************************************************************
-- Package Public Procedures
--*****************************************************************************
-------------------------------------------------------------------------------
--
-- PROCEDURE     getCatalogLock
--
-- Description:
--       Gets the catalog lock prior to making a change to the cloud catalog.
--
-- Parameters:
--       currentChangeSeq -    The current value of cloud.change_seq#
--                             This is the sequence # of the last committed
--                             change.
--       privs                 Privilege required for this lock operation
--       gdsctl_version        Version of gdsctl (GDSCTL interface only)
--       gsm_version           Version of GSM (GSM interface only)
--       gsm_name              Name of GSM (GSM interface only)
--       catalog_version       Version of the catalog
--
-- Notes:
--       WARNING: This function is executabble by "public" and runs with
--       gsmadmin_internal privileges. It *MUST* check that the real calling
--       session user has the privilege to peform catalog operations first
--       (before anything else is done). The "privs" and "pool_name"
--       parameters provide the require privileges for the current "lock"
--       operation. The sequence of events is that the user "locks" the catalog,
--       performs the desired operation, and then unlocks the catalog
--
-------------------------------------------------------------------------------

GSMAdmin                    constant    number := 1;
GSMPoolAdmin                constant    number := 2;

-- overloaded old version for backwards compatibility
PROCEDURE getCatalogLock( currentChangeSeq OUT number,
                          privs IN number default GSMAdmin);
-- version called by GDSCTL
PROCEDURE getCatalogLock( currentChangeSeq OUT    number,
                          privs            IN     number default GSMAdmin,
                          gdsctl_version   IN     varchar2 default NULL,
                          catalog_version  OUT    number,
                          update_mode      IN     number
                               default updNoGSM);
-- version called by GSM servers
PROCEDURE getCatalogLock( currentChangeSeq OUT    number,
                          privs            IN     number default GSMAdmin,
                          gsm_version      IN     varchar2 default NULL,
                          gsm_name         IN     varchar2 default NULL,
                          catalog_version  OUT    number,
                          update_mode      IN     number
                               default noUpdate);

-------------------------------------------------------------------------------
--
-- PROCEDURE     releaseCatalogLock
--
-- Description:
--      Releases the catalog lock and commits or rolls back the changes
--      made under the lock.
--
-- Parameters:
--      action:  "releaseLockCommit" -> release lock and commit all
--                             changes
--               "releaseLockRollback" -> release lock and rollback
--                             all changes
--      changeSeq: If "action" = "releaseLockCommit" this is the change
--                 sequence number of the the last change made under this lock.
--                 If "action" = "releaseLockRollback" then will be set to 0.
--
--
-- Notes:
--
-------------------------------------------------------------------------------

releaseLockCommit           constant  number := 1;
releaseLockRollback         constant  number := 2;


PROCEDURE releaseCatalogLock( action    IN number default releaseLockCommit,
                              changeSeq OUT number );


END dbms_gsm_nopriv;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "GSMADMIN_INTERNAL"."DBMS_GSM_DBADMIN" AS

--*****************************************************************************
-- Package Public Constants
--*****************************************************************************

-- RAC status values (must match defines for gwm_rac_status in gwm2.h
--
GWM_NORAC       constant  pls_integer := 0;  -- database not on RAC
GWM_RAC_ADMIN   constant  pls_integer := 1;  -- database on admin managed RAC
GWM_RAC_POLICY  constant  pls_integer := 2;  -- database on policy managed RAC
GWM_RAC_UNKNOWN constant  pls_integer := 3;  -- unknown RAC status

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     addDatabase
  --
  -- Description:
  --     Adds this database to the GDS framework (cloud)
  --
  -- Parameters:
  --     cloud_name - Name of the cloud (gds framework)
  --     dbpool_name - database pool to which database is added
  --     region_name - region of database
  --     db_number  - catalog assigned (generated) database number
  --     num_instances_reserved - number of instance slots reserved for
  --                             this database
  --     force - force the add if it has already been added
  --     cpu_thresh
  --     srlat_thresh
  --
  -- Notes:
  --    Sets a number of database parameters to hold GDS related values
  -----------------------------------------------------------------------------
  PROCEDURE addDatabase( cloud_name              IN varchar2,
			 dbpool_name             IN varchar2,
			 region_name             IN varchar2,
			 db_number               IN number,
                         num_instances_reserved  IN number
             		              default dbms_gsm_common.max_inst_default,
                         force                   IN number
                                      default dbms_gsm_common.isFalse,
			 cpu_thresh              IN number default NULL,
			 srlat_thresh            IN number default NULL);

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     modifyDatabase
  --
  -- Description: changes the region of the database
  --
  -- Parameters:
  --   region_name - new region name
  --   cpu_thresh
  --   srlat_thresh
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE modifyDatabase( region_name          IN varchar2 ,
                            cpu_thresh IN number default NULL,
                            srlat_thresh IN number default NULL );

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     validateDatabase
  --
  -- Description:
  --    Validate database existence and return local DB info
  --
  -- Parameters:
  --   dbpool - dbpool that database existis in
  --   db_unique_name - unique name of database
  --   instances - number of instances database currently has configured
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE validateDatabase( dbpool         IN  varchar2,
                              db_unique_name OUT varchar2,
                              instances      OUT number,
                              cloud_name     IN varchar2 default NULL);
   PROCEDURE validateDatabase( dbpool         IN  varchar2,
                              db_unique_name OUT varchar2);
  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     removeDatabase
  --
  -- Description:
  --    Remove a database from the GDS framework (cloud)
  --
  -- Parameters:
  --    db_only - Remove only database?
  --              Else cascaded remove which removes all global services
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE removeDatabase (db_only   IN   boolean default FALSE);

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    addGSM
  --
  -- Description:
  --    Inform database of a new GSM which has been added to the catalog
  --
  -- Parameters:
  --   gsm_alias   - gsm name
  --   endpoint - GSM listen endpoint
  --   region_name - region in which GSM exists
  --   ons_port - ONS port for GSM
  --
  -- Notes:
  --   Triggers registration request in LREG for new GSM
  --
  -----------------------------------------------------------------------------
  PROCEDURE addGSM( gsm_alias      IN  varchar2,
                    endpoint       IN  varchar2,
                    region_name    IN  varchar2,
                    ons_port       IN  number );

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    modifyGSM
  --
  -- Description:
  --   Inform database of GSM attribute changes
  --
  -- Parameters:
  --   gsm_alias   - GSM name
  --   endpoint - gsm listen endpoint
  --   region_name - region in which GSM exists
  --   ons_port - ONS port for GSM
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE modifyGSM( gsm_alias   IN  varchar2,
                       endpoint    IN  varchar2 default NULL,
                       region_name IN  varchar2 default NULL,
                       ons_port    IN  number   default NULL );

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     removeGSM
  --
  -- Description:
  --    inform database of GSM removal
  --
  -- Parameters:
  --    gsm_alias - name of GSM
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE removeGSM( gsm_alias   IN varchar2 );


  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     addService
  --
  -- Description:  Creates a new global service in the database and CRS
  --
  -- Parameters:
  --   service_name - short name of the service in the data dictionary
  --   network_name - long service name used in SQLNet connect descriptors
  --   rlb_goal - RLB goal (service time, throuput, none)
  --   clb_goal - CLB goal (short, long)
  --   distr_trans - enables distributed transaction processing
  --   aq_notifications - enables AQ notfications
  --   aq_ha_notifications - used to disable HA AQ notfications
  --   lag_property - determines whether specified max lag should be enforced
  --   max_lag_value - maximum acceptable value for replication lag
  --   failover_method - TAF failover method
  --   failover_type - TAF failover type
  --   failover_retries - TAF failover retries
  --   failover_delay - TAF failover delay
  --   edition  - databse edition
  --   pdb - privite db id
  --   parameters for transaction continuity:
  --     commit_outcome
  --     retention_timeout
  --     replay_initiation_timeout
  --     session_state_consistency
  --   sql_translation_profile - directs how to interpret non-Oracle SQL
  --   role - database role (primary or physical/logical/snapshot standby)
  --   proxy_db - TRUE if service is created on primary database
  --                    to be used on standby(s)
  --   primary_db - TRUE if this is primary database (OUT parameter)
  --
  -- Note:
  --   Constants for use in arguments are defined in dbms_gsm_common
  -----------------------------------------------------------------------------
  PROCEDURE addService( service_name              IN varchar2,
                        network_name              IN varchar2,
                        rlb_goal                  IN number default NULL,
                        clb_goal                  IN number default NULL,
                        distr_trans               IN number default NULL,
                        aq_notifications          IN number default NULL,
                        aq_ha_notifications       IN number default NULL,
                        lag_property              IN number default NULL,
                        max_lag_value             IN number default NULL,
                        failover_method           IN varchar2 default NULL,
                        failover_type             IN varchar2 default NULL,
                        failover_retries          IN number default NULL,
                        failover_delay            IN number default NULL,
                        edition                   IN varchar2 default NULL,
                        pdb                       IN varchar2 default NULL,
                        commit_outcome            IN number default NULL,
                        retention_timeout         IN number default NULL,
                        replay_initiation_timeout IN number default NULL,
                        session_state_consistency IN varchar2 default NULL,
                        sql_translation_profile   IN varchar2 default NULL,
                        locality                  IN number default NULL,
                        region_failover           IN number default NULL,
                        role                      IN number default NULL,
                        proxy_db                  IN number default 0,
                        primary_db                OUT number );

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     modifyService
  --
  -- Description:  Modifies all attributes of a global service
  --
  -- Parameters:
  --   service_name - short name of the service in the data dictionary
  --   rlb_goal - RLB goal (service time, throuput, none)
  --   clb_goal - CLB goal (short, long)
  --   distr_trans - enables distributed transaction processing
  --   aq_notifications - enables AQ notfications
  --   aq_ha_notifications - used to disable HA AQ notfications
  --   lag_property - determines whether specified max lag should be enforced
  --   max_lag_value - maximum acceptable value for replication lag
  --   failover_method - TAF failover method
  --   failover_type - TAF failover type
  --   failover_retries - TAF failover retries
  --   failover_delay - TAF failover delay
  --   edition  - databse edition
  --   pdb - privite db id
  --   parameters for transaction continuity:
  --     commit_outcome
  --     retention_timeout
  --     replay_initiation_timeout
  --     session_state_consistency
  --   sql_translation_profile - directs how to interpret non-Oracle SQL
  --   role - database role (primary or physical/logical/snapshot standby)
  --   network_number - network interface number to access the service
  --   server_pool - name of the server pool for the service
  --   cardinality - service cardinality on RAC (singleton or uniform)
  --   proxy_db - TRUE if service is modified on primary database
  --                    to propagate modifications to standby(s)
  --   primary_db - TRUE if this is primary database (OUT parameter)
  --   instances  - string containing primary/available instances
  --
  -- Note:
  --   Constants for use in arguments are defined in dbms_gsm_common
  --   Depricated, use
  --     modifyServiceLocalParameters or
  --     modifyServiceGlobalParameters instead
  -----------------------------------------------------------------------------
  PROCEDURE modifyService( service_name           IN varchar2,
                        rlb_goal                  IN number default NULL,
                        clb_goal                  IN number default NULL,
                        distr_trans               IN number default NULL,
                        aq_notifications          IN number default NULL,
                        aq_ha_notifications       IN number default NULL,
                        lag_property              IN number default NULL,
                        max_lag_value             IN number default NULL,
                        failover_method           IN varchar2 default NULL,
                        failover_type             IN varchar2 default NULL,
                        failover_retries          IN number default NULL,
                        failover_delay            IN number default NULL,
                        edition                   IN varchar2 default NULL,
                        pdb                       IN varchar2 default NULL,
                        commit_outcome            IN number default NULL,
                        retention_timeout         IN number default NULL,
                        replay_initiation_timeout IN number default NULL,
                        session_state_consistency IN varchar2 default NULL,
                        sql_translation_profile   IN varchar2 default NULL,
                        locality                  IN number default NULL,
                        region_failover           IN number default NULL,
                        role                      IN number default NULL,
                        network_number            IN number default NULL,
                        server_pool               IN varchar2 default NULL,
                        cardinality               IN varchar2 default NULL,
                        proxy_db                  IN number default 0,
                        primary_db                OUT number,
                        instances                 IN varchar2 default NULL,
                        force                     IN number
                            default dbms_gsm_common.isFalse);


  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     modifyServiceLocalParameters
  --
  -- Description:  Modifies all local attributes of a global service
  --
  -- Parameters:
  --   service_name - short name of the service in the data dictionary
  --
  --   network_number - network interface number to access the service
  --   server_pool - name of the server pool for the service
  --   cardinality - service cardinality on RAC (singleton or uniform)
  --
  --   proxy_db - TRUE if service is modified on primary database
  --                    to propagate modifications to standby(s)
  --   primary_db - TRUE if this is primary database (OUT parameter)
  --
  -- Note:
  --   Constants for use in arguments are defined in dbms_gsm_common.
  -----------------------------------------------------------------------------

   PROCEDURE modifyServiceLocalParameters(
                        service_name              IN varchar2,
                        network_number            IN number,
                        server_pool               IN varchar2,
                        cardinality               IN varchar2,
                        instances                 IN varchar2 default NULL,
                        force                     IN number
                            default dbms_gsm_common.isFalse);

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     modifyServiceGlobalParameters
  --
  -- Description:  Modifies all global attributes of a global service
  --
  -- Parameters:
  --   service_name - short name of the service in the data dictionary
  --
  --   rlb_goal - RLB goal (service time, throuput, none)
  --   clb_goal - CLB goal (short, long)
  --   distr_trans - enables distributed transaction processing
  --   aq_notifications - enables AQ notfications
  --   aq_ha_notifications - used to disable HA AQ notfications
  --   lag_property - determines whether specified max lag should be enforced
  --   max_lag_value - maximum acceptable value for replication lag
  --   failover_method - TAF failover method
  --   failover_type - TAF failover type
  --   failover_retries - TAF failover retries
  --   failover_delay - TAF failover delay
  --   edition  - databse edition
  --   pdb - privite db id
  --   parameters for transaction continuity:
  --     commit_outcome
  --     retention_timeout
  --     replay_initiation_timeout
  --     session_state_consistency
  --   sql_translation_profile - directs how to interpret non-Oracle SQL
  --   role - database role (primary or physical/logical/snapshot standby)
  --
  --   proxy_db - TRUE if service is modified on primary database
  --                    to propagate modifications to standby(s)
  --   primary_db - TRUE if this is primary database (OUT parameter)
  --
  -- Note:
  --   Constants for use in arguments are defined in dbms_gsm_common.
  --   This procedure sets all of the parameters to the given values.
  -----------------------------------------------------------------------------

  PROCEDURE modifyServiceGlobalParameters(
                        service_name              IN varchar2,
                        rlb_goal                  IN number,
                        clb_goal                  IN number,
                        distr_trans               IN number,
                        aq_notifications          IN number,
                        aq_ha_notifications       IN number,
                        lag_property              IN number,
                        max_lag_value             IN number,
                        failover_method           IN varchar2,
                        failover_type             IN varchar2,
                        failover_retries          IN number,
                        failover_delay            IN number,
                        edition                   IN varchar2,
                        pdb                       IN varchar2,
                        commit_outcome            IN number,
                        retention_timeout         IN number,
                        replay_initiation_timeout IN number,
                        session_state_consistency IN varchar2,
                        sql_translation_profile   IN varchar2,
                        locality                  IN number,
                        region_failover           IN number,
                        role                      IN number,
                        proxy_db                  IN number,
                        primary_db                OUT number,
                        force                     IN number
                            default dbms_gsm_common.isFalse);





  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     removeService
  --
  -- Description:  Removes a service from CRS and / or the database.
  --
  -- Parameters:
  --   service_name
  --   proxy_db - TRUE if service is removed on primary database
  --                    to be removed on standby(s)
  --   delete_to_move - TRUE if service is removed to be moved to another db
  --   primary_db - TRUE if this is primary database (OUT parameter)

  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE removeService( service_name           IN varchar2,
                           proxy_db               IN number default 0,
                           delete_to_move         IN number default 0,
                           primary_db             OUT number );

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     startService
  --
  -- Description:
  --     Start a service on this database
  --
  -- Parameters:
  --   service_name
  --   inst_list - list of instances to start on
  --
  -- Notes:
  --   inst_list is ignored for DB types other than admin-managed RAC
  --
  -----------------------------------------------------------------------------
  PROCEDURE startService( service_name IN varchar2,
                          inst_list IN varchar2 DEFAULT NULL );

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     stopService
  --
  -- Description:
  --    Stop a service on this database
  --
  -- Parameters:
  --   service_name
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE stopService( service_name IN varchar2,
                         force        IN number
                             default dbms_gsm_common.isFalse);

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     addRegion
  --
  -- Description:
  --    Inform database of addition of a new region in the datalog
  --
  -- Parameters:
  --   region_name - name of the region
  -- buddy_region - name of its buddy
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE addRegion( region_name  IN varchar2,
                       buddy_region IN varchar2 default NULL);

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    modifyRegion
  --
  -- Description:
  --   inform database of modification of region attributes
  --
  -- Parameters:
  --   region_name - name of the region
  --   buddy_region - name of its buddy
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE modifyRegion( region_name  IN varchar2,
                          buddy_region IN varchar2 default NULL);

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE     removeRegion
  --
  -- Description:
  --   inoform database of removal of a region
  --
  -- Parameters:
  --   region_name - name of the region
  --
  -- Notes:
  --

  -----------------------------------------------------------------------------
  PROCEDURE removeRegion( region_name IN varchar2 );
  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    getHostInfo
  --
  -- Description:
  --       Gets information about connected host for GSM
  --
  -- Parameters:
  --   ons_port   OUT   ONS port number
  --   scan_name  OUT   Cluster SCAN name (if appropriate)
  --   hostname   OUT   connected server host
  --   db_type    OUT   type of database
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------

  PROCEDURE getHostInfo (ons_port OUT varchar2,
                         scan_name OUT varchar2,
                         hostname OUT varchar2);

  PROCEDURE getHostInfo (ons_port OUT varchar2,
                         scan_name OUT varchar2,
                         hostname OUT varchar2,
                         db_type  OUT char);

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    getCRSinfo
  --
  -- Description:
  --    Get CRS information
  --
  -- Parameters:
  --   ons_port - ONS port for CRS
  --   scan_name - scan name for CRS
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  PROCEDURE getCRSinfo( ons_port OUT varchar2, scan_name OUT varchar2,
                        rac_status OUT pls_integer );

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    getGSMinfo
  --
  -- Description:
  --   Get information about the database for GSM
  --
  -- Parameters:
  --   NONE
  --
  -- Returns:
  --   gsm_info - object containing information about the database for GSM
  --
  -- Notes:
  --
  -----------------------------------------------------------------------------
  FUNCTION getGSMInfo
  return gsm_info;

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    removeAllServices
  --
  -- Description: stop and delete all the global services.
  --
  -- Parameters:  None
  --
  -- Notes:
  --

  PROCEDURE removeAllServices;

  -----------------------------------------------------------------------------
  --
  -- PROCEDURE    sync
  --
  -- Description: execute modifications on database side.
  --
  -- Parameters:
  --  dsc - describes the new state of database.
  --        This parameter also is used to return
  --        host info data and sync status.
  --
  --  warnings - output parameter used to return error messages
  --             occured during sync process.
  --
  -- Notes:
  --

  PROCEDURE sync(dsc IN OUT database_dsc_t, warnings OUT warning_list_t);

  END dbms_gsm_dbadmin;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "GSMADMIN_INTERNAL"."DBMS_GSM_POOLADMIN" AS


--*****************************************************************************
-- Package Public Types
--*****************************************************************************


-----------------
-- Name list type
-----------------
TYPE name_list_type IS TABLE OF varchar2(30) index by binary_integer;


--*****************************************************************************
-- Package Public Constants
--*****************************************************************************

prv_key                  constant  number := 0;
pub_key                  constant  number := 1;
prk_enc_str              constant  number := 2;


--*****************************************************************************
-- Package Public Exceptions
--*****************************************************************************



--*****************************************************************************
-- Package Public Procedures
--*****************************************************************************

--*****************************************************************************
-- Package private constants
--*****************************************************************************
-- Action parameter
logical                     constant  number := 1;
physical                    constant  number := 2;

-- Force parameter
force_off                   constant  number := 0;
force_on                    constant  number := 1;

-- gen_aq_notification parameter
gen_aq_off                  constant  number := 0;
gen_aq_on                   constant  number := 1;

-------------------------------------------------------------------------------
--
-- PROCEDURE     changeServiceState
--
-- Description:
--       update service state, sends notification with new service state
--
-- Parameters:
--       service_name:         The name of the service to check.
--       database_pool_name:   The database pool to check.
--       database_name:        The db unique name of the database.
--       new_state:            New state of service.
--       gen_notification:     Send AQ notification
--
--
-- Returns:
--
-- Notes:
--
-------------------------------------------------------------------------------
PROCEDURE changeServiceState(  service_name IN varchar2,
                               pool_name    IN varchar2,
                               db_name      IN varchar2,
                               new_state   IN varchar2,
                               gen_notification IN number default 0);

-------------------------------------------------------------------------------
--
-- PROCEDURE     addBrokerConfig
--
-- Description:
--       Makes a database pool a Data Guard broker configuration.
--
-- Parameters:
--       db_unique_name:               db_unique name for the primary
--                                     database in a Data Guard broker
--                                     configuration.
--       database_pool_name:           The name of the database pool.
--       database_connect_string:      Connect string for the database.
--       password:                     Encrypted password for the database.
--       region:                       Region in which to put the databases.
--       num_standbys:                 The number of standby databases to
--                                     reserve for the broker config.
--
-- Notes:
--     addBrokerConfig is implemented as follows:
--       1. GSMCTL invokes this routine and it:
--          a. adds the primary database entry to the catalog with status "I"
--          b. assigns the database a unique number and reserves a range of
--             numbers for the standbys
--          c. generates a GSM change message indicating that an Add
--             Brokerconfig has been done.  Included in the message is the
--             number of database id's reserved for the config
--             (-num_standbys S) [Note that this number will be greater than
--             the input parameter "num_standbys" to this routine to allow for
--             the addition of new standbys during the processing of this
--             command], and the number of instances reserved for
--             each database in the config (-num_instances I).
--       2. The Master GSM is notified of the change and then:
--          a. modifies the primary database to become part of the cloud
--          b. invokes addDatabaseDone to clear the "I" status for the
--             primary database and optionally add the scan address and
--             ons port for the primary database
--          c. queries the primary for the names of all the standbys
--          d. modifies the standbys to become part of the cloud
--          e. invokes addDatabaseInternal for each standby to add the
--             standby database to the catalog, set its status appropriately,
--             optionally add the database's scan and ons port, and
--             generate a 'DatabaseDone' AQ notification.  All the GSMs
--             process this message and update their internal data structures
--             accordingly.
--
--     database_pool_name can be NULL if there is only one database pool
--     in the cloud.  In which case the command will default to that pool.
--
--     If region_name is NULL and there is a single region defined, then
--     the primary database is put into that region.  If more than one
--     region is defined, then the database will be given a NULL region.
-------------------------------------------------------------------------------

PROCEDURE addBrokerConfig( db_unique_name           IN varchar2,
                           database_pool_name       IN varchar2 default NULL,
                           database_connect_string  IN varchar2,
                           password                 IN varchar2 default NULL,
                           region                   IN varchar2 default NULL,
                           num_standbys             IN number default 1,
                           instances                IN number default NULL,
                           encpassword              IN RAW  default NULL);


-- TODO: make num_standbys required when GSM code has been modified?
-------------------------------------------------------------------------------
--
-- PROCEDURE     removeBrokerConfig
--
-- Description:
--       Removes entire broker configuration (all databases and services)
--
-- Parameters:
--
--       database_pool_name:       The name of the database pool.
--       action:                   logical or physical;
--                                 logical will update as removed (first phase)
--                                 physical will remove database records
--       gen_aq_notification       gen_aq_on or gen_aq_off
--                                 determines if AQ notification is generated
--
-- Notes:
--    This procedure will remove all databases and services for the provided
--    database pool after verifying that it is a broker configuration. The
--    "force" option is used for databases and services since the operation
--    is not yet recoverable; the assumption is that all databases and services
--    must eventually be removed. WARNING: this operaion is not reversible and
--    complete removal must be completed once initiated.
-- TODO: recover this somehow if it goes wrong in GSM?
-------------------------------------------------------------------------------
PROCEDURE removeBrokerConfig(database_pool_name    IN varchar2,
                             action                IN number default logical,
                             gen_aq_notification   IN number default gen_aq_on);
-------------------------------------------------------------------------------
--
-- PROCEDURE     syncBrokerConfig
--
-- Description:
--       Sync GSM's version of broker configuration with latest updates
--
-- Parameters:
--
--       database_pool_name:       The name of the database pool.
--       database_name:            Name of primary database in BC (optional)
--
-- Notes:
--    This function simply notifies GSM through AQ and gsm_requests that the
--    broker configuration needs to be synced. GSM will do all the work.
-------------------------------------------------------------------------------
PROCEDURE syncBrokerConfig ( database_pool_name    IN varchar2 DEFAULT NULL,
                             database_name          IN varchar2 DEFAULT NULL);

-------------------------------------------------------------------------------
--
-- PROCEDURE     addDatabaseInternal
--
-- Description:
--       Adds a new database to a broker configuration.
--
-- Parameters:
--       db_unique_name:               db_unique name for the database to add
--       database_pool_name:           The name of the database pool.
--       database_connect_string:      Connect string for the database.
--       password:                     Encrypted password for the database.
--       region:                       Region in which to put the database.
--       status:                       Configuration status to give the database
--       db_num:                       The database number assigned to this
--                                     standby by the GSM.  If NULL then the
--                                     this routine will assign the database
--                                     a number.
--       scan_address:                 If the database is RAC, its SCAN address
--       ons_port:                     If the database is RAC, its ONS port
--       hostname                      hostname or IP address for VNCR
--       db_vers                       GDS internal version of the database
--       prmdb_name                    name of primary DB to cp password from
--
-- Notes:
--     This is the final step of addBrokerConfig().  The master GSM invokes
--     this routine to add each standby database to the cloud catalog.
--
--     The routine will generate a "database done" AQ notification.
--
--     database_pool_name can be NULL if there is only one database pool
--     in the cloud.  In which case the command will default to that pool.
--
--     If region_name is NULL and there is a single region defined, then
--     the primary database is put into that region.  If more than one
--     region is defined, then the database will be given a NULL region.
-------------------------------------------------------------------------------

PROCEDURE addDatabaseInternal( db_unique_name          IN varchar2,
                               database_pool_name      IN varchar2 default NULL,
                               database_connect_string IN varchar2,
                               password                IN varchar2 default NULL,
                               region                  IN varchar2 default NULL,
                               status                  IN char,
                               db_num                  IN number default NULL,
-- TODO: make db_num mandatory after GSM code is modified ?
                               scan_address            IN varchar2 default NULL,
                               ons_port                IN number default NULL,
                               hostname                IN varchar2 default NULL,
                               db_vers                 IN number default NULL,
                               prmdb_name              IN varchar2 default NULL,
                               db_type                  IN char default 'U');

-------------------------------------------------------------------------------
--
-- PROCEDURE     addDatabase
--
-- Description:
--       Adds a database to a region and a database pool.
--
-- Parameters:
--       db_unique_name:               db_unique name for the database to
--                                       add to the pool.
--       database_pool_name:           The name of the database pool.
--       database_connect_string:      Connect string for the database.
--       password:                     Encrypted password for the database.
--       region:                       Region in which to put the database.
--       instances                     Number of instances reserved.
--       cpu_thresh                    CPU threshold value.
--       srlat_thresh                  Single read latency threshold.
--
-- Notes:
--    The "Add Database" command is implemented in three phases:
--      1. GSMCTL invokes this routine and it:
--           a. Adds the database entry to the cloud catalog
--           b. Set the status to "I" (incomplete)
--           c. Generates a GSM change message indicating that an
--              Add Database has been done
--      2. The Master GSM is notified of the change and then modifies
--         each database to become part of the cloud.  This involves adding
--         some GSM related hidden parameters.
--      3. The Master GSM then invokes addDatabaseDone() to clear the "I"
--         status for the database, optionally add the scan address and ons
--         port to the database's catalog entry, and generate a GSM change
--         message indicating that the add of the database completed.  All
--         the GSMs process this message and update their internal data
--         structures accordingly.
--
--     database_pool_name can be NULL if there is only one database pool
--     in the cloud.  In which case the command will default to that pool.
--
--     region_name can be NULL if there is only one region in the cloud.
--     In which case the command will default to that region.
-------------------------------------------------------------------------------

PROCEDURE addDatabase( db_unique_name           IN varchar2,
                       database_pool_name       IN varchar2 default NULL,
                       database_connect_string  IN varchar2,
                       password                 IN varchar2 default NULL,
                       region                   IN varchar2 default NULL,
                       instances                IN number default NULL,
                       cpu                      IN number default NULL,
                       srlat                    IN number default NULL,
                       encpassword              IN RAW default NULL);



-------------------------------------------------------------------------------
--
-- PROCEDURE     modifyDatabase
--
-- Description:
--       modifies database  database pool.
--
-- Parameters:
--       db_unique_name:               db_unique name
--       database_pool_name:           The name of the database pool.
--       database_connect_string:      Connect string for the database.
--       password:                     Encrypted password for the database.
--       region:                       Region in which to put the database.
--       scan:                         Scan address
--       ons:                          ONS port
--       cpu_thresh                    CPU threshold value.
--       srlat_thresh                  Single read latency threshold.
--
-- Notes:
--   This procedure is used for manual correction of db parameters
-------------------------------------------------------------------------------
PROCEDURE modifyDatabase ( db_unique_name           IN varchar2,
                           database_pool_name       IN varchar2 default NULL,
                           database_connect_string  IN varchar2 default NULL,
                           password                 IN varchar2 default NULL,
                           region                   IN varchar2 default NULL,
                           scan                     IN varchar2 default NULL,
                           ons                      IN number default NULL,
                           cpu                      IN number default NULL,
                           srlat                    IN number default NULL,
                           encpassword              IN RAW   default NULL);


-------------------------------------------------------------------------------
--
-- PROCEDURE     addDatabaseDone
--
-- Description:
--       Marks the end of "add database" processing.
--
-- Parameters:
--       db_unique_name:               db_unique name for the database
--       database_pool_name:           The name of the database pool.
--       status:                       Configuration status to give the database.
--       scan_address:                 If the database is RAC, its SCAN address
--       ons_port:                     If the database is RAC, its ONS port
--       hostname                      host name or IP for autoVNCR
--       db_vers                       numeric cloud database version
--       db_type                       type of database
--
-- Notes:
--     This is the final step of addDatabase().  The master GSM invokes
--     this routine to complete "add database" processing.  The status,
--     scan_address, and ons_port of the database will be updated.  In
--     addition, a "database done" AQ notification will be made.
-------------------------------------------------------------------------------
PROCEDURE addDatabaseDone( db_unique_name           IN varchar2,
                           database_pool_name       IN varchar2,
                           scan_address             IN varchar2 default NULL,
                           ons_port                 IN number default NULL,
                           hostname                 IN varchar2 default NULL,
                           db_vers                  IN number default NULL,
                           db_type                  IN char default 'U' );
-------------------------------------------------------------------------------
--
-- PROCEDURE     updateDatabaseStatus
--
-- Description:
--       Updates runtime status information for database
--
-- Parameters:
--       db_unique_name:               db_unique name for the database
--       database_pool_name:           The name of the database pool.
--       status:                       Configuration status to give the database.
--       db_vers                       GSM internal DB version
--
-- Notes:
--     The master GSM invokes this routine to notify other GSMS on db status.
--     If mastership will be switched, new master will be aware of current db
--     status
-------------------------------------------------------------------------------
PROCEDURE updateDatabaseStatus ( db_unique_name      IN varchar2,
                                 database_pool_name  IN varchar2  default NULL,
                                 status              IN char DEFAULT NULL,
                                 db_vers             IN NUMBER DEFAULT NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     removeDatabase
--
-- Description:
--       Remove a database from a database pool.
--
-- Parameters:
--       db_unique_name:         db_unique name for the database to
--                                 add to the pool.
--       database_pool_name:     The name of the database pool.
--       action:                 logical:  Mark the database entry as removed
--                                   (also generate change message)
--                               physical: Physically remove the database entry
--                                   (but do not generate a change message)
--       force:                  Interactive user supplied the "-force"
--                                 parameter.
--       gen_aq_notification:    Only valid if action = "physical"
--                               gen_aq_off:  Don't generate an AQ notification
--                               gen_aq_on:   Generate an AQ notification
--
-- Notes:
--    The "Remove Database" command is implemented in two phases:
--       1. GSMCTL invokes this routine and it: sets the status for the
--          database to "R" (for removed), and generates a GSM change
--          message indicating that a Remove Database was done.
--       2. The Master GSM is notified of the change log entry and then
--          calls this routine again to physically remove the database
--          entry from the catalog.  By deferring the removal of the catalog
--          entry, the Master GSM is able to use the database credentials in
--          the catalog to make the necessary changes on the database.
--
--    This routine may also be called with "physical" flag when an Add
--    Database command fails in order to drop the catalog database entry
--    for the database that could not be added.  In that case,
--    "gen_aq_notification" will be set to "gen_aq_off".
--
--    No checking is done other than verifying that the database is in the
--    catalog.  Entries from service_preferred_available are also removed.
--
--    database_pool_name can be NULL if there is only one database pool
--    in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------




PROCEDURE removeDatabase( db_unique_name           IN varchar2,
                          database_pool_name       IN varchar2 default NULL,
                          action                   IN number default logical,
                          force                    IN number default NULL,
                          gen_aq_notification      IN number default gen_aq_on );



-------------------------------------------------------------------------------
--
-- PROCEDURE     addService
--
-- Description:
--       Add a service to a database pool.
--
-- Parameters:
--
--   Note: all constants are defined in package dbms_gwm_common.
--
--       database_pool_name:  Name of the database pool hosting the service
--
--       service_name: Name of the service.  If the name has a "." in it
--                     then this name will also be used as the network
--                     service name.  Otherwise the network service name
--                     will be:
--                     <service_name>.<database_pool_name>.<cloud_name>
--
--       preferred_all: Define which databases should host the service.
--                      Allowed values are:
--           select_dbs - will select preferred and available databases in
--                        "preferred_dbs" and "available_dbs".
--           prefer_all_dbs - all databases in the pool are "preferred"
--                            databases for this service.
--
--       preferred_dbs: list of database names to be preferred databases for
--                      the service.  "preferred_all" should be set to
--                      "select_dbs".
--
--       available_dbs: list of database names to be available databases for
--                      the service.  "preferred_all" should be set to
--                      "select_dbs".
--
--       svc_locality: Specify the degree of service afinity to a region.
--                     Allowed values are:
--           service_anywhere - A client connection request is routed to the
--                              the best database that can satisfy the CLB
--                              goal for the requested service.
--           service_local_only - A client connection request is routed to the
--                                best database in the client region that can
--                                satisfy the CLB goal for the requested
--                                service.
--
--       region_failover: This policy is in effect when "svc_locality" is
--                        set to "service_local_only".  Allowed values are:
--           region_failover_on - If there are no databases in the local
--                                region offering a service, instead of denying
--                                the client request, it is forwarded to the
--                                best database in another region that has
--                                the requested service started.
--           region_failover_off - Client connection requests are not
--                                 forwarded outside the region.
--
--       db_role: Specifies the role a database must have before the service
--                can be started on it. This parameter is only valid for
--                services in a Data Guard broker configuration.
--                Allowed values are:
--           db_role_none -  the service can be started on a database with
--                           any role.
--           db_role_primary - the service will only be started on a
--                             database with primary role.
--           db_role_phys_stby - the service will only be started on a
--                               physical standby database.
--           db_role_log_stby - the service will only be started on a
--                              logical standby database.
--           db_role_snap_stby - the service will only be started on a
--                               snapshot standby database.
--
--       failover_primary: Enables a service for failover to a primary
--                         database.  Applicable to only services with
--                         "db_role" = "db_role_phys_stby".
--                         Allowed values are:
--           failover_primary_off - turns off failover to the primary
--           failover_primary_on - turns on failover to the primary
--
--       rlb_goal: Run-time load balancing goal
--                 Allowed values are:
--           rlb_goal_none - Turns off run time load balancing.
--           rlb_goal_service_time
--           rlb_goal_throughput
--
--       clb_goal: Connection time load balancing goal
--                 Allowed values are:
--           clb_goal_none - Turns off connection load balancing.
--           clb_goal_short
--           clb_goal_long
--
--       ha_notification: HA notifications for this service
--                        Allowed values are:
--           ha_notification_off
--           ha_notification_on
--
--       taf_policy: TAF policy specification.
--                   Allowed values are:
--           taf_none
--           taf_basic
--           taf_preconnect
--
--       restart_policy: Management policy.
--                       Allowed values are:
--           policy_manual
--           policy_automatic
--
--       distr_trans: Enables distributed transaction processing.
--                    Allowed values are:
--           dtp_off
--           dtp_on
--
--       lag: Specifies if and how much lag is allowed for this service.
--            Allowed values are:
--           any_lag - any lag is tolerated for this service.
--           specified_lag - the lag specified in "max_lag" is the
--                           lag tolerated for this service.  This
--                           parameter is only valid for services
--                           in a Data Guard broker configuration.
--
--       max_lag: maximum lag if lag = "specified_lag"
--
--       TAF parameters:
--         failover_method: TAF failover method.  Allowed values are:
--            failover_none
--            failover_basic
--
--         failover_type: TAF failover type.  Allowed values are:
--            failover_type_none
--            failover_type_session
--            failover_type_select
--            failover_type_transact -
--
--         failover_retries: TAF failover retries
--
--         failover_delay: TAF failover delay.
--
--       edition: database edition
--
--       pdb: plugable database id
--
--       Parameters for transaction continuity:
--         commit_outcome: Allowed values are:
--           commit_outcome_off
--           commit_outcome_on
--
--         retention_timeout:
--
--         replay_initiation_timeout:
--
--         session_state_consistency: Allowed values are:
--           session_state_static
--           session_state_dynamic
--
--       sql_translation_profile: Directs how to interpret non-Oracle SQL
--
-- Notes:
--    database_pool_name can be NULL if there is only one database pool
--    in the cloud.  In which case the command will default to that pool.
--
--    Status of the service is set to:
--        'P' (stopped) in the "service" table
--        'E' (enabled) in the "service_preferred_available" table
--
-------------------------------------------------------------------------------
PROCEDURE addService( database_pool_name        IN varchar2 default NULL,
                      service_name              IN varchar2,
                      preferred_all             IN number default
                                                      dbms_gsm_common.prefer_all_dbs,
                      preferred_dbs             IN name_list_type,
                      available_dbs             IN name_list_type,
                      svc_locality              IN number default
                                                      dbms_gsm_common.service_anywhere,
                      region_failover           IN number default
                                                      dbms_gsm_common.region_failover_off,
                      db_role                   IN number default
                                                      dbms_gsm_common.db_role_none,
                      failover_primary          IN number default
                                                      dbms_gsm_common.failover_primary_off,
                      rlb_goal                  IN number default
                                                      dbms_gsm_common.rlb_goal_none,
                      clb_goal                  IN number default
                                                      dbms_gsm_common.clb_goal_none,
                      ha_notification           IN number default
                                                      dbms_gsm_common.ha_notification_on,
                      taf_policy                IN number default
                                                      dbms_gsm_common.taf_none,
                      restart_policy            IN number default
                                                      dbms_gsm_common.policy_automatic,
                      distr_trans               IN number default
                                                      dbms_gsm_common.dtp_off,
                      lag                       IN number default
                                                      dbms_gsm_common.any_lag,
                      max_lag                   IN number default 0,
                      failover_method           IN varchar2 default
                                                      dbms_gsm_common.failover_none,
                      failover_type             IN varchar2 default
                                                      dbms_gsm_common.failover_type_none,
                      failover_retries          IN number default NULL,
                      failover_delay            IN number default NULL,
                      edition                   IN varchar2 default NULL,
                      pdb                       IN varchar2 default NULL,
                      commit_outcome            IN number default NULL,
                      retention_timeout         IN number default NULL,
                      replay_initiation_timeout IN number default NULL,
                      session_state_consistency IN varchar2 default NULL,
                      sql_translation_profile   IN varchar2 default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     modifyService
--
-- Description:
--      Modify one or more attributes of a service.
--
-- Parameters:
--      See addService() for a description.
--
-- Notes:
--      Changes are reflected only in new connections to the service.
--
--      edition and sql_translation_profile parameters may be set to NULL
--      by passing literal 'null' to them.
--
--      database_pool_name can be NULL if there is only one database pool
--      in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------
PROCEDURE modifyService( database_pool_name        IN varchar2 default NULL,
                         service_name              IN varchar2,
                         svc_locality              IN number default NULL,
                         region_failover           IN number default NULL,
                         db_role                   IN number default NULL,
                         failover_primary          IN number default NULL,
                         rlb_goal                  IN number default NULL,
                         clb_goal                  IN number default NULL,
                         ha_notification           IN number default NULL,
                         taf_policy                IN number default NULL,
                         restart_policy            IN number default NULL,
                         distr_trans               IN number default NULL,
                         lag                       IN number default NULL,
                         max_lag                   IN number default NULL,
                         failover_method           IN varchar2 default NULL,
                         failover_type             IN varchar2 default NULL,
                         failover_retries          IN number default NULL,
                         failover_delay            IN number default NULL,
                         edition                   IN varchar2 default NULL,
                         pdb                       IN varchar2 default NULL,
                         commit_outcome            IN number default NULL,
                         retention_timeout         IN number default NULL,
                         replay_initiation_timeout IN number default NULL,
                         session_state_consistency IN varchar2 default NULL,
                         sql_translation_profile   IN varchar2 default NULL,
                         force                     IN number
                            default dbms_gsm_common.isFalse);

-------------------------------------------------------------------------------
--
-- PROCEDURE     addServiceToDBs
--
-- Description:
--      Add an existing service to additional preferred and/or available
--      databases.
--
-- Parameters:
--      database_pool_name   -   The database pool in which the service
--                               is defined.
--      service_name         -   An existing service.
--      preferred_dbs        -   A list of preferred databases to add the
--                               service to.
--      available_dbs        -   A list of available databases to add the
--                               service to.
--
-- Notes:
--      It is an error if "preferred_all" is set for the service.
--
--      At least one preferred or available database should be set.
--
--      None of the preferred or available databases should already be
--      a database for the service.
--
--      database_pool_name can be NULL if there is only one database pool
--      in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------
PROCEDURE addServiceToDBs( database_pool_name       IN varchar2 default NULL,
                           service_name             IN varchar2,
                           preferred_dbs            IN name_list_type,
                           available_dbs            IN name_list_type );

-------------------------------------------------------------------------------
--
-- PROCEDURE     moveServiceToDB
--
-- Description:
--      Move an existing service from one database to another.
--
-- Parameters:
--      database_pool_name   -   The database pool in which the service
--                               is defined.
--      service_name         -   An existing service.
--      old_db               -   Database to move service from.
--      new_db               -   Database to move service to.
--      force                -   User supplied the "force" parameter.
--
-- Notes:
--      The "force" parameter is passed on to the master GSM.
--
--      The service should not already be defined on the new database.
--
--      See removeDatabase for definitions for "force" parameter.
--
--      database_pool_name can be NULL if there is only one database pool
--      in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------
PROCEDURE moveServiceToDB( database_pool_name       IN varchar2 default NULL,
                           service_name             IN varchar2,
                           old_db                   IN varchar2,
                           new_db                   IN varchar2,
                           force                    IN number default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     makeDBsPreferred
--
-- Description:
--      Changes the specified databases to preferred databases for the
--      service.
--
-- Parameters:
--      database_pool_name   -   The database pool in which the service
--                               is defined.
--      service_name         -   An existing service.
--      dbs                  -   A list of names of the databases to make
--                               preferred for the service.
--      force                -   User supplied "force" parameter.
--                               TODO: what does it mean in this case?
--
-- Notes:
--      The service should already be defined on the databases.
--
--      The databases should be in the database pool and either not have
--      the service defined on them or be available databases for the
--      service.
--
--      It is an error if the service has "preferred_all" set.
--
--      See removeDatabase for definitions for "force" parameter.
--
--      database_pool_name can be NULL if there is only one database pool
--      in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------
PROCEDURE makeDBsPreferred( database_pool_name  IN varchar2 default NULL,
                            service_name        IN varchar2,
                            dbs                 IN name_list_type,
                            force               IN number default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     modifyServiceConfig
--
-- Description:
--      Changes the set of preferred and available databases for a service.
--
-- Parameters:
--      database_pool_name   -   The database pool in which the service
--                               is defined.
--      service_name         -   An existing service.
--      preferred_all        -   Set to dbms_gsm_common.prefer_all_dbs if
--                               all databases in the pool should be set
--                               to preferred.
--      preferred_dbs        -   The names of the databases to be set
--                               preferred for the service.
--      available_dbs        -   The names of the databases to be set
--                               available for the service.
--      force                -   User supplied "force" parameter.
--
-- Notes:
--      The "force" parameter is passed on to the master GSM.
--
--      If "preferred_all" is set to "prefer_all_dbs" then "preferred_dbs"
--      and "available_dbs" are ignored.
--
--      If "prefer_dbs" is set then the current preferred/available list is
--      cleared and new lists are built based on "preferred_dbs" and
--      "available_dbs".
--
--      See removeDatabase for definitions for "force" parameter.
--
--      database_pool_name can be NULL if there is only one database pool
--      in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------
PROCEDURE modifyServiceConfig( database_pool_name  IN varchar2 default NULL,
                               service_name        IN varchar2,
                               preferred_all       IN number,
                               preferred_dbs       IN name_list_type,
                               available_dbs       IN name_list_type,
                               force               IN number default NULL );
-------------------------------------------------------------------------------
--
-- FUNCTION     getServiceDBParams
--
-- Description:
--      Converts DB paramters in name_list_type to a parameter string.
--      Used primarily by GDSCTL/GSM to return parameter strings from
--      database object types
--
-- Parameters:
--      dbparam_names - list of parameter names
--      dbparam_values - list of parameter values
--
-- Returns:
--       varchar - string containing parameters in NVP format
--
-- Notes:
-------------------------------------------------------------------------------
FUNCTION getServiceDBParams (dbparams IN dbparams_list)
RETURN varchar2;

-------------------------------------------------------------------------------
--
-- FUNCTION     getServiceLocalParams
--
-- Description:
--      Converts DB local parameter list types to a parameter string.
--      Used primarily by GDSCTL/GSM to return parameter strings from
--      database object types
--
-- Parameters:
--      dbparams - list of parameter names
--      instances - list of instances
--
-- Returns:
--       varchar - string containing parameters in NVP format
--
-- Notes:
-------------------------------------------------------------------------------
FUNCTION getServiceLocalParams (dbparams    IN   dbparams_list,
                                instances   IN   instance_list)
RETURN varchar2;

-------------------------------------------------------------------------------
--
-- PROCEDURE     getInstanceString
--
-- Description:
--      returns a list of preferred/available instances in string form
--
-- Parameters:
--      pool_name            -   The database pool in which the service
--                               is defined.
--      service_name         -   An existing service.
--      database_name        -   The database on which service is defined
--      instance_string      -   String containing instance list for this
--                               service in NVP format
--
--
-------------------------------------------------------------------------------
PROCEDURE getInstanceString (service_name    IN    varchar2,
                             pool_name       IN    varchar2,
                             database_name   IN    varchar2,
                             instance_string OUT   varchar2);

-------------------------------------------------------------------------------
--
-- PROCEDURE     modifyServiceOnDB
--
-- Description:
--      Modifies the attributes of a service specific to a (RAC) database.
--
-- Parameters:
--      database_pool_name   -   The database pool in which the service
--                               is defined.
--      service_name         -   An existing service.
--      database_name        -   The database on which to change the
--                               service attributes.
--      params               -   A copy of the rest of the parameters
--                               supplied by the user.  Maximum size is
--                               1024.
--      dbparam_names        -   list of DB specific parameter names
--      dbparam_value        -   list of matching values for above names
--      palist_op            -   operation for preferred/available list
--                               'A' - Add this as new list (old list erased)
--                               'M' - Existing list is modified
--                               'D' - remove values fom existing list
--      preferred_list       -   list of preferred instances
--      available_list       -   list of available instances
--
-- Notes:
--      The command is implemented in the Master GSM.  The catalog database
--      just passes the request on to the GSM.
--
-------------------------------------------------------------------------------
PROCEDURE modifyServiceOnDB( database_pool_name  IN varchar2 default NULL,
                             service_name        IN varchar2,
                             database_name       IN varchar2,
                             params              IN varchar2 DEFAULT NULL,
                             dbparam_names       IN name_list_type
                                 DEFAULT CAST(NULL AS name_list_type),
                             dbparam_values      IN name_list_type
                                 DEFAULT CAST(NULL AS name_list_type),
                             palist_op           IN char DEFAULT NULL,
                             preferred_list      IN name_list_type
                                 DEFAULT CAST(NULL AS name_list_type),
                             available_list      IN name_list_type
                                 DEFAULT CAST(NULL AS name_list_type),
                             force               IN number
                                 DEFAULT dbms_gsm_common.isFalse);
-------------------------------------------------------------------------------
--
-- PROCEDURE     removeService
--
-- Description:
--      Remove a service from a database pool.
--
-- Parameters:
--       database_pool_name:   The name of the database pool.
--       service_name:         The name of the service.
--
-- Notes:
--     No checking is done at this time other than verifying that the service
--     is in the "service" table.  Entries are also removed from
--     the "service_preferred_available" table.
--
--     database_pool_name can be NULL if there is only one database pool
--     in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------
PROCEDURE removeService( database_pool_name       IN varchar2 default NULL,
                         service_name             IN varchar2 );

-------------------------------------------------------------------------------
--
-- PROCEDURE     removeServiceInternal
--
-- Description:
--      Remove a service from a database pool; called by GSM directly
--
-- Parameters:
--       database_pool_name:   The name of the database pool.
--       service_name:         The name of the service.
--       CalledByGSM           1 if called by GSM, 0 otherwise
--       gen_aq_notification   gen_aq_on or gen_aq_off
--       force                 force removal even if service is running
--
-- Notes:
-------------------------------------------------------------------------------
PROCEDURE removeServiceInternal( database_pool_name   IN varchar2 default NULL,
                                 service_name         IN varchar2,
                                 CalledByGSM          IN number default 0,
                                 gen_aq_notification  IN number
                                   default gen_aq_on,
                                 force                IN number default NULL );
-------------------------------------------------------------------------------
--
-- PROCEDURE     startService
--
-- Description:
--       Start a service in a database pool.
--
-- Parameters:
--       database_pool_name:   The name of the database pool.
--       service_name:         The name of the service.
--       database_name:        The name of the database (db_unique_name).
--
-- Notes:
--    database_pool_name can be NULL if there is only one database pool
--    in the cloud.  In which case the command will default to that pool.
--
--    If service name is NULL then starts all the services in the pool.
--
--    If database_name is NULL then starts the service on all databases
--    where the service is defined.
--
--    Status of service is changed to "S" in "service" table
-------------------------------------------------------------------------------
PROCEDURE startService( database_pool_name      IN varchar2 default NULL,
                        service_name            IN varchar2 default NULL,
                        database_name           IN varchar2 default NULL );


-------------------------------------------------------------------------------
--
-- PROCEDURE     stopService
--
-- Description:
--       Stop a service in a database pool.
--
-- Parameters:
--       database_pool_name:   The name of the database pool.
--       service_name:         The name of the service.
--       database_name:        The name of the database (db_unique_name).
--       force:                The interactive user specified the "-force"
--                                parameter.
--
-- Notes:
--    See removeDatabase for definitions for "force" parameter.
--
--    database_pool_name can be NULL if there is only one database pool
--    in the cloud.  In which case the command will default to that pool.
--
--    If service name is NULL then stops all the services in the pool.
--
--    If database_name is NULL then stops the service on all databases
--    where the service is defined.
--
--    Status of service is changed to "P" in "service" table
-------------------------------------------------------------------------------
PROCEDURE stopService( database_pool_name       IN varchar2 default NULL,
                       service_name             IN varchar2 default NULL,
                       database_name            IN varchar2 default NULL,
                       force                    IN number default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     enableService
--
-- Description:
--       Enable a service in a database pool.
--
-- Parameters:
--       database_pool_name:   The name of the database pool.
--       service_name:         The name of the service.
--       database_name:        The name of the database (db_unique_name).
--
-- Notes:
--    database_pool_name can be NULL if there is only one database pool
--    in the cloud.  In which case the command will default to that pool.
--
--    If service name is NULL then enables all the services in the pool.
--
--    If database_name is NULL then enables the service on all databases
--    where the service is defined.
--
--    Status of service is changed to "E" in "service_preferred_available"
--    table.
-------------------------------------------------------------------------------
PROCEDURE enableService( database_pool_name      IN varchar2 default NULL,
                         service_name            IN varchar2 default NULL,
                         database_name           IN varchar2 default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     disableService
--
-- Description:
--       Disable a service in a database pool.
--
-- Parameters:
--       database_pool_name:   The name of the database pool.
--       service_name:         The name of the service.
--       database_name:        The name of the database (db_unique_name).
--
-- Notes:
--    database_pool_name can be NULL if there is only one database pool
--    in the cloud.  In which case the command will default to that pool.
--
--    If service name is NULL then disables all the services in the pool.
--
--    If database_name is NULL then disables the service on all databases
--    where the service is defined.
--
--    Status of service is changed to "E" in "service_preferred_available"
--    table.
-------------------------------------------------------------------------------
PROCEDURE disableService( database_pool_name      IN varchar2 default NULL,
                          service_name            IN varchar2 default NULL,
                          database_name           IN varchar2 default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     relocateService
--
-- Description:
--       Relocate a service from one database to another.
--       This operation does not change the underlying configuration of the
--       service.
--
-- Parameters:
--       database_pool_name:   The name of the database pool.
--       service_name:         The name of the service.
--       old_database_name:    The name of the database (db_unique_name) from
--                                which to move the service.
--       new_database_name:    The name of the database (db_unique_name) to
--                                which to move the service.
--       force:                The interactive user specified the "-force"
--                                parameter.
--
-- Notes:
--   The command is implemented in the Master GSM.  The catalog database
--   just passes the request on to the GSM.
--
--   See removeDatabase for definitions for "force" parameter.
--
--   database_pool_name can be NULL if there is only one database pool
--   in the cloud.  In which case the command will default to that pool.
-------------------------------------------------------------------------------
PROCEDURE relocateService( database_pool_name      IN varchar2 default NULL,
                           service_name            IN varchar2,
                           old_database_name       IN varchar2,
                           new_database_name       IN varchar2,
                           force                   IN number default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     syncDatabase
--
-- Description:
--       Send database sync AQ message to GSM
--
-- Parameters:
--       database_pool_name:       The name of the database pool.
--       database_name:            Name of database to sync (optional)
--
-- Notes:
--       Null database name will sync all databases in the pool
-------------------------------------------------------------------------------
PROCEDURE syncDatabase ( database_pool_name    IN varchar2 DEFAULT NULL,
                         database_name          IN varchar2 DEFAULT NULL);

-------------------------------------------------------------------------------
--
-- PROCEDURE     catRollback
--
-- Description:
--       Perform rollback operation on catalog when distributed
--       change has failed on target database(s)
--
-- Parameters:
--       change       GSM change request
--
-- Notes:
--       This procedure is called from a trigger when gsm_requests status
--       is updated to 'A' (Aborted) by the GSM server
-------------------------------------------------------------------------------
PROCEDURE catRollback (change          IN   gsm_change_message,
                       old_instances   IN   instance_list);

-------------------------------------------------------------------------------
--
-- PROCEDURE     requestDone
--
-- Description:
--       Perform completion actions when change request is done
--
-- Parameters:
--       change      GSM change request
--
-- Notes:
--       This procedure is called from a trigger when gsm_requests status
--       is updated to 'D' (Done) or the row is deleted by the GSM server
-------------------------------------------------------------------------------
PROCEDURE requestDone (change    IN   gsm_change_message);

-------------------------------------------------------------------------------
--
-- PROCEDURE     strtolist
--
-- Description:
--       convert varchar2 string to name_list_type
--
-- Parameters:
--       lstring - string reprsenting a list
--
-- Notes:
--      Primarily for unit testing, this function allows us to call
--      PL/SQL functions for complex types from SQLPLUS
-------------------------------------------------------------------------------
FUNCTION strtolist (lstring IN VARCHAR2)
return name_list_type;

-------------------------------------------------------------------------------
--
-- PROCEDURE    set_key
--
-- Description:
--       Set PKI Keys and flags
--
-- Parameters:
--     key_name:              key type
--     key_value:             value of key
--
-------------------------------------------------------------------------------


PROCEDURE set_key(key_type in number,
                  key_value in RAW);

-------------------------------------------------------------------------------
--
-- PROCEDURE    get_key
--
-- Description:
--       get the value of a key by name
--
-- Parameters:
--       key_type:          key type
--
-------------------------------------------------------------------------------
FUNCTION get_key(key_type in number) RETURN RAW;


--*****************************************************************************
-- End of Package Public Procedures
--*****************************************************************************

END dbms_gsm_pooladmin;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "GSMADMIN_INTERNAL"."DBMS_GSM_CLOUDADMIN" AS


--*****************************************************************************
-- Package Public Types
--*****************************************************************************


--*****************************************************************************
-- Package Public Constants
--*****************************************************************************

gsm_master_lock_name    constant    varchar2(19) := 'ORA$GSM_MASTER_LOCK';
no_lock                 constant    number := 99; -- lock not granted (GDS)
rogueGSM                constant    number := 99;
masterNotAllowed        constant    number := 98; -- GSM is not allowed to
                                                  -- get master lock
MaxGSM                  constant    number := 5;


--*****************************************************************************
-- Package Public Exceptions
--*****************************************************************************



--*****************************************************************************
-- Package Public Procedures
--*****************************************************************************

maxwait     constant    integer := 32767;            -- Wait forever
sessioninfo    gsm_session;

-------------------------------------------------------------------------------
--
-- PROCEDURE     getMasterLock
--
-- Description:
--     Request the GSM catalog master lock in exclusive mode.
--
-- Parameters:
--     timeout:  the number of seconds to wait for the lock
--               "maxwait" means to wait forever
--     lock_handle: handle used to identify the lock
--                  should be passed to releaseMasterLock to release the lock
--                  size can be up to 128
--
-- Returns:
--      0 - success
--      1 - timeout
--      2 - deadlock
--      3 - parameter error
--      4 - already own lock
--      5 - illegal lock handle
--     99 - Lock not granted (due to GDS checking)
--
-- Notes:
--     The routine uses dbms_lock.allocate_unique, so will always do a
--     transaction commit.
--
--     Lock is held until it is explicitly released or session terminates.
-------------------------------------------------------------------------------

FUNCTION getMasterLock( timeout     IN  integer default maxwait,
                        lock_handle OUT varchar2,
                        gsm_name    IN  varchar2 default NULL,
                        gsm_vers    IN  varchar2 default NULL )
 RETURN integer;

-------------------------------------------------------------------------------
--
-- PROCEDURE     releaseMasterLock
--
-- Description:
--     Release the GSM catalog master lock acquired previously by getMasterLock.
--
-- Parameters:
--     lock_handle: handle returned by getMasterLock
--
-- Returns:
--      0 - success
--      3 - parameter error
--      4 - don't own lock
--      5 - illegal lock handle
--
-- Notes:
--
-------------------------------------------------------------------------------

FUNCTION releaseMasterLock( lock_handle IN varchar2 )
 RETURN integer;


-------------------------------------------------------------------------------
--
-- PROCEDURE     createCloud
--
-- Description:
--     Creates a cloud entry in the cloud catalog.
--
-- Parameters:
--     cloud_name: name to give the cloud.
--
-- Notes:
--     Currently the catalog only supports one cloud.
-------------------------------------------------------------------------------
PROCEDURE createCatalog(cloud_name IN varchar2 default NULL,
                       autoVNCR IN number default  dbms_gsm_common.isTrue,
                       instances IN number default NULL,
                       force IN number default  dbms_gsm_common.isFalse);
PROCEDURE createCloud( cloud_name IN varchar2 default NULL,
                       autoVNCR IN number default  dbms_gsm_common.isTrue,
                       instances IN number default NULL,
                       force IN number default  dbms_gsm_common.isFalse);

-------------------------------------------------------------------------------
--
-- PROCEDURE     modifyCatalog
--
-- Description:
--     Modifies information in the cloud catalog
--
-- Parameters:
--     autoVNCR: boolean - isTrue = Turn on autoVNCR
--                         isFalse = Turn off autoVNCR
--
-- Notes:
--     Currently the catalog only supports one cloud.
-------------------------------------------------------------------------------
PROCEDURE modifyCatalog(autoVNCR IN number default NULL);
-------------------------------------------------------------------------------
--
-- PROCEDURE     removeCloud
--
-- Description:
--     Removes the cloud entry from the cloud catalog.
--
-- Parameters:
--     cloud_name: name of the cloud to remove.
--
-- Notes:
--     Currently the catalog only supports one cloud.
-------------------------------------------------------------------------------
PROCEDURE removeCatalog( cloud_name IN varchar2 default NULL );  -- TODO: remove
PROCEDURE removeCloud( cloud_name IN varchar2 default NULL );


-------------------------------------------------------------------------------
--
-- PROCEDURE     addGSM
--
-- Description:
--     Adds a GSM to the cloud.
--
-- Parameters:
--     gsm_name:             GSM alias name
--     gsm_endpoint1:        Listener endpoint
--     gsm_endpoint2:        TODO:?
--     local_ons_port:       Local ONS port for ONS server process
--     remote_ons_port:      Remote ONS port of ONS server process
--     region_name:          The GSM region, if NULL will use the default.
--     gsm_number:           Unique number assigned to the GSM
--
-- Notes:
--     Updates the "_remote_gsm" parameter on the catalog database to point
--     to the new GSM.
--
--     region_name can be NULL if there is only one region in the cloud.
--     In which case the GSM will be added to that region.
--
--     No assumptions should be made about gsm_number other than it is
--     unique for the cloud.  For example, the caller should not assume that it
--     is a monotonically increasing number.
-------------------------------------------------------------------------------
PROCEDURE addGSM( gsm_name        IN  varchar2,
                  gsm_endpoint1   IN  varchar2,
                  gsm_endpoint2   IN  varchar2,
                  local_ons_port  IN  number,
                  remote_ons_port IN  number,
                  region_name     IN  varchar2 default NULL,
                  gsm_number      OUT number,
                  gsm_oracle_home IN  varchar2 default NULL,
                  gsm_hostname    IN  varchar2 default NULL );

-------------------------------------------------------------------------------
--
-- PROCEDURE     syncParameters
--
-- Description:
--     Syncronize spfile parameter values using database information
--
-- Parameters:
--    NONE
--
-- Notes:
--    Currently updates the _gsm and _cloud_name parameters. These values are
--    required for the catalog database instance and will not be set on
--    data-guard standby databases (since createCatalog is never run there).
--    This function will be executed as part of the database open notifier
--    callback on any primary database that is a catalog database
--
------------------------------------------------------------------------------
PROCEDURE syncParameters;

-------------------------------------------------------------------------------
--
-- PROCEDURE     modifyGSM
--
-- Description:
--     Changes a GSM attributes.
--
-- Parameters:
--     gsm_name:             GSM alias name
--     gsm_endpoint1:        Listener endpoint
--     gsm_endpoint2:        TODO:?
--     local_ons_port:       Local ONS port for ONS server process
--     remote_ons_port:      Remote ONS port of ONS server process
--     region_name:          The GSM region.
--
-- Notes:
--     One or more of the attributes can be changed on each call.
--
--     If "gsm_endpoint1" is changed, then will update the "_remote_gsm"
--     parameter on the catalog database with the new endpoint.
-------------------------------------------------------------------------------
PROCEDURE modifyGSM( gsm_name        IN  varchar2,
                     gsm_endpoint1   IN  varchar2 default NULL,
                     gsm_endpoint2   IN  varchar2 default NULL,
                     local_ons_port  IN  number   default NULL,
                     remote_ons_port IN  number   default NULL,
                     region_name     IN  varchar2 default NULL );


-------------------------------------------------------------------------------
--
-- PROCEDURE     removeGSM
--
-- Description:
--     Removes a GSM from the cloud.
--
-- Parameters:
--     gsm_name:             GSM alias name
--
-- Notes:
--    It is up to the caller to insure that the GSM has been stopped.
--
--    Will remove this GSM endpoint from the "_remote_gsm" parameter on the
--    catalog database.
-------------------------------------------------------------------------------
PROCEDURE removeGSM( gsm_name        IN  varchar2 );


-------------------------------------------------------------------------------
--
-- PROCEDURE     disconnectGSM
--
-- Description:
--     Kills GSM session.
--
-- Parameters:
--     gsm_name:             GSM alias name
--     kill_level:           if 0 kill sesssion, if 1 the same immediate,
--                           if 2 disconnect session
--
-- Notes:
--
-------------------------------------------------------------------------------
PROCEDURE disconnectGSM( gsm_name IN  varchar2, kill_level number default 2 );

-------------------------------------------------------------------------------
--
-- PROCEDURE     addVNCR
--
-- Description:
--     Adds VNCR to Cloud
--
-- Parameters:
--     name:             VNCR name
--     group_id:            VNCR group id
--
-- Notes:
--    Group id could be NULL. If set, it allows group removal of VNCRs
-------------------------------------------------------------------------------
PROCEDURE addVNCR( name        IN  varchar2,
                   group_id in varchar2 default NULL,
                   updateRequestTable  IN number
                     default dbms_gsm_utility.updateTrue);

-------------------------------------------------------------------------------
--
-- PROCEDURE     removeVNCR
--
-- Description:
--     removes VNCR from Cloud
--
-- Parameters:
--     name:             VNCR name
--     group_id:            VNCR group id
--
-- Notes:
--    One and only one of either group id or name could be NULL.
-------------------------------------------------------------------------------
PROCEDURE removeVNCR( name IN  varchar2 default NULL,
                      group_id in varchar2 default NULL);

-------------------------------------------------------------------------------
--
-- PROCEDURE     createSubscriber
--
-- Description:
--     Add an AQ subscriber to the change log queue.
--
-- Parameters:
--     gsm_name:    Subscriber name should be a name of one of the GSMs in
--                  the cloud.
--
-- Notes:
--
-------------------------------------------------------------------------------
PROCEDURE createSubscriber( gsm_name IN varchar2 );


-------------------------------------------------------------------------------
--
-- PROCEDURE     removeSubscriber
--
-- Description:
--     Remove an AQ subscriber to the change log queue.
--
-- Parameters:
--     gsm_name:    The name used originally to subscribe to the queue.
--                  The name should have been a name of one of the GSMs in
--                  the cloud.
--
-- Notes:
--
-------------------------------------------------------------------------------
PROCEDURE removeSubscriber( gsm_name IN varchar2 );


-------------------------------------------------------------------------------
--
-- PROCEDURE     addRegion
--
-- Description:
--     Adds a region to the cloud.
--
-- Parameters:
--     region_name:      The name to give to the region.
--     buddy_name:       The name of the buddy region.
--
-- Notes:
--
-------------------------------------------------------------------------------
PROCEDURE addRegion( region_name IN varchar2,
                     buddy_name  IN varchar2 default NULL );


-------------------------------------------------------------------------------
--
-- PROCEDURE     modifyRegion
--
-- Description:
--     Modifies a region.
--
-- Parameters:
--     region_name:      The name of the region to modify.
--     buddy_name:       The name of a buddy region to assign to the region.
--                       Can be NULL.
--
-- Notes:
--
-------------------------------------------------------------------------------
PROCEDURE modifyRegion( region_name     IN varchar2,
                        buddy_name      IN varchar2 default NULL,
                        region_weights  IN varchar2 default NULL);


-------------------------------------------------------------------------------
--
-- PROCEDURE     removeRegion
--
-- Description:
--     Removes a region from the cloud.
--
-- Parameters:
--     region_name:      The name of the region.
--
-- Notes:
--     The region should be empty of GSMs and databases.
--
--     The last region in the cloud cannot be removed.
-------------------------------------------------------------------------------
PROCEDURE removeRegion( region_name IN varchar2 );


-------------------------------------------------------------------------------
--
-- PROCEDURE     addDatabasePool
--
-- Description:
--     Adds a database pool to the cloud.
--
-- Parameters:
--     database_pool_name:    The name to give to the database pool.
--
-- Notes:
--
-------------------------------------------------------------------------------
PROCEDURE addDatabasePool( database_pool_name IN varchar2 );


-------------------------------------------------------------------------------
--
-- PROCEDURE     removeDatabasePool
--
-- Description:
--     Removes a database pool from the cloud.
--
-- Parameters:
--     database_pool_name:    The name of the database pool.
--
-- Notes:
--     The pool should be empty, i.e. it should no longer have any
--     databases or services.
-------------------------------------------------------------------------------
PROCEDURE removeDatabasePool( database_pool_name IN varchar2 );


-------------------------------------------------------------------------------
--
-- PROCEDURE     removeDatabasePoolAdmin
--
-- Description:
--     Adds an administrator for a database pool.
--
-- Parameters:
--     database_pool_name:    The name of the database pool.
--     user_name:             The name of user to become administrator for the
--                            pool.
--
-- Notes:
--     database_pool_name can be NULL if there is only one database pool
--     in the cloud.  In which case the command will default to that pool.
--
--     The user is revoked VPD access to the cloud information about the
--     database pool.
--
--
-------------------------------------------------------------------------------
PROCEDURE removeDatabasePoolAdmin( database_pool_name IN varchar2 default NULL,
                                user_name          IN varchar2 );

-------------------------------------------------------------------------------
--
-- PROCEDURE     addDatabasePoolAdmin
--
-- Description:
--     Adds an administrator for a database pool.
--
-- Parameters:
--     database_pool_name:    The name of the database pool.
--     user_name:             The name of user to become administrator for the
--                            pool.
--
-- Notes:
--     database_pool_name can be NULL if there is only one database pool
--     in the cloud.  In which case the command will default to that pool.
--
--     The user is granted VPD access to the cloud information about the
--     database pool.
--
--     TODO: the user is also given "gsm_pooladmin_role".
-------------------------------------------------------------------------------
PROCEDURE addDatabasePoolAdmin( database_pool_name IN varchar2 default NULL,
                                user_name          IN varchar2 );


-------------------------------------------------------------------------------
--
-- PROCEDURE     poolVpdPredicate
--
-- Description:
--     Enforces VPD read security for database pool tables.
--
-- Parameters:
--     Standard VPD function parameters.
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION  poolVpdPredicate( obj_schema varchar2,
                            obj_name   varchar2 ) RETURN varchar2;

-------------------------------------------------------------------------------
--
-- PROCEDURE     MaskPolicy
--
-- Description:
--     Enforces VPD masking for select on database table
--
-- Parameters:
--     Standard VPD function parameters.
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION MaskPolicy ( obj_schema varchar2,
                      obj_name   varchar2)  RETURN varchar2;
-------------------------------------------------------------------------------
--
-- FUNCTION     VerifyCatalog
--
-- Description:
--     Perform various cross-check verifications on the catalog data
--
-- Parameters:
--     NONE
--
-- Notes:
--
-------------------------------------------------------------------------------
FUNCTION VerifyCatalog
RETURN NUMBER;

-------------------------------------------------------------------------------
--
-- PROCEDURE     cancelAllChanges
--
-- Description:
--       Cancel (and rollback) all outstanding catalog changes
--
-- Parameters:
--       NONE
--
-- Notes:
--       This procedure requires that there are no GSM servers running, and it
--       will get the "master lock" to prevent any from becoming master while
--       it is running
--
--       This is an "escape hatch" to be used only under customer support
--       supervision. Usually the GSM will perform the right cleanup
--       automatically while it is running or as soon as it re-starts
--       after shutdown or crash.
-------------------------------------------------------------------------------
PROCEDURE cancelAllChanges;


-------------------------------------------------------------------------------
--
-- FUNCTION     importBegin
--
-- Description:
--     Clear tables and other possibly important stuff
--
-- Parameters:
--     NONE
--
-------------------------------------------------------------------------------

PROCEDURE importBegin;


-------------------------------------------------------------------------------
--
-- FUNCTION     importEnd
--
-- Description:
--     Update sequences, and other possible stuff after successful import
--
-- Parameters:
--     NONE
--
-------------------------------------------------------------------------------

PROCEDURE importEnd;

-------------------------------------------------------------------------------
--
-- PROCEDURE    checkGSMDown
--
-- Description:
--       Checks whether a GSM is disconnecting from the catalog database.
--       If it is a GSM then post the alert GSM down.
--
-- Parameters:
--       None.
--
-------------------------------------------------------------------------------
PROCEDURE checkGSMDown;
-------------------------------------------------------------------------------
--
-- PROCEDURE     doEncryptGSMPwd
--
-- Description:
--  Encrypt database.GSM_PASSWORD and store in database.ENCRYPTED_GSM_PASSWORD
--
-- Parameters:
--      NULL
--
-------------------------------------------------------------------------------
PROCEDURE doEncryptGSMPwd;
-------------------------------------------------------------------------------
--
-- PROCEDURE     setEncryptedGSMPwd
--
-- Description:
--     Sets value for gsmadmin_internal.database.ENCRYPTED_GSM_PASSWORD
--
-- Parameters:
--     dbname:        The name of the database.
--     encpwd:        content of encrypted password
--
-------------------------------------------------------------------------------
PROCEDURE setEncryptedGSMPwd( dbname varchar2,
                              encpwd   RAW);

--*****************************************************************************
-- End of Package Public Procedures
--*****************************************************************************


END dbms_gsm_cloudadmin;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "GSMADMIN_INTERNAL"."DBMS_GSM_ALERTS" AS


--*****************************************************************************
-- Package Public Types
--*****************************************************************************


--*****************************************************************************
-- Package Public Constants
--*****************************************************************************
 yellow_level          constant  varchar2(7) := 'YELLOW';
 red_level             constant  varchar2(4) := 'RED';
 cpu_threshold         constant  varchar2(4) := 'CPU';
 disk_threshold        constant  varchar2(5) := 'DISK';

-------------------------------------------------------------------------------
-- Default Names
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Identifier lengths
-------------------------------------------------------------------------------

--*****************************************************************************
-- Package Public Exceptions
--*****************************************************************************


--*****************************************************************************
-- Package Public Procedures
--*****************************************************************************
-------------------------------------------------------------------------------
--
-- PROCEDURE    post_alert
--
-- Description:
--       post a GDS alert.
--
-- Parameters:
--        reason_id  -
--        severity -
--        object_name -
--        database_name
--        pool_name -
--        region_name -
--        resource_name -
--        thresh_level -
--        expect_card -
--        current_card -
--        clear_old_alert -
--
-------------------------------------------------------------------------------
procedure post_alert(reason_id      IN   dbms_server_alert.reason_id_t,
                           severity      IN   dbms_server_alert.severity_level_t,
                           object_name     IN   VARCHAR2,
                           instance_name   IN   VARCHAR2 default NULL,
                           database_name   IN   VARCHAR2 default NULL,
                           pool_name       IN   VARCHAR2 default NULL,
                           region_name     IN   VARCHAR2 default NULL,
                           resource_name   IN   VARCHAR2 default NULL,
                           thresh_level    IN   VARCHAR2 default NULL,
                           expect_card     IN   VARCHAR2  default NULL,
                           current_card    IN   VARCHAR2  default NULL);


-------------------------------------------------------------------------------
--
-- PROCEDURE    post_gsm_down
--
-- Description:
--       post a GDS alert : gsm down.
--
-- Parameters:
--       gsm_name -    The name of gsm.
--       region_name - The region GSM belongs to.
--
-------------------------------------------------------------------------------
procedure post_gsm_down(gname     IN  VARCHAR2,
                        rname     IN   VARCHAR2 default NULL);

-------------------------------------------------------------------------------
--
-- PROCEDURE    post_instance_down
--
-- Description:
--       post a GDS alert : instance down or not reachable.
--
-- Parameters:
--       gsm_name -    The name of instance.
--       pool_name -   The pool the instance belongs to.
--       region_name - The region the instance belongs to.
--
-------------------------------------------------------------------------------
PROCEDURE post_instance_down (instance_name IN VARCHAR2,
                              pool_name      IN VARCHAR2 default NULL,
                              region_name    IN VARCHAR2 default NULL);

-------------------------------------------------------------------------------
--
-- PROCEDURE    post_database_down
--
-- Description:
--       post a GDS alert : database down or not reachable.
--
-- Parameters:
--       database_name  - The name of the database.
--       pool_name      - The pool the database belongs to.
--       region_name    - The region the database belongs to.
--
-------------------------------------------------------------------------------
PROCEDURE post_database_down (database_name IN VARCHAR2,
                              pool_name      IN VARCHAR2 default NULL,
                              region_name    IN VARCHAR2 default NULL);

-------------------------------------------------------------------------------
--
-- PROCEDURE    post_threshold_hit
--
-- Description:
--       post a GDS alert : a CPU or a DISK threshold has been hit
--                          for a given service.
--
-- Parameters:
--       service_name -  The name of the service.
--       pool_name -     The pool the service belongs to.
--       resource_name - The resource (CPU or DISK) hit by the threshold.
--       thresh_level -  The threshold level ('Yellow' or 'Red')
--
-------------------------------------------------------------------------------
procedure post_threshold_hit (instance_name  IN VARCHAR2,
                              pool_name      IN VARCHAR2,
                              region_name    IN VARCHAR2,
                              resource_name  IN VARCHAR2,
                              thresh_level   IN VARCHAR2);

-------------------------------------------------------------------------------
--
-- PROCEDURE    post_database_lagging
--
-- Description:
--       post a GDS alert : The replcated database is lagging
--                          for a given service.
--
-- Parameters:
--       service_name -  The name of the service.
--       pool_name -     The pool the service belongs to.
--       database_name - The name of the replicated database.
--       region_name -   The region the database belongs to.
-------------------------------------------------------------------------------
procedure post_database_lagging (service_name  IN VARCHAR2,
                              pool_name     IN VARCHAR2,
                              database_name IN VARCHAR2,
                              region_name IN VARCHAR2);

-------------------------------------------------------------------------------
--
-- PROCEDURE    post_card_off
--
-- Description:
--       post a GDS alert : Service cardinality is off.
--
-- Parameters:
--       service_name -  The name of the service.
--       pool_name -     The pool the service belongs to.
--       exp_card -      The expected cardinality.
--       curr_card -     The current cardinality.
--
-------------------------------------------------------------------------------
procedure post_card_off (service_name IN VARCHAR2,
                         pool_name    IN VARCHAR2,
                         exp_card     IN NUMBER,
                         curr_card    IN NUMBER);

-------------------------------------------------------------------------------
--
-- PROCEDURE    post_card_off
--
-- Description:
--       post a GDS alert : Service cardinality is off.
--
-- Parameters:
--       service_name -  The name of the service.
--       pool_name -     The pool the service belongs to.
--       region_name  -  The region where the cardinality is off.
--
-------------------------------------------------------------------------------
procedure post_card_off (service_name IN VARCHAR2,
                         pool_name    IN VARCHAR2,
                         region_name  IN VARCHAR2 default NULL);

-------------------------------------------------------------------------------
--
-- PROCEDURE    post_catalog_down
--
-- Description:
--       post a GDS alert : The catalog is down or not reachable.
--
-- Parameters:
--       database_name - The name of the database where the catalog has
--                       been created.
-- Note:
--       This will be posted on the cloud databases.
-------------------------------------------------------------------------------
procedure post_catalog_down (database_name IN VARCHAR2);



-------------------------------------------------------------------------------
--
-- FUNCTION   get_gsm_name
--
-- Description:
--       Returns the GSM name associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the GSM name only if a GSM is involved in
--       the GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_gsm_name (my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_instance_name
--
-- Description:
--       Returns the instance name associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the instance name only if an instance is involved in
--       the GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_instance_name (my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_database_name
--
-- Description:
--       Returns the database name associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the instance name only if a database is involved in
--       the GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_database_name (my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_database_name
--
-- Description:
--       Returns the database name associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the instance name only if a database is involved in
--       the GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_service_name(my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_gdspool_name
--
-- Description:
--       Returns the GDS pool name associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the GDS pool name only if a GDS pool is involved in
--       the GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_gdspool_name (my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_region_name
--
-- Description:
--       Returns the region name associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the region name only if a region is named in
--       the GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_region_name (my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_resource_name
--
-- Description:
--       Returns the resource name (CPU or DISK)  associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the resource name only if it is a treshold limit
--       GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_resource_name (my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_thresh_level
--
-- Description:
--       Returns the thresh level (Yellow, Red) associated with the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note:
--       This will return the threshold level if it is a threshold
--       GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_thresh_level (my_alert IN ALERT_TYPE
                 )
          return VARCHAR2;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_expected_cardinality
--
-- Description:
--       Returns the expected cardinality as mentioned in the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note
--       This will return the expected cardinality if it is a cardinality miss
--       GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_expected_cardinality (my_alert IN ALERT_TYPE
                 )
          return BINARY_INTEGER;

-------------------------------------------------------------------------------
--
-- FUNCTION   get_current_cardinality
--
-- Description:
--       Returns the current cardinality as mentioned in the alert.
--
-- Parameters:
--       my_alert - The GDS alert.
-- Note
--       This will return the current cardinality if it is a cardinality miss
--       GDS alert.
-------------------------------------------------------------------------------
FUNCTION get_current_cardinality (my_alert IN ALERT_TYPE
                 )
          return BINARY_INTEGER;

END dbms_gsm_alerts;
/

