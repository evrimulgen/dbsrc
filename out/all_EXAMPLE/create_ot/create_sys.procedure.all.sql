CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."APS_VALIDATE" IS
   AWok BOOLEAN;
   OBJok BOOLEAN;
   x NUMBER; -- dummy output spot
   junklob CLOB;
   v_Value varchar2(64);
   running BOOLEAN;
BEGIN

   begin
     SELECT value INTO v_Value FROM v$option WHERE parameter = 'OLAP';
     if v_Value = 'FALSE' then
       -- set status OPTION OFF
       sys.dbms_registry.Option_Off('APS');
       return;
     end if;
   exception
     when OTHERS then
       null;
   end;

   if dbms_aw.olap_running() then
     running := TRUE;
   else
     running := FALSE;
   end if;

   -- AWs are valid if we can read an option
   BEGIN
     junklob := dbms_aw.INTERP('show SESSCACHE');
     AWok := TRUE;
   EXCEPTION
     WHEN OTHERS THEN
       AWok := FALSE;
   END;

   -- supporting object things
   BEGIN
     SELECT 0 INTO x FROM DBA_OBJECTS
       WHERE STATUS = 'INVALID' AND rownum <=1 AND
         OWNER='SYS' AND OBJECT_NAME IN
        ('OLAP_TABLE', 'OLAPIMPL_T', 'OLAP_SRF_T', 'OLAP_NUMBER_SRF',
         'OLAP_EXPRESSION', 'OLAP_TEXT_SRF', 'OLAP_EXPRESSION_TEXT',
         'OLAP_BOOL_SRF', 'OLAP_EXPRESSION_BOOL');
     -- at least one object is invalid so component is invalid
     OBJok := FALSE;
   EXCEPTION
   WHEN NO_DATA_FOUND THEN
     -- no invalid objects were found so component is valid
     OBJok := TRUE;
   END;

   IF NOT running THEN
      dbms_aw.shutdown(TRUE);
   END IF;

   IF AWok AND OBJok THEN
     dbms_registry.valid('APS');
   ELSE
     dbms_registry.invalid('APS');
   END IF;
  END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."AW_DROP_PROC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
9ba 463
8eeCEwaTCJn5UrS4cqSeQYGbWhkwg5AreSCDfC8ZFz+VoXxsWASspWWU2xS3BIWnV5OKiTO3
6T4lKw0CjfJVGvnOTG6/omvY5VG4/mjH0HK8bdZQxE2kAo6nlpsz3gONBbDX5TkO+LcgCXFb
jnY5nBSgixQhEy+6iAjLVHNEjDgxfnfngGYS5mpQfh1Q1W05FQgx5zumNVrJHD7YJThKUF71
tiK/mIvpmuMtxxViD93aiNP1WaVjsbyF5894V9amsxgOgn1mN6OiwieF6rD+BRgT6ywm9prW
f5GvZiimLFPYd2BkdtEzfqLb2dUxVuh0lBMuTPoCSXvp6NyYed24dKuSTQ58shAoYZg5VovD
eSlIc5giHJ+gwDRCZj86wHq8EmUiIoQFhhTt6xQTE5iGdnO2dtATgU9x1ItDUnNGdGd1stDZ
B4EwEeW/We9PtUgIv8QVIha014SKhRCYGdHqckJAE5iSVMHnLaLkC+0jp51I60NomtnboNoa
Sem7+hgu8ljovWVSJuiIlw26c3EkVrbttnvHBOXUqheeQnJRPBSiRF0uHnuaPhGRs8gsKi/H
l8P9cA4ACFdBPKdqpT5inNNvREXMcKbmxVF8eXYYGv8hQurQ2CRLWnrsuPP8k/8b0uyPCd+2
TmjJBKERo9UlZpl+jHvLKO4feYyeB6M3IagGIX5nGlHxkiYWjcduF8YN6OA9LN4mWMOAoncY
iPzlq8zVstmwK+nwQ4BZfU9f5rLfsCVlmH5wUs+cNmnTrOgagLao8vgW82nD6vfPAp9jDtvu
If3QPUVvAgAWxUHL8vOdiztU0NvXSF0jBqNKxz5Y41d9DqyRcEHVymNpZcKE0EQ7hEJbZWfi
6xgbiXjlyMKKCbLVDuPuMDkGRZT2Ps362CWfepdXJTSCnfcr7qIppV5SDvU66jhUbv+x6lAU
IBE+5Bij8//Txk5NzS/P1YsS26Tf1vzLvPB4ctu/ctv+/9v+Xs8Zh5U7a72LqqIXlX4Vj8PS
j1S58p0XBY2q5Pb8FHxwvKD0ysAYSRnRYW7p4tqsdIlMJ8DEeyiMR5AZVBkz1LH3eDQig4S8
nFNv2ZWhCwc/yh00A/Ai5B3wcgtC
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."AW_REN_PROC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
62a 327
JLO84JSqaslwB3DF/6+4gVj5wiIwg/BcLtDrfC9DaA9/CW3sDtPNYUtNojXAtzEbyLSvn9/S
kajblFCHU4rQF4pX/2H8pytcHv80/otqt97V6UrpSfO8tSrQJKpYJNCdqkemZi34ftJr6U1X
enxYnFni6nA7bioX2FHBFk8ThoheFNsj9HamnUO0/PKliX6mO5H4QC4rXgjygMuYrMQT1yOY
8GLxme8nPIf6/hEJU0yaVXlu5vqJTaGPewL7eV7OuB4257qKQPGEAbP4/UmQx7K5lZjJByXs
0ql6lbm4D1LA65hFqjwFdKfszSdx1N0wf1du5kwQNVTCPziHt66chUwluQvjCH+M26sBdQkW
MlGb0/2LhcxTSlftZ03sYWCMvDy2+hx6F1bsVOUFPmIdcES7K2nvmh7AZkKnFavHsr59U0oZ
2yHLo1Pf10BgVQyzyCGC2OoZPJxaasYjsLfwOHl4cb2TFhuQe2cAoFFPj8knsl9/h5evmBDT
FJimLazhul1Em+RLqeCJpaH024claMsyoGN/mkgGqamolUb1i/Xw6QkEv3ozH6HadTtGrkfH
G49YnAzMpMNl6N5ypFUF4UXuW/A5S21mxiqRS7x2wNjGYYMV2h8gP0TeosndYJIq92gAF0iF
nKXSopE82gW1+vvsAq3tGy6urRB6h+xJpvrFAj/WX1TsbxWwxoK/M23DvlD5ax62mFh02TKB
qczP0UoFP8EVWcEIjmE8R1WCKBJlhZvi4uuz2oqPj8furOuWhV5ksumubPMuDLXzKQqqO6pU
Hw==
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."AW_TRUNC_PROC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
797 390
qeC/88wI4tw6ObF5Kef6a4fTttwwg41ceSATfC8ZweQYt/E+fAFNLkXciODxHdwOHRPgXqeu
Efz+eeXfzQyq5P8Hf6GnyY5c8DKWcgD+BseT+nVJMpXuBU8zseu7u9DNcrAs0Lamrki5o+2W
rZHhHFSUsNij0d1aRNX/WgHvMDIWM0lZqC/29VxtBKmq8EImgj7mieGJlAWUfshhWIWgFzsf
pT8No+LqvC2Uwo2t1YBmVPaiU4cZGZ/nPl4td3zTawPfjiIZcTsSplicZKZn9uFTGzkRE35F
Rb6bMCzi53tvQAQ/UdHfNGVmVZNBg0jO0bZN1J1+ElAO54vsecAi/jf0Gl4v5kEQ7nwX19gQ
bXuQwDUaKQ8fhl5G2549ZWMwYx2UsDRwXYq+QZLuRAfYFscZ5fjPuGVbHutJ8IflGRZMrdZE
aFbKweCw66/6Iz5BTlSEVvZr7b8i/4mnw+ih6k15bJlGyWL2iY0qPsaIybLuohBUXrLyqMD6
RoRES0A50oJxsmM3ItQMdtiD8WkSlHU49i35gsiZ03DtNzLGq20h1kW/wlazBizsVsoj600b
sD69HqmKQAUC5oCpIvRUGJqu78koaz1PrssO4FgGMyLSYXaEAbrsJerqpr7MBr2W80BtMCTW
Nkq2pzeI6yYxshmrxESH9gQlDhtE44KVNdysGmOGLSK9l9x+ylZ/Hsdx0LcgEfFjQlCJ1slM
Nq3/qKxDQ8gQIncuIbv4OqqwGWXAanzF0/BporHPy3JySDRgV9rrhVV3fyE72SmsBH/1U5Su
B7kRi//5yuXdQ1U7kOiYIFY8MR3+5MdSirbA0VC4ua5Ix65N6xUA38tUd0IcM4P5f8ejnil3
M5BCk/Yc9147a6wTbakF0yxdpdcPtG0KMw==
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ACTIVE_DATA_GUARD"
    (feature_boolean  OUT  NUMBER,
      aux_count        OUT  NUMBER,
      feature_info     OUT  CLOB)
AS
    feature_usage         varchar2(1000);
    num_casc_stby         number;
    num_dgconfig          number;
    num_far_sync          number;
    num_realtime_query    number;
    num_terminal_db       number;
    num_rolling           number;
    num_rolling_logs      number;
    num_rolling_parts     number;
    num_rolling_pops      number;
    num_rolling_pots      number;
    num_global_seq_use    number;
    use_global_sequences  varchar2(5);
    use_realtime_query    varchar2(5);
    use_rolling           varchar2(5);
BEGIN
    -- initialize
    feature_boolean := 0;
    aux_count := 0;
    num_casc_stby := 0;
    num_dgconfig :=0;
    num_far_sync := 0;
    num_realtime_query := 0;
    num_terminal_db := 0;
    num_rolling := 0;
    num_rolling_logs := 0;
    num_rolling_parts := 0;
    num_rolling_pops := 0;
    num_rolling_pots := 0;
    num_global_seq_use := 0;
    use_global_sequences := 'FALSE';
    use_realtime_query := 'FALSE';
    use_rolling := 'FALSE';

    -- We have to first look for each Active Data Guard feature before we can
    -- report if they are using any of them.

    -- determine if v$dataguard_config is populated
    execute immediate 'select count(*) from v$dataguard_config'
        into num_dgconfig;

    -- Depending on whether v$dataguard_config is populated or not, some
    -- of the commands below will either use v$dataguard_config or
    -- v$archive_dest.

    if (num_dgconfig > 0) then
        -- get number of Far Sync Instances
        execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
            'from v$dataguard_config ' ||
            'where (DEST_ROLE = ''FAR SYNC INSTANCE'')'
            into num_far_sync;
        if (num_far_sync > 0) then
            feature_boolean := 1;
        end if;

        -- get the number of cascading standbys
        execute immediate 'select count(unique(PARENT_DBUN)) ' ||
            'from v$dataguard_config ' ||
            'where (PARENT_DBUN not in ' ||
            '(select DB_UNIQUE_NAME from v$database) and ' ||
            'PARENT_DBUN != ''NONE'' and PARENT_DBUN != ''UNKNOWN'')'
            into num_casc_stby;
        if (num_casc_stby > 0) then
            feature_boolean := 1;
        end if;

        -- get the number of terminal databases
        -- Note: this is not an Active Data Guard feature, but we report it.
        execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
            'from v$dataguard_config ' ||
            'where (DB_UNIQUE_NAME not in ' ||
            '(select PARENT_DBUN from v$dataguard_config) and ' ||
            'PARENT_DBUN != ''UNKNOWN'')'
            into num_terminal_db;

        -- check for DBMS_ROLLING usage
        execute immediate 'select count(status) from dba_rolling_status'
            into num_rolling;
        if (num_rolling > 0) then
            feature_boolean := 1;
            use_rolling := 'TRUE';

            -- get the total number of DBMS_ROLLING participants
            execute immediate 'select count(dbun) '                     ||
                'from dba_rolling_databases '                           ||
                'where participant=''YES'''
                into num_rolling_parts;

            -- get the number of physicals of the original primary
            execute immediate 'select count(scope) '                    ||
                'from dba_rolling_parameters where name=''PROTECTS'''   ||
                'and curval=''PRIMARY'' and scope in (select dbun '     ||
                'from dba_rolling_databases where participant=''YES'''  ||
                'and role=''PHYSICAL'')'
                into num_rolling_pops;

            -- get the number of physicals of the future primary
            execute immediate 'select count(scope) '                    ||
                'from dba_rolling_parameters where name=''PROTECTS'''   ||
                'and curval=''TRANSIENT'' and scope in (select dbun '   ||
                'from dba_rolling_databases where participant=''YES'' ' ||
                'and role=''PHYSICAL'')'
                into num_rolling_pots;

            -- get the number of logical standbys
            execute immediate 'select count(dbun) '                     ||
                'from dba_rolling_databases where participant=''YES'' ' ||
                'and role=''LOGICAL'' and dbun != '                     ||
                '(select future_primary from dba_rolling_status)'
                into num_rolling_logs;
        end if;
    else
        -- get number of Far Sync Instances
        execute immediate 'select count(*) from v$archive_dest_status ' ||
            'where status = ''VALID'' and type = ''FAR SYNC'''
            into num_far_sync;
        if (num_far_sync > 0) then
            feature_boolean := 1;
        end if;

        -- copy far sync instance count into cascading standby
        num_casc_stby := num_far_sync;
    end if;

    -- check for real time query usage
    -- We can only count the directly connected standbys
    execute immediate 'select count(*) from v$archive_dest_status ' ||
        'where status = ''VALID'' and ' ||
        'recovery_mode like ''MANAGED%'' and ' ||
        'database_mode = ''OPEN_READ-ONLY'''
        into num_realtime_query;
    if (num_realtime_query > 0) then
        use_realtime_query := 'TRUE';
        feature_boolean := 1;
    end if;
    -- check for global sequence usage
    execute immediate 'select count(*) from dba_sequences ' ||
        'where sequence_owner != ''SYS'' and session_flag = ''N'''
        into num_global_seq_use;
    if (num_global_seq_use > 0) then
        use_global_sequences := 'TRUE';
    end if;
    if (feature_boolean = 1) then
        feature_usage :=
                'Number of Far Sync Instances: ' || to_char(num_far_sync) ||
        ', ' || 'Number of Cascading databases: ' || to_char(num_casc_stby) ||
        ', ' || 'Number of Terminal databases: ' || to_char(num_terminal_db) ||
        ', ' || 'Real Time Query used: ' || upper(use_realtime_query) ||
        ', ' || 'Global Sequences used: ' || upper(use_global_sequences) ||
        ', ' || 'DBMS_ROLLING used: ' || upper(use_rolling) ||
        ', ' || 'Number of DBMS_ROLLING Participants: '
             || to_char(num_rolling_parts) ||
        ', ' || 'Number of DBMS_ROLLING OP Physicals: '
             || to_char(num_rolling_pops) ||
        ', ' || 'Number of DBMS_ROLLING FP Physicals: '
             || to_char(num_rolling_pots) ||
        ', ' || 'Number of DBMS_ROLLING OP Logicals: '
             || to_char(num_rolling_logs)
        ;
        feature_info := to_clob(feature_usage);
    else
        feature_info := to_clob('Active Data Guard usage not detected');
    end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ADAPTIVE_PLANS"
  (feature_boolean    OUT  NUMBER,
   aux_count          OUT  NUMBER,
   feature_info       OUT  CLOB)
AS
  NEW_LINE      CONSTANT  VARCHAR2(8) := '
';

  adaptive_plan_param     VARCHAR2(10);   -- adaptive plans parameter
  reporting_param         VARCHAR2(10);   -- reporting mode parameter
  num_all_queries         NUMBER;         -- number of queries
  num_adaptive_queries    NUMBER;         -- number of adaptive queries
  reporting_param_value   VARCHAR2(10);   -- reporting mode param value
  tmp_buf                 VARCHAR2(32767);

BEGIN
  dbms_lob.createtemporary(feature_info, TRUE);

  select ksppstvl
  into adaptive_plan_param
  from x$ksppi x, x$ksppcv y where (x.indx = y.indx) and
  ksppinm = '_optimizer_adaptive_plans';

  select ksppstvl
  into reporting_param
  from x$ksppi x, x$ksppcv y where (x.indx = y.indx) and
  ksppinm = 'optimizer_adaptive_reporting_only';

  if (reporting_param = 'FALSE' AND adaptive_plan_param = 'TRUE') then
    feature_boolean := 1;
  else
    feature_boolean := 0;
  end if;

  if (reporting_param = 'FALSE') then
    reporting_param_value := 'No';
  else
    reporting_param_value := 'Yes';
  end if;


  -- Find # of sqls in v$sql
  select count(*)
  into   num_all_queries
  from   v$sql vs, v$sqlcommand vsc
  where vs.command_type = vsc.command_type and
  vsc.command_name in ('INSERT', 'SELECT', 'UPDATE', 'DELETE', 'UPSERT');

  -- Find # of sqls which are adaptive
  select count(*)
  into   num_adaptive_queries
  from   v$sql vs, v$sqlcommand vsc
  where vs.command_type = vsc.command_type and
  vs.is_resolved_adaptive_plan is NOT NULL and
  vsc.command_name in ('INSERT', 'SELECT', 'UPDATE', 'DELETE', 'UPSERT');

  tmp_buf := 'Total number of queries: ' || num_all_queries ||
             NEW_LINE ;

  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  tmp_buf := 'Number of queries with an adaptive plan: ' ||
              num_adaptive_queries ||
             NEW_LINE ;

  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  tmp_buf := 'Percentage of queries with an adaptive plan: ' ||
             100*num_adaptive_queries/num_all_queries ||
             NEW_LINE ;

  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  tmp_buf := 'Are the queries running in reporting mode ? : ' ||
             reporting_param_value ||
             NEW_LINE ;

  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

END dbms_feature_adaptive_plans;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ADV_IDXCMP" (
    feature_boolean OUT NUMBER,
    aux_count       OUT NUMBER,
    feature_info    OUT CLOB)
AS
    feature_usage               varchar2(1000);
    oltp_high_idx_cnt           number;
    oltp_low_idx_cnt            number;
    oltp_high_part_idx_cnt      number;
    oltp_low_part_idx_cnt       number;
    num_oltp_high               number;
    num_oltp_low                number;
    blk_oltp_high               number;
    blk_oltp_low                number;
    def_oltp_high               number;
    def_oltp_low                number;

BEGIN
    feature_boolean             := 0;
    aux_count                   := 0;

    --Check for ADVANCED HIGH seg, block, deferred seg
    execute immediate 'select count(*) from seg$ s ' ||
      ' where s.type# = 6 AND ' ||
            ' s.user# not in (select user# from user$ ' ||
                ' where name in (''SYS'' , ''SYSTEM'' )) AND' ||
            ' bitand(s.spare1, 2048) = 2048 AND ' ||
            ' bitand(s.spare1, 16777216 + 1048576) = 16777216 '
      into num_oltp_high;

    if (num_oltp_high = 0) then
      blk_oltp_high := 0;
    else
      execute immediate 'select sum(blocks) from seg$ s ' ||
        ' where s.type# = 6 AND ' ||
              ' s.user# not in (select user# from user$ ' ||
                  ' where name in (''SYS'', ''SYSTEM'' )) AND' ||
              ' bitand(s.spare1, 2048) = 2048 AND ' ||
              ' bitand(s.spare1, 16777216 + 1048576) = 16777216 '
        into blk_oltp_high;
    end if;

    execute immediate 'select count(*) from deferred_stg$ ds ' ||
      ' where ds.obj# in (select obj# from obj$ ob' ||
                ' where ob.owner# not in (select user# from user$ ' ||
                          ' where name in (''SYS'', ''SYSTEM'' ))) AND' ||
            ' bitand(ds.flags_stg, 4) = 4 AND ' ||
            ' bitand(ds.cmpflag_stg, 6) = 2 '
      into def_oltp_high;

    --Check for ADVANCED LOW seg, block, deferred seg
    execute immediate 'select count(*) from seg$ s ' ||
      ' where s.type# = 6 AND ' ||
            ' s.user# not in (select user# from user$ ' ||
                ' where name in (''SYS'', ''SYSTEM'' )) AND' ||
            ' bitand(s.spare1, 2048) = 2048 AND ' ||
            ' bitand(s.spare1, 16777216 + 1048576) = 1048576 '
      into num_oltp_low;

    if (num_oltp_low = 0) then
      blk_oltp_low := 0;
    else
      execute immediate 'select sum(blocks) from seg$ s ' ||
        ' where s.type# = 6 AND ' ||
              ' s.user# not in (select user# from user$ ' ||
                  ' where name in (''SYS'', ''SYSTEM'' )) AND' ||
              ' bitand(s.spare1, 2048) = 2048 AND ' ||
              ' bitand(s.spare1, 16777216 + 1048576) = 1048576 '
        into blk_oltp_low;
    end if;

    execute immediate 'select count(*) from deferred_stg$ ds ' ||
      ' where ds.obj# in (select obj# from obj$ ob' ||
                ' where ob.owner# not in (select user# from user$ ' ||
                          ' where name in (''SYS'', ''SYSTEM'' ))) AND' ||
            ' bitand(ds.flags_stg, 4) = 4 AND ' ||
            ' bitand(ds.cmpflag_stg, 6) = 4 '
      into def_oltp_low;

    --Summary
    feature_usage :=
        ' Advanced Index Compression feature usage: ' ||
                ' Segments Compressed for ADVANCED HIGH: ' ||
                  to_char(num_oltp_high) ||
        ', ' || ' Blocks Compressed for ADVANCED HIGH: ' ||
                  to_char(blk_oltp_high) ||
        ', ' || ' Deferred Segements Compressed for ADVANCED HIGH: ' ||
                  to_char(def_oltp_high) ||
        ', ' || ' Segments Compressed for ADVANCED LOW: ' ||
                  to_char(num_oltp_low) ||
        ', ' || ' Blocks Compressed for ADVANCED LOW: ' ||
                  to_char(blk_oltp_low) ||
        ', ' || ' Deferred Segements Compressed for ADVANCED LOW: ' ||
                  to_char(def_oltp_low);

    if (num_oltp_high + def_oltp_high + num_oltp_low + def_oltp_low > 0) then
      feature_boolean := 1;
      feature_info := to_clob(feature_usage);
    else
      feature_boolean := 0;
      feature_info := to_clob('Advanced Index Compression not detected');
    end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ADV_TABCMP" (
    feature_boolean OUT NUMBER,
    aux_count       OUT NUMBER,
    feature_info    OUT CLOB)
AS
    feature_usage               varchar2(1000);
    num_tab                     number;
    num_tab_part                number;
    num_tab_subpart             number;

BEGIN
    feature_boolean             := 0;
    aux_count                   := 0;

    -- dbms_compression might create tables with
    -- prefixes 'CMP4%' which we want to ignore
    execute immediate
       'select count(*) from dba_tables where ' ||
       'compress_for = ''ADVANCED'' and table_name ' ||
       'not like ''CMP4$%'' '
    into num_tab;

    execute immediate
       'select count(*) from dba_tab_partitions where ' ||
       'compress_for = ''ADVANCED'' '
    into num_tab_part;

    execute immediate
       'select count(*) from dba_tab_subpartitions where ' ||
       'compress_for = ''ADVANCED'' '
    into num_tab_subpart;

    --Summary
    feature_usage :=
        ' ADVANCED Table Compression Feature Usage: ' ||
                ' Tables compressed for ADVANCED: ' ||
                  to_char(num_tab) ||
        ', ' || ' Table partitions compressed for ADVANCED: ' ||
                  to_char(num_tab_part) ||
        ', ' || ' Table subpartitions compressed for ADVANCED: ' ||
                  to_char(num_tab_subpart);

     if (num_tab + num_tab_part + num_tab_subpart > 0) then
      feature_boolean := 1;
      feature_info := to_clob(feature_usage);
    else
      feature_boolean := 0;
      feature_info := to_clob('ADVANCED Table Compression Not Detected');
    end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_APEX"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
    l_apex_schema   varchar2(30) := null;
    l_usage_detect  number := 0;
    l_num_apps      number := 0;
    l_num_workspace number := 0;
    l_num_users     number := 0;
begin
    /* Determine current schema for Application Express
       Note: this will only return one row              */
    for c1 in (select schema
                 from dba_registry
                where comp_id = 'APEX' ) loop
        l_apex_schema := dbms_assert.enquote_name(c1.schema, FALSE);
    end loop;

    /* If not found, then APEX is not installed */
    if l_apex_schema is null then
        feature_boolean := 0;
        aux_count := 0;
        feature_info := to_clob('APEX usage not detected');
        return;
    end if;

    /* Determine if any activity since last sample date */
    execute immediate 'select count(*)
  from dual
 where exists (select null
                 from '||l_apex_schema||'.wwv_flow_activity_log
                where time_stamp > nvl((select last_sample_date
                                          from dba_feature_usage_statistics
                                         where name = ''Application Express''),
                                       (sysdate -7)) )' into l_usage_detect;

    if l_usage_detect = 1 then

       /* Determine the number of user-created applications */
       execute immediate 'select count(*)
  from '||l_apex_schema||'.wwv_flows
 where security_group_id != 10' into l_num_apps;

        /* Determine the number of workspaces */
        execute immediate 'select count(*)
  from '||l_apex_schema||'.wwv_flow_companies
 where provisioning_company_id != 10' into l_num_workspace;

        /* Determine the number of non-internal Application Express users */
        execute immediate 'select count(*)
  from '||l_apex_schema||'.wwv_flow_fnd_user
 where security_group_id != 10' into l_num_users;

        feature_boolean := 1;
        aux_count := l_num_apps;
        feature_info := to_clob('Number of applications: '||to_char(l_num_apps)||
        ', '||'Number of workspaces: '||to_char(l_num_workspace)||
        ', '||'Number of users: '||to_char(l_num_users));

    else
        feature_boolean := 0;
        aux_count := 0;
        feature_info := to_clob('APEX usage not detected');
    end if;

end DBMS_FEATURE_APEX;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ASM"
      (is_used OUT number, total_diskgroup_size OUT number, summary OUT clob)
AS
   redundancy_type    clob;
   max_diskgroup_size number;
   min_diskgroup_size number;
   num_disk           number;
   num_diskgroup      number;
   min_disk_size      number;
   max_disk_size      number;
   num_failgroup      number;
   min_failgroup_size number;
   max_failgroup_size number;

BEGIN
  -- initialize
  redundancy_type      := 'Redundancy';
  max_diskgroup_size   := NULL;
  min_diskgroup_size   := NULL;
  total_diskgroup_size := NULL;
  num_disk             := NULL;
  num_diskgroup        := NULL;
  min_disk_size        := NULL;
  max_disk_size        := NULL;
  num_failgroup        := NULL;
  min_failgroup_size   := NULL;
  max_failgroup_size   := NULL;

  select count(*) into is_used from v$asm_client;
  -- if asm is used
  if (is_used >= 1) then

       select max(total_mb), min(total_mb), sum(total_mb), count(*)
         into max_diskgroup_size, min_diskgroup_size,
              total_diskgroup_size, num_diskgroup
         from v$asm_diskgroup;

       select max(total_mb), min(total_mb), count(*)
         into max_disk_size, min_disk_size, num_disk
         from v$asm_disk;

       select max(total_fg_mb), min(total_fg_mb), count(*)
         into max_failgroup_size, min_failgroup_size, num_failgroup
         from (select sum(total_mb) as total_fg_mb
                 from v$asm_disk
                 group by failgroup);



       for item in (select type, count(*) as rcount from v$asm_diskgroup group by type)
       loop
         redundancy_type:=redundancy_type||':'||item.type||'='||item.rcount;
       end loop;

       summary :=redundancy_type||':total_diskgroup_size:'||total_diskgroup_size
                ||':max_diskgroup_size:'||max_diskgroup_size
                ||':min_diskgroup_size:'||min_diskgroup_size
                ||':num_diskgroup:'||num_diskgroup
                ||':max_disk_size:'||max_disk_size
                ||':min_disk_size:'||min_disk_size
                ||':num_disk:'||num_disk
                ||':max_failgroup_size:'||max_failgroup_size
                ||':min_failgroup_size:'||min_failgroup_size
                ||':num_failgroup:'||num_failgroup;

  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AUDIT_OPTIONS"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   uniaud_linkon        NUMBER;
   system_audit_options NUMBER;
   object_audit_options NUMBER;
   audit_trail          VARCHAR2(100);
   feature_usage        VARCHAR2(1000);
BEGIN

  -- Initialize
  feature_boolean       := 0;
  aux_count             := 0;
  feature_info          := NULL;
  system_audit_options  := 0;
  object_audit_options  := 0;

  -- Check if 'uniaud_on' is linked
  select count(*) into uniaud_linkon from v$option
    where parameter like '%Unified Auditing%' and value = 'TRUE';

  -- Get the value of 'audit_trail' parameter
  select UPPER(value) into audit_trail from v$parameter
    where UPPER(name) = 'AUDIT_TRAIL';

  -- If Unified auditing is ON, then Audit options(OLD) are always disabled
  if ((uniaud_linkon = 0) AND (audit_trail != 'NONE')) then
    feature_boolean := 1;
  end if;

  select count(*) into system_audit_options from audit$;
  select count(*) into object_audit_options from dba_obj_audit_opts;

  feature_usage := 'AUDIT_TRAIL=' || audit_trail || '; ' ||
   'Number of system audit options=' || to_char(system_audit_options) || '; '||
   'Number of object audit options=' || to_char(object_audit_options);
  feature_info := to_clob(feature_usage);

END dbms_feature_audit_options;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AUM"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  ts_info         varchar2(1000);
  undo_blocks     number;
  max_concurrency number;
BEGIN

  select count(*) into feature_boolean from v$system_parameter where
    name = 'undo_management' and upper(value) = 'AUTO';

  if (feature_boolean = 0) then
    /* not automatic undo management */
    aux_count    := 0;
    feature_info := null;
  else

    aux_count := 0;

    /* undo tablespace information */
    for ts_type in
      (select retention, count(*) tcount, sum(size_mb) size_mb
        from
         (select ts.tablespace_name, retention, sum(bytes)/1048576 size_mb
           from dba_data_files df, dba_tablespaces ts
          where df.tablespace_name = ts.tablespace_name
            and ts.contents = 'UNDO'
          group by ts.tablespace_name, retention)
        group by retention)
    loop

      /* track total number of tablespaces */
      aux_count := aux_count + ts_type.tcount;

      ts_info := ts_info ||
          '(Retention: ' || ts_type.retention ||
         ', TS Count: ' || ts_type.tcount ||
         ', Size MB: '  || ts_type.size_mb || ') ';

    end loop;

    /* get some more information */
    select sum(undoblks), max(maxconcurrency)
      into undo_blocks, max_concurrency
      from v$undostat
      where begin_time >=
             (SELECT nvl(max(last_sample_date), sysdate-7)
                FROM dba_feature_usage_statistics);

    ts_info := ts_info || '(Undo Blocks: ' || undo_blocks ||
                         ', Max Concurrency: ' || max_concurrency || ') ';

    for ssold in
      (select to_char(min(begin_time), 'YYYY-MM-DD HH24:MI:SS') btime,
              to_char(max(end_time),   'YYYY-MM-DD HH24:MI:SS') etime,
              sum(SSOLDERRCNT) errcnt
        from v$undostat
        where (begin_time >=
               (SELECT nvl(max(last_sample_date), sysdate-7)
                  FROM dba_feature_usage_statistics)))
    loop
      ts_info := ts_info ||
          '(Snapshot Old Info - Begin Time: ' || ssold.btime ||
                        ', End Time: '   || ssold.etime ||
                        ', SSOLD Error Count: ' || ssold.errcnt || ') ';
    end loop;

    feature_boolean := 1;
    feature_info    := to_clob(ts_info);

  end if;

END dbms_feature_aum;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AUTOSTA"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  asqlt_task_name    VARCHAR2(30) := 'SYS_AUTO_SQL_TUNING_TASK';

  execs_since_sample NUMBER;                  -- # of execs since last sample
  total_execs        NUMBER;                  -- number of task executions
  w_auto_impl        NUMBER;                  -- execs with AUTO implement on
  profs_rec          NUMBER;                  -- total profiles in task
  savedsecs          NUMBER;                  -- db time saved (s)
  tmp_buf            VARCHAR2(32767);         -- temp buffer
BEGIN

  /*
   * We compute the following stats for db feature usage:
   *   Number of executions since last sample (execs_since_sample)
   *   Total number of executions in the task (total_execs)
   *   Total number of executions with auto-implement ON (w_auto_impl)
   *   Total number of SQL profiles recommended in the task (profs_rec)
   *   Projected DB Time Saved through Auto Implementation (savedsecs)
   *
   * Note that these stats are only computed through looking at the task,
   * which, by default, stores results from the last month of history only.
   */

  -- execs since last sample
  SELECT count(*)
  INTO   execs_since_sample
  FROM   dba_advisor_executions
  WHERE  task_name = asqlt_task_name AND
         execution_last_modified >= (SELECT nvl(max(last_sample_date),
                                                sysdate-7)
                                     FROM   dba_feature_usage_statistics);

  -- total # of executions
  SELECT count(*)
  INTO   total_execs
  FROM   dba_advisor_executions
  WHERE  task_name = asqlt_task_name;

  -- #execs with auto implement ON
  SELECT count(*)
  INTO   w_auto_impl
  FROM   dba_advisor_exec_parameters
  WHERE  task_name = asqlt_task_name AND
         parameter_name = 'ACCEPT_SQL_PROFILES' AND
         parameter_value = 'TRUE';

  -- total profiles recommended so far
  SELECT count(*)
  INTO   profs_rec
  FROM   dba_advisor_recommendations r
  WHERE  r.task_name = asqlt_task_name AND
         r.type = 'SQL PROFILE';

  -- db time saved by AUTO impl profiles
  SELECT round(nvl(sum(before_usec - after_usec)/1000000, 0))
  INTO   savedsecs
  FROM   (SELECT nvl(o.attr8, 0) before_usec,
                 nvl(o.attr8, 0) * (1 - r.benefit/10000) after_usec
          FROM   dba_sql_profiles sp,
                 dba_advisor_objects o,
                 dba_advisor_findings f,
                 dba_advisor_recommendations r
          WHERE  o.task_name = asqlt_task_name AND
                 o.type = 'SQL' AND
                 sp.task_id = o.task_id AND
                 sp.task_obj_id = o.object_id AND
                 sp.task_exec_name = o.execution_name AND
                 o.task_id = f.task_id AND
                 o.execution_name = f.execution_name AND
                 o.object_id = f.object_id AND
                 f.finding_id = sp.task_fnd_id AND
                 r.task_id = f.task_id AND
                 r.execution_name = f.execution_name AND
                 r.finding_id = f.finding_id AND
                 r.rec_id = sp.task_rec_id AND
                 sp.type = 'AUTO');

  -- the used boolean and aux count we set to the number of execs since last
  -- sample
  feature_boolean := execs_since_sample;
  aux_count := execs_since_sample;

  -- compose the CLOB
  tmp_buf := 'Execution count so far: '          || total_execs || ', ' ||
             'Executions with auto-implement: '  || w_auto_impl || ', ' ||
             'SQL profiles recommended so far: ' || profs_rec   || ', ' ||
             'Projected DB Time Saved Automatically (s): ' || savedsecs;

  dbms_lob.createtemporary(feature_info, TRUE);
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

END dbms_feature_autosta;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AUTO_MEM"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  feature_usage          varchar2(1000);
  memory_target             number;
  sga_max_size              number;
  memory_max_target         number;
begin

  -- initialize
  feature_boolean := 0;
  aux_count := 0;
  feature_info := to_clob('Automatic Memory Tuning usage not detected');
  feature_usage := '';
  memory_target := 0;
  sga_max_size := 0;
  memory_max_target := 0;

  execute immediate 'select to_number(value) from v$system_parameter where ' ||
                    'name like ''memory_target'''
  into memory_target;

  if memory_target > 0
  then

    feature_boolean := 1;

    feature_usage := feature_usage||':memory_target:'||memory_target;

    -- get sga_max_size value
    execute immediate 'select to_number(value) from v$system_parameter where ' ||
                      'name like ''sga_max_size'''
    into sga_max_size;

    feature_usage := feature_usage||':sga_max_size:'||sga_max_size;

    -- get memory_max_target value
    execute immediate 'select to_number(value) from v$system_parameter where ' ||
                      'name like ''memory_max_target'''
    into memory_max_target;

    feature_usage := feature_usage||':memory_max_target:'||memory_max_target;

    -- get v$memory_dynamic_components info
    for item in (select component, current_size, min_size, max_size,
                 user_specified_size from
                 v$memory_dynamic_components where current_size != 0)
    loop
      feature_usage := feature_usage||':comp:'||item.component||
                       ':cur:'||item.current_size||':min:'||
                       item.min_size||':max:'||item.max_size||
                       ':usr:'||item.user_specified_size;
    end loop;

    -- get v$pgastat info
    for item in (select name, value from v$pgastat where
                 name in ('tot PGA alc', 'over alc cnt',
                          'tot PGA for auto wkar',
                          'tot PGA for man wkar',
                          'glob mem bnd', 'aggr PGA auto tgt',
                          'aggr PGA tgt prm'))
    loop
      feature_usage := feature_usage||':'||item.name||':'||item.value;
    end loop;

    -- get v$memory_target_advice info
    feature_usage := feature_usage||':mem tgt adv:';
    for item in (select memory_size, memory_size_factor, estd_db_time,
                 estd_db_time_factor from v$memory_target_advice
                 order by memory_size)
    loop
      feature_usage := feature_usage||':msz:'||item.memory_size||
                       ':sf:'||item.memory_size_factor||
                       ':time:'||item.estd_db_time||
                       ':tf:'||item.estd_db_time_factor;
    end loop;

    -- get v$system_event info for SGA events
    for item in (select substr(event, 0, 15) evt, total_waits, time_waited
                 from v$system_event where event like '%SGA%')
    loop
      feature_usage := feature_usage||':event:'||item.evt||':waits:'||
                       item.total_waits||':time:'||item.time_waited;
    end loop;

    feature_info := to_clob(feature_usage);

  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AUTO_REOPT"
  (feature_boolean    OUT  NUMBER,
   aux_count          OUT  NUMBER,
   feature_info       OUT  CLOB)
AS
  NEW_LINE      CONSTANT  VARCHAR2(8) := '
';

  reporting_param         VARCHAR2(10);
  use_feedback_param      VARCHAR2(10);
  num_all_queries         NUMBER;   -- number of queries
  num_reopt_queries       NUMBER;   -- number of reoptimizable queries
  tmp_buf                 VARCHAR2(32767);

BEGIN
  dbms_lob.createtemporary(feature_info, TRUE);

  select ksppstvl
  into reporting_param
  from x$ksppi x, x$ksppcv y where (x.indx = y.indx) and
  ksppinm = 'optimizer_adaptive_reporting_only';

  select ksppstvl
  into use_feedback_param
  from x$ksppi x, x$ksppcv y where (x.indx = y.indx) and
  ksppinm = '_optimizer_use_feedback';

  if (reporting_param = 'FALSE' AND use_feedback_param = 'TRUE') then
    feature_boolean := 1;
  else
    feature_boolean := 0;
  end if;

  -- Find # of sqls in v$sql
  select count(*)
  into   num_all_queries
  from   v$sql vs, v$sqlcommand vsc
  where vs.command_type = vsc.command_type and
  vsc.command_name in ('INSERT', 'SELECT', 'UPDATE', 'DELETE', 'UPSERT');

  -- Find # of sqls which are reoptimizable
  select count(*)
  into   num_reopt_queries
  from   v$sql vs, v$sqlcommand vsc
  where vs.command_type = vsc.command_type and vs.is_reoptimizable = 'Y'
  and vsc.command_name in ('INSERT', 'SELECT', 'UPDATE', 'DELETE', 'UPSERT');

  tmp_buf := 'Total number of queries: ' || num_all_queries ||
             NEW_LINE ;

  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  tmp_buf := 'Number of reoptimizable queries: ' || num_reopt_queries ||
             NEW_LINE ;

  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  tmp_buf := 'Percentage of reoptimizable queries: ' ||
             100*num_reopt_queries/num_all_queries ||
             NEW_LINE ;

  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

END dbms_feature_auto_reopt;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AUTO_SGA"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  feature_usage          varchar2(1000);
  sga_target             number;
  sga_max_size           number;
begin

  -- initialize
  feature_boolean := 0;
  aux_count := 0;
  feature_info := to_clob('Automatic SGA Tuning usage not detected');
  feature_usage := '';
  sga_target := 0;
  sga_max_size := 0;

  execute immediate 'select to_number(value) from v$system_parameter where ' ||
                    'name like ''sga_target'''
  into sga_target;

  if sga_target > 0
  then

    feature_boolean := 1;

    feature_usage := feature_usage||':sga_target:'||sga_target;

    -- get sga_max_size value
    execute immediate 'select to_number(value) from v$system_parameter where ' ||
                      'name like ''sga_max_size'''
    into sga_max_size;

    feature_usage := feature_usage||':sga_max_size:'||sga_max_size;

    -- get v$memory_dynamic_components info
    for item in (select component, current_size, min_size, max_size,
                 user_specified_size from
                 v$memory_dynamic_components where current_size != 0)
    loop
      feature_usage := feature_usage||':comp:'||item.component||
                       ':cur:'||item.current_size||':min:'||
                       item.min_size||':max:'||item.max_size||
                       ':usr:'||item.user_specified_size;
    end loop;

    -- get v$system_event info for SGA events
    for item in (select substr(event, 0, 15) evt, total_waits, time_waited
                 from v$system_event where event like '%SGA%')
    loop
      feature_usage := feature_usage||':event:'||item.evt||':waits:'||
                       item.total_waits||':time:'||item.time_waited;
    end loop;
    feature_info := to_clob(feature_usage);

  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AUTO_SSM"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  auto_seg_space boolean;
  ts_info        varchar2(1000);
BEGIN

  /* initialize everything */
  auto_seg_space := FALSE;
  ts_info        := '';
  aux_count      := 0;

  for ts_type in
     (select segment_space_management, count(*) tcount, sum(size_mb) size_mb
       from
        (select ts.tablespace_name, segment_space_management,
              sum(bytes)/1048576 size_mb
          from dba_data_files df, dba_tablespaces ts
         where df.tablespace_name = ts.tablespace_name
         group by ts.tablespace_name, segment_space_management)
       group by segment_space_management)
  loop

    /* check for auto segment space management */
    if ((ts_type.segment_space_management = 'AUTO') and
         (ts_type.tcount > 0)) then
      auto_seg_space  := TRUE;
      aux_count       := ts_type.tcount;
    end if;

    ts_info := ts_info ||
        '(Segment Space Management: ' || ts_type.segment_space_management ||
       ', TS Count: ' || ts_type.tcount ||
       ', Size MB: '  || ts_type.size_mb || ') ';

  end loop;

  /* set the boolean and feature info.  the aux count is already set above */
  if (auto_seg_space) then
    feature_boolean := 1;
    feature_info    := to_clob(ts_info);
  else
    feature_boolean := 0;
    feature_info    := null;
  end if;

END dbms_feature_auto_ssm;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_AWR"
     ( feature_boolean_OUT  OUT  NUMBER,
       aux_count_OUT        OUT  NUMBER,
       feature_info_OUT     OUT  CLOB)
AS
  DBFUS_LAST_SAMPLE_DATE  DATE;

  l_DBtime7day_secs   number;
  l_DBcpu7day_secs    number;

  -- cursor fetches last 7 days of AWR snapshot DB time and DB cpu
  cursor TimeModel7day_cur
  IS
WITH snap_ranges AS
(select /*+ FULL(ST) */
        SN.dbid
       ,SN.instance_number
       ,SN.startup_time
       ,ST.stat_id
       ,ST.stat_name
       ,MIN(SN.snap_id) as MIN_snap
       ,MAX(SN.snap_id) as MAX_snap
       ,MIN(CAST(begin_interval_time AS DATE)) as MIN_date
       ,MAX(CAST(end_interval_time AS DATE)) as MAX_date
   from
        dba_hist_snapshot   SN
       ,wrh$_stat_name      ST
  where
        SN.begin_interval_time > TRUNC(SYSDATE) - 7
    and SN.end_interval_time   < TRUNC(SYSDATE)
    and SN.dbid = ST.dbid
    and ST.stat_name IN ('DB time', 'DB CPU')
  group by
        SN.dbid,SN.instance_number,SN.startup_time,ST.stat_id,ST.stat_name
)
,delta_data AS
(select
        SR.dbid
       ,SR.instance_number
       ,SR.stat_name
       ,CASE WHEN SR.startup_time BETWEEN SR.MIN_date AND SR.MAX_date
               THEN TM1.value + (TM2.value - TM1.value)
             ELSE (TM2.value - TM1.value)
        END
        as delta_time
   from
        WRH$_SYS_TIME_MODEL   TM1
       ,WRH$_SYS_TIME_MODEL   TM2
       ,snap_ranges           SR
  where
        TM1.dbid = SR.dbid
    and TM1.instance_number = SR.instance_number
    and TM1.snap_id         = SR.MIN_snap
    and TM1.stat_id         = SR.stat_id
    and TM2.dbid = SR.dbid
    and TM2.instance_number = SR.instance_number
    and TM2.snap_id         = SR.MAX_snap
    and TM2.stat_id         = SR.stat_id
)
select
       stat_name
      ,ROUND(SUM(delta_time/1000000),2) as secs
  from
       delta_data
 group by
       stat_name;

begin
  --> initialize OUT parameters
  feature_boolean_OUT := 0;
  aux_count_OUT       := null;
  feature_info_OUT    := null;

  --> initialize last sample date
  select nvl(max(last_sample_date), sysdate-7)
    into DBFUS_LAST_SAMPLE_DATE
   from wri$_dbu_usage_sample;

  if DBFUS_LAST_SAMPLE_DATE IS NOT NULL
  then
    --> get snapshot count since last sample date
    select count(*)
      into feature_boolean_OUT
      from wrm$_snapshot
     where dbid = (select dbid from v$database)
       and status = 0
       and bitand(snap_flag, 1) = 1
       and end_interval_time > DBFUS_LAST_SAMPLE_DATE;
  end if;

  --> fetch 7 day DB time and DB CPU from AWR
  for TimeModel7day_rec in TimeModel7day_cur
  loop
    case TimeModel7day_rec.stat_name
      when 'DB time' then l_DBtime7day_secs := TimeModel7day_rec.secs;
      when 'DB CPU'  then l_DBcpu7day_secs := TimeModel7day_rec.secs;
    end case;
  end loop;

  --> assemble feature info CLOB
  feature_info_OUT := 'DBtime:'||TO_CHAR(l_DBtime7day_secs)||
                      ',DBcpu:'||TO_CHAR(l_DBcpu7day_secs);


end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_BACKUP_ENCRYPTION"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => FALSE,
                    encrypted   => TRUE,
                    compalg     => NULL);

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_BA_OWNER"
      (feature_boolean OUT number,
       aux_count       OUT number,
       info            OUT clob)
AS
   owner     VARCHAR2(100);

BEGIN

   EXECUTE IMMEDIATE
   'BEGIN ' ||
   'SELECT dbms_ba_owner INTO :owner FROM DUAL; ' ||
   'EXCEPTION ' ||
   '   WHEN OTHERS THEN ' ||
   '   :owner := NULL; ' ||
   'END;' USING OUT owner;

   IF (owner IS NOT NULL) THEN
      feature_boolean := 1;
   ELSE
      feature_boolean := 0;
   END IF;

   aux_count := NULL;
   info := NULL;

END dbms_feature_ba_owner;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_CDC"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_autolog           number := 0;
  num_hotlog            number := 0;
  num_sync              number := 0;
  num_dist              number := 0;
  num_hotmine           number := 0;

  num_auto_sets         number := 0;
  num_hot_sets          number := 0;
  num_sync_sets         number := 0;
  num_dist_sets         number := 0;
  num_mine_sets         number := 0;

  num_auto_tabs         number := 0;
  num_hot_tabs          number := 0;
  num_sync_tabs         number := 0;
  num_dist_tabs         number := 0;
  num_mine_tabs         number := 0;

  num_auto_subs         number := 0;
  num_hot_subs          number := 0;
  num_sync_subs         number := 0;
  num_dist_subs         number := 0;
  num_mine_subs         number := 0;

  feature_usage         varchar2(2000);

begin
  --initialize
  aux_count := 0;

  /* get the number of total change tables and dump in aux_count */
  begin
    execute immediate 'select count(*) from sys.cdc_change_Tables$'
                        into aux_count;
  exception
    when others then
      aux_count := 0;
  end;

  if (aux_count > 0) then
    feature_boolean := 1;
  else
    feature_boolean := 0;
    feature_info := to_clob('CDC usage not detected');
    return;
  end if;

  /* get data for AUTOLOG */
  begin
    execute immediate 'select count(*) from sys.cdc_change_sources$
                         where BITAND(source_type, 2) = 2'
                        into num_autolog;
  exception
    when others then
      num_autolog := 0;
  end;

  if (num_autolog > 0 ) then

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b
                           where BITAND(a.source_type, 2) = 2 AND
                              b.change_source_name = a.source_name'
                          into num_auto_sets;
    exception
      when others then
        num_auto_sets := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_change_tables$ c
                           where BITAND(a.source_type, 2) = 2 AND
                              b.change_source_name = a.source_name AND
                              c.change_set_name = b.set_name'
                          into num_auto_tabs;
    exception
      when others then
        num_auto_tabs := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_subscribers$ c
                           where BITAND(a.source_type, 2) = 2 AND
                              b.change_source_name = a.source_name AND
                              c.set_name = b.set_name'
                          into num_auto_subs;
    exception
      when others then
        num_auto_subs := 0;
    end;

  end if;

  /* get data for HOTLOG */
  begin
    execute immediate 'select count(*) from sys.cdc_change_sources$
                         where BITAND(source_type, 4) = 4'
                        into num_hotlog;
  exception
    when others then
      num_hotlog := 0;
  end;

  if (num_hotlog > 0 ) then

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b
                           where BITAND(a.source_type, 4) = 4 AND
                              b.change_source_name = a.source_name'
                          into num_hot_sets;
    exception
      when others then
        num_hot_sets := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_change_tables$ c
                           where BITAND(a.source_type, 4) = 4 AND
                              b.change_source_name = a.source_name AND
                              c.change_set_name = b.set_name'
                          into num_hot_tabs;
    exception
      when others then
        num_hot_tabs := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_subscribers$ c
                           where BITAND(a.source_type, 4) = 4 AND
                              b.change_source_name = a.source_name AND
                              c.set_name = b.set_name'
                          into num_hot_subs;
    exception
      when others then
        num_hot_subs := 0;
    end;

  end if;

  /* get data for SYNCHRONOUS */
  begin
    execute immediate 'select count(*) from sys.cdc_change_sources$
                         where BITAND(source_type, 8) = 8'
                        into num_sync;
  exception
    when others then
      num_sync := 0;
  end;

  if (num_sync > 0 ) then

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b
                           where BITAND(a.source_type, 8) = 8 AND
                              b.change_source_name = a.source_name'
                          into num_sync_sets;
    exception
      when others then
        num_sync_sets := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_change_tables$ c
                           where BITAND(a.source_type, 8) = 8 AND
                              b.change_source_name = a.source_name AND
                              c.change_set_name = b.set_name'
                          into num_sync_tabs;
    exception
      when others then
        num_sync_tabs := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_subscribers$ c
                           where BITAND(a.source_type, 8) = 8 AND
                              b.change_source_name = a.source_name AND
                              c.set_name = b.set_name'
                          into num_sync_subs;
    exception
      when others then
        num_sync_subs := 0;
    end;

  end if;

  /* get data for DISTRIBUTED HOTLOG */
  begin
    execute immediate 'select count(*) from sys.cdc_change_sources$
                         where BITAND(source_type, 64) = 64'
                        into num_dist;
  exception
    when others then
      num_dist := 0;
  end;

  if (num_dist > 0 ) then

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b
                           where BITAND(a.source_type, 64) = 64 AND
                              b.change_source_name = a.source_name'
                          into num_dist_sets;
    exception
      when others then
        num_dist_sets := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_change_tables$ c
                           where BITAND(a.source_type, 64) = 64 AND
                              b.change_source_name = a.source_name AND
                              c.change_set_name = b.set_name'
                          into num_dist_tabs;
    exception
      when others then
        num_dist_tabs := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_subscribers$ c
                           where BITAND(a.source_type, 64) = 64 AND
                              b.change_source_name = a.source_name AND
                              c.set_name = b.set_name'
                          into num_dist_subs;
    exception
      when others then
        num_dist_subs := 0;
    end;

  end if;

  /* get data for DISTRIBUTED HOTMINING */
  begin
    execute immediate 'select count(*) from sys.cdc_change_sources$
                         where BITAND(source_type, 128) = 128'
                        into num_hotmine;
  exception
    when others then
      num_hotmine := 0;
  end;

  if (num_hotmine > 0 ) then

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b
                           where BITAND(a.source_type, 128) = 128 AND
                              b.change_source_name = a.source_name'
                          into num_mine_sets;
    exception
      when others then
        num_mine_sets := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_change_tables$ c
                           where BITAND(a.source_type, 128) = 128 AND
                              b.change_source_name = a.source_name AND
                              c.change_set_name = b.set_name'
                          into num_mine_tabs;
    exception
      when others then
        num_mine_tabs := 0;
    end;

    begin
      execute immediate 'select count(*) from sys.cdc_change_sources$ a,
                           sys.cdc_change_sets$ b, sys.cdc_subscribers$ c
                           where BITAND(a.source_type, 128) = 128 AND
                              b.change_source_name = a.source_name AND
                              c.set_name = b.set_name'
                          into num_mine_subs;
    exception
      when others then
        num_mine_subs := 0;
    end;

  end if;


  feature_usage := 'autolog - source: ' || to_char(num_autolog) ||', '||
                  'sets: '  || to_char(num_auto_sets) ||', '||
                  'tables: ' || to_char(num_auto_tabs) ||', '||
                  'subscriptions: ' || to_char(num_auto_subs) ||', '||
                  'hotlog - source: ' || to_char(num_hotlog) ||', '||
                  'sets: '  || to_char(num_hot_sets) ||', '||
                  'tables: ' || to_char(num_hot_tabs) ||', '||
                  'subscriptions: ' || to_char(num_hot_subs) ||', '||
                  'sync - source: ' || to_char(num_sync) ||', '||
                  'sets: '  || to_char(num_sync_sets) ||', '||
                  'tables: ' || to_char(num_sync_tabs) ||', '||
                  'subscriptions: ' || to_char(num_sync_subs) ||', '||
                  'distributed - source: ' || to_char(num_dist) ||', '||
                  'sets: '  || to_char(num_dist_sets) ||', '||
                  'tables: ' || to_char(num_dist_tabs) ||', '||
                  'subscriptions: ' || to_char(num_dist_subs) ||', '||
                  'HotMine - source: ' || to_char(num_hotmine) ||', '||
                  'sets: '  || to_char(num_mine_sets) ||', '||
                  'tables: ' || to_char(num_mine_tabs) ||', '||
                  'subscriptions: ' || to_char(num_mine_subs);

  feature_info := to_clob(feature_usage);

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_CONCURRENT_STATS"
  (feature_boolean    OUT  NUMBER,
   aux_count          OUT  NUMBER,
   feature_info       OUT  CLOB)
AS
  NEW_LINE      CONSTANT  VARCHAR2(8) := '
';
  num_all_ops             NUMBER;   -- number of all stats operations
  num_gath_ops            NUMBER;   -- number of gather operations
  num_conc_ops            NUMBER;   -- number of concurrent stats operations
  num_auto_ops            NUMBER;   -- number of auto stats gathering jobs
  interval_start          VARCHAR(20); -- minimum start time in operations view
  interval_end            VARCHAR(20); -- maximum start time in operations view
  conc_pref               VARCHAR2(10); -- value of "concurrent" preference
  tmp_buf                 VARCHAR2(32767);

  -- cursor to get the types of stats gathering operations which were
  -- were performed concurrently.
  CURSOR op_type_cursor IS
    select operation op, count(*) cnt from dba_optstat_operations
    where  extractvalue(xmltype(notes),
                       '/params/param[@name="concurrent"]/@val') = 'TRUE'
    group by operation
    order by 2 desc;

BEGIN
  dbms_lob.createtemporary(feature_info, TRUE);

  -- get the time interval reported in dba_optstat_operations
  select to_char(min(start_time), 'MM/DD/YYYY'),
         to_char(max(start_time), 'MM/DD/YYYY')
         into interval_start, interval_end
  from dba_optstat_operations;

  tmp_buf := 'Time interval covered by dba_optstat_operations: '||
             interval_start || ' - ' || interval_end || NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- get the total number of rows in dba_optstat_operations
  SELECT count(*)
  INTO num_all_ops
  FROM dba_optstat_operations;

  tmp_buf := 'Total Number of All Stats Operations: '|| num_all_ops
             || NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- get the number of gather stats operations which is eligible to be run
  -- concurrently
  SELECT count(*)
  INTO num_gath_ops
  FROM dba_optstat_operations
  WHERE operation like 'gather%';

  tmp_buf := 'Total Number of Gather Stats Operations: '|| num_gath_ops
             || NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- get the number of concurrent stats gathering operations
  SELECT count(*)
  INTO num_conc_ops
  FROM dba_optstat_operations
  WHERE extractvalue(xmltype(notes),
                       '/params/param[@name="concurrent"]/@val') = 'TRUE';

  tmp_buf := 'Total Number of Concurrent Operations: ' || num_conc_ops || '.'
              || NEW_LINE ||
             'Types of concurrent operations with their frequencies:'
              || NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- # of concurrent operations group by the kind of operation
  for op_type_iter in op_type_cursor
  loop
    tmp_buf := '  ' || op_type_iter.op ||': '||
                      op_type_iter.cnt || NEW_LINE;
    dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);
  end loop;

  -- value of "concurrent" preference
  select dbms_stats.get_prefs('CONCURRENT')
  into conc_pref
  from dual;

  tmp_buf := 'Current value of CONCURRENT preference: '|| conc_pref || NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- populate the outputs if concurrent stats gathering is enabled
  if (num_conc_ops > 0 OR
      upper(conc_pref) not in ('OFF', 'FALSE')) then
    feature_boolean := 1;
  else
    feature_boolean := 0;
  end if;

  if (num_gath_ops > 0) then
    aux_count := num_conc_ops/num_gath_ops;
  else
    aux_count := -1;
  end if;

END dbms_feature_concurrent_stats;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DATABASE_ODM"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   dm_on              NUMBER;     -- data mining option on
   model_cnt          NUMBER;
   dm_usage           varchar2(32767);
begin
  -- initialize
  feature_boolean   := 0;
  aux_count         := 0;
  feature_info      := NULL;
  model_cnt         := 0;

  -- check if ODM option is installed
  select count(*) into dm_on from v$option where
     parameter = 'Data Mining' and value = 'TRUE';

  if (dm_on = 0) then
    return;
  end if;

   execute immediate
         'select count(*), listagg(feature,'';'') within group (order by feature) ' ||
     'from ( ' ||
       'with a as ( ' ||
        'select decode(func ' ||
          ',1, ''CLASSIFICATION'' ' ||
          ',2, ''REGRESSION'' ' ||
          ',3, ''CLUSTERING'' ' ||
          ',4, ''FEATURE_EXTRACTION''  ' ||
          ',5, ''ASSOCIATION_RULES''  ' ||
          ',6, ''ATTRIBUTE_IMPORTANCE''  ' ||
          ',0)||''(''||   ' ||
          ' decode(alg ' ||
          ',1, ''NAIVE_BAYES''  ' ||
          ',2, ''ADAPTIVE_BAYES_NETWORK''  ' ||
          ',3, ''DECISION_TREE''   ' ||
          ',4, ''SUPPORT_VECTOR_MACHINES''  ' ||
          ',5, ''KMEANS''   ' ||
          ',6, ''O_CLUSTER''  ' ||
          ',7, ''NONNEGATIVE_MATRIX_FACTOR''   ' ||
          ',8, ''GENERALIZED_LINEAR_MODEL''  ' ||
          ',9, ''APRIORI_ASSOCIATION_RULES''   ' ||
          ',10, ''MINIMUM_DESCRIPTION_LENGTH''   ' ||
          ',11, ''SINGULAR_VALUE_DECOMP''   ' ||
          ',12, ''EXPECTATION_MAXIMIZATION''    ' ||
          ',0)||'')'' feat from model$  ' ||
          'where (alg not in (4,5)) or  ' ||
          '(alg in (4,5) and obj# in (select mod# from modeltab$ where typ#=2))) ' ||
      'select feat||''(''||count(*)||'')'' feature from a group by feat order by count(*))'
       into model_cnt, dm_usage;

    if (model_cnt  > 0)   then     --- feature used
        feature_boolean := 1;
        aux_count := model_cnt;
        feature_info := TO_CLOB(dm_usage);
    else                        --- feature not used
        feature_boolean := 0;
        aux_count := 0;
        feature_info := null;
    end if;

END DBMS_FEATURE_DATABASE_ODM;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DATABASE_VAULT"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   dv_linkon          NUMBER;
   dvsys_uid          NUMBER;
   dvowner_uid        NUMBER;
   dvacctmgr_uid      NUMBER;
BEGIN
  -- initialize
  feature_boolean   := 0;
  aux_count         := 0;
  feature_info      := NULL;

  -- check to see if DV is linked on
  select count(*) into dv_linkon from v$option where
     parameter = 'Oracle Database Vault' and
     value = 'TRUE';

  if (dv_linkon = 0) then
    return;
  end if;

  -- get DVSYS hard coded uid
  select count(*) into dvsys_uid from user$ where
    name = 'DVSYS' and
    user# = 1279990;

  -- get uids for hard coded roles
  select count(*) into dvowner_uid from user$ where
     name = 'DV_OWNER' and
     user# = 1279992;
  select count(*) into dvacctmgr_uid from user$ where
     name = 'DV_ACCTMGR' and
     user# = 1279991;

  if (dvsys_uid = 0 or
      dvowner_uid = 0 or
      dvacctmgr_uid = 0) then
     return;
  end if;

  feature_boolean := 1;

END dbms_feature_database_vault;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DATA_GUARD"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage         varchar2(1000);
    log_transport         varchar2(25);
    num_arch              number;
    num_casc_stby         number;
    num_compression       number;
    num_dgconfig          number;
    num_far_sync          number;
    num_fast_sync         number;
    num_lgwr_async        number;
    num_lgwr_sync         number;
    num_realtime_apply    number;
    num_redo_apply        number;
    num_snapshot          number;
    num_sql_apply         number;
    num_standbys          number;
    num_terminal_db       number;
    protection_mode       varchar2(24);
    use_broker            varchar2(5);
    use_compression       varchar2(8);
    use_far_sync          varchar2(5);
    use_fast_sync         varchar2(5);
    use_flashback         varchar2(18);
    use_fs_failover       varchar2(22);
    use_realtime_apply    varchar2(5);
    use_redo_apply        varchar2(5);
    use_snapshot          varchar2(5);
    use_sql_apply         varchar2(5);

begin
    -- initialize
    feature_boolean := 0;
    aux_count := 0;
    log_transport := NULL;
    num_arch := 0;
    num_casc_stby := 0;
    num_compression := 0;
    num_dgconfig :=0;
    num_far_sync := 0;
    num_fast_sync := 0;
    num_lgwr_async := 0;
    num_lgwr_sync := 0;
    num_realtime_apply := 0;
    num_redo_apply := 0;
    num_snapshot := 0;
    num_sql_apply := 0;
    num_standbys := 0;
    num_terminal_db := 0;
    use_broker := 'FALSE';
    use_compression := 'FALSE';
    use_far_sync := 'FALSE';
    use_fast_sync := 'FALSE';
    use_flashback := 'FALSE';
    use_fs_failover := 'FALSE';
    use_realtime_apply := 'FALSE';
    use_redo_apply := 'FALSE';
    use_snapshot := 'FALSE';
    use_sql_apply := 'FALSE';

    -- check for Data Guard usage by counting valid standby destinations
    -- We use v$archive_dest here and NOT v$dataguard_config because if the
    -- dg_config is not initialized, v$dataguard_config will be empty.
    execute immediate 'select count(*) from v$archive_dest ' ||
        'where status = ''VALID'' and target = ''STANDBY'''
        into num_standbys;

    if (num_standbys > 0) then
        feature_boolean := 1;

        -- determine if v$dataguard_config is populated
        execute immediate 'select count(*) from v$dataguard_config'
            into num_dgconfig;

        -- Depending on whether v$dataguard_config is populated or not, some
        -- of the commands below will either use v$dataguard_config or
        -- v$archive_dest.

        if (num_dgconfig > 0) then
            -- get the real number of standbys
            execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
                'from v$dataguard_config ' ||
                'where (DEST_ROLE like ''% STANDBY'')'
                into num_standbys;

            -- get the number of cascading standbys
            execute immediate 'select count(unique(PARENT_DBUN)) ' ||
                'from v$dataguard_config ' ||
                'where (PARENT_DBUN not in ' ||
                '(select DB_UNIQUE_NAME from v$database) and ' ||
                'PARENT_DBUN != ''NONE'' and PARENT_DBUN != ''UNKNOWN'')'
                into num_casc_stby;

            -- get the number of terminal databases
            execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
                'from v$dataguard_config ' ||
                'where (DB_UNIQUE_NAME not in ' ||
                '(select PARENT_DBUN from v$dataguard_config) and ' ||
                'PARENT_DBUN != ''UNKNOWN'')'
                into num_terminal_db;

            -- check for Redo Apply (Physical Standby) usage
            execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
                'from v$dataguard_config ' ||
                'where (DEST_ROLE = ''PHYSICAL STANDBY'')'
                into num_redo_apply;
            if (num_redo_apply > 0) then
                use_redo_apply := 'TRUE';
            end if;

            -- check for SQL Apply (Logical Standby) usage
            execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
                'from v$dataguard_config ' ||
                'where (DEST_ROLE = ''LOGICAL STANDBY'')'
                into num_sql_apply;
            if (num_sql_apply > 0) then
                use_sql_apply := 'TRUE';
            end if;

            -- check for Far Sync Instance usage
            execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
                'from v$dataguard_config ' ||
                'where (DEST_ROLE = ''FAR SYNC INSTANCE'')'
                into num_far_sync;
            if (num_far_sync > 0) then
                use_far_sync := 'TRUE';
            end if;

            -- check for Snapshot Standby usage
            execute immediate 'select count(unique(DB_UNIQUE_NAME)) ' ||
                'from v$dataguard_config ' ||
                'where (DEST_ROLE = ''SNAPSHOT STANDBY'')'
                into num_snapshot;
            if (num_snapshot > 0) then
                use_snapshot := 'TRUE';
            end if;
        else
            -- check for Redo Apply (Physical Standby) usage
            execute immediate 'select count(*) from v$archive_dest_status ' ||
                'where status = ''VALID'' and type = ''PHYSICAL'''
                into num_redo_apply;
            if (num_redo_apply > 0) then
                use_redo_apply := 'TRUE';
            end if;

            -- check for SQL Apply (Logical Standby) usage
            execute immediate 'select count(*) from v$archive_dest_status ' ||
                'where status = ''VALID'' and type = ''LOGICAL'''
                into num_sql_apply;
            if (num_sql_apply > 0) then
                use_sql_apply := 'TRUE';
            end if;

            -- check for Far Sync Instance usage
            execute immediate 'select count(*) from v$archive_dest_status ' ||
                'where status = ''VALID'' and type = ''FAR SYNC'''
                into num_far_sync;
            if (num_far_sync > 0) then
                use_far_sync := 'TRUE';
            end if;

            -- copy far sync instance count into cascading standby
            num_casc_stby := num_far_sync;

            -- check for Snapshot Standby usage
            execute immediate 'select count(*) from v$archive_dest_status ' ||
                'where status = ''VALID'' and type = ''SNAPSHOT'''
                into num_snapshot;
            if (num_snapshot > 0) then
                use_snapshot := 'TRUE';
            end if;
        end if;

        -- check for Broker usage by selecting the init param value
        execute immediate 'select value from v$system_parameter ' ||
            'where name = ''dg_broker_start'''
            into use_broker;

        -- get all log transport methods
        execute immediate 'select count(*) from v$archive_dest ' ||
            'where status = ''VALID'' and target = ''STANDBY'' ' ||
            'and archiver like ''ARC%'''
            into num_arch;
        if (num_arch > 0) then
            log_transport := 'ARCH ';
        end if;
        execute immediate 'select count(*) from v$archive_dest ' ||
            'where status = ''VALID'' and target = ''STANDBY'' ' ||
            'and archiver = ''LGWR'' ' ||
            'and (transmit_mode = ''SYNCHRONOUS'' or ' ||
            '     transmit_mode = ''PARALLELSYNC'')'
            into num_lgwr_sync;
        if (num_lgwr_sync > 0) then
            log_transport := log_transport || 'LGWR SYNC ';
        end if;
        execute immediate 'select count(*) from v$archive_dest ' ||
            'where status = ''VALID'' and target = ''STANDBY'' ' ||
            'and archiver = ''LGWR'' ' ||
            'and transmit_mode = ''ASYNCHRONOUS'''
            into num_lgwr_async;
        if (num_lgwr_async > 0) then
            log_transport := log_transport || 'LGWR ASYNC';
        end if;

        -- get protection mode for primary db
        execute immediate 'select protection_mode from v$database'
            into protection_mode;

        -- check for Fast Sync usage
        if (protection_mode = 'MAXIMUM AVAILABILITY') then
            execute immediate 'select count(*) from v$archive_dest ' ||
                'where status = ''VALID'' and target = ''STANDBY'' ' ||
                'and archiver = ''LGWR'' ' ||
                'and (transmit_mode = ''SYNCHRONOUS'' or ' ||
                '     transmit_mode = ''PARALLELSYNC'') ' ||
                'and affirm = ''NO'' '
                into num_fast_sync;
            if (num_fast_sync > 0) then
                use_fast_sync := 'TRUE';
            end if;
        end if;

        -- check for fast-start failover usage
        execute immediate 'select fs_failover_status from v$database'
            into use_fs_failover;
        if (use_fs_failover != 'DISABLED') then
            use_fs_failover := 'TRUE';
        else
            use_fs_failover := 'FALSE';
        end if;

        -- check for realtime apply usage
        -- We can only count the directly connected standbys
        execute immediate 'select count(*) from v$archive_dest_status ' ||
            'where status = ''VALID'' ' ||
            'and recovery_mode like ''%REAL TIME APPLY'''
            into num_realtime_apply;
        if (num_realtime_apply > 0) then
            use_realtime_apply := 'TRUE';
        end if;

        -- check for network compression usage
        -- We can only count the directly connected standbys
        execute immediate 'select count(*) from v$archive_dest ' ||
            'where status = ''VALID'' and target = ''STANDBY'' ' ||
            'and compression = ''ENABLE'''
            into num_compression;
        if (num_compression > 0) then
            use_compression := 'TRUE';
        end if;

        -- check for flashback usage
        execute immediate 'select flashback_on from v$database'
            into use_flashback;
        if (use_flashback = 'YES') then
            use_flashback := 'TRUE';
        else
            use_flashback := 'FALSE';
        end if;

        feature_usage :=
                'Number of standbys: ' || to_char(num_standbys) ||
        ', ' || 'Number of Cascading databases: ' || to_char(num_casc_stby) ||
        ', ' || 'Number of Terminal databases: ' || to_char(num_terminal_db) ||
        ', ' || 'Redo Apply used: ' || upper(use_redo_apply) ||
        ', ' || 'SQL Apply used: ' || upper(use_sql_apply) ||
        ', ' || 'Far Sync Instance used: ' || upper(use_far_sync) ||
        ', ' || 'Snapshot Standby used: ' || upper(use_snapshot) ||
        ', ' || 'Broker used: ' || upper(use_broker) ||
        ', ' || 'Protection mode: ' || upper(protection_mode) ||
        ', ' || 'Log transports used: ' || upper(log_transport) ||
        ', ' || 'Fast Sync used: ' || upper(use_fast_sync) ||
        ', ' || 'Fast-Start Failover used: ' || upper(use_fs_failover) ||
        ', ' || 'Real-Time Apply used: ' || upper(use_realtime_apply) ||
        ', ' || 'Compression used: ' || upper(use_compression) ||
        ', ' || 'Flashback used: ' || upper(use_flashback)
        ;
        feature_info := to_clob(feature_usage);
    else
        feature_info := to_clob('Data Guard usage not detected');
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DATA_REDACTION"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage         varchar2(1000);
    num_policies          number;
    num_policies_enabled  number;
    num_full_redaction    number;
    num_partial_redaction number;
    num_random_redaction  number;
    num_regexp_redaction   number;

begin
    -- initialize
    feature_boolean := 0;
    aux_count := 0;
    num_policies := 0;
    num_policies_enabled := 0;
    num_full_redaction := 0;
    num_partial_redaction := 0;
    num_random_redaction := 0;
    num_regexp_redaction := 0;

    -- check for Data Redaction usage by counting number of policies
    execute immediate 'select count(*) from REDACTION_POLICIES '
        into num_policies;

    if (num_policies > 0) then
        feature_boolean := 1;

        -- check for enable Data Radaction policy usage
        execute immediate 'select count(*) from REDACTION_POLICIES ' ||
            'where upper(ENABLE) like ''%YES%'''
            into num_policies_enabled;

        -- check for Full Data Redaction type usage
        execute immediate 'select count(*) from REDACTION_COLUMNS ' ||
            'where FUNCTION_TYPE = ''FULL REDACTION'''
            into num_full_redaction;

        -- check for Partial Data Redaction type usage
        execute immediate 'select count(*) from REDACTION_COLUMNS ' ||
            'where FUNCTION_TYPE = ''PARTIAL REDACTION'''
            into num_partial_redaction;

        -- check for Random Data Redaction type usage
        execute immediate 'select count(*) from REDACTION_COLUMNS ' ||
            'where FUNCTION_TYPE = ''RANDOM REDACTION'''
            into num_random_redaction;

        -- check for Regexp-based Data Redaction type usage
        execute immediate 'select count(*) from REDACTION_COLUMNS ' ||
            'where FUNCTION_TYPE = ''REGEXP REDACTION'''
            into num_regexp_redaction;

        feature_usage :=
                'Number of data redaction policies: ' ||
                 to_char(num_policies) ||
        ', ' || 'Number of enabled policies: ' ||
                 to_char(num_policies_enabled) ||
        ', ' || 'Number of policies using full redaction: ' ||
                 to_char(num_full_redaction) ||
        ', ' || 'Number of policies using partial redaction: ' ||
                 to_char(num_partial_redaction) ||
        ', ' || 'Number of policies using random redaction: ' ||
                 to_char(num_random_redaction)  ||
        ', ' || 'Number of policies using regexp redaction: ' ||
                 to_char(num_regexp_redaction)
        ;
        feature_info := to_clob(feature_usage);
    else
        feature_info := to_clob('Data Redaction usage not detected');
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DBFS_CONTENT"
    (feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  table_not_found        exception;
  PRAGMA EXCEPTION_INIT(table_not_found, -942);
  num_content_stores     number;
BEGIN
  -- initialize
  feature_boolean    := 0;
  aux_count          := 0;
  num_content_stores := 0;

  -- check existence of content stores
  BEGIN
    execute immediate 'SELECT COUNT(*) FROM sys.dbfs$_stores'
      INTO num_content_stores;
  EXCEPTION
    WHEN table_not_found THEN NULL;
  END;

  feature_boolean := num_content_stores;
  IF feature_boolean <> 0
  THEN
    feature_info := to_clob('DBFS Content feature in use. ' ||
                               num_content_stores ||
                               ' DBFS Content stores detected.');
  ELSE
    feature_info := to_clob('DBFS Content feature not in use.');
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DBFS_HS"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  table_not_found        exception;
  PRAGMA EXCEPTION_INIT(table_not_found, -942);
  num_hierarchical_stores number;
BEGIN
  -- initialize
  feature_boolean := 0;
  aux_count := 0;
  num_hierarchical_stores := 0;

  -- check existence of content stores of HS sub-types
  BEGIN
    execute immediate 'SELECT COUNT(*)  FROM sys.dbfs_hs$_fs'
      INTO num_hierarchical_stores;
  EXCEPTION
    WHEN table_not_found THEN NULL;
  END;

  feature_boolean := num_hierarchical_stores;
  IF feature_boolean <> 0
  THEN
    feature_info := to_clob('DBFS HS in use. ' ||
                              num_hierarchical_stores ||
                              ' DBFS hierarchical stores detected.');
  ELSE
    feature_info := to_clob('DBFS HS feature not in use.');
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DBFS_SFS"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  table_not_found        exception;
  PRAGMA EXCEPTION_INIT(table_not_found, -942);
  num_sf_stores          number;
BEGIN
  -- initialize
  feature_boolean := 0;
  aux_count := 0;
  num_sf_stores := 0;

  -- check existence of SecureFile stores (POSIX file-systems)
  BEGIN
    execute immediate 'SELECT COUNT(*) FROM sys.dbfs_sfs$_fs'
      INTO num_sf_stores;
  EXCEPTION
    WHEN table_not_found THEN NULL;
  END;

  feature_boolean := num_sf_stores;
  IF feature_boolean <> 0
  THEN
    feature_info := to_clob('DBFS SFS feature in use. ' ||
                              num_sf_stores ||
                              ' DBFS SF stores detected.');
  ELSE
    feature_info := to_clob('DBFS SFS feature is not in use.');
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DEFERRED_SEG_CRT"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_usage        VARCHAR2(1000);
   table_count          NUMBER;
   index_count          NUMBER;
   lob_count            NUMBER;
   tabpart_count        NUMBER;
   indpart_count        NUMBER;
   lobpart_count        NUMBER;
   tabsubpart_count     NUMBER;
   indsubpart_count     NUMBER;
   lobsubpart_count     NUMBER;
   total_segments       NUMBER;
   total_def_segments   NUMBER;
BEGIN
  -- initialize
  feature_boolean    := 0;
  aux_count          := 0;
  feature_info       := NULL;
  feature_usage      := NULL;
  table_count        := 0;
  index_count        := 0;
  lob_count          := 0;
  tabpart_count      := 0;
  indpart_count      := 0;
  lobpart_count      := 0;
  tabsubpart_count   := 0;
  indsubpart_count   := 0;
  lobsubpart_count   := 0;
  total_segments     := 0;
  total_def_segments := 0;

  -- check to see if DSC parameter is turned on
  select count(*) into feature_boolean from v$system_parameter where
     name = 'deferred_segment_creation' and value = 'TRUE';

  -- Regardless of the value of the parameter, compute the number of
  -- objects that do not yet have segments created

  -- non-partitioned tables
--  select count(*) into table_count from dba_tables where
--      segment_created = 'NO';

  select count(*) into table_count from
  (  select decode(bitand(t.property, 17179869184), 17179869184, 'NO',
                   decode(bitand(t.property, 32), 32, 'N/A', 'YES')) x
     from tab$ t
  )
  where x = 'NO';

  -- non-partitioned indexes
--  select count(*) into index_count from dba_indexes where
--      segment_created = 'NO';

  select count(*) into index_count from
  (  select  decode(bitand(i.flags, 67108864), 67108864, 'NO','?')  x
     from ind$ i
   )
   where x = 'NO';

  -- non-partitioned lobs
--  select count(*) into lob_count from dba_lobs where
--      segment_created = 'NO';

  select count(*) into lob_count from
  ( select decode(bitand(l.property, 4096), 4096, 'NO','?') x
    from lob$ l
   )
   where x = 'NO';

  -- table partitions
--  select count(*) into tabpart_count from dba_tab_partitions where
--      segment_created = 'NO';

  select count(*) into tabpart_count from
  ( select  decode(bitand(tp.flags, 65536), 65536, 'NO', 'YES') x
    from tabpart$ tp
  ) where x = 'NO';

  -- index partitions
--  select count(*) into indpart_count from dba_ind_partitions where
--      segment_created = 'NO';

  select count(*) into indpart_count from
  ( select  decode(bitand(ip.flags, 65536), 65536, 'NO', 'YES') x
    from indpart$ ip
  ) where x = 'NO';

  -- lob partitions
--  select count(*) into lobpart_count from dba_lob_partitions where
--      segment_created = 'NO';

    select count(*) into lobpart_count from
  ( select decode(bitand(lf.fragflags, 33554432), 33554432, 'NO', 'YES') x
    from lobfrag$ lf where lf.fragtype$='P'
  ) where x = 'NO';

  -- table sub-partitions
--  select count(*) into tabsubpart_count from dba_tab_subpartitions where
--      segment_created = 'NO';

  select count(*) into tabsubpart_count from
  ( select  decode(bitand(tsp.flags, 65536), 65536, 'NO', 'YES') x
    from tabsubpart$ tsp
  ) where x = 'NO';

  -- index sub-partitions
--  select count(*) into indsubpart_count from dba_ind_subpartitions where
--      segment_created = 'NO';

  select count(*) into indsubpart_count from
  ( select  decode(bitand(isp.flags, 65536), 65536, 'NO', 'YES') x
    from indsubpart$ isp
  ) where x = 'NO';

  -- lob sub-partitions
--  select count(*) into lobsubpart_count from dba_lob_subpartitions where
--      segment_created = 'NO';

  select count(*) into lobsubpart_count from
  ( select decode(bitand(lf.fragflags, 33554432), 33554432, 'NO', 'YES') x
    from lobfrag$ lf where lf.fragtype$='S'
  ) where x = 'NO';

  -- Total segments of objects which can have deferred segment creation
--  select count(*) into total_segments from dba_segments where
--      segment_type IN ('TABLE',
--                       'INDEX',
--                       'LOBSEGMENT',
--                       'LOBINDEX',
--                       'TABLE PARTITION',
--                       'INDEX PARTITION',
--                       'LOB PARTITION' );

 select count(*) into total_segments from seg$ where type# in (5,6,8);

  -- Total # of segments whose creation is deferred
  total_def_segments := table_count + index_count + lob_count +
                        tabpart_count + indpart_count + lobpart_count +
                        tabsubpart_count + indsubpart_count + lobsubpart_count;

  feature_usage := feature_usage || 'Deferred Segment Creation ' ||
                   ' Parameter:' || feature_boolean ||
                   ' Total Deferred Segments:' || total_def_segments ||
                   ' Total Created Segments:' || total_segments   ||
                   ' Table Segments:' || table_count   ||
                   ' Index Segments:' || index_count   ||
                   ' Lob Segments:'   || lob_count   ||
                   ' Table Partition Segments:' || tabpart_count   ||
                   ' Index Partition Segments:' || indpart_count   ||
                   ' Lob Partition Segments:'   || lobpart_count   ||
                   ' Table SubPartition Segments:' || tabsubpart_count   ||
                   ' Index SubPartition Segments:' || indsubpart_count   ||
                   ' Lob SubPartition Segments:'   || lobsubpart_count;

  -- update feature_boolean if even one segment is uncreated
  if (total_def_segments > 0) then
    feature_boolean := feature_boolean+1;
  end if;

  feature_info    := to_clob(feature_usage);
  aux_count       := total_def_segments;

END dbms_feature_deferred_seg_crt;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DMU"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  v_usage_value   varchar2(4000);
  v_last_used     date;
  v_last_sampled  date;
BEGIN
  --
  -- start with 'DMU usage not detected'
  -- we do not utilize aux_count.
  --
  feature_boolean := 0;
  feature_info := to_clob('DMU usage not detected');
  aux_count := 0;
  --
  -- test if DMU was used since last sampled date
  --
  begin
    --
    -- get the date DMU was used last time
    --
    select value$ into v_usage_value
      from sys.props$
     where name = 'NLS_DMU_USAGE';
    v_last_used := to_date(substr(v_usage_value,1,instr(v_usage_value,',')-1),
                           'YYYYMMDDHH24MISS');
    --
    -- get the date sampled last time
    --
    select nvl(max(last_sample_date), sysdate-7)
      into v_last_sampled
      from wri$_dbu_usage_sample;
    --
    -- DMU usage is detected
    --
    if v_last_sampled < v_last_used then
      feature_boolean := 1;
      feature_info := to_clob(v_usage_value);
    end if;
  exception
    --
    -- DMU usage is not detected if any exception is thrown including:
    --  * NLS_DMU_USAGE not found in sys.props$
    --  * the value is not in the format of 'YYYYMMDDHH24MISS'
    --
    when others then
      null;
  end;
END DBMS_FEATURE_DMU;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_DYN_SGA"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  num_resize_ops         number;                 -- number of resize operations
  feature_usage          varchar2(1000);
begin
  -- initialize
  num_resize_ops := 0;
  feature_boolean := 0;
  aux_count := 0;
  feature_info := to_clob('Dynamic SGA usage not detected');
  feature_usage := '';

  execute immediate 'select count(*) from v$sga_resize_ops ' ||
                    'where oper_type in (''GROW'', ''SHRINK'') and ' ||
                    'oper_mode=''MANUAL''and ' ||
                    'start_time >= ' ||
                    'to_date((select nvl(max(last_sample_date), sysdate-7) ' ||
                    'from dba_feature_usage_statistics))'
  into num_resize_ops;

  if num_resize_ops > 0
  then

    feature_boolean := 1;

    feature_usage := feature_usage||':rsz ops:'||num_resize_ops;

    -- get v$memory_dynamic_components info
    for item in (select component, current_size, min_size, max_size,
                 user_specified_size from
                 v$memory_dynamic_components where current_size != 0)
    loop
      feature_usage := feature_usage||':comp:'||item.component||
                       ':cur:'||item.current_size||':min:'||
                       item.min_size||':max:'||item.max_size||
                       ':usr:'||item.user_specified_size;
    end loop;

    -- get v$system_event info for SGA events
    for item in (select substr(event, 0, 15) evt, total_waits, time_waited
                 from v$system_event where event like '%SGA%')
    loop
      feature_usage := feature_usage||':event:'||item.evt||':waits:'||
                       item.total_waits||':time:'||item.time_waited;
    end loop;

    feature_info := to_clob(feature_usage);

  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_EMX"
     ( feature_boolean  OUT NUMBER,
       aux_count        OUT NUMBER,
       feature_info     OUT CLOB)
AS
  -- total em express usage count since last feature usage collection
  l_count_total_delta number := 0;

  -- total em express usage count since the first time it's used
  l_count_total number := 0;

  -- feature_info clob
  l_detailed_usage_clob CLOB := NULL;

  -- feature_info xml
  l_detailed_usage_xml xmltype := NULL;

  -- new xml to add to feature_info xml for one report
  l_report_usage_xml xmltype   := NULL;

  -- xpath key to find out if report already has entry in feature_info xml
  l_report_usage_key varchar2(32767);

  -- report name
  l_report_name varchar2(32767) := NULL;

  -- statistics of existing entry in feature_info xml for report
  l_old_report_count         number;
  l_old_report_avg_time      number;
  l_old_report_avg_cputime   number;

  -- new statistics to put into feature_info xml for report
  l_new_report_count         number:= NULL;
  l_new_report_total_time    number:= NULL;
  l_new_report_avg_time      number:= NULL;
  l_new_report_total_cputime number:= NULL;
  l_new_report_avg_cputime   number:= NULL;

  -- last db feature usage sample collection time
  l_last_collection_time date;

  -- Query to select the delta since last feature usage collection
  -- from internal fixed table X$KEXSVFU.
  -- Note if count for the report is 0, but last request timestamp is greater
  -- than or equal to the latest sample date of db feature usage framework,
  -- then this report must have been used at least once, therefore decoding
  -- count from 0 to 1.
  -- If in CDB, returned result is for this container only
  cursor emx_fu_cursor(p_last_collection_time date) is
    select report,
           sum(total_count) as total_count,
           sum(total_elapsed_time) as total_elapsed_time,
           sum(total_cpu_time) as total_cpu_time
      from table(gv$(cursor(
             select report_kexsvfu       as report,
                    decode(count_kexsvfu, 0, 1, count_kexsvfu) as total_count,
                    elapsed_time_kexsvfu as total_elapsed_time,
                    cpu_time_kexsvfu     as total_cpu_time
               from X$KEXSVFU
              where last_req_time_kexsvfu >= p_last_collection_time
                and con_id = sys_context('userenv', 'con_id'))))
    group by report;

begin

  -- initialize output parameters
  feature_boolean := 0;
  aux_count := 0;
  feature_info := NULL;

  -- get total em express usage count from aux_count column and
  -- detailed em express usage info from feature_info column before
  -- last usage collection
  begin
    select nvl(aux_count, 0), feature_info
      into l_count_total, l_detailed_usage_clob
      from dba_feature_usage_statistics
     where name = 'EM Express';
  exception
    when NO_DATA_FOUND then
      l_count_total := 0;
      l_detailed_usage_clob := NULL;
  end;

  -- if no feature_info xml exists, construct a brand new one
  if (l_detailed_usage_clob is NULL) then
    l_detailed_usage_xml :=
      xmltype('<emx_usage time_unit="us"></emx_usage>');
  -- otherwise update the existing one
  else
    l_detailed_usage_xml := xmltype(l_detailed_usage_clob);
  end if;

  -- get last db feature usage collection time
  select nvl(max(last_sample_date), sysdate-7)
    into l_last_collection_time
    from dba_feature_usage_statistics;

  -- get report usage info since last feature usage collection
  for rc in emx_fu_cursor(l_last_collection_time)
  loop
    l_report_name              := rc.report;
    l_new_report_count         := rc.total_count;
    l_new_report_total_time    := rc.total_elapsed_time;
    l_new_report_total_cputime := rc.total_cpu_time;

    -- update total count for all EM Express reports since last usage
    -- collection, this will indicate if EM Express has been used since last
    -- collection, and be added to aux_count column
    l_count_total_delta := l_count_total_delta + l_new_report_count;

    --
    -- update the feature_info detail xml
    --

    -- build the xpath key to find out if the report already exists
    -- in the xml. The key looks like:
    --   '//report_usage[@report="<report_id>"]'
    l_report_usage_key := '//report_usage[' ||
                          '@report="' || l_report_name || '"' ||
                          ']';

    -- find out if an xml element for this report already exists in the xml
    if (l_detailed_usage_xml.existsNode(l_report_usage_key) > 0) then

      -- get the old count for this report
      -- if any of the attributes is not found for this report,
      -- reset it to 0
      select NVL(EXTRACTVALUE(l_detailed_usage_xml,
                              l_report_usage_key || '//@count'), 0),
             NVL(EXTRACTVALUE(l_detailed_usage_xml,
                              l_report_usage_key || '//@avg_elapsed_time'), 0),
             NVL(EXTRACTVALUE(l_detailed_usage_xml,
                              l_report_usage_key || '//@avg_cpu_time'), 0)
        into l_old_report_count,
             l_old_report_avg_time,
             l_old_report_avg_cputime
        from dual;

      -- update the statistics, increment count and total time with stats
      -- since the last usage collection
      l_new_report_count
        := l_old_report_count + l_new_report_count;

      -- recalculate average time
      l_new_report_avg_time
        := round((l_old_report_avg_time * l_old_report_count
                  + l_new_report_total_time) / l_new_report_count, 1);

      l_new_report_avg_cputime
        := round((l_old_report_avg_cputime * l_old_report_count
                 + l_new_report_total_cputime) / l_new_report_count, 1);

      -- update the xml using the new stats
      select updateXML(l_detailed_usage_xml,
                       l_report_usage_key || '//@count',
                       l_new_report_count,
                       l_report_usage_key || '//@avg_elapsed_time',
                       l_new_report_avg_time,
                       l_report_usage_key || '//@avg_cpu_time',
                       l_new_report_avg_cputime)
        into l_detailed_usage_xml
        from dual;

    -- if no xml element is found for this report, construct a new one
    else
      -- calculate average time
      l_new_report_avg_time
        := round(l_new_report_total_time / l_new_report_count, 1);
      l_new_report_avg_cputime
        := round(l_new_report_total_cputime / l_new_report_count, 1);

      -- construct new xml element for this report usage
      select xmlelement("report_usage",
                        xmlattributes(
                          l_report_name              as "report",
                          l_new_report_count         as "count",
                          l_new_report_avg_time      as "avg_elapsed_time",
                          l_new_report_avg_cputime   as "avg_cpu_time"))
        into l_report_usage_xml
        from dual;

      -- append this report usage to the main emx feature usage xml
      l_detailed_usage_xml :=
        l_detailed_usage_xml.appendChildxml('/*', l_report_usage_xml);

    end if;

  end loop;

  -- update feature_boolean to indicate if em express has been used or not
  -- by setting it to the total count since last usage collection
  feature_boolean := l_count_total_delta;

  -- update total count in aux_count column
  aux_count := l_count_total + l_count_total_delta;

  -- update feature_info for the new collection
  feature_info := l_detailed_usage_xml.getClobVal();

end dbms_feature_emx;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_EXADATA"
    (feature_boolean  OUT  NUMBER,
     num_cells        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  feature_usage          varchar2(1000);
begin
  -- initialize
  num_cells := 0;
  feature_boolean := 0;
  feature_info := to_clob('EXADATA usage not detected');
  feature_usage := '';

  num_cells := sys.dbms_registry.num_of_exadata_cells();

  if num_cells > 0
  then

    feature_boolean := 1;

    feature_usage := feature_usage||':cells:'||num_cells;

    feature_info := to_clob(feature_usage);

  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_EXTENSIBILITY"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_user_opts         number;
  num_user_aggs         number;
  num_table_funs        number;
  num_idx_types         number;
  num_domain_idxs       number;
  feature_usage         varchar2(1000);
  TYPE cursor_t         IS REF CURSOR;
  cursor_udftype        cursor_t;
  total_count           number;
  flag                  number;

begin
  --initialize
  num_user_opts         :=0;
  num_user_aggs         :=0;
  num_table_funs        :=0;
  num_idx_types         :=0;
  num_domain_idxs       :=0;
  total_count           :=0;
  flag                  :=0;


  feature_boolean := 0;
  aux_count := 0;

  /* get number of user-defined operators */
  execute immediate 'select count(*) from DBA_OPERATORS
          where owner not in (select schema_name from v$sysaux_occupants)
          and owner not in (''SH'')'
          into num_user_opts;

  /* get number of user-defined index types */
  execute immediate 'select count(*)
          from sys.indtypes$ i, sys.user$ u, sys.obj$ o
          where i.obj# = o.obj# and o.owner# = u.user# and
                u.name not in (select schema_name from v$sysaux_occupants)
                and u.name not in (''SH'')'
          into num_idx_types;

  /* get number of user-defined domain indexes */
  execute immediate 'select count(*) from sys.user$ u, sys.ind$ i, sys.obj$ o
          where u.user# = o.owner# and o.obj# = i.obj# and
                i.type# = 9 and
                u.name not in (select schema_name from v$sysaux_occupants)
                and u.name not in (''SH'')'
          into num_domain_idxs;

  /* get number of user-defined aggregates and user-defined
   * pipelined table functions
   */
  OPEN cursor_udftype FOR '
    select count(*), bitand(p.properties, 24)
    from sys.obj$ o, sys.user$ u, sys.procedureinfo$ p
    where o.owner# = u.user# and o.obj# = p.obj# and
          bitand(p.properties, 24) != 0 and
          u.name not in (select schema_name from v$sysaux_occupants)
          and u.name not in (''SH'', ''DVSYS'')
    group by (bitand(p.properties, 24))';

  LOOP
    BEGIN
      FETCH cursor_udftype INTO total_count, flag;
      EXIT WHEN cursor_udftype%NOTFOUND;

      IF flag = 8 THEN
        num_user_aggs := total_count;
      END IF;

      IF flag = 16 THEN
        num_table_funs := total_count;
      END IF;
    END;
  END LOOP;

  if ((num_user_opts > 0) OR (num_user_aggs > 0) OR (num_table_funs > 0)
      OR (num_idx_types > 0) OR (num_domain_idxs > 0)) then
    feature_boolean := 1;
    feature_usage := 'num of user-defined operators: ' || to_char(num_user_opts) ||
        ',' || 'num of user-defined aggregates: ' || to_char(num_user_aggs) ||
        ',' || 'num of table functions: ' || to_char(num_table_funs) ||
        ',' || 'num of index types: ' || to_char(num_idx_types) ||
        ',' || 'num of domain indexes: ' || to_char(num_domain_idxs);

    feature_info := to_clob(feature_usage);
  else
    feature_info := to_clob('EXTENSIBILITY usage not detected');
  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_FGA_AUDIT"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_usage           VARCHAR2(1000);
   fga_policies_total      NUMBER;
   fga_policies_enabled    NUMBER;
   fga_policies_column     NUMBER;
   fga_policies_condition  NUMBER;
   fga_policies_handler    NUMBER;
   fga_policies_DB_trail   NUMBER;
   fga_policies_XML_trail  NUMBER;
BEGIN

  -- Initialize
  feature_boolean         := 0;
  aux_count               := 0;
  feature_info            := NULL;
  fga_policies_total      := 0;
  fga_policies_enabled    := 0;
  fga_policies_column     := 0;
  fga_policies_condition  := 0;
  fga_policies_handler    := 0;
  fga_policies_DB_trail   := 0;
  fga_policies_XML_trail  := 0;

  -- Get FGA policy details from the database
  FOR item IN (SELECT enabled, policy_text, policy_column, pf_function,
                      audit_trail FROM DBA_AUDIT_POLICIES)
  LOOP
    IF (item.enabled = 'YES') THEN
      fga_policies_enabled := fga_policies_enabled + 1;
    END IF;

    IF (item.policy_text IS NOT NULL) THEN
      fga_policies_condition := fga_policies_condition + 1;
    END IF;

    IF (item.policy_column IS NOT NULL) THEN
      fga_policies_column := fga_policies_column + 1;
    END IF;

    IF (item.pf_function IS NOT NULL) THEN
      fga_policies_handler := fga_policies_handler + 1;
    END IF;

    IF (item.audit_trail LIKE 'DB%') THEN
      fga_policies_DB_trail := fga_policies_DB_trail + 1;
    ELSE
      fga_policies_XML_trail := fga_policies_XML_trail + 1;
    END IF;

    fga_policies_total := fga_policies_total + 1;
  END LOOP;

  -- If atleast a single FGA policy is enabled, then FGA feature is enabled
  if (fga_policies_enabled > 0) then
    feature_boolean := 1;
  end if;

  feature_usage := 'Number of FGA policies=' ||
                       to_char(fga_policies_total) || '; ' ||
                   'Number of Enabled FGA policies=' ||
                       to_char(fga_policies_enabled) || '; ' ||
                   'Number of FGA policies with audit_condition=' ||
                       to_char(fga_policies_condition) || '; ' ||
                   'Number of FGA policies with column-level audit=' ||
                       to_char(fga_policies_column) || '; ' ||
                   'Number of FGA policies with handler=' ||
                       to_char(fga_policies_handler) || '; ' ||
                   'Number of FGA policies with DB audit_trail=' ||
                       to_char(fga_policies_DB_trail) || '; ' ||
                   'Number of FGA policies with XML audit_trail=' ||
                       to_char(fga_policies_XML_trail);

  feature_info := to_clob(feature_usage);

END dbms_feature_fga_audit;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_GATEWAYS"
    ( feature_boolean OUT NUMBER,
      aux_count        OUT NUMBER,
      feature_info    OUT CLOB )
AS
  TYPE GtwCursorRef is REF CURSOR;
  TYPE ResultList   is TABLE of varchar(150);
  cur GtwCursorRef;
  res ResultList;
  hs_sql varchar(250);
  i number;
BEGIN
 /*
 We are using "execute immediate" to query HS tables
 because they are not present at the moment this
 stored procedure is created.
 */

  hs_sql := 'select count(*)  ' ||
            '  from   HS_FDS_CLASS '        ||
            '  where fds_class_name <> ''BITE''';
  execute immediate hs_sql into aux_count;

  feature_boolean := aux_count;

  if aux_count = 0
  then
    feature_info := 'This feature is not used.';

    return;
  end if;

  feature_info := 'Num of FDS classes:' || aux_count;

  open cur for 'select ''(ID:''  || FDS_CLASS_ID || ''' ||
               ',NAME:'' || FDS_CLASS_NAME || '',' ||
               'COMMENTS:'' || substr(FDS_CLASS_COMMENTS, 1, 110) || '')''' ||
               ' from HS_FDS_CLASS where FDS_CLASS_NAME <> ''BITE''';
  fetch cur bulk collect into res;
  close cur;

  for i in res.FIRST .. res.LAST loop
    feature_info := feature_info || ',' || res(i);
    /* make sure we don't reach the 1000 chars limit */
    if LENGTH(feature_info) > 850
    then
      feature_info := feature_info || '...';
      return;
    end if;
  end loop;

  hs_sql := 'select count(*)  ' ||
            '  from   HS_FDS_INST '        ||
            '  where fds_class_name <> ''BITE''';
  execute immediate hs_sql into i;

  feature_info := feature_info || ',Num of FDS instances:' || i;

  if i > 0 then
    open cur for 'select ''(CLASS:''  || FDS_CLASS_ID || '',ID:'' || ' ||
                 'FDS_INST_ID || '',NAME:'' || FDS_INST_NAME || ' ||
                 ''',COMMENTS:'' || substr(FDS_INST_COMMENTS, 1, 110)' ||
                 ' || '')'' from HS_FDS_INST where FDS_CLASS_NAME <> ''BITE''';
    fetch cur bulk collect into res;
    close cur;

    for i in res.FIRST .. res.LAST loop
      feature_info := feature_info || ',' || res(i);
      /* make sure we don't reach the 1000 chars limit */
      if LENGTH(feature_info) > 850
      then
        feature_info := feature_info || '...';
        return;
      end if;
    end loop;
  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_GOLDENGATE"
      (feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  -- Based on goldengate usage
  num_capture                             NUMBER;
  num_ds_capture                          NUMBER;
  num_apply                               NUMBER;
  num_trigger_suppression                 NUMBER;
  num_transient_duplicate                 NUMBER;
  num_dblogreader                         NUMBER;
  num_ggsddltrigopt                       NUMBER;
  feature_usage                           VARCHAR2(4000);
  total_feature_usage                     NUMBER;
  num_dbencryption                        NUMBER;
  num_ggsession                           NUMBER;
  num_delcascadehint                      NUMBER;
  num_suplog                              NUMBER;
BEGIN
  -- initialize
  feature_boolean                  := 0;
  aux_count                        := 0;
  feature_info                     := NULL;
  num_capture                      := 0;
  num_ds_capture                   := 0;
  num_apply                        := 0;
  num_trigger_suppression          := 0;
  num_transient_duplicate          := 0;
  num_dblogreader                  := 0;
  num_ggsddltrigopt                := 0;
  feature_usage                    := NULL;
  total_feature_usage              := 0;
  num_dbencryption                 := 0;
  num_ggsession                    := 0;
  num_delcascadehint               := 0;
  num_suplog                       := 0;

  select decode (count(*), 0, 0, 1) into num_capture
     from dba_capture where UPPER(purpose) = 'GOLDENGATE CAPTURE';

  select decode (count(*), 0, 0, 1) into num_ds_capture
     from dba_capture where UPPER(purpose) = 'GOLDENGATE CAPTURE' and
                            UPPER(capture_type) = 'DOWNSTREAM';

  select decode (count(*), 0, 0, 1) into num_apply from dba_apply
     where UPPER(purpose) IN ('GOLDENGATE APPLY', 'GOLDENGATE CAPTURE');

  select sum(count) into num_dblogreader
     from GV$GOLDENGATE_CAPABILITIES where name like 'DBLOGREADER';

  select sum(count) into num_transient_duplicate
     from GV$GOLDENGATE_CAPABILITIES where name like 'TRANSIENTDUPLICATE';

  select sum(count) into num_trigger_suppression
     from GV$GOLDENGATE_CAPABILITIES where name like 'TRIGGERSUPPRESSION';

  select sum(count) into num_ggsddltrigopt
     from GV$GOLDENGATE_CAPABILITIES where name like 'DDLTRIGGEROPTIMIZATION';

  select sum(count) into num_dbencryption
     from GV$GOLDENGATE_CAPABILITIES where name like 'DBENCRYPTION';

  select sum(count) into num_ggsession
     from GV$GOLDENGATE_CAPABILITIES where name like 'GGSESSION';

  select sum(count) into num_delcascadehint
     from GV$GOLDENGATE_CAPABILITIES where name like 'DELETECASCADEHINT';

  select sum(count) into num_suplog
     from GV$GOLDENGATE_CAPABILITIES where name like 'SUPPLEMENTALLOG';

  total_feature_usage := num_capture + num_apply + num_dblogreader +
     num_transient_duplicate + num_ggsddltrigopt + num_trigger_suppression +
     num_dbencryption + num_ggsession + num_delcascadehint + num_suplog;

  feature_usage := feature_usage ||
        'tcap:'                  || num_capture
      ||' dscap:'                || num_ds_capture
      ||' app:'                  || num_apply
      ||' dblogread:'            || num_dblogreader
      ||' tdup:'                 || num_transient_duplicate
      ||' suptrig:'              || num_trigger_suppression
      ||' dtrigopt:'             || num_ggsddltrigopt
      ||' dbenc:'                || num_dbencryption
      ||' ggsess:'               || num_ggsession
      ||' delhint:'              || num_delcascadehint
      ||' suplog:'               || num_suplog;

  feature_info   := to_clob(feature_usage);
  if (total_feature_usage > 0) THEN
      feature_boolean := 1;
  end if;
  if(num_capture > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_apply > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_dblogreader > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_transient_duplicate > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_ggsddltrigopt > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_trigger_suppression > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_dbencryption > 0) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_ggsession > 0) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_delcascadehint > 0) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_suplog > 0) THEN
       aux_count      :=  aux_count+1;
  end if;

END dbms_feature_goldengate;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_HCC"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage         varchar2(1000);
    num_cmp_dollar        number;
    num_level1            number;
    num_level2            number;
    num_level3            number;
    num_hcc               number;
    num_dmls              number;
    num_rll               number;
    blk_level1            number;
    blk_level2            number;
    blk_level3            number;
    blk_nonhcc            number;
    blk_nonhcctry         number;
    blk_rll               number;

begin
    -- initialize
    feature_boolean := 0;
    aux_count := 0;
    num_cmp_dollar := 0;
    num_hcc := 0;
    num_level1  := 0;
    num_level2  := 0;
    num_level3  := 0;
    blk_level1 := 0;
    blk_level2 := 0;
    blk_level3 := 0;

    execute immediate 'select count(*) from compression$ '
        into num_cmp_dollar;

    -- check if there is something compressed
    execute immediate 'select count(*) from seg$ s ' ||
         ' where bitand(s.spare1, 100663296) = 33554432 OR ' ||
               ' bitand(s.spare1, 100663296) = 67108864 OR ' ||
               ' bitand(s.spare1, 100663296) = 100663296 '
        into num_hcc;

    if ((num_cmp_dollar > 0) OR (num_hcc > 0)) then

        feature_boolean := 1;

        -- check for HCC for Query LOW (level 1)
        execute immediate 'select count(*) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 100663296) = 33554432 '
           into num_level1;

        execute immediate 'select sum(blocks) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 100663296) = 33554432 '
           into blk_level1;

        -- check for HCC for Query HIGH (level 2)
        execute immediate 'select count(*) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 100663296) = 67108864 '
           into num_level2;

        execute immediate 'select sum(blocks) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 100663296) = 67108864 '
           into blk_level2;

        -- check for HCC for Archive (level 3)
        execute immediate 'select count(*) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 100663296) = 100663296 '
           into num_level3;

        execute immediate 'select sum(blocks) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 100663296) = 100663296 '
           into blk_level3;

        -- track OLTP compression (non-HCC compression) w/in HCC
        execute immediate 'select value from v$sysstat' ||
            ' where name like ''EHCC Block Compressions'''
            into blk_nonhcc;

        execute immediate 'select value from v$sysstat' ||
            ' where name like ''EHCC Attempted ' ||
            'Block Compressions'''
            into blk_nonhcctry;

        execute immediate 'select value from v$sysstat' ||
            ' where name like ''EHCC Conventional DMLs'''
            into num_dmls;

        -- check for HCC with Row Level Locking
        execute immediate 'select count(*) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 2147483648) = 2147483648 '
           into num_rll;

        execute immediate 'select sum(blocks) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 2147483648) = 2147483648 '
           into blk_rll;

     feature_usage :=
      'Number of Hybrid Columnar Compressed Segments: ' || to_char(num_hcc) ||
        ', ' || ' Segments Analyzed: ' || to_char(num_cmp_dollar) ||
        ', ' || ' Segments Compressed Query Low: ' || to_char(num_level1) ||
        ', ' || ' Blocks Compressed Query Low: ' || to_char(blk_level1) ||
        ', ' || ' Segments Compressed Query High: ' || to_char(num_level2) ||
        ', ' || ' Blocks Compressed Query High: ' || to_char(blk_level2) ||
        ', ' || ' Segments Compressed Archive: ' || to_char(num_level3) ||
        ', ' || ' Blocks Compressed Archive: ' || to_char(blk_level3) ||
        ', ' || ' Blocks Compressed Non-HCC: ' || to_char(blk_nonhcc) ||
        ', ' || ' Attempts to Block Compress: ' || to_char(blk_nonhcctry) ||
        ', ' || ' Conventional DMLs: ' || to_char(num_dmls) ||
        ', ' || ' Segments with HCC Row Level Locking: ' || to_char(num_rll) ||
        ', ' || ' Blocks with HCC Row Level Locking: ' || to_char(blk_rll);

        feature_info := to_clob(feature_usage);
    else
        feature_info := to_clob('Hybrid Columnar Compression not detected');
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_HCCRLL"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage         varchar2(1000);
    num_cmp_dollar        number;
    num_hcc               number;
    num_rll               number;
    blk_rll               number;

begin
    -- initialize
    feature_boolean := 0;
    aux_count := 0;
    num_cmp_dollar := 0;
    num_hcc := 0;

    execute immediate 'select count(*) from compression$ '
        into num_cmp_dollar;

    -- check if there is something compressed
    execute immediate 'select count(*) from seg$ s ' ||
         ' where bitand(s.spare1, 100663296) = 33554432 OR ' ||
               ' bitand(s.spare1, 100663296) = 67108864 OR ' ||
               ' bitand(s.spare1, 100663296) = 100663296 '
        into num_hcc;

        -- check for HCC with Row Level Locking
        execute immediate 'select count(*) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 2147483648) = 2147483648 '
           into num_rll;

        execute immediate 'select sum(blocks) from seg$ s ' ||
          ' where bitand(s.spare1, 2048) = 2048 AND ' ||
                ' bitand(s.spare1, 2147483648) = 2147483648 '
           into blk_rll;

    if ((num_rll > 0) OR (blk_rll > 0)) then

        feature_boolean := 1;

     feature_usage :=
      'Number of Hybrid Columnar Compressed Segments: ' || to_char(num_hcc) ||
        ', ' || ' Segments Analyzed: ' || to_char(num_cmp_dollar) ||
        ', ' || ' Segments with HCC Row Level Locking: ' || to_char(num_rll) ||
        ', ' || ' Blocks with HCC Row Level Locking: ' || to_char(blk_rll);

        feature_info := to_clob(feature_usage);
    else
        feature_info := to_clob('Hybrid Columnar Compression Row Level Locking not detected');
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_HEATMAP"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage   varchar2(300);
    num_tbs         number := 0;
    num_seg         number := 0;
    num_blocks      number := 0;
begin
    -- initialize
    feature_boolean := 0;
    aux_count       := 0;
    feature_info    := to_clob('Heat Map feature is not used');

    -- Distinct tablespaces tracked
    execute immediate 'select count(distinct(ts#)) from heat_map_stat$ where
                       obj# <> -1'
       into num_tbs;


    -- Distinct segments tracked
    execute immediate 'select count(*) from '||
            ' (select distinct obj#, dataobj#, ts# from heat_map_stat$ where
                       obj# <> -1)'
            into num_seg;

    -- Blocks tracked in memory
    execute immediate 'select count(*) from x$ktfsimstat'
           into num_blocks;

    if num_tbs > 0 OR num_seg > 0 OR num_blocks > 0 then

      feature_boolean := 1;
      feature_usage   :=
                'Number of Tablespaces Tracked: ' || to_char(num_tbs) ||
        ', ' || ' Number of Segments Tracked: ' || to_char(num_seg) ||
        ', ' || ' Number of Blocks Tracked in Memory: ' || to_char(num_blocks);
      feature_info    := to_clob(feature_usage);

    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_IDH"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  feature_usage          varchar2(1000);
  cursor c1 is select grantee,granted_role
                      from dba_role_privs where
                      granted_role = 'DBHADOOP' and grantee != 'SYS';
begin
  -- initialize
  aux_count := 0;
  feature_boolean := 0;
  feature_info := to_clob('In-Database Hadoop usage not detected');
  feature_usage := '';

  for i in c1
  loop
    aux_count := aux_count + 1;
  end loop;

  if aux_count > 0
  then
    feature_boolean := 1;
    feature_usage := feature_usage||':DBHADOOP users:'||aux_count;
    feature_info := to_clob(feature_usage);
  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ILM"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage         varchar2(1000);
    num_ilm_pol           number := 0;
    num_obj_pol           number := 0;
begin
    -- initialize
    feature_boolean := 0;
    aux_count       := 0;
    feature_info    := to_clob('Information Lifecycle Management not detected');

    -- check for ILM usage by counting policies in ILM dictionary
    execute immediate 'select count(*) from ilm$ '
       into num_ilm_pol;

    if num_ilm_pol > 0 then

      feature_boolean := 1;

      execute immediate 'select count(*) from ilmobj$ '
         into num_obj_pol;

      feature_usage   :=
                'Number of ILM Policies: ' || to_char(num_ilm_pol) ||
        ', ' || 'Number of Objects Affected: ' || to_char(num_obj_pol);
      feature_info    := to_clob(feature_usage);

    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_IMA" (
    feature_boolean OUT NUMBER,
    aux_count       OUT NUMBER,
    feature_info    OUT CLOB)
AS
    feature_usage               varchar2(1000);
    num_kv                      number;
    avg_num_dim                 number;
    max_num_dim                 number;
    num_fact                    number;

BEGIN
    feature_boolean             := 0;
    aux_count                   := 0;

    -- find the total number of recent key vectors
    execute immediate 'select count(*) from gv$key_vector where probed > 0'
      into num_kv;

    -- average number of recent key vectors per query, overall maximum and
    -- total number of unique fact tables referenced (does not include
    -- complex facts)
    execute immediate 'select round(avg(key_vector_count),2),
                              max(key_vector_count),
                              count(distinct fact_name)
                       from (select fact_name, count(*) key_vector_count
                             from gv$key_vector
                             where probed > 0
                             group by sql_id, sql_exec_id, fact_name)'
      into avg_num_dim, max_num_dim, num_fact;

    --Summary
    feature_usage :=
        ' In-Memory Aggregation Feature Usage: ' ||
                'Total Number of Key Vectors: ' ||
                  to_char(num_kv) ||
         ', ' || 'Maximum Number of Key Vectors for a Query: ' ||
                  to_char(max_num_dim) ||
        ', ' || 'Average Number of Key Vectors per Query: ' ||
                  to_char(avg_num_dim) ||
        ', ' || 'Total Number of Unique Fact Tables: ' ||
                  to_char(num_fact);

     if (num_kv > 0) then
      feature_boolean := 1;
      feature_info := to_clob(feature_usage);
    else
      feature_boolean := 0;
      feature_info := to_clob('In-Memory Aggregation Not Detected');
    end if;
END DBMS_FEATURE_IMA;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_IMC" (
    feature_boolean OUT NUMBER,
    aux_count       OUT NUMBER,
    feature_info    OUT CLOB)
AS
    feature_usage               varchar2(1000);
    num_tab                     number;
    num_tab_part                number;
    num_tab_subpart             number;
    num_segs                    number;

BEGIN
    feature_boolean             := 0;
    aux_count                   := 0;

    execute immediate
       'select count(*) from dba_tables where ' ||
       'inmemory_compression is not null'
    into num_tab;

    execute immediate
       'select count(*) from dba_tab_partitions where ' ||
       'inmemory_compression is not null'
    into num_tab_part;

    execute immediate
       'select count(*) from dba_tab_subpartitions where ' ||
       'inmemory_compression is not null'
    into num_tab_subpart;

    -- This query will catch the case where tables are
    -- created with inmemory_default=FORCE. In that case
    -- the tables created will have the 'inmemory_compression'
    -- field as null. The above queries are still required
    -- since a table could have been created as 'INMEMORY',
    -- but not have been loaded into memory yet. segtype=0
    -- will exclude in-memory journal areas.
    execute immediate
       'select count(*) from gv$im_segments_detail where ' ||
       'segtype=0'
    into num_segs;

    --Summary
    feature_usage :=
        ' In-Memory Column Store Feature Usage: ' ||
                'In-Memory Column Store Tables: ' ||
                  to_char(num_tab) ||
        ', ' || 'In-Memory Column Store Table Partitions: ' ||
                  to_char(num_tab_part) ||
        ', ' || 'In-Memory Column Store Table Subpartitions: ' ||
                  to_char(num_tab_subpart) ||
        ', ' || 'Total In-Memory Column Store Segments Populated: ' ||
                  to_char(num_segs);

     if (num_tab + num_tab_part + num_tab_subpart + num_segs > 0) then
      feature_boolean := 1;
      feature_info := to_clob(feature_usage);
    else
      feature_boolean := 0;
      feature_info := to_clob('In-Memory Column Store Not Detected');
    end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_IOT" (
    feature_boolean OUT NUMBER,
    aux_count       OUT NUMBER,
    feature_info    OUT CLOB)
AS
    feature_usage                 varchar2(1000);
    num_iot                       number;
    num_iotpart_index_segments    number;
    num_iotpart_overflow_segments number;

BEGIN
    feature_boolean             := 0;
    aux_count                   := 0;

    -- If the IOT or its overflow segment is stored in a tablespace other than
    -- SYSTEM or SYSAUX, count it.
    execute immediate
       'select count(*) from dba_tables, dba_indexes where ' ||
       'dba_tables.iot_type is not null and dba_indexes.table_name ' ||
       '= dba_tables.table_name and (dba_indexes.tablespace_name ' ||
       'not in (''SYSTEM'', ''SYSAUX'', ''TEMP'', ''SYSEXT'')' ||
       'or dba_tables.tablespace_name ' ||
       'not in (''SYSTEM'', ''SYSAUX'', ''TEMP'', ''SYSEXT''))'
    into num_iot;

    -- Partitioned IOT/overflow segment
    -- for the IOT overflow segment partitions
    execute immediate
       'select count(*) from dba_tables, dba_tab_partitions where ' ||
       'dba_tables.iot_type is not null and dba_tables.table_name = ' ||
       'dba_tab_partitions.table_name ' ||
       'and dba_tab_partitions.tablespace_name ' ||
       'not in (''SYSTEM'', ''SYSAUX'', ''TEMP'', ''SYSEXT'')'
    into num_iotpart_overflow_segments;

    -- for the IOT index segment partitions
    execute immediate
       'select count(*) ' ||
       'from dba_tables, dba_indexes, dba_ind_partitions where ' ||
       'dba_tables.iot_type is not null and dba_tables.table_name = ' ||
       'dba_indexes.table_name and dba_indexes.index_name = ' ||
       'dba_ind_partitions.index_name and ' ||
       'dba_ind_partitions.tablespace_name ' ||
       'not in (''SYSTEM'', ''SYSAUX'', ''TEMP'', ''SYSEXT'')'
    into num_iotpart_index_segments;

    -- Composite partitioning is not supported for IOTs

    --Summary
    feature_usage :=
        ' Index Organized Table Feature Usage: ' ||
                'Index Organized Tables: ' ||
                  to_char(num_iot) ||
        ', ' || 'Index Organized Table Partitions ' ||
        '(Index and Overflow Partitions) ' ||
                  to_char(num_iotpart_index_segments +
                          num_iotpart_overflow_segments);

     if (num_iot + num_iotpart_index_segments +
         num_iotpart_overflow_segments > 0) then
      feature_boolean := 1;
      feature_info := to_clob(feature_usage);
    else
      feature_boolean := 0;
      feature_info := to_clob('Index Organized Tables Not Detected');
    end if;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_JOB_SCHEDULER"
      (is_used OUT number, nr_of_jobs OUT number, summary OUT clob)
AS
sum1 varchar2(4000);
n1 number;
n2 number;
n3 number;
n4 number;
n5 number;
n6 number;
n7 number;
n8 number;
n9 number;

BEGIN
  select count(*) into nr_of_jobs from dba_scheduler_jobs where
      owner not in ('SYS', 'ORACLE_OCM', 'EXFSYS' )
       and job_name not like 'AQ$%'
       and job_name not like 'MV_RF$J_%';

  is_used := nr_of_jobs;
  -- if job used
  if is_used = 0  then return; end if;

select count(*) into n1 from dba_scheduler_jobs;
    sum1  := sum1
              || 'JNRA:' || n1
              || ',JNRU:' || nr_of_jobs;

select count(*) into n1 from dba_jobs;
    sum1  := sum1
              || ',DJOBS:' || n1;
-- Direct per job type counts, i.e of the total number of jobs how many are
--  program vs executable vs plsql block vs stored procedure vs chain


  for it in  (
select jt t, count(*) n
from (select   nvl(job_type, 'PROGRAM') jt
from   dba_scheduler_jobs )
group by jt order by 1)
  loop
    sum1  := sum1 || ',JTD' || substr(it.t,1,3) || ':' || it.n;
  end loop;


-- Indirect per job type counts.
-- In this case the you have to track down the program type of all
-- the jobs whose jobs are of type program.
-- So now of the the total number of jobs, how many are
--  executable vs plsql block vs stored procedure vs chain

  for it in  (
select jt t, count(*) n from
   (select program_type jt
      from dba_scheduler_jobs j,
         dba_scheduler_programs p
    where
            job_type is null
            and p.owner = j.program_owner
            and p.program_name = j.program_name
    union all
     select 'NAP'
      from dba_scheduler_jobs j
       where
            j.job_type is null
            and not exists (select 1 from
             dba_scheduler_programs p
              where
               p.owner = j.program_owner
              and p.program_name = j.program_name)
    union all
    select   job_type
    from   dba_scheduler_jobs where job_type is not null)
     group by jt order by 1)
  loop
    sum1  := sum1 || ',JTI' || substr(it.t,1,3) || ':' || it.n;
  end loop;
-- Direct per schedule type counts, i.e. of the total
-- number of jobs how many are
-- repeat_interval is null, schedule based, event based, file watcher based,
-- plsql repeat interval, calendar repeat interval, window based



  for it in  (
select schedule_type t,
         count(*) n
from   dba_scheduler_jobs
group by schedule_type order by 1)
  loop
    sum1  := sum1 || ',JDS' || substr(replace(it.t, 'WINDOW_','W'),1,3) || ':' || it.n;
  end loop;

-- Indirect per schedule type counts. In this case the schedule based jobs are
-- tracked down to their eventual schedule type. So now of the total number of jobs, how many are
--  repeat_interval is null, event based, file watcher, plsql repeat interval,
-- calendar repeat interval, window (group) based

  for it in  (
select schedule_type t, count(*) n from
   (select p.schedule_type
      from dba_scheduler_jobs j,
         dba_scheduler_schedules p
    where
            j.schedule_type = 'NAMED'
            and p.owner = j.schedule_owner
            and p.schedule_name = j.schedule_name
    union all
    select   schedule_type
    from   dba_scheduler_jobs where schedule_type <> 'NAMED')
     group by schedule_type order by 1)
  loop
    sum1  := sum1 || ',JIS' || substr(replace(it.t, 'WINDOW_','W'),1,3) || ':' || it.n;
  end loop;


-- Number of jobs that have destination set to a
-- single destination vs destination set to a destination group

 for it in (
select dest t, count(*) n
   from (select decode(number_of_destinations,1, 'SD', 'MD') dest
       from dba_scheduler_jobs where destination is not null)
   group by dest order by 1)
  loop
    sum1  := sum1 || ',JD' || it.t || ':' || it.n;
  end loop;

-- Number of external jobs (job type or program type executable) split across local without a credential,
-- local with credential, remote single destination, remote destination group
 for it in (
select ext_type t, count(*) n from
(select job_name, decode(destination, null,
     decode(credential_name, null,'JXL','JXLC'),
     decode(dest_type,null,'JXRID','SINGLE','JXRSD','JXRGD')) ext_type from
(select job_name, job_type, credential_name, destination_owner, destination
from all_scheduler_jobs where program_name is null
union all
select job_name, program_type, credential_name, destination_owner, destination
from all_scheduler_jobs aj, all_scheduler_programs ap
where aj.program_owner = ap.owner and aj.program_name = ap.program_name) aij,
(select owner, group_name dest_name, 'GROUP' dest_type from all_scheduler_groups
where group_type = 'EXTERNAL_DEST'
union all
select 'SYS', destination_name, 'SINGLE' from all_scheduler_external_dests) ad
where job_type in ('EXECUTABLE','EXTERNAL_SCRIPT')  and aij.destination_owner = ad.owner(+) and
aij.destination = ad.dest_name(+)) group by ext_type order by 1)
  loop
    sum1  := sum1 || ',' || it.t || ':' || it.n;
  end loop;


-- Number of remote database jobs with single destination versus number of jobs with destination group (i.e. destination is set and job type or program type is plsql block or stored procedure).

 for it in (
select dest_type t, count(*) n from
    (select  job_type, destination_owner, destination
        from all_scheduler_jobs where program_name is null
    union all
    select  program_type, destination_owner, destination
        from all_scheduler_jobs aj, all_scheduler_programs ap
            where aj.program_owner = ap.owner and aj.program_name = ap.program_name) aij,
    (select owner, group_name dest_name, 'JDBG' dest_type from all_scheduler_groups
            where group_type = 'DB_DEST'
     union all
     select owner, destination_name, 'JDBS' from all_scheduler_db_dests) ad
 where job_type in  ('STORED_PROCEDURE','PLSQL_BLOCK','SQL_SCRIPT', 'BACKUP_SCRIPT') and
       aij.destination is not null and aij.destination_owner = ad.owner(+) and
       aij.destination = ad.dest_name(+) group by dest_type order by 1)
  loop
    sum1  := sum1 || ',' || it.t || ':' || it.n;
  end loop;

-- Number of jobs with arguments. For those jobs with arguments, avg,
-- median and max number of job arguments.

select count(*),
       avg(number_of_arguments),
       median(number_of_arguments),
       max(number_of_arguments) into  n1, n2, n3, n4
from dba_scheduler_jobs where number_of_arguments > 0;

    sum1  := sum1
              || ',JAC:' || n1
              || ',JAA:' || round(n2)
              || ',JAM:' || n3
              || ',JAX:' || n4;

-- Split total number of jobs across job_style, i.e. regular vs lightweight

 for it in (
select job_style t, count(*) n from dba_scheduler_jobs
     group by job_style order by 1)
  loop
    sum1  := sum1 || ',JST' || substr(it.t,1,3) || ':' || it.n;
  end loop;


-- Number of jobs that have restartable set to true
-- How many have max_run_duration set
-- How many have schedule_limit set
-- How many have instance_id set
-- How many have allow_runs_in_restricted_mode set
-- How many have raise_events set
-- How many have parallel_instances set
select sum(decode(restartable,null, 0,1)),
       sum(decode(max_run_duration,null, 0,1)) ,
       sum(decode(schedule_limit,null, 0,1)) ,
       sum(decode(instance_id,null, 0,1)) ,
       sum(decode(allow_runs_in_restricted_mode,'FALSE', 0,1)) ,
       sum(decode(bitand(flags, 2147483648),2147483648,1,0)),
       sum(decode(bitand(flags, 68719476736),68719476736,1,0)),
       sum(decode(enabled,'FALSE',1,0)),
       sum(decode(raise_events,null, 0,1))
             into n1, n2, n3, n4, n5,n6, n7, n8, n9
from dba_scheduler_jobs;
    sum1  := sum1
              || ',JRS:' || n1
              || ',JMRD:' || n2
              || ',JSL:' || n3
              || ',JII:' || n4
              || ',JAR:' || n5
              || ',JFLW:' || n7
              || ',JRE:' || n9
              || ',JDIS:' || n8
              || ',JPI:' || n6;

-- Total number of programs
-- Per type program numbers, i.e. the number of executable, plsql_block,
-- stored procedure, chain programs

 for it in (
select program_type t, count(*) n from dba_scheduler_programs
    group by program_type order by 1)
  loop
    sum1  := sum1 || ',PRT' || substr(it.t,1,3) || ':' || it.n;
  end loop;


-- Number of programs with arguments
-- For programs with arguments, avg, mean and max number of arguments
select count(*) ,  round(avg(number_of_arguments)) ,
       median(number_of_arguments) ,
      max(number_of_arguments)
         into n1, n2, n3, n4
from dba_scheduler_programs where number_of_arguments > 0;
    sum1  := sum1
              || ',PAC:' || n1
              || ',PAA:' || n2
              || ',PAM:' || n3
              || ',PAX:' || n4;

-- Total number of schedules
-- Split across schedule type. How many in each category:
-- run once, plsql repeat interval, calendar repeat interval, event based,
-- file watcher, window based


 for it in (
select schedule_type t, count(*) n from dba_scheduler_schedules group by
     schedule_type order by 1)
  loop
    sum1  := sum1 || ',SST' || substr(it.t,1,3) || ':' || it.n;
  end loop;


-- Total number of arguments
-- How many of them are named arguments

 for it in (
select an t, count(*) n
    from (select  decode(argument_name, null, 'PA_', 'PAN') an from
    dba_scheduler_program_args) group by an order by 1)
  loop
    sum1  := sum1 || ',' || it.t || ':' || it.n;
  end loop;

-- Split across count of metadata arguments, varchar based args, anydata based arguments
 for it in (
select metadata_attribute t, count(*) n from dba_scheduler_program_args where
         metadata_attribute is not null group by metadata_attribute order by 1)
  loop
    sum1  := sum1 || ',PM' ||
                  substr(replace(replace(it.t,'JOB_','J'),'WINDOW_','W'),1,3)
                    || ':' || it.n;
  end loop;

-- Job Classes
-- Total number of job classes
-- How many have service set
-- How many have resource consumer group set
-- split across logging levels, i.e. how many no logging, failed runs, runs only, full

select count(*) , sum(decode(service, null, 0, 1)) ,
sum(decode(resource_consumer_group, null, 0, 1)) into n1,n2,n3
from dba_scheduler_job_classes;
    sum1  := sum1
              || ',JCNT:' || n1
              || ',JCSV:' || n2
              || ',JCCG:' || n3 ;

 for it in (
select logging_level t, count(*) n from dba_scheduler_job_classes
    group by logging_level order by 1)
  loop
    sum1  := sum1 || ',LL' || substr(it.t,1,3)  || ':' || it.n;
  end loop;

-- Windows
-- Total number of windows
-- Number of high priority windows (low = total - high)
-- Number of windows without a resource plan
-- Number of named schedule based windows (inlined schedule = total - named schedule)
 for it in (
select window_priority t, count(*) n from dba_scheduler_windows
    group by window_priority order by 1)
  loop
    sum1  := sum1 || ',WIP' || substr(it.t,1,2) || ':' || it.n;
  end loop;

select count(*) into n1 from dba_scheduler_windows  where resource_plan is
 null;
    sum1  := sum1
              || ',WINR:' || n1;

 for it in (
select st t, count(*) n from
   (select schedule_type  st
     from
     dba_scheduler_windows)  group by st order by 1)
  loop
    sum1  := sum1 || ',SWT' || substr(it.t,1,2) || ':' || it.n;
  end loop;


-- Chains
-- Total number of chains
-- How many have evaluation interval set
-- How many were created with a rule set passed in
-- Total number of steps
-- How many steps have destination set
-- Avg, mean and max number of steps per chain
-- Total number of rules
-- Avg, mean and max number of rules per chain
-- ? How many of them use simple syntax
-- ? Avg, mean and max number of steps per rule condition
-- ? Avg, mean and max number of steps per rule action

select count(*), sum(decode(evaluation_interval, null, 0, 1)) EV,
       sum(decode(user_rule_set, 'TRUE', 1, 0)) UR,
       sum(nvl(number_of_rules,0)) NR, sum(nvl(number_of_steps,0)) NS,
       round(avg(number_of_steps)) VS , median(number_of_steps) MS,
       max(number_of_steps) XS into n1, n2,n3,n4,n5,n6,n7,n8
    from dba_scheduler_chains;
    sum1  := sum1
              || ',CCNT:' || n1
              || ',CEVI:' || n2
              || ',CURS:' || n3
              || ',CNRR:' || n4
              || ',CNRS:' || n5
              || ',CAVS:' || n6
              || ',CMDS:' || n7
              || ',CMXS:' || n8;


select count(*) into n1
    from dba_scheduler_chain_steps where destination is not null;
    sum1  := sum1
              || ',CSRD:' || n1 ;

-- Direct per step type counts. Of total how many steps point to:
--    program vs (sub)chain vs event
 for it in (
select step_type t, count(*)  n from dba_scheduler_chain_steps
   group by step_type order by 1)
  loop
    sum1  := sum1 || ',CSP' || substr(it.t,1,3) || ':' || it.n;
  end loop;

-- Indirect per step type counts. By following the program type how many are:
--    executable vs plsql block vs stored procedure vs (sub)chain vs event

 for it in (
select step_type t, count(*) n from
      (select step_type from dba_scheduler_chain_steps
            where step_type <> 'PROGRAM'
      union all
       select program_type from dba_scheduler_programs p,
                                dba_scheduler_chain_steps s
          where
           s.step_type = 'PROGRAM' and
          s.program_owner =p.owner and
          s.program_name = p.program_name)
   group by step_type order by 1)
  loop
    sum1  := sum1 || ',CHST' || substr(it.t,1,3) || ':' || it.n;
  end loop;

-- Total number of credentials
-- How many have database role set
-- How many have windows domain set

select count(*), sum(decode(database_role, null, 0, 1)),
       sum(decode(windows_domain, null, 0, 1))
     into n1,n2,n3
    from dba_scheduler_credentials;
    sum1  := sum1
              || ',CRNR:' || n1
              || ',CRDB:' || n2
              || ',CSWD:' || n3 ;

-- Total number of destinations
-- How many database destinations (external dests = total - database dests)
-- Of the database destinations, how many specified connect info (non null tns_name)

 for it in (
select dt t, count(*) n from
   (select decode(destination_type, 'EXTERNAL', 'DSXT', 'DSDB') dt
     from dba_scheduler_dests )
    group by dt order by 1)
  loop
    sum1  := sum1 || ',' || it.t || ':' || it.n;
  end loop;

select count(*) into n1 from dba_scheduler_db_dests
         where connect_info is null;
    sum1  := sum1
              || ',DSDN:' || n1  ;
-- File Watcher
-- Total number of file watchers
-- How many remote file watchers (destination is non null)
-- How many have minimum file size > 0
-- How many have steady_state_duration set to a non-null value
select count(*),
       sum(decode(steady_state_duration, null, 0,1)),
       sum(decode(destination, null, 0,1)),
       sum(decode(nvl(min_file_size,0), 0, 0, 1))
      into n1,n2,n3,n4
 from dba_scheduler_file_watchers;
    sum1  := sum1
              || ',FWNR:' || n1
              || ',FWSS:' || n2
              || ',FWDS:' || n3
              || ',FWMF' || n4  ;


-- Groups
-- Total number of groups
-- Per group type count, i.e. how many are db_dest vs external_dest vs window
-- Avg, mean and max number of members per group

 for it in (
select group_type t, count(*) n , round(avg(number_of_members)) a ,
              max(number_of_members) b,
              median(number_of_members) c
        from dba_scheduler_groups group by group_type order by 1)
  loop
    sum1  := sum1 || ',G' || substr(it.t,1,3) || 'N:' || it.n
                        || ',G' || substr(it.t,1,3) || 'A:' || it.a
                        || ',G' || substr(it.t,1,3) || 'X:' || it.b
                        || ',G' ||substr( it.t,1,3) || 'M:' || it.c;
  end loop;


-- Calendar Syntax
-- Total number of schedules
-- Total number of non-null repeat_intervals schedules
-- Of the calendar syntax ones how many:
-- use include, exclude, or intersect
-- have a user defined frequency
-- use offset

select count(*) into n1 from dba_scheduler_schedules;
    sum1  := sum1
              || ',SCHNRA:' || n1;

select count(*) into n1 from dba_scheduler_schedules
       where repeat_interval is not null;
    sum1  := sum1
              || ',SCHNNR:' || n1;

 for it in (
select typ t, count(*) n from
      (select decode(instr(i,'FREQ=YEARLY'),1, 'Y',
        decode(instr(i, 'FREQ=MONTHLY'),1,'M',
         decode(instr(i,'FREQ=WEEKLY'),1, 'W',
          decode(instr(i,'FREQ=DAILY'),1, 'D',
           decode(instr(i,'FREQ=HOURLY'),1, 'H',
           decode(instr(i,'FREQ=MINUTELY'),1, 'MI',
           decode(instr(i,'FREQ=SECONDLY'),1, 'S',
           decode(instr(i,'FREQ='),1, 'U','X')))))))) typ
      from (select replace(upper(iv), ' ', '') i from (
         select repeat_interval iv
        from dba_scheduler_jobs
          where schedule_type = 'CALENDAR'
       union all select repeat_interval from dba_scheduler_schedules where
         schedule_type = 'CALENDAR')))
 group by typ order by 1)
  loop
    sum1  := sum1 || ',CAF' || it.t || ':' || it.n;
  end loop;


select sum(decode(instr(i, 'OFFSET'), 0, 0, 1)) "Offset",
       sum(decode(instr(i, 'SPAN'), 0, 0, 1)) "Span",
       sum(decode(instr(i, 'BYSETPOS'), 0, 0, 1)) "Bysetp",
       sum(decode(instr(i, 'INCLUDE'), 0, 0, 1)) "Inc",
       sum(decode(instr(i, 'EXCLUDE'), 0, 0, 1)) "EXC",
      sum(decode(instr(i, 'INTERSECT'), 0, 0, 1)) "ISEC"
      into n1,n2,n3,n4,n5,n6
from (select replace(upper(iv), ' ', '') i from (
   select repeat_interval iv
  from dba_scheduler_jobs
    where schedule_type = 'CALENDAR'
 union all select repeat_interval from dba_scheduler_schedules where
   schedule_type = 'CALENDAR'));
    sum1  := sum1
              || ',CAOF:' || n1
              || ',CASC:' || n2
              || ',CABS:' || n3
              || ',CAIC:' || n4
              || ',CAEX:' || n5
              || ',CAIS:' || n6;


select count (distinct owner||job_name) into n1
     from dba_scheduler_notifications;
    sum1  := sum1
              || ',SNNR:' || n1;

 for it in (
select event t, count(*) n
     from dba_scheduler_notifications
     group by event order by 1)
  loop
    sum1  := sum1 || ',JN'
               || substr(replace(it.t, 'JOB_','J'),1,5) || ':' || it.n;
  end loop;
  summary := to_clob(sum1);
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_JSON"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB )
AS
  num_json_cols         number := 0;
  num_clob_cols         number := 0;
  num_blob_cols         number := 0;
  num_raw_cols          number := 0;
  num_varchar2_cols     number := 0;
  num_json_view         number := 0;
  num_jv_view           number := 0;
  num_je_view           number := 0;
  num_jq_view           number := 0;
  num_jt_view           number := 0;
  num_min_rows          number := 0;
  num_max_rows          number := 0;
  num_avg_rows          number := 0;
  num_jv_fidx           number := 0;
  num_je_fidx           number := 0;
  num_jq_fidx           number := 0;
  num_json_cidx         number := 0;
  num_bson_cidx         number := 0;
  CURSOR expr_cur IS
    SELECT COLUMN_EXPRESSION
    FROM DBA_IND_EXPRESSIONS;
  expr   expr_cur%ROWTYPE;
  c      clob;
BEGIN
  -- initialize
  feature_boolean := 0;
  aux_count := 0;
  feature_info := '{ "version":1, ';

  /* get the number of json cols from dba_json_columns */
  execute immediate 'select count(1) from dba_json_columns
                     where owner not in
                     (select schema_name from v$sysaux_occupants)'
  into num_json_cols;

  /* Number of CLOB columns */
  execute immediate 'select count(1) from dba_json_columns
                     where data_type = ''CLOB'' and owner not in
                     (select schema_name from v$sysaux_occupants)'
  into num_clob_cols;

  /* Number of BLOB columns */
  execute immediate 'select count(1) from dba_json_columns
                     where data_type = ''BLOB'' and owner not in
                     (select schema_name from v$sysaux_occupants)'
  into num_blob_cols;

  /* Number of RAW columns */
  execute immediate 'select count(1) from dba_json_columns
                     where data_type = ''RAW'' and owner not in
                     (select schema_name from v$sysaux_occupants)'
  into num_raw_cols;

  /* Number of varchar columns */
  execute immediate 'select count(1) from dba_json_columns
                     where data_type = ''VARCHAR2'' and owner not in
                     (select schema_name from v$sysaux_occupants)'
  into num_varchar2_cols;

  /* Write Storage stats into clob */
  dbms_lob.append(feature_info, to_clob ('"jsonColumns": {' ||
                  '"total":' || to_char(num_json_cols) || ' , ' ||
                  '"varchar2":' || to_char(num_varchar2_cols) || ' , ' ||
                  '"clob":' || to_char(num_clob_cols) || ' , ' ||
                  '"blob":' || to_char(num_blob_cols) || ' , ' ||
                  '"raw":'  || to_char(num_raw_cols)  || ' }, '));

  /* Get the min, max and avg size of the JSON tables */
  execute immediate 'select max(num_rows) from dba_tables where
                     table_name in (select table_name
                     from dba_json_columns where owner not in
                     (select schema_name from v$sysaux_occupants))'
  into num_max_rows;

  execute immediate 'select min(num_rows) from dba_tables where
                     table_name in (select table_name
                     from dba_json_columns where owner not in
                     (select schema_name from v$sysaux_occupants))'
  into num_min_rows;

  execute immediate 'select avg(num_rows) from dba_tables where
                     table_name in (select table_name
                     from dba_json_columns where owner not in
                     (select schema_name from v$sysaux_occupants))'
  into num_avg_rows;

  if num_max_rows is null then
    num_max_rows := 0;
  end if;

  if num_min_rows is null then
    num_min_rows := 0;
  end if;

  if num_avg_rows is null then
    num_avg_rows := 0;
  end if;

  /* Write row count stats into clob */
  dbms_lob.append(feature_info, to_clob ('"rowCount": {' ||
                  '"maxCount":' || to_char(num_max_rows) || ' , ' ||
                  '"minCount":' || to_char(num_min_rows) || ' , ' ||
                  '"avgCount":' || to_char(num_avg_rows) || ' }, '));

  /* Get the JSON view stats */
  execute immediate 'select count(1) from dba_views where
                     upper(text_vc) like ''%JSON_VALUE%'' and owner
                     not in (select schema_name from v$sysaux_occupants)'
  into num_jv_view;

  execute immediate 'select count(1) from dba_views where
                     upper(text_vc) like ''%JSON_EXISTS%'' and owner
                     not in (select schema_name from v$sysaux_occupants)'
  into num_je_view;

  execute immediate 'select count(1) from dba_views where
                     upper(text_vc) like ''%JSON_QUERY%'' and owner
                     not in (select schema_name from v$sysaux_occupants)'
  into num_jq_view;

  execute immediate 'select count(1) from dba_views where
                     upper(text_vc) like ''%JSON_TABLE%'' and owner
                     not in (select schema_name from v$sysaux_occupants)'
  into num_jt_view;

  execute immediate 'select count(1) from dba_views where
                     upper(text_vc) like ''%JSON_%'' and owner
                     not in (select schema_name from v$sysaux_occupants)'
  into num_json_view;

  /* Write JSON view stats into clob */
  dbms_lob.append(feature_info, to_clob ('"views": {' ||
                  '"total":' || to_char(num_json_view) || ' , ' ||
                  '"jsonValue":'  || to_char(num_jv_view) || ' , ' ||
                  '"jsonExists":' || to_char(num_je_view) || ' , ' ||
                  '"jsonQuery":'  || to_char(num_jq_view) || ' , ' ||
                  '"jsonTable":'  || to_char(num_jt_view) || ' }, '));

  /* Indexes */

  /* Get JSON Functional Index stats */

  OPEN expr_cur;
  LOOP
      FETCH expr_cur INTO expr;
      EXIT WHEN expr_cur%NOTFOUND;
      c := to_clob(expr.COLUMN_EXPRESSION);
      if (upper(c) like '%JSON_VALUE%') then
        num_jv_fidx := num_jv_fidx + 1;
      elsif (upper(c) like '%JSON_EXISTS%') then
        num_je_fidx := num_je_fidx + 1;
      elsif (upper(c) like '%JSON_QUERY%') then
        num_jq_fidx := num_jq_fidx + 1;
      end if;
  END LOOP;
  CLOSE expr_cur;

  /* Write JSON view stats into clob */
  dbms_lob.append(feature_info, to_clob ('"funcIdx": {' ||
                  '"jsonValue":'  || to_char(num_jv_fidx) || ' , ' ||
                  '"jsonExists":' || to_char(num_je_fidx) || ' , ' ||
                  '"jsonQuery":'  || to_char(num_jq_fidx) || ' }, '));


  /* Get JSON text indexes stats */
  begin
  execute immediate 'select idx_name from  ctxsys.dr$index  where
                     idx_id in (select ixv_idx_id from
                     ctxsys.dr$index_value where IXV_OAT_ID = 50817)'
  into num_json_cidx;
  exception
    when OTHERS then
       num_json_cidx := 0;
  end;

  begin
  execute immediate 'select idx_name from  ctxsys.dr$index  where
                     idx_id in (select ixv_idx_id from
                     ctxsys.dr$index_value where IXV_OAT_ID = 50819)'
  into num_bson_cidx;
  exception
    when OTHERS then
       num_bson_cidx := 0;
  end;

  /* Write JSON CTX index stats into clob */
  dbms_lob.append(feature_info, to_clob ('"ctxIdx": {' ||
                  '"jsonCtxIdx":' || to_char(num_json_cidx) || ' , ' ||
                  '"bsonCtxIdx":' || to_char(num_bson_cidx)  || ' } } '));

  /* set feature_boolean if reqd */
  IF num_json_cols > 0 THEN
    feature_boolean := 1;
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_LABEL_SECURITY"
     ( feature_boolean  OUT NUMBER,
       aux_count        OUT NUMBER,
       feature_info     OUT CLOB)
AS
begin
  -- execute immediate as lbacsys is not installed yet
  execute immediate 'begin lbacsys.feature_usage(:1,:2,:3); end;'
                     USING OUT feature_boolean,
                           OUT aux_count,
                           OUT feature_info;

  EXCEPTION WHEN OTHERS THEN
    null;

end dbms_feature_label_security;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_LMT"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  loc_managed boolean;
  ts_info     varchar2(1000);
BEGIN

  /* initialize everything */
  loc_managed := FALSE;
  ts_info     := '';
  aux_count   := 0;

  for ts_type in
     (select extent_management, count(*) tcount, sum(size_mb) size_mb
       from
        (select ts.tablespace_name, extent_management,
                sum(bytes)/1048576 size_mb
           from dba_data_files df, dba_tablespaces ts
          where df.tablespace_name = ts.tablespace_name
          group by ts.tablespace_name, extent_management)
       group by extent_management)
  loop

    /* check for auto segment space management */
    if ((ts_type.extent_management = 'LOCAL') and
         (ts_type.tcount > 0)) then
      loc_managed  := TRUE;
      aux_count       := ts_type.tcount;
    end if;

    ts_info := ts_info ||
        '(Extent Management: ' || ts_type.extent_management ||
       ', TS Count: ' || ts_type.tcount ||
       ', Size MB: '  || ts_type.size_mb || ') ';

  end loop;

  /* set the boolean and feature info.  the aux count is already set above */
  if (loc_managed) then
    feature_boolean := 1;
    feature_info    := to_clob(ts_info);
  else
    feature_boolean := 0;
    feature_info    := null;
  end if;

END dbms_feature_lmt;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_MOVE_DATAFILE"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage      varchar2(1000);
    use_omd_primary    varchar2(5);
    use_pri            number;

begin
    -- initialize
    feature_boolean := 0;
    aux_count := 0;
    use_omd_primary := 'FALSE';

    execute immediate 'select DI2MVUSE_PRI from X$KCCDI2'
      into use_pri;
    if (use_pri > 0) then
      use_omd_primary := 'TRUE';
      feature_boolean := 1;
    end if;

    if (feature_boolean = 1) then
        feature_usage :=
                'Online Move Datafile on primary used: '
             || upper(use_omd_primary)
        ;
        feature_info := to_clob(feature_usage);
    else
        feature_info := to_clob('Online Move Datafile usage not detected');
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_OBJECT"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_obj_types         number;
  num_obj_tables        number;
  num_obj_columns       number;
  num_obj_views         number;
  num_anydata_cols      number;
  num_nt_cols           number;
  num_varray_cols       number;
  num_octs              number;
  feature_usage         varchar2(1000);
  TYPE cursor_t         IS REF CURSOR;
  cursor_coltype        cursor_t;
  total_count           number;
  flag                  number;

BEGIN
  --initialize
  num_obj_types         :=0;
  num_obj_tables        :=0;
  num_obj_columns       :=0;
  num_obj_views         :=0;
  num_anydata_cols      :=0;
  num_nt_cols           :=0;
  num_varray_cols       :=0;
  num_octs              :=0;
  total_count           :=0;
  flag                  :=0;

  feature_boolean := 0;
  aux_count := 0;

  /* get number of object types */
  execute immediate 'select count(*) from sys.type$ t, sys.obj$ o, sys.user$ u
          where o.owner# = u.user# and o.oid$ = t.tvoid and
            u.name not in (select schema_name from v$sysaux_occupants) and
            u.name not in (''OE'', ''IX'', ''PM'', ''DVSYS'',
                           ''LBACSYS'', ''GSMADMIN_INTERNAL'') and
            u.name not like ''FLOWS_%'' and
            u.name not like ''APEX_%'''
          into num_obj_types;

  /* get number of object tables */
  execute immediate 'select count(*) from  sys.tab$ t, sys.obj$ o, sys.user$ u
          where o.owner# = u.user# and o.obj# = t.obj# and
                bitand(t.property, 1) = 1 and bitand(o.flags, 128) = 0 and
                u.name not in (select schema_name from v$sysaux_occupants) and
                u.name not in (''OE'', ''PM'', ''GSMADMIN_INTERNAL'') and
                u.name not like ''FLOWS_%'' and
                u.name not like ''APEX_%'''
          into num_obj_tables;


  /* get number of object views */
  execute immediate 'select count(*) from sys.typed_view$ t, sys.obj$ o, sys.user$ u
          where o.owner# = u.user# and o.obj# = t.obj# and
                u.name not in (select schema_name from v$sysaux_occupants) and
                u.name not in (''OE'', ''DVSYS'') and
                u.name not like ''FLOWS_%'' and
                u.name not like ''APEX_%'''
          into num_obj_views;

  /* get number of object columns, nested table columns, varray columns,
   * anydata columns and OCTs
   */
  OPEN cursor_coltype FOR '
    select /*+ index(o i_obj1) */ count(*), bitand(t.flags, 16414)
    from sys.coltype$ t, sys.obj$ o, sys.user$ u
    where o.owner# = u.user# and o.obj# = t.obj# and
          u.name not in (select schema_name from v$sysaux_occupants) and
          u.name not in (''OE'', ''IX'', ''PM'', ''DVSYS'',
                         ''GSMADMIN_INTERNAL'') and
          u.name not like ''FLOWS_%'' and
          u.name not like ''APEX_%'' and
          ((bitand(t.flags, 30) != 0) OR
           (bitand(t.flags, 16384) = 16384 and
            t.toid = ''00000000000000000000000000020011''))
    group by (bitand(t.flags, 16414))';


  LOOP
    BEGIN
      FETCH cursor_coltype INTO total_count, flag;
      EXIT WHEN cursor_coltype%NOTFOUND;

      /* number of nested table columns */
      IF flag = 4 THEN
        num_nt_cols := total_count;
      END IF;

      /* number of varray columns */
      IF flag = 8 THEN
        num_varray_cols := total_count;
      END IF;

      /* number of OCTs */
      IF flag = 12 THEN
        num_octs := total_count;
      END IF;

      /* number of adt and ref columns */
      IF (flag = 2 or flag = 16) THEN
        num_obj_columns  := num_obj_columns + total_count;
      END IF;

      /* number of anydata columns */
      IF (flag = 16384) THEN
        num_anydata_cols := total_count;
      END IF;
    END;
  END LOOP;

  if ((num_obj_types > 0) OR (num_obj_tables > 0) OR (num_obj_columns >0)
      OR (num_obj_views > 0) OR (num_anydata_cols > 0) OR (num_nt_cols > 0)
      OR (num_varray_cols > 0) OR (num_octs > 0)) then

    feature_boolean := 1;
    feature_usage := 'num of object types: ' || to_char(num_obj_types) ||
        ',' || 'num of object tables: ' || to_char(num_obj_tables) ||
        ',' || 'num of adt and ref columns: ' || to_char(num_obj_columns) ||
        ',' || 'num of object views: ' || to_char(num_obj_views) ||
        ',' || 'num of anydata cols: ' || to_char(num_anydata_cols) ||
        ',' || 'num of nested table cols: ' || to_char(num_nt_cols) ||
        ',' || 'num of varray cols: ' || to_char(num_varray_cols) ||
        ',' || 'num of octs: ' || to_char(num_octs);

    feature_info := to_clob(feature_usage);
  else
    feature_info := to_clob('OBJECT usage not detected');
  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ONLINE_REDEF"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
 num_usage         number;
 num_redef         number;                              -- total number of redefinition
 num_finish      number;                       -- total number of finished redefinition
 num_abort      number;                         -- total number of aborted redefinition
 num_pk       number;                          -- total number of PK-based redefinition
 num_rowid        number;                   -- total number of rowid-based redefinition
 num_part      number;                  -- total number of partition-based redefinition
 num_batch      number;                           -- total number of batch redefinition
 num_auto_vpd      number;                -- total number of auto copy VPD redefinition
 num_manual_vpd        number;          -- total number of manual copy VPD redefinition
 last_refresh_date     date;                                  -- last redefinition date
 feature_usage  varchar2(1000);

BEGIN
  -- initialize
  num_usage  := 0;
  num_redef  := 0;
  num_finish := 0;
  num_abort := 0;
  num_pk := 0;
  num_rowid := 0;
  num_part  := 0;
  num_batch := 0;
  num_auto_vpd := 0;
  num_manual_vpd  := 0;
  num_pk := 0;

  feature_boolean := 0;
  aux_count := 0;

  /* get total number of redefinition */
  execute immediate 'select count(*) from sys.redef$'
  into num_usage;

  if (num_usage > 0)
  then
   /* get number of finished redefinition */
    execute immediate 'select redef# from sys.redef_track$'
    into num_redef;

    /* get number of finished redefinition */
    execute immediate 'select finish_redef# from sys.redef_track$'
    into num_finish;

    /* get number of aborted redefinition */
    execute immediate 'select abort_redef# from sys.redef_track$'
    into num_abort;

    /* get number of PK-based redefinition */
    execute immediate 'select pk_redef# from sys.redef_track$'
    into num_pk;

    /* get number of rowid-based redefinition */
    execute immediate 'select rowid_redef#  from sys.redef_track$'
    into num_rowid;

    /* get number of partition redefinition */
    execute immediate 'select part_redef# from sys.redef_track$'
    into num_part;

    /* get number of batch redefinition */
    execute immediate 'select batch_redef# from sys.redef_track$'
    into num_batch;

    /* get number of auto copy VPD  redefinition */
    execute immediate 'select vpd_auto# from sys.redef_track$'
    into num_auto_vpd;

    /* get number of manual copy VPD redefinition */
    execute immediate 'select vpd_manual# from sys.redef_track$'
    into num_manual_vpd;

    /* get last refresh date */
    execute immediate 'select last_redef_time from sys.redef_track$'
    into last_refresh_date;

    feature_boolean := 1;

    feature_usage := 'total number of redefinition:' || to_char(num_redef) ||
          ',' || ' num of finished redefinition:' || to_char(num_finish) ||
          ',' || ' num of abort redefinition:' || to_char(num_abort) ||
          ',' || ' num of PK-based redefinition:' || to_char(num_pk) ||
          ',' || ' num of rowid-based redefinition:' || to_char(num_rowid) ||
          ',' || ' num of partition-based redefinition:' || to_char(num_part) ||
          ',' || ' num of batch redefinition:' || to_char(num_batch) ||
          ',' || ' num of automatic copy VPD redefinition:' || to_char(num_auto_vpd) ||
          ',' || ' num of manual copy VPD redefinition:' || to_char(num_manual_vpd) ||
          ',' || ' last redefiniton date:' ||  to_char(last_refresh_date, 'Month DD, YYYY') ||
          '.';

    feature_info := to_clob(feature_usage);
  else
    feature_info := to_clob('Online Redefinition usage not detected!');
  end if;
  exception
    when others then
      null;
end DBMS_FEATURE_ONLINE_REDEF;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_PARTITION_SYSTEM"
      (is_used OUT number, data_ratio OUT number, clob_rest OUT clob)
AS
BEGIN
  -- initialize
  is_used := 0;
  data_ratio := 0;
  clob_rest := NULL;

  FOR crec IN (select num||':'||idx_or_tab||':'||ptype||':'||subptype||':'||pcnt||':'||subpcnt||':'||
                      pcols||':'||subpcols||':'||idx_flags||':'||
                      idx_type||':'||idx_uk||':'||rpcnt||':'||rsubpcnt||':'|| def_segment_creation||':'||
                      partial_idx||':'||orphaned_entries ||':'||zonemap||':'||attrcluster||':'||
                      subpartemp || '|' my_string
               from (select dense_rank() over (order by  decode(bo#,null,pobj#,bo#)) NUM,
                            idx_or_tab,
                            ptype, pcols, pcnt, rpcnt,
                            subptype, subpcols, subpartemp, subpcnt, rsubpcnt,
                            idx_flags, idx_type, idx_uk, orphaned_entries,
                            def_segment_creation, partial_idx,
                            zonemap, attrcluster
                     from
                     ( select /*+ full(o) */ o.obj#, i.bo#, p.obj# pobj#,
                       decode(o.type#,1,'I',2,'T',null) IDX_OR_TAB,
                       is_xml ||
                       decode(p.parttype, 1, case when bitand(p.flags,64)=64 then
                                                 -- INTERVAL-REF, 12c
                                                 case when bitand(p.flags,32)=32 then 'INT-REF'
                                                      else 'INTERVAL' end
                                                 else 'RANGE' end
                                         ,2, 'HASH', 3, 'SYSTEM', 4, 'LIST', 5, 'REF'
                                         ,p.parttype||'-?') ||
                      decode(bitand(p.flags,32),32,' (PARENT)') PTYPE,
                      decode(mod(p.spare2, 256), 0, null, 1, 'RANGE', 2, 'HASH', 3,'SYSTEM'
                                                    , 4, 'LIST', 5, 'REF'
                                                    , p.spare2||'-?') SUBPTYPE,
                      p.partcnt PCNT,
                      mod(trunc(p.spare2/65536), 65536) SUBPCNT,
                      p.partkeycols PCOLS,
                      case mod(trunc(p.spare2/256), 256)
                           when 0 then null
                           else mod(trunc(p.spare2/256), 256) end SUBPCOLS,
                      case when bitand(p.flags,1) = 1 then
                                case when bitand(p.flags,2) = 2 then 'LP'
                                      else 'L' end
                           when bitand(p.flags,2) = 2 then 'GP'
                      end IDX_FLAGS,
                      decode(i.type#, 1, 'NORMAL'||
                                          decode(bitand(i.property, 4), 0, '', 4, '/REV'),
                                      2, 'BITMAP', 3, 'CLUSTER', 4, 'IOT - TOP',
                                      5, 'IOT - NESTED', 6, 'SECONDARY', 7, 'ANSI', 8, 'LOB',
                                      9, 'DOMAIN')  ||
                                      case when bitand(i.property,16) = 16
                                           then '-FUNC' end IDX_TYPE,
                      decode(i.property, null,null,
                                         decode(bitand(i.property, 1), 0, 'NU',
                                                                       1, 'U', '?')) IDX_UK,
                      -- real partition and subpartition count
                      case when bitand(p.flags,64)=64 then op.xnumpart else p.partcnt end RPCNT,
                      osp.numsubpart RSUBPCNT,
                      -- deferred segments
                      case o.type#
                      when 1 then --index
                        decode(ip_seg_off,null,isp_seg_off,ip_seg_off)
                      when 2 then --table
                        decode(tp_seg_off,null,tsp_seg_off,tp_seg_off)
                      else null end DEF_SEGMENT_CREATION,
                      -- partial indexing
                      case o.type#
                      when 1 then --index
                         decode(bitand(i.flags, 8388608), 8388608, 'PARTIAL', 'FULL')||'-'||
                        -- overload field with count of all [sub]partitions with indexing off
                        decode(ip_idx_off,null,isp_idx_off,ip_idx_off)
                      when 2 then --table
                        decode(bitand(p.flags,8192),8192,'OFF','ON')||'-'||
                        -- overload field with count of all [sub]partitions with indexing off
                        decode(tp_idx_off,null,tsp_idx_off,tp_idx_off)
                      else null end PARTIAL_IDX,
                      null ORPHANED_ENTRIES,
                      decode(zonemap,null,'N',zonemap) ZONEMAP,
                      decode(attrcluster,null,'N',attrcluster) ATTRCLUSTER,
                      st_part SUBPARTEMP
                      from partobj$ p, obj$ o, user$ u, ind$ i,
                           ( select distinct obj#, 'XML-' as is_xml from opqtype$ where type=1) xml,
                           -- real subpartition count for tables and indexes
                           ( select /* NO_MERGE FULL(tsp) FULL(tcp) */ tcp.bo#, count(*) numsubpart
                             from tabsubpart$ tsp, tabcompart$ tcp
                             where tcp.obj# = tsp.pobj#
                             group by tcp.bo#
                             union all
                             select /* NO_MERGE FULL(isp) FULL(icp) */ icp.bo#, count(*) numsubpart
                             from indsubpart$ isp, indcompart$ icp
                             where icp.obj# = isp.pobj#
                             group by icp.bo#) osp,
                           -- real partition count for tables and indexes
                           ( select tp.bo#, count(*) xnumpart
                             from tabpart$ tp
                             group by tp.bo#
                             union all
                             select ip.bo#, count(*) xnumpart
                             from indpart$ ip
                             group by ip.bo#) op,
                           -- details table partitions: partial indexing and deferred segments
                           ( select tp.bo#,
                                    -- number or partitions with indexing off
                                    sum(decode(bitand(tp.flags, 2097152), 2097152, 1, 0))  tp_idx_off,
                                    -- number or partitions with deferred segment creation
                                    sum(decode(bitand(tp.flags, 65536), 65536, 1, 0))  tp_seg_off
                             from tabpart$ tp
                             group by tp.bo#) pxd,
                           -- details table subpartitions: partial indexing and deferred segments
                           ( select tcp.bo#,
                                    -- number or subpartitions with indexing off
                                    sum(decode(bitand(tsp.flags, 2097152), 2097152, 1, 0))  tsp_idx_off,
                                    -- number or subpartitions with deferred segment creation
                                    sum(decode(bitand(tsp.flags, 65536), 65536, 1, 0))  tsp_seg_off
                             from tabsubpart$ tsp, tabcompart$ tcp
                             where tcp.obj# = tsp.pobj#
                             group by tcp.bo#) spxd,
                           -- details index partitions: partial indexing and deferred segments
                           ( select ip.bo#,
                                    -- number or partitions with indexing off
                                    sum(decode(bitand(ip.flags, 1), 1, 1, 0))  ip_idx_off,
                                    -- number or partitions with deferred segment creation
                                    sum(decode(bitand(ip.flags, 65536), 65536, 1, 0))  ip_seg_off
                             from indpart$ ip
                             group by ip.bo#) ipd,
                           -- details index subpartitions: partial indexing and deferred segments
                           ( select icp.bo#,
                                    -- number or subpartitions with indexing off
                                    sum(decode(bitand(isp.flags, 1), 1, 1, 0))  isp_idx_off,
                                    -- number or subpartitions with deferred segment creation
                                    sum(decode(bitand(isp.flags, 65536), 65536, 1, 0))  isp_seg_off
                             from indsubpart$ isp, indcompart$ icp
                             where icp.obj# = isp.pobj#
                             group by icp.bo#) ispd,
                           -- attribute clustering
                           ( select c.clstobj#, 'Y-'||
                                    -- kind of attribute clustering
                                    case when ctable is not null
                                         then 'MT-' else 'ST-' end
                                    ||
                                    case when clstfunc = 1 then 'I-'     -- interleaved
                                         else 'L-' end     -- linear
                                    ||to_char(decode(ctable, null,0,ctable)+1)||'-'||ccol as ATTRCLUSTER
                             from sys.clst$ c,
                                  -- count of tables and columns used for attribute clustering
                                  -- no detailed breakdown of columns per row
                                  -- table count does not include fact table for hierarchical attr. clustering
                                  ( select clstobj#, count(intcol#) ccol
                                    from sys.clstkey$
                                    group by clstobj#) k,
                                  ( select clstobj#, count(*) ctable
                                    from sys.clstjoin$
                                    group by clstobj#) kt
                             where c.clstobj# = k.clstobj#
                             and   c.clstobj# = kt.clstobj#(+)) attrcl,
                            -- zone maps
                            (select detailobj#, zonemap from
                                (select sd.detailobj#, flags, 'Y-'||
                                        -- single table zonemap or hierarchical zonemap
                                        decode(bitand(sn.flag3, 1024),
                                               0, 'ST', 'MT') ||
                                               -- number of tables and columns in zonemap (aggr, no detailed breakdown)
                                               -- table count does not include fact table for hierarch. zonemap
                                               '-'||  count(distinct sd.detailobj#) over (partition by sd.sumobj#) ||
                                               '-'||  sa.zmcol as ZONEMAP
                                 from sys.sumdetail$ sd, sys.sum$ s, sys.snap$ sn,
                                      ( select sumobj#, count(*) zmcol
                                        from sys.sumagg$
                                        where aggfunction = 18
                                        group by sumobj#) sa
                                 where s.obj# = sd.sumobj#
                                 and   s.obj# = sa.sumobj#
                                 and s.containernam(+) = sn.vname) v
                             where bitand(v.flags, 2) = 2      /* zonemap fact table */
                           ) zm,
                           ( select bo#, count(*) st_part
                             from defsubpart$
                             group by bo# ) spt
                      where o.obj# = i.obj#(+)
                      and   o.owner# = u.user#
                      and   p.obj# = o.obj#
                      and   p.obj# = xml.obj#(+)
                      and   p.obj# = osp.bo#(+)
                      and   p.obj# = op.bo#(+)
                      and   p.obj# = pxd.bo#(+)
                      and   p.obj# = spxd.bo#(+)
                      and   p.obj# = ipd.bo#(+)
                      and   p.obj# = ispd.bo#(+)
                      and   p.obj# = spt.bo#(+)
                      and   o.obj# = attrcl.clstobj#(+)
                      and   o.obj# = zm.detailobj#(+)
                      -- fix bug 3074607 - filter on obj$
                      and o.type# in (1,2,19,20,25,34,35)
                union all
                -- global nonpartitioned indexes on partitioned tables
                select o.obj#, i.bo#, p.obj# pobj#,
                       'I' IDX_OR_TAB,
                        null,null,null,null,
                        case cols when 0 then null
                                  else cols end PCOLS,null,
                       'GNP' IDX_FLAGS,
                       decode(i.type#, 1, 'NORMAL'||
                                      decode(bitand(i.property, 4), 0, '', 4, '/REV'),
                                      2, 'BITMAP', 3, 'CLUSTER', 4, 'IOT - TOP',
                                      5, 'IOT - NESTED', 6, 'SECONDARY', 7, 'ANSI', 8, 'LOB',
                                      9, 'DOMAIN') ||
                       case when bitand(i.property,16) = 16 then '-FUNC' end IDX_TYPE,
                       decode(i.property, null,null,
                                          decode(bitand(i.property, 1), 0, 'NU',
                                          1, 'U', '?')) IDX_UK,
                       null, null,
                       null DEF_SEGMENT_CREATION,
--                      decode(bitand(p.flags,6144),4096,'YES',2048,'NO','NONE') DEF_SEGMENT_CREATION,
                       decode(bitand(i.flags, 8388608), 8388608, 'PARTIAL', 'FULL') PARTIAL_IDX,
                       decode(bitand(i.flags, 268435456), 268435456, 'YES', 'NO') ORPHANED_ENTRIES,
                       NULL ZONEMAP, NULL ATTRCLUSTER,
                       NULL SUBPARTEMP
                from partobj$ p, user$ u, obj$ o, ind$ i
                where p.obj# = i.bo#
                and   o.owner# = u.user#
                and   p.obj# = o.obj#
                -- nonpartitioned index
                and   bitand(i.property, 2) <>2 )
                order by num, idx_or_tab desc
             )) LOOP

     if (is_used = 0) then
       is_used:=1;
     end if;

     clob_rest := clob_rest||crec.my_string;
   end loop;

   if (is_used = 1) then
     select pcnt into data_ratio
     from
     (
       SELECT c1, TRUNC((ratio_to_report(sum_blocks) over())*100,2) pcnt
       FROM
       (
        select decode(p.obj#,null,'REST','PARTTAB') c1, sum(s.blocks) sum_blocks
        from tabpart$ p, seg$ s
        where s.file#=p.file#(+)
        and s.block#=p.block#(+)
        and s.type#=5
        group by  decode(p.obj#,null,'REST','PARTTAB')
        )
      )
      where c1 = 'PARTTAB';
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_PARTITION_USER"
      (is_used OUT number, data_ratio OUT number, clob_rest OUT clob)
AS
BEGIN
  -- initialize
  is_used := 0;
  data_ratio := 0;
  clob_rest := NULL;

  FOR crec IN (select num||':'||idx_or_tab||':'||ptype||':'||subptype||':'||pcnt||':'||subpcnt||':'||
                      pcols||':'||subpcols||':'||idx_flags||':'||
                      idx_type||':'||idx_uk||':'||rpcnt||':'||rsubpcnt||':'|| def_segment_creation||':'||
                      partial_idx||':'||orphaned_entries ||':'||zonemap||':'||attrcluster||':'||
                      subpartemp || '|' my_string
               from (select dense_rank() over (order by  decode(bo#,null,pobj#,bo#)) NUM,
                            idx_or_tab,
                            ptype, pcols, pcnt, rpcnt,
                            subptype, subpcols, subpartemp, subpcnt, rsubpcnt,
                            idx_flags, idx_type, idx_uk, orphaned_entries,
                            def_segment_creation, partial_idx,
                            zonemap, attrcluster
                     from
                     ( select /*+ full(o) */ o.obj#, i.bo#, p.obj# pobj#,
                       decode(o.type#,1,'I',2,'T',null) IDX_OR_TAB,
                       is_xml ||
                       decode(p.parttype, 1, case when bitand(p.flags,64)=64 then
                                                 -- INTERVAL-REF, 12c
                                                 case when bitand(p.flags,32)=32 then 'INT-REF'
                                                      else 'INTERVAL' end
                                                 else 'RANGE' end
                                         ,2, 'HASH', 3, 'SYSTEM', 4, 'LIST', 5, 'REF'
                                         ,p.parttype||'-?') ||
                      decode(bitand(p.flags,32),32,' (PARENT)') PTYPE,
                      decode(mod(p.spare2, 256), 0, null, 1, 'RANGE', 2, 'HASH', 3,'SYSTEM'
                                                    , 4, 'LIST', 5, 'REF'
                                                    , p.spare2||'-?') SUBPTYPE,
                      p.partcnt PCNT,
                      mod(trunc(p.spare2/65536), 65536) SUBPCNT,
                      p.partkeycols PCOLS,
                      case mod(trunc(p.spare2/256), 256)
                           when 0 then null
                           else mod(trunc(p.spare2/256), 256) end SUBPCOLS,
                      case when bitand(p.flags,1) = 1 then
                                case when bitand(p.flags,2) = 2 then 'LP'
                                      else 'L' end
                           when bitand(p.flags,2) = 2 then 'GP'
                      end IDX_FLAGS,
                      decode(i.type#, 1, 'NORMAL'||
                                          decode(bitand(i.property, 4), 0, '', 4, '/REV'),
                                      2, 'BITMAP', 3, 'CLUSTER', 4, 'IOT - TOP',
                                      5, 'IOT - NESTED', 6, 'SECONDARY', 7, 'ANSI', 8, 'LOB',
                                      9, 'DOMAIN')  ||
                                      case when bitand(i.property,16) = 16
                                           then '-FUNC' end IDX_TYPE,
                      decode(i.property, null,null,
                                         decode(bitand(i.property, 1), 0, 'NU',
                                                                       1, 'U', '?')) IDX_UK,
                      -- real partition and subpartition count
                      case when bitand(p.flags,64)=64 then op.xnumpart else p.partcnt end RPCNT,
                      osp.numsubpart RSUBPCNT,
                      -- deferred segments
                      case o.type#
                      when 1 then --index
                        decode(ip_seg_off,null,isp_seg_off,ip_seg_off)
                      when 2 then --table
                        decode(tp_seg_off,null,tsp_seg_off,tp_seg_off)
                      else null end DEF_SEGMENT_CREATION,
                      -- partial indexing
                      case o.type#
                      when 1 then --index
                         decode(bitand(i.flags, 8388608), 8388608, 'PARTIAL', 'FULL')||'-'||
                        -- overload field with count of all [sub]partitions with indexing off
                        decode(ip_idx_off,null,isp_idx_off,ip_idx_off)
                      when 2 then --table
                        decode(bitand(p.flags,8192),8192,'OFF','ON')||'-'||
                        -- overload field with count of all [sub]partitions with indexing off
                        decode(tp_idx_off,null,tsp_idx_off,tp_idx_off)
                      else null end PARTIAL_IDX,
                      null ORPHANED_ENTRIES,
                      decode(zonemap,null,'N',zonemap) ZONEMAP,
                      decode(attrcluster,null,'N',attrcluster) ATTRCLUSTER,
                      st_part SUBPARTEMP
                      from partobj$ p, obj$ o, user$ u, ind$ i,
                           ( select distinct obj#, 'XML-' as is_xml from opqtype$ where type=1) xml,
                           -- real subpartition count for tables and indexes
                           ( select /* NO_MERGE FULL(tsp) FULL(tcp) */ tcp.bo#, count(*) numsubpart
                             from tabsubpart$ tsp, tabcompart$ tcp
                             where tcp.obj# = tsp.pobj#
                             group by tcp.bo#
                             union all
                             select /* NO_MERGE FULL(isp) FULL(icp) */ icp.bo#, count(*) numsubpart
                             from indsubpart$ isp, indcompart$ icp
                             where icp.obj# = isp.pobj#
                             group by icp.bo#) osp,
                           -- real partition count for tables and indexes
                           ( select tp.bo#, count(*) xnumpart
                             from tabpart$ tp
                             group by tp.bo#
                             union all
                             select ip.bo#, count(*) xnumpart
                             from indpart$ ip
                             group by ip.bo#) op,
                           -- details table partitions: partial indexing and deferred segments
                           ( select tp.bo#,
                                    -- number or partitions with indexing off
                                    sum(decode(bitand(tp.flags, 2097152), 2097152, 1, 0))  tp_idx_off,
                                    -- number or partitions with deferred segment creation
                                    sum(decode(bitand(tp.flags, 65536), 65536, 1, 0))  tp_seg_off
                             from tabpart$ tp
                             group by tp.bo#) pxd,
                           -- details table subpartitions: partial indexing and deferred segments
                           ( select tcp.bo#,
                                    -- number or subpartitions with indexing off
                                    sum(decode(bitand(tsp.flags, 2097152), 2097152, 1, 0))  tsp_idx_off,
                                    -- number or subpartitions with deferred segment creation
                                    sum(decode(bitand(tsp.flags, 65536), 65536, 1, 0))  tsp_seg_off
                             from tabsubpart$ tsp, tabcompart$ tcp
                             where tcp.obj# = tsp.pobj#
                             group by tcp.bo#) spxd,
                           -- details index partitions: partial indexing and deferred segments
                           ( select ip.bo#,
                                    -- number or partitions with indexing off
                                    sum(decode(bitand(ip.flags, 1), 1, 1, 0))  ip_idx_off,
                                    -- number or partitions with deferred segment creation
                                    sum(decode(bitand(ip.flags, 65536), 65536, 1, 0))  ip_seg_off
                             from indpart$ ip
                             group by ip.bo#) ipd,
                           -- details index subpartitions: partial indexing and deferred segments
                           ( select icp.bo#,
                                    -- number or subpartitions with indexing off
                                    sum(decode(bitand(isp.flags, 1), 1, 1, 0))  isp_idx_off,
                                    -- number or subpartitions with deferred segment creation
                                    sum(decode(bitand(isp.flags, 65536), 65536, 1, 0))  isp_seg_off
                             from indsubpart$ isp, indcompart$ icp
                             where icp.obj# = isp.pobj#
                             group by icp.bo#) ispd,
                           -- attribute clustering
                           ( select c.clstobj#, 'Y-'||
                                    -- kind of attribute clustering
                                    case when ctable is not null
                                         then 'MT-' else 'ST-' end
                                    ||
                                    case when clstfunc = 1 then 'I-'     -- interleaved
                                         else 'L-' end     -- linear
                                    ||to_char(decode(ctable, null,0,ctable)+1)||'-'||ccol as ATTRCLUSTER
                             from sys.clst$ c,
                                  -- count of tables and columns used for attribute clustering
                                  -- no detailed breakdown of columns per row
                                  -- table count does not include fact table for hierarchical attr. clustering
                                  ( select clstobj#, count(intcol#) ccol
                                    from sys.clstkey$
                                    group by clstobj#) k,
                                  ( select clstobj#, count(*) ctable
                                    from sys.clstjoin$
                                    group by clstobj#) kt
                             where c.clstobj# = k.clstobj#
                             and   c.clstobj# = kt.clstobj#(+)) attrcl,
                            -- zone maps
                            (select detailobj#, zonemap from
                                (select sd.detailobj#, flags, 'Y-'||
                                        -- single table zonemap or hierarchical zonemap
                                        decode(bitand(sn.flag3, 1024),
                                               0, 'ST', 'MT') ||
                                               -- number of tables and columns in zonemap (aggr, no detailed breakdown)
                                               -- table count does not include fact table for hierarch. zonemap
                                               '-'||  count(distinct sd.detailobj#) over (partition by sd.sumobj#) ||
                                               '-'||  sa.zmcol as ZONEMAP
                                 from sys.sumdetail$ sd, sys.sum$ s, sys.snap$ sn,
                                      ( select sumobj#, count(*) zmcol
                                        from sys.sumagg$
                                        where aggfunction = 18
                                        group by sumobj#) sa
                                 where s.obj# = sd.sumobj#
                                 and   s.obj# = sa.sumobj#
                                 and s.containernam(+) = sn.vname) v
                             where bitand(v.flags, 2) = 2      /* zonemap fact table */
                           ) zm,
                           ( select bo#, count(*) st_part
                             from defsubpart$
                             group by bo# ) spt
                      where o.obj# = i.obj#(+)
                      and   o.owner# = u.user#
                      and   p.obj# = o.obj#
                      and   p.obj# = xml.obj#(+)
                      and   p.obj# = osp.bo#(+)
                      and   p.obj# = op.bo#(+)
                      and   p.obj# = pxd.bo#(+)
                      and   p.obj# = spxd.bo#(+)
                      and   p.obj# = ipd.bo#(+)
                      and   p.obj# = ispd.bo#(+)
                      and   p.obj# = spt.bo#(+)
                      and   o.obj# = attrcl.clstobj#(+)
                      and   o.obj# = zm.detailobj#(+)
                      -- bug 14369338, exclude AUDSYS
                      and   u.name not in ('SYS','SYSTEM','SH','SYSMAN','AUDSYS')
                      -- fix bug 3074607 - filter on obj$
                      and o.type# in (1,2,19,20,25,34,35)
                      -- exclude flashback data archive tables
                      -- fix bug 14666795
                      and o.name not like 'SYS_FBA%'
                      -- crystal clear identification of FBA tables deemed as too expensive
--                      and o.obj# not in (select obj# from tab$ where bitand(property,8589934592)=8589934592)
                      -- exclude change tables
                      and o.obj# not in ( select obj# from cdc_change_tables$)
                      -- exclude local partitioned indexes on change tables
                      and i.bo# not in  ( select obj# from cdc_change_tables$)
                union all
                -- global nonpartitioned indexes on partitioned tables
                select o.obj#, i.bo#, p.obj# pobj#,
                       'I' IDX_OR_TAB,
                        null,null,null,null,
                        case cols when 0 then null
                                  else cols end PCOLS,null,
                       'GNP' IDX_FLAGS,
                       decode(i.type#, 1, 'NORMAL'||
                                      decode(bitand(i.property, 4), 0, '', 4, '/REV'),
                                      2, 'BITMAP', 3, 'CLUSTER', 4, 'IOT - TOP',
                                      5, 'IOT - NESTED', 6, 'SECONDARY', 7, 'ANSI', 8, 'LOB',
                                      9, 'DOMAIN') ||
                       case when bitand(i.property,16) = 16 then '-FUNC' end IDX_TYPE,
                       decode(i.property, null,null,
                                          decode(bitand(i.property, 1), 0, 'NU',
                                          1, 'U', '?')) IDX_UK,
                       null, null,
                       null DEF_SEGMENT_CREATION,
--                      decode(bitand(p.flags,6144),4096,'YES',2048,'NO','NONE') DEF_SEGMENT_CREATION,
                       decode(bitand(i.flags, 8388608), 8388608, 'PARTIAL', 'FULL') PARTIAL_IDX,
                       decode(bitand(i.flags, 268435456), 268435456, 'YES', 'NO') ORPHANED_ENTRIES,
                       NULL ZONEMAP, NULL ATTRCLUSTER,
                       NULL SUBPARTEMP
                from partobj$ p, user$ u, obj$ o, ind$ i
                where p.obj# = i.bo#
                -- exclude global nonpartitioned indexes on change tables
                and   i.bo# not in  ( select obj# from cdc_change_tables$)
                -- exclude flashback data archive tables
                and   o.name not like 'SYS_FBA%'
                and   o.owner# = u.user#
                and   p.obj# = o.obj#
                -- nonpartitioned index
                and   bitand(i.property, 2) <>2
                -- bug 14369338, exclude AUDSYS
                and   u.name not in ('SYS','SYSTEM','SH','SYSMAN','AUDSYS'))
                order by num, idx_or_tab desc
             )) LOOP

     if (is_used = 0) then
       is_used:=1;
     end if;

     clob_rest := clob_rest||crec.my_string;
   end loop;

   if (is_used = 1) then
     select pcnt into data_ratio
     from
     (
       SELECT c1, TRUNC((ratio_to_report(sum_blocks) over())*100,2) pcnt
       FROM
       (
        select decode(p.obj#,null,'REST','PARTTAB') c1, sum(s.blocks) sum_blocks
        from tabpart$ p, seg$ s
        where s.file#=p.file#(+)
        and s.block#=p.block#(+)
        and s.type#=5
        group by  decode(p.obj#,null,'REST','PARTTAB')
        )
      )
      where c1 = 'PARTTAB';
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_PILLAR_EHCC"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  feature_count NUMBER;
    feature_usage         varchar2(1000);
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  execute immediate 'select value from v$sysstat' ||
    ' where name like ''EHCC Used on Pillar Tablespace'''
    into feature_count;

  feature_usage := 'EHCC on Pillar: ' || to_char(feature_count);
  feature_info := to_clob(feature_usage);

  if (feature_count > 0) then
    feature_boolean := 1;
  else
    feature_boolean := 0;
  end if;
  aux_count       := feature_count;
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_PILLAR_STORAGE"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  feature_count  NUMBER;
  tsn            NUMBER;
  stortype       NUMBER;
  TYPE cursor_t  IS REF CURSOR;
  cursor_objtype cursor_t;
  feature_usage         varchar2(1000);
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  OPEN cursor_objtype FOR q'[select ts# from sys.ts$]';

  LOOP
    BEGIN
      FETCH cursor_objtype INTO tsn;
      EXIT WHEN cursor_objtype%NOTFOUND;
      kdzstoragetype(tsn, stortype);
      IF (stortype = 2) THEN
        feature_count := feature_count + 1;
      END IF;
    END;
  END LOOP;

  feature_usage := 'TS on Pillar: ' || to_char(feature_count);
  feature_info := to_clob(feature_usage);

  if (feature_count > 0) then
    feature_boolean := 1;
  else
    feature_boolean := 0;
  end if;
  aux_count       := feature_count;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_PLSQL_NATIVE" (
  o_is_used     OUT           number,
  o_aux_count   OUT           number, -- not used, set to zero
  o_report      OUT           clob )

  --
  -- Find ncomp usage from ncomp_dll$
  --
  -- When >0 NATIVE units, sets "o_is_used=1". Always generates XML report,
  -- for example...
  --
  -- <plsqlNativeReport date ="04-feb-2003 14:34">
  -- <owner name="1234" native="2" interpreted="1"/>
  -- <owner name="1235" native="10" interpreted="1"/>
  -- <owner name="CTXSYS" native="118"/>
  -- ...
  -- <owner name="SYS" native="1292" interpreted="6"/>
  -- <owner name="SYSTEM" native="6"/>
  -- ...
  -- <owner name="XDB" native="176"/>
  -- </plsqlNativeReport>
  --

is
  YES      constant number := 1;
  NO       constant number := 0;
  NEWLINE  constant varchar2(2 char) := '
';
  v_date   constant varchar2(30) := to_char(sysdate, 'dd-mon-yyyy hh24:mi');
  v_report          varchar2(400); -- big enough to hold one "<owner .../>"
begin

  o_is_used   := NO;
  o_aux_count := 0;
  o_report    := '<plsqlNativeReport date ="' || v_date || '">' || NEWLINE;

  -- For security and privacy reasons, we do not collect the names of the
  -- non-Oracle schemas. In the case statement below, we filter the schema
  -- names against v$sysaux_occupants, which contains the list of Oracle
  -- schemas.
  for r in (select (case when u.name in
                              (select distinct schema_name
                                 from v$sysaux_occupants)
                         then u.name
                         else to_char(u.user#)
                    end) name,
              count(o.obj#) total, count(d.obj#) native
              from user$ u, ncomp_dll$ d, obj$ o
              where o.obj# = d.obj# (+)
                and o.type# in (7,8,9,11,12,13,14)
                and u.user# = o.owner#
              group by u.name, u.user#
              order by u.name) loop
    if (r.native > 0) then
      o_is_used := YES;
    end if;
    v_report := '<owner name="'|| r.name || '"';
    if (r.native > 0) then
      v_report := v_report || ' native="' || r.native || '"';
    end if;
    if (r.total > r.native) then
      v_report := v_report || ' interpreted="' || (r.total - r.native) || '"';
    end if;
    v_report := v_report || '/>' || NEWLINE;
    o_report := o_report || v_report;
  end loop;
  o_report := o_report || '</plsqlNativeReport>';
end dbms_feature_plsql_native;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_PRIV_CAPTURE"
     ( feature_boolean  OUT NUMBER,
       aux_count        OUT NUMBER,
       feature_info     OUT CLOB)
AS
  cursor priv_capture is select id#, type,
                         CASE type
                           WHEN 1 THEN 'DATABASE'
                           WHEN 2 THEN 'ROLE'
                           WHEN 3 THEN 'CONTEXT'
                           WHEN 4 THEN 'ROLE_AND_CONTEXT'
                         END l_type
                         from sys.priv_capture$ where id# >= 5000;
  l_capture   priv_capture%ROWTYPE;
  feature_usage varchar2(1000) := NULL;
  l_prefix      varchar2(100) := NULL;
  l_count       number := 0;
begin
  -- initialize output parameters
  aux_count := 0;
  feature_boolean := 0;
  feature_info := NULL;

  -- total number of captures
  select count(*) into l_count from sys.priv_capture$ where id# >= 5000;

  if (l_count > 0) then
    -- feature is used if a capture is created
    feature_boolean := 1;
    aux_count := l_count;

    l_prefix := 'Number of privilege captures=' || to_char(l_count)
                || Chr(13) || Chr(10) || '(';

    -- Information for each capture
    for l_capture in priv_capture loop

        feature_usage := feature_usage || 'Type=' || l_capture.l_type;

        select count(*) into l_count from sys.capture_run_log$
        where capture = l_capture.id#;

        feature_usage := feature_usage || ' Number of Runs=' ||
                         to_char(l_count) || Chr(13) || Chr(10);
    end loop;
    feature_info := to_clob(l_prefix || feature_usage || ')');

  end if;
end dbms_feature_priv_capture;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_QOSM"
      (is_used OUT number, aux_count OUT number, feature_info OUT clob)
AS
  measure_only     number;
BEGIN
  -- initialize
  feature_info := NULL;
  aux_count := NULL;

  -- get number of performance classes

  select count(*) into is_used from x$kywmpctab
    where kywmpctabsp not like ':%';

  -- if QOSM is used
  if (is_used >= 1) then

    -- number of Performance Classes
    aux_count := is_used;

    -- check if QoSM is in measure only mode
    select count(kywmpctabmonly) into measure_only from x$kywmpctab
      where kywmpctabsp not like ':%' and kywmpctabmonly = 0;
    if (measure_only = 0) then
      feature_info := to_clob('QoSM is in measure only mode');
    else
      feature_info := to_clob('QoSM is in management mode');
    end if;

  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RAC"
      (is_used OUT number, nodes OUT number, clob_rest OUT clob)
AS
   cpu_count_current number;
   cpu_stddev_current number;
BEGIN
  -- initialize
  clob_rest := NULL;
  nodes := NULL;
  cpu_count_current := NULL;
  cpu_stddev_current := NULL;

  select count(*) into is_used from v$system_parameter where
     name='cluster_database' and value='TRUE';
   -- if RAC is used see if only active/passive or active/active
   if (is_used = 1) then
       select count(*) into nodes from gv$instance;
       select sum(cpu_count_current), round(stddev(cpu_count_current),1)
          into cpu_count_current, cpu_stddev_current from gv$license;
       -- active_instance_count init.ora has been deprecated
       --   so 'usage:Active Passive' will no longer be returned
       clob_rest:='usage:All Active:cpu_count_current:'||cpu_count_current
                ||':cpu_stddev_current:'||cpu_stddev_current;
  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RAS"
     ( feature_boolean  OUT NUMBER,
       aux_count        OUT NUMBER,
       feature_info     OUT CLOB)
AS
  row_count1              PLS_INTEGER;
  row_count2              PLS_INTEGER;
  policy_count            PLS_INTEGER;
  applied_policy_count    PLS_INTEGER;
  acl_count               PLS_INTEGER;
  ace_count               PLS_INTEGER;
  user_count              PLS_INTEGER;
  role_count              PLS_INTEGER;
  sc_count                PLS_INTEGER;
  privilege_count         PLS_INTEGER;
  session_count           PLS_INTEGER;
  external_session_count  PLS_INTEGER;
  regular_session_count   PLS_INTEGER;
  dispatcher_used         VARCHAR2(5);
  midtier_cache_used      VARCHAR2(5);
  max_seeded_id           NUMBER := 2147493647;
begin
 feature_boolean := 0;
 feature_info := to_clob('Real Application Security usage not detected');
 aux_count := 0;

 begin

   /* Check if Real Application Security objects are created. */
   select count(*) into row_count1 from sys.xs$obj where id > max_seeded_id and BITAND(flags,1) = 0;
   if row_count1 > 0 then
     feature_boolean := 1;

     /* Find the number of XDS policies. */
     select count(*) into policy_count from sys.xs$dsec;

     if policy_count > 0 then

       /* Find the number of applied XDS policies. */
       select count(*) into applied_policy_count from sys.DBA_XS_APPLIED_POLICIES p
              where p.status = 'ENABLED';
     end if;

     /* Find the number of ACLs. */
     select count(*) into acl_count from sys.xs$acl where acl# > max_seeded_id;

     /* Find the number of ACEs. */
     select count(*) into ace_count from sys.xs$ace where acl# > max_seeded_id;

     /* Find the number of users. */
     select count(*) into user_count from sys.xs$prin p where p.type = 0 and prin# > max_seeded_id;

     /* Find the number of roles. */
     select count(*) into role_count from sys.xs$prin p where p.type <> 0 and prin# > max_seeded_id;

     /* Find number of security classes. */
     select count(*) into sc_count from sys.xs$seccls where sc# > max_seeded_id;

     /* Find number of privileges. */
     select count(*) into privilege_count from sys.xs$priv where priv# > max_seeded_id;

     /* Find the number of sessions. */
     select count(*) into session_count from sys.rxs$sessions;

     /* Find the number of session created with external user. */
     select count(*) into external_session_count from sys.rxs$sessions r
            where BITAND(r.flag,4) = 4;

     /* Find the number of session created with regular XS user. */
     regular_session_count := session_count - external_session_count;

     /* Find if dispatcher is being used. */
     select count(*) into row_count1 from sys.dba_xs_role_grants where granted_role = 'XSSESSIONADMIN';
     select count(*) into row_count2 from sys.dba_role_privs where granted_role = 'XS_SESSION_ADMIN' and grantee <> 'SYS';
     if ((row_count1 > 0) OR (row_count2 > 0)) then
       dispatcher_used := 'TRUE';
     else
       dispatcher_used := 'FALSE';
     end if;

     /* Find if midtier cache is used. */
     select count(*) into row_count1 from sys.dba_xs_role_grants where granted_role = 'XSCACHEADMIN';
     select count(*) into row_count2 from sys.dba_role_privs where granted_role = 'XS_CACHE_ADMIN' and grantee <> 'SYS';
     if ((row_count2 > 0) OR (row_count2 > 0)) then
       midtier_cache_used := 'TRUE';
     else
       midtier_cache_used := 'FALSE';
     end if;

     feature_info := to_clob('Number of policies: '||policy_count||
                            ' Number of policies applied: '||applied_policy_count||
                ' Number of ACLs created: '||acl_count||
                ' Number of ACEs: '||ace_count||
                ' Number of users created: '||user_count||
                ' Number of roles created: '||role_count||
                ' Number of security classes created: '||sc_count||
                ' Number of privileges created: '||privilege_count||
                ' Number of sessions created: '||session_count||
                ' Number of external sessions created: '||external_session_count||
                ' Number of regular sessions created: '||regular_session_count||
                ' Dispatcher used: '||dispatcher_used||
                ' Mid-tier cache used: '||midtier_cache_used);
   end if;
 exception
   when others then
     null;
 end;
END DBMS_FEATURE_RAS;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_REGISTER_ALLFEAT"
as
  /* string to get the last sample date */
  DBFUS_LAST_SAMPLE_DATE_STR CONSTANT VARCHAR2(100) :=
            ' (select nvl(max(last_sample_date), sysdate-7) ' ||
                'from wri$_dbu_usage_sample) ';

begin

  /**********************
   * Advanced Replication
   **********************/

  declare
    DBFUS_ADV_REPLICATION_STR CONSTANT VARCHAR2(1000) :=
        'select count(*), NULL, NULL from dba_repcat';

  begin
    dbms_feature_usage.register_db_feature
     ('Advanced Replication',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_ADV_REPLICATION_STR,
      'Advanced Replication has been enabled.');
  end;

  /**********************
   * Advanced Security Option Encryption/Checksumming
   **********************/

  declare
    DBFUS_ASO_STR CONSTANT VARCHAR2(1000) :=
     'select count (*), NULL, NULL from v$session_connect_info where ' ||
        'network_service_banner like ''%AES256 encryption%'' or ' ||
        'network_service_banner like ''%AES192 encryption%'' or ' ||
        'network_service_banner like ''%AES128 encryption%'' or ' ||
        'network_service_banner like ''%RC4_256 encryption%'' or ' ||
        'network_service_banner like ''%RC4_128 encryption%'' or ' ||
        'network_service_banner like ''%3DES168 encryption%'' or ' ||
        'network_service_banner like ''%3DES112 encryption%'' or ' ||
        'network_service_banner like ''%RC4_56 encryption%'' or ' ||
        'network_service_banner like ''%RC4_40 encryption%'' or ' ||
        'network_service_banner like ''%DES encryption%'' or ' ||
        'network_service_banner like ''%DES40 encryption%'' or ' ||
        'network_service_banner like ''%SHA1 crypto-checksumming%'' or ' ||
        'network_service_banner like ''%MD5 crypto-checksumming%''';
  begin
    dbms_feature_usage.register_db_feature
     ('ASO native encryption and checksumming',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_ASO_STR,
      'ASO network native encryption and checksumming is being used.');
  end;

  /**********************
   * Advanced Network Compression
   **********************/
  declare
   DBFUS_NETWORK_COMPRESSION_STR CONSTANT VARCHAR2(1000) :=
    'select count (*), 0, null' ||
      ' from  v$session_connect_info' ||
      ' where network_service_banner like ''%Compression%''';
  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Advanced Network Compression Service',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_NETWORK_COMPRESSION_STR,
      'Oracle Advanced Network Compression Service Used');
  end;

  /**********************
   * Traditional Audit
   **********************/
  declare
    DBFUS_AUDIT_PROC CONSTANT VARCHAR2(1000) :=
      'dbms_feature_audit_options';

  begin
    dbms_feature_usage.register_db_feature
     ('Traditional Audit',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_AUDIT_PROC,
      'Traditional Audit in use.');
  end;

  /**************************
   * Fine Grained Audit (FGA)
   **************************/
  declare
    DBFUS_FGA_PROC CONSTANT VARCHAR2(1000) :=
      'dbms_feature_fga_audit';

  begin
    dbms_feature_usage.register_db_feature
     ('Fine Grained Audit',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_FGA_PROC,
      'Fine Grained Audit in use.');
  end;

  /**********************
   * Unified Audit
   **********************/
  declare
    DBFUS_UNIFIED_PROC CONSTANT VARCHAR2(1000) :=
      'dbms_feature_unified_audit';

  begin
    dbms_feature_usage.register_db_feature
     ('Unified Audit',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_UNIFIED_PROC,
      'Unified Audit in use.');
  end;

  /**********************************************
   * Auto-Maintenance Tasks
   *********************************************/

  declare
    DBFUS_KET_OPT_STATS_STR CONSTANT VARCHAR(1000) :=
     'select nvl(ats, 0) * nvl(cls, 0) enabled, ' ||
      'NVL((select SUM(jobs_created) ' ||
             'from dba_autotask_client_history ' ||
            'where client_name = ''auto optimizer stats collection'' ' ||
              'and window_start_time >  ' ||
                  '(SYSDATE - INTERVAL ''168'' HOUR) ), 0) jobs, NULL ' ||
     'from (select DECODE(MAX(autotask_status),''ENABLED'',1,0) ats, ' ||
            'DECODE(MAX(OPTIMIZER_STATS),''ENABLED'',1,0) cls ' ||
            'from dba_autotask_window_clients)';

    DBFUS_KET_SEG_STATS_STR CONSTANT VARCHAR(1000) :=
     'select nvl(ats, 0) * nvl(cls, 0) enabled, ' ||
      'NVL((select SUM(jobs_created) ' ||
             'from dba_autotask_client_history ' ||
            'where client_name = ''auto space advisor'' ' ||
              'and window_start_time >  ' ||
                  '(SYSDATE - INTERVAL ''168'' HOUR) ), 0) jobs, NULL ' ||
     'from (select DECODE(MAX(autotask_status),''ENABLED'',1,0) ats, ' ||
            'DECODE(MAX(SEGMENT_ADVISOR),''ENABLED'',1,0) cls ' ||
            'from dba_autotask_window_clients)';

    DBFUS_KET_SQL_STATS_STR CONSTANT VARCHAR(1000) :=
     'select nvl(ats, 0) * nvl(cls, 0) enabled, ' ||
      'NVL((select SUM(jobs_created) ' ||
             'from dba_autotask_client_history ' ||
            'where client_name = ''sql tuning advisor'' ' ||
              'and window_start_time >  ' ||
                  '(SYSDATE - INTERVAL ''168'' HOUR) ), 0) jobs, NULL ' ||
     'from (select DECODE(MAX(autotask_status),''ENABLED'',1,0) ats, ' ||
            'DECODE(MAX(SQL_TUNE_ADVISOR),''ENABLED'',1,0) cls ' ||
            'from dba_autotask_window_clients)';


  begin
    dbms_feature_usage.register_db_feature
     ('Automatic Maintenance - Optimizer Statistics Gathering',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_KET_OPT_STATS_STR,
      'Automatic initiation of Optimizer Statistics Collection');

    dbms_feature_usage.register_db_feature
     ('Automatic Maintenance - Space Advisor',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_KET_SEG_STATS_STR,
      'Automatic initiation of Space Advisor');

    dbms_feature_usage.register_db_feature
     ('Automatic Maintenance - SQL Tuning Advisor',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_KET_SQL_STATS_STR,
      'Automatic initiation of SQL Tuning Advisor');
  end;

  /**********************************************
   * Automatic Segment Space Management (system)
   **********************************************/

  declare
    DBFUS_BITMAP_SEGMENT_SYS_PROC CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_AUTO_SSM';

  begin
    dbms_feature_usage.register_db_feature
     ('Automatic Segment Space Management (system)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_BITMAP_SEGMENT_SYS_PROC,
      'Extents of locally managed tablespaces are managed ' ||
      'automatically by Oracle.');
  end;

  /********************************************
   * Automatic Segment Space Management (user)
   ********************************************/

  declare
    DBFUS_BITMAP_SEGMENT_USER_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from dba_tablespaces where ' ||
        'segment_space_management = ''AUTO'' and ' ||
        'tablespace_name not in ' ||
          '(''SYSTEM'', ''SYSAUX'', ''TEMP'', ''USERS'', ''EXAMPLE'')';

  begin
    dbms_feature_usage.register_db_feature
     ('Automatic Segment Space Management (user)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BITMAP_SEGMENT_USER_STR,
      'Extents of locally managed user tablespaces are managed ' ||
      'automatically by Oracle.');
  end;

  /*********************************
   * Automatic SQL Execution Memory
   *********************************/

  declare
    DBFUS_AUTO_PGA_STR CONSTANT VARCHAR2(1000) :=
      'select decode(pga + wap, 2, 1, 0), pga_aux + wap_aux, NULL from ' ||
        '(select count(*) pga, 0 pga_aux from v$system_parameter ' ||
          'where name = ''pga_aggregate_target'' and value != ''0''), ' ||
        '(select count(*) wap, 0 wap_aux from v$system_parameter ' ||
          'where name = ''workarea_size_policy'' and upper(value) = ''AUTO'')';

  begin
    dbms_feature_usage.register_db_feature
     ('Automatic SQL Execution Memory',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_AUTO_PGA_STR,
      'Sizing of work areas for all dedicated sessions (PGA) is automatic.');
  end;

  /********************************
   * Automatic Storage Management
   ******************************/

  declare
    DBFUS_ASM_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_ASM';

  begin
    dbms_feature_usage.register_db_feature
     ('Automatic Storage Management',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_ASM_PROC,
      'Automatic Storage Management has been enabled');
  end;

  /***************************
   * Automatic Undo Management
   ***************************/

  declare
    DBFUS_AUM_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_AUM';

  begin
    dbms_feature_usage.register_db_feature
     ('Automatic Undo Management',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_AUM_PROC,
      'Oracle automatically manages undo data using an UNDO tablespace.');
  end;

  /**************************************
   * Automatic Workload Repository (AWR)
   **************************************/
  begin
    dbms_feature_usage.register_db_feature
       ('Automatic Workload Repository'
       ,dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED
       ,NULL
       ,dbms_feature_usage.DBU_DETECT_BY_PROCEDURE
       ,'DBMS_FEATURE_AWR'
       ,'A manual Automatic Workload Repository (AWR) snapshot was taken ' ||
        'in the last sample period.');
  end;


  /***************
   * AWR Baseline
   ***************/

  declare
    DBFUS_AWR_BASELINE_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), count(*), NULL from dba_hist_baseline ' ||
        'where baseline_name != ''SYSTEM_MOVING_WINDOW''';

  begin
    dbms_feature_usage.register_db_feature
     ('AWR Baseline',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_AWR_BASELINE_STR,
      'At least one AWR Baseline has been created by the user');
  end;

  /************************
   * AWR Baseline Template
   ************************/

  declare
    DBFUS_AWR_BL_TEMPLATE_STR VARCHAR2(1000) :=
      'select count(*), count(*), NULL ' ||
        'from dba_hist_baseline_template';

  begin
    dbms_feature_usage.register_db_feature
     ('AWR Baseline Template',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_AWR_BL_TEMPLATE_STR,
      'At least one AWR Baseline Template has been created by the user');
  end;

  /***************
   * AWR Reports
   ***************/

  declare
    DBFUS_AWR_REPORT_STR CONSTANT VARCHAR2(1000) :=
    q'[with last_period as
       (select * from wrm$_wr_usage
         where upper(feature_type) like 'REPORT'
           and usage_time >= ]' ||
    DBFUS_LAST_SAMPLE_DATE_STR ||
    q'[)
       select decode (count(*), 0, 0, 1),
              count(*),
              feature_list
         from last_period,
        (select substr(sys_connect_by_path(feature_count, ','),2) feature_list
           from
             (select feature_count,
                     count(*) over () cnt,
                     row_number () over (order by 1) seq
                from
                  (select feature_name || ':' || count(*) feature_count
                     from last_period
                 group by feature_name)
             )
        where seq=cnt
        start with seq=1
   connect by prior seq+1=seq)
     group by feature_list]';

  begin
    dbms_feature_usage.register_db_feature
     ('AWR Report',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_AWR_REPORT_STR,
      'At least one Workload Repository Report has been created by the user');
  end;

  /**************************
   * Backup Encryption
   **************************/

  /* This query returns 1 if there are any encrypted backup pieces,
   * whose status is 'available'.
   * Controlfile autobackups are ignored, because we don't want to
   * consider RMAN in use if they just turned on the controlfile autobackup
   * feature. */

  begin
    dbms_feature_usage.register_db_feature
     ('Backup Encryption',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_BACKUP_ENCRYPTION',
      'Encrypted backups are being used.');
  end;

  /********************************
   * Baseline Adaptive Thresholds
   ********************************/

  declare
    DBFUS_BASELINE_ADAPTIVE_STR CONSTANT VARCHAR2(1000) :=
      'select decode(nvl(sum(moving)+sum(static),0), 0, 0, 1) '||
            ',nvl(sum(moving)+sum(static),0) '||
            ',''Adaptive: ''||nvl(sum(moving),0)||''; Static:''||nvl(sum(static),0) '||
        'from (select decode(AB.baseline_id, 0, 0, 1) static '||
                    ',decode(AB.baseline_id, 0, 1, 0) moving '||
                'from dbsnmp.bsln_threshold_params TP '||
                    ',dbsnmp.bsln_baselines B '||
                    ',dba_hist_baseline AB '||
                    ',v$database D '||
                    ',v$instance I '||
               'where AB.dbid = D.dbid '||
                 'and B.dbid = AB.dbid '||
                 'and B.baseline_id = AB.baseline_id '||
                 'and B.instance_name = I.instance_name '||
                 'and TP.bsln_guid = B.bsln_guid '||
                 'and in_effect = ''Y'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Baseline Adaptive Thresholds',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BASELINE_ADAPTIVE_STR,
      'Adaptive Thresholds have been configured.');
  end;

  /********************************
   * Baseline Static Computations
   ********************************/

  declare
    DBFUS_BASELINE_COMPUTES_STR CONSTANT VARCHAR2(1000) :=
      'select decode(count(*), 0, 0, 1), count(*), NULL '||
        'from dba_hist_baseline_metadata AB '||
            ',dbsnmp.bsln_baselines B '||
            ',v$database D '||
            ',v$instance I '||
       'where AB.dbid = D.dbid '||
         'and AB.baseline_type <> ''MOVING_WINDOW'' '||
         'and B.dbid = AB.dbid '||
         'and B.baseline_id = AB.baseline_id '||
         'and B.instance_name = I.instance_name '||
         'and B.last_compute_date IS NOT NULL';
  begin
    dbms_feature_usage.register_db_feature
     ('Baseline Static Computations',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BASELINE_COMPUTES_STR,
      'Static baseline statistics have been computed.');
  end;

  /************************
   * Block Change Tracking
   ************************/

  declare
    DBFUS_BLOCK_CHANGE_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL ' ||
        'from v$block_change_tracking where status = ''ENABLED''';

  begin
    dbms_feature_usage.register_db_feature
     ('Change-Aware Incremental Backup',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BLOCK_CHANGE_STR,
      'Track blocks that have changed in the database.');
  end;

  /**********************
   * Client Identifier
   **********************/

  declare
    DBFUS_CLIENT_IDN_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$session ' ||
      'where client_identifier is not null';

  begin
    dbms_feature_usage.register_db_feature
     ('Client Identifier',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CLIENT_IDN_STR,
      'Application User Proxy Authentication: Client Identifier is ' ||
      'used at this specific time.');
  end;


  /**********************************
   * Clusterwide Global Transactions
   **********************************/

  declare
    DBFUS_CLUSTER_GTX_STR CONSTANT VARCHAR2(1000) :=
      'select value, NULL, NULL from v$sysstat ' ||
        'where name = ''Clusterwide global transactions''';

  begin
    dbms_feature_usage.register_db_feature
     ('Clusterwide Global Transactions',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CLUSTER_GTX_STR,
      'Clusterwide Global Transactions is being used.');
  end;

  /**********************************
   * Crossedition Triggers
   **********************************/

  declare
    DBFUS_XEDTRG_STR CONSTANT VARCHAR2(1000) :=
      'select count(1), count(1), NULL from trigger$ t ' ||
        'where bitand(t.property, 8192) = 8192';

  begin
    dbms_feature_usage.register_db_feature
     ('Crossedition Triggers',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_XEDTRG_STR,
      'Crossedition triggers is being used.');
  end;

  /******************************
   * CSSCAN - character set scan
   *******************************/

  declare
    DBFUS_CSSCAN_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), null, null  from ' ||
      'csmig.csm$parameters c ' ||
      'where c.name=''TIME_START'' and ' ||
      'to_date(c.value, ''YYYY-MM-DD HH24:MI:SS'') ' ||
      '>= ' || DBFUS_LAST_SAMPLE_DATE_STR;

  begin
    dbms_feature_usage.register_db_feature
     ('CSSCAN',
      dbms_feature_usage.DBU_INST_OBJECT,
      'CSMIG.csm$parameters',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CSSCAN_STR,
      'Oracle Database has been scanned at least once for character set:' ||
      'CSSCAN has been run at least once.');
  end;


  /******************************
   * Character semantics turned on
   *******************************/

  declare
    DBFUS_CHAR_SEMANTICS_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), null, null  from ' ||
      'sys.v$nls_parameters where ' ||
      'parameter=''NLS_LENGTH_SEMANTICS'' and upper(value)=''CHAR'' ';

  begin
    dbms_feature_usage.register_db_feature
     ('Character Semantics',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CHAR_SEMANTICS_STR,
      'Character length semantics is used in Oracle Database');
  end;

  /****************************
   * Character Set of Database
   ****************************/

  declare
    DBFUS_CHAR_SET_STR CONSTANT VARCHAR2(1000) :=
      'select 1, null, value  from ' ||
      'sys.v$nls_parameters where ' ||
      'parameter=''NLS_CHARACTERSET'' ';

  begin
    dbms_feature_usage.register_db_feature
     ('Character Set',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CHAR_SET_STR,
      'Character set is used in Oracle Database');
  end;


  /**********************
   * Data Guard
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('Data Guard',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_DATA_GUARD',
      'Data Guard, a set of services, is being used to create, ' ||
      'maintain, manage, and monitor one or more standby databases.');
  end;

  /**********************
   * Data Mining
   **********************/

 declare
    DBFUS_ODM_PROC VARCHAR2(100) := 'DBMS_FEATURE_DATABASE_ODM';
  begin
    dbms_feature_usage.register_db_feature
     ('Data Mining',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_ODM_PROC,
      'There exist Oracle Data Mining models in the database.');
  end;


  /**********************
   * Dynamic SGA
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('Dynamic SGA',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_DYN_SGA',
      'The Oracle SGA has been dynamically resized through an ' ||
      'ALTER SYSTEM SET statement.');
  end;

  /*************************************************
   * DMU - Database Migration Assistant for Unicode
   *************************************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Database Migration Assistant for Unicode',
      dbms_feature_usage.DBU_INST_OBJECT,
      'SYS.PROPS$',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_DMU',
      'Database Migration Assistant for Unicode has been used.');
  end;

  /******************************
   * Editions
   *******************************/

  declare
    DBFUS_EDITION_STR CONSTANT VARCHAR2(1000) :=
      'select count(1), count(1), null from sys.edition$ e, sys.obj$ o ' ||
      'where e.obj# = o.obj# and o.name != ''ORA$BASE''';

  begin
    dbms_feature_usage.register_db_feature
     ('Editions',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_EDITION_STR,
      'Editions is being used.');
  end;

  /******************************
   * Editioning Views
   *******************************/

  declare
    DBFUS_EDITION_STR CONSTANT VARCHAR2(1000) :=
      'select count(1), count(1), null from sys.view$ v ' ||
      'where bitand(v.property, 32) = 32';

  begin
    dbms_feature_usage.register_db_feature
     ('Editioning Views',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_EDITION_STR,
      'Editioning views is being used.');
  end;

  /******************************
   * EM - Cloud Control tracking
   *******************************/

  declare
    DBFUS_EM_GC_STR CONSTANT VARCHAR2(1000) :=
      'select count(1), null, null from ' ||
      'dbsnmp.mgmt_db_feature_log a ' ||
      'where a.source=''GC'' and ' ||
      'CAST(a.last_update_date AS DATE) ' ||
      '>= ' || DBFUS_LAST_SAMPLE_DATE_STR;
  begin
    dbms_feature_usage.register_db_feature
     ('EM Cloud Control',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_EM_GC_STR,
      'EM Cloud Control Database Home Page has been visited at least once.');
  end;

  /******************************
   * EM Performance Page  tracking
   *******************************/

  declare
    DBFUS_EM_DIAG_STR CONSTANT VARCHAR2(1000) :=
      'select count(1), null, null from ' ||
      'dbsnmp.mgmt_db_feature_log a ' ||
      'where a.source=''Diagnostic'' and ' ||
      'CAST(a.last_update_date AS DATE) ' ||
      '>= ' || DBFUS_LAST_SAMPLE_DATE_STR;
  begin
    dbms_feature_usage.register_db_feature
     ('EM Performance Page',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_EM_DIAG_STR,
      'EM Performance Page has been visited at least once.');
  end;

  /******************************
   * EM - SQL Monitoring and Tuning pages tracking
   *******************************/

  declare
    DBFUS_EM_TUNING_STR CONSTANT VARCHAR2(1000) :=
      'select count(1), null, null from ' ||
      'dbsnmp.mgmt_db_feature_log a ' ||
      'where a.source=''Tuning'' and ' ||
      'CAST(a.last_update_date AS DATE) ' ||
      '>= ' || DBFUS_LAST_SAMPLE_DATE_STR;
  begin
    dbms_feature_usage.register_db_feature
     ('SQL Monitoring and Tuning pages',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_EM_TUNING_STR,
      'EM SQL Monitoring and Tuning pages has been visited at least once.');
  end;

  /**********************
   * File Mapping
   **********************/

  declare
    DBFUS_FILE_MAPPING_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$system_parameter where ' ||
        'name = ''file_mapping'' and upper(value) = ''TRUE'' and ' ||
        'exists (select 1 from v$map_file)';

  begin
    dbms_feature_usage.register_db_feature
     ('File Mapping',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_FILE_MAPPING_STR,
      'File Mapping, the mechanism that shows a complete mapping ' ||
      'of a file to logical volumes and physical devices, is ' ||
      'being used.');
  end;


  /***************************
   * Flashback Database
   ***************************/

  declare
    DBFUS_FB_DB_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$database where ' ||
        'flashback_on = ''YES''';

  begin
    dbms_feature_usage.register_db_feature
     ('Flashback Database',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_FB_DB_STR,
      'Flashback Database, a rewind button for the database, is enabled');
  end;


  /***************************
   * Flashback Data Archive
   ***************************/

  declare
    DBFUS_FDA_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from DBA_FLASHBACK_ARCHIVE_TABLES';

  begin
    dbms_feature_usage.register_db_feature
     ('Flashback Data Archive',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_FDA_STR,
      'Flashback Data Archive, a historical repository of changes to data ' ||
      'contained in a table, is used ');
  end;


  /******************************
   * Internode Parallel Execution
   ******************************/

  declare
    DBFUS_INODE_PRL_EXEC_STR CONSTANT VARCHAR2(1000) :=
      'select sum(value), NULL, NULL from gv$pq_sysstat ' ||
        'where statistic like ''%Initiated (IPQ)%''';


  begin
    dbms_feature_usage.register_db_feature
     ('Internode Parallel Execution',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_INODE_PRL_EXEC_STR,
      'Internode Parallel Execution is being used.');
  end;

  /**********************
   * Label Security
   **********************/

  declare
    DBFUS_LABEL_SECURITY_PROC CONSTANT VARCHAR2(1000) :=
      'dbms_feature_label_security';
  begin
    dbms_feature_usage.register_db_feature
     ('Label Security',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_LABEL_SECURITY_PROC,
      'Oracle Label Security is being used');
  end;

  /**********************
   * Oracle Database Vault
   **********************/
  declare
     DBFUS_DATABASE_VAULT_PROC CONSTANT VARCHAR2(1000) :=
       'DBMS_FEATURE_DATABASE_VAULT';
  begin
     dbms_feature_usage.register_db_feature
     ('Oracle Database Vault',
      dbms_feature_usage.DBU_INST_OBJECT,
      'dvsys.realm$',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_DATABASE_VAULT_PROC,
      'Oracle Database Vault is being used');
  end;

  /***************************************
   * Deferred Segment Creation
   ***************************************/

  declare
    DBFUS_DEFERRED_SEG_CRT_PROC CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_DEFERRED_SEG_CRT';
  begin
    dbms_feature_usage.register_db_feature
     ('Deferred Segment Creation',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_DEFERRED_SEG_CRT_PROC,
      'Deferred Segment Creation is being used');
  end;

  /***************************************
   * Locally Managed Tablespaces (system)
   ***************************************/

  declare
    DBFUS_LOCALLY_MANAGED_SYS_PROC CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_LMT';

  begin
    dbms_feature_usage.register_db_feature
     ('Locally Managed Tablespaces (system)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_LOCALLY_MANAGED_SYS_PROC,
      'There exists tablespaces that are locally managed in ' ||
      'the database.');
  end;

  /*************************************
   * Locally Managed Tablespaces (user)
   *************************************/

  declare
    DBFUS_LOCALLY_MANAGED_USER_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from dba_tablespaces where ' ||
        'extent_management = ''LOCAL'' and ' ||
        'tablespace_name not in ' ||
          '(''SYSTEM'', ''SYSAUX'', ''TEMP'', ''USERS'', ''EXAMPLE'')';

  begin
    dbms_feature_usage.register_db_feature
     ('Locally Managed Tablespaces (user)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_LOCALLY_MANAGED_USER_STR,
      'There exists user tablespaces that are locally managed in ' ||
      'the database.');
  end;

  /******************************
   * Messaging Gateway
   ******************************/

  declare
    DBFUS_MSG_GATEWAY_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from dba_registry ' ||
        'where comp_id = ''MGW'' and status != ''REMOVED'' and ' ||
        'exists (select 1 from mgw$_links)';

  begin
    dbms_feature_usage.register_db_feature
     ('Messaging Gateway',
      dbms_feature_usage.DBU_INST_OBJECT,
      'SYS.MGW$_GATEWAY',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_MSG_GATEWAY_STR,
      'Messaging Gateway, that enables communication between non-Oracle ' ||
      'messaging systems and Advanced Queuing (AQ), link configured.');
  end;

  /**********************
   * VLM
   **********************/

  declare
    DBFUS_VLM_ADV_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$system_parameter where ' ||
        'name like ''use_indirect_data_buffers'' and upper(value) != ''FALSE''';
  begin
    dbms_feature_usage.register_db_feature
     ('Very Large Memory',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_VLM_ADV_STR,
      'Very Large Memory is enabled.');
  end;


  /**********************
   * Automatic Memory Tuning
   **********************/
  begin
    dbms_feature_usage.register_db_feature
     ('Automatic Memory Tuning',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_AUTO_MEM',
      'Automatic Memory Tuning is enabled.');
  end;

  /**********************
   * Automatic SGA Tuning
   **********************/
  begin
    dbms_feature_usage.register_db_feature
     ('Automatic SGA Tuning',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_AUTO_SGA',
      'Automatic SGA Tuning is enabled.');
  end;


  /**********************
   * ENCRYPTED Tablespace
   **********************/
  declare
    DBFUS_ENT_ADV_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$encrypted_tablespaces';
  begin
    dbms_feature_usage.register_db_feature
     ('Encrypted Tablespaces',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_ENT_ADV_STR,
      'Encrypted Tablespaces is enabled.');
  end;


  /**********************
   * MTTR Advisor
   **********************/

  declare
    DBFUS_MTTR_ADV_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$statistics_level where ' ||
        'statistics_name = ''MTTR Advice'' and ' ||
        'system_status = ''ENABLED'' and ' ||
        'exists (select 1 from v$instance_recovery ' ||
                  'where target_mttr != 0) and ' ||
        'exists (select 1 from v$mttr_target_advice ' ||
                  'where advice_status = ''ON'')';

  begin
    dbms_feature_usage.register_db_feature
     ('MTTR Advisor',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_MTTR_ADV_STR,
      'Mean Time to Recover Advisor is enabled.');
  end;

  /***********************
   * Multiple Block Sizes
   ***********************/

  declare
    DBFUS_MULT_BLOCK_SIZE_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$system_parameter where ' ||
        'name like ''db_%_cache_size'' and value != ''0''';

  begin
    dbms_feature_usage.register_db_feature
     ('Multiple Block Sizes',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_MULT_BLOCK_SIZE_STR,
      'Multiple Block Sizes are being used with this database.');
  end;

  /*****************************
   * OLAP - Analytic Workspaces
   *****************************/

  declare
    DBFUS_OLAP_AW_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), count(*), NULL from dba_aws where AW_NUMBER >= 1000' ||
        'and owner not in (''DM'',''OLAPTRAIN'',''GLOBAL'',''HR'',''OE'','||
        '''PM'',''SH'',''IX'',''BI'',''SCOTT'')';

  begin
    dbms_feature_usage.register_db_feature
     ('OLAP - Analytic Workspaces',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_OLAP_AW_STR,
      'OLAP - the analytic workspaces stored in the database.');
  end;

  /*****************************
   * OLAP - Cubes
   *****************************/

  declare
    DBFUS_OLAP_CUBE_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), count(*), NULL from DBA_OLAP2_CUBES ' ||
        'where invalid != ''Y'' and OWNER = ''SYS'' ' ||
        'and CUBE_NAME = ''STKPRICE_TBL''';

  begin
    dbms_feature_usage.register_db_feature
     ('OLAP - Cubes',
      dbms_feature_usage.DBU_INST_OBJECT,
      'PUBLIC.DBA_OLAP2_CUBES',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_OLAP_CUBE_STR,
      'OLAP - number of cubes in the OLAP catalog that are fully ' ||
      'mapped and accessible by the OLAP API.');
  end;

  /***********************
   * Oracle Managed Files
   ***********************/

  declare
    DBFUS_OMF_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from dba_data_files where ' ||
        'upper(file_name) like ''%O1_MF%''';

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Managed Files',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_OMF_STR,
      'Database files are being managed by Oracle.');
  end;

  /***********************
   * Oracle Secure Backup
   ***********************/

  /* This query returns the number of backup pieces created with
   * Oracle Secure Backup whose status is 'available'. */

  declare
    DBFUS_OSB_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from x$kccbp where ' ||
      'bitand(bpext, 256) = 256 and '                   ||
      'bitand(bpflg,1+4096+8192) = 0';

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Secure Backup',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_OSB_STR,
      'Oracle Secure Backup is used for backups to tertiary storage.');
  end;

  /*******************************
   * Parallel SQL DDL Execution
   *******************************/

  declare
    DBFUS_PSQL_DDL_STR CONSTANT VARCHAR2(1000) :=
      'select value, NULL, NULL from v$pq_sysstat ' ||
        'where rtrim(statistic,'' '') = ''DDL Initiated''';

  begin
    dbms_feature_usage.register_db_feature
     ('Parallel SQL DDL Execution',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_PSQL_DDL_STR,
      'Parallel SQL DDL Execution is being used.');
  end;

  /*******************************
   * Parallel SQL DML Execution
   *******************************/

  declare
    DBFUS_PSQL_DML_STR CONSTANT VARCHAR2(1000) :=
      'select value, NULL, NULL from v$pq_sysstat ' ||
        'where rtrim(statistic,'' '') = ''DML Initiated''';

  begin
    dbms_feature_usage.register_db_feature
     ('Parallel SQL DML Execution',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_PSQL_DML_STR,
      'Parallel SQL DML Execution is being used.');
  end;

  /****************************
   * Oracle Pluggable Database
   ****************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Pluggable Databases',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_PDB_NUM',
      'Oracle Pluggable Databases is being used.');
  end;

  /*******************************
   * Parallel SQL Query Execution
   *******************************/

  declare
    DBFUS_PSQL_QUERY_STR CONSTANT VARCHAR2(1000) :=
      'select value, NULL, NULL from v$pq_sysstat ' ||
        'where rtrim(statistic,'' '') = ''Queries Initiated''';

  begin
    dbms_feature_usage.register_db_feature
     ('Parallel SQL Query Execution',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_PSQL_QUERY_STR,
      'Parallel SQL Query Execution is being used.');
  end;

  /************************
   * Partitioning (system)
   ************************/

  declare
    DBFUS_PARTN_SYS_PROC CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_PARTITION_SYSTEM';

  begin
    dbms_feature_usage.register_db_feature
     ('Partitioning (system)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_PARTN_SYS_PROC,
      'Oracle Partitioning option is being used - there is at ' ||
      'least one partitioned object created.');
  end;

  /**********************
   * Partitioning (user)
   **********************/

  declare
    DBFUS_PARTN_USER_PROC CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_PARTITION_USER';

  begin
    dbms_feature_usage.register_db_feature
     ('Partitioning (user)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_PARTN_USER_PROC,
      'Oracle Partitioning option is being used - there is at ' ||
      'least one user partitioned object created.');
  end;

  /**********************
   * Zone Maps
   **********************/

  declare
    DBFUS_ZMAP_USER_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_ZMAP';
  begin
    dbms_feature_usage.register_db_feature
      ('Zone maps',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       DBFUS_ZMAP_USER_PROC,
       'Zone maps');
  end;


  /****************************
   * Oracle Text
   ****************************/

  declare
    DBFUS_TEXT_PROC CONSTANT VARCHAR2(1000) := 'ctxsys.drifeat.dr$feature_track';

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Text',
      dbms_feature_usage.DBU_INST_OBJECT,
      'ctxsys.drifeat',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_TEXT_PROC,
      'Oracle Text is being used - there is at least one oracle '||
      'text index');
  end;

  /****************************
   * PL/SQL Native Compilation
   ****************************/

  declare
    DBFUS_PLSQL_NATIVE_PROC CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_PLSQL_NATIVE';

  begin
    dbms_feature_usage.register_db_feature
     ('PL/SQL Native Compilation',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_PLSQL_NATIVE_PROC,
      'PL/SQL Native Compilation is being used - there is at least one ' ||
      'natively compiled PL/SQL library unit in the database.');
  end;

  /********************************
   * Quality of Service Management
   ********************************/

  declare
    DBFUS_QOSM_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_QOSM';

  begin
    dbms_feature_usage.register_db_feature
     ('Quality of Service Management',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_QOSM_PROC,
      'Quality of Service Management has been used.');
  end;

  /********************************
   * RAC One Node
   ********************************/

  declare
    DBFUS_ROND_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_ROND';

  begin
    dbms_feature_usage.register_db_feature
     ('Real Application Cluster One Node',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_ROND_PROC,
      'Real Application Cluster One Node is being used.');
  end;

  /****************************
   * Real Application Clusters
   ****************************/

  declare
    DBFUS_RAC_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_RAC';

  begin
    dbms_feature_usage.register_db_feature
     ('Real Application Clusters (RAC)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_RAC_PROC,
      'Real Application Clusters (RAC) is configured.');
  end;

  /**********************
   * Recovery Area
   **********************/

  declare
    DBFUS_RECOVERY_AREA_STR CONSTANT VARCHAR2(1000) :=
      'select p, s, NULL from ' ||
        '(select count(*) p from v$parameter ' ||
         'where name = ''db_recovery_file_dest'' and value is not null), ' ||
        '(select to_number(value) s from v$parameter ' ||
         'where name = ''db_recovery_file_dest_size'')';

  begin
    dbms_feature_usage.register_db_feature
     ('Recovery Area',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_RECOVERY_AREA_STR,
      'The recovery area is configured.');
  end;

  /**************************
   * Recovery Manager (RMAN)
   **************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Recovery Manager (RMAN)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_BACKUP',
      'Recovery Manager (RMAN) is being used to backup the database.');
  end;

  /**********************
   * RMAN - Disk Backup
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('RMAN - Disk Backup',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_DISK_BACKUP',
      'Recovery Manager (RMAN) is being used to backup the database to disk.');
  end;

  /**********************
   * RMAN - Tape Backup
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('RMAN - Tape Backup',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_TAPE_BACKUP',
      'Recovery Manager (RMAN) is being used to backup the database to tape.');
  end;

  /**********************************
   * RMAN - ZLIB compressed backups
   **********************************/
  begin

    dbms_feature_usage.register_db_feature
     ('Backup ZLIB Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_ZLIB',
      'ZLIB compressed backups are being used.');
  end;

  /**********************************
   * RMAN - BZIP2 compressed backups
   **********************************/
  begin

    dbms_feature_usage.register_db_feature
     ('Backup BZIP2 Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_BZIP2',
      'BZIP2 compressed backups are being used.');
  end;

  /**********************************
   * RMAN - BASIC compressed backups
   **********************************/
  begin

    dbms_feature_usage.register_db_feature
     ('Backup BASIC Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_BASIC',
      'BASIC compressed backups are being used.');
  end;

  /**********************************
   * RMAN - LOW compressed backups
   **********************************/
  begin

    dbms_feature_usage.register_db_feature
     ('Backup LOW Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_LOW',
      'LOW compressed backups are being used.');
  end;

  /**********************************
   * RMAN - MEDIUM compressed backups
   **********************************/
  begin

    dbms_feature_usage.register_db_feature
     ('Backup MEDIUM Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_MEDIUM',
      'MEDIUM compressed backups are being used.');
  end;

  /**********************************
   * RMAN - HIGH compressed backups
   **********************************/
  begin

    dbms_feature_usage.register_db_feature
     ('Backup HIGH Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RMAN_HIGH',
      'HIGH compressed backups are being used.');
  end;

  /****************************
  * Long-term archival backups
  *****************************/

  declare
  DBFUS_KEEP_BACKUP_STR CONSTANT VARCHAR2(1000) :=
    'select count(*), NULL, decode(min(keep_options), ''BACKUP_LOGS'',
    ''Consistent backups archived'') from v$backup_set where keep = ''YES''';

  begin
    dbms_feature_usage.register_db_feature
     ('Long-term Archival Backup',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_KEEP_BACKUP_STR,
      'Long-term archival backups are being used.');
  end;

  /****************************
  * Multi section backups
  *****************************/

  declare
  DBFUS_MULTI_SECTION_BACKUP_STR CONSTANT VARCHAR2(1000) :=
    'select count(*), NULL, NULL ' ||
    'from v$backup_set where multi_section = ''YES''';

  begin
    dbms_feature_usage.register_db_feature
     ('Multi Section Backup',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_MULTI_SECTION_BACKUP_STR,
      'Multi section backups are being used.');
  end;

  /***********************
   * Block Media Recovery
   ***********************/

  declare
    DBFUS_BLOCK_MEDIA_RCV_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''BLOCK MEDIA RECOVERY%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Block Media Recovery',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BLOCK_MEDIA_RCV_STR,
      'Block Media Recovery is being used to repair the database.');
  end;


  /***********************
   * Restore Point
   ***********************/

  declare
    DBFUS_RESTORE_POINT_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$restore_point)';
  begin
    dbms_feature_usage.register_db_feature
     ('Restore Point',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_RESTORE_POINT_STR,
      'Restore Points are being used as targets for Flashback');
  end;

  /***********************
   * Logfile Multiplexing
   ***********************/

  declare
    DBFUS_LOGFILE_MULTIPLEX_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from ' ||
        '  (select count(*) a from v$logfile group by group#)' ||
        '  where a>1)';
  begin
    dbms_feature_usage.register_db_feature
     ('Logfile Multiplexing',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_LOGFILE_MULTIPLEX_STR,
      'Multiple members are used in a single log file group');
  end;


  /***********************
   * Bigfile Tablespace
   ***********************/

  declare
    DBFUS_BIGFILE_TBS_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$tablespace' ||
        '  where bigfile = ''YES'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Bigfile Tablespace',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BIGFILE_TBS_STR,
      'Bigfile tablespace is being used');
  end;


  /**************************
   * Transportable Tablespace
   **************************/

  declare
    DBFUS_TRANSPORTABLE_TBS_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$datafile' ||
        '  where plugged_in = 1)';
  begin
    dbms_feature_usage.register_db_feature
     ('Transportable Tablespace',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_TRANSPORTABLE_TBS_STR,
      'Transportable tablespace is being used');
  end;


  /***********************
   * Read Only Tablespace
   ***********************/

  declare
    DBFUS_READONLY_TBS_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$datafile' ||
        '  where enabled = ''READ ONLY'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Read Only Tablespace',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_READONLY_TBS_STR,
      'Read only tablespace is being used');
  end;

  /*************************
   * Read Only Open Delayed
   *************************/

  declare
    DBFUS_READOPEN_DELAY_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$parameter' ||
        '  where name = ''read_only_open_delayed'' and value = ''TRUE'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Deferred Open Read Only',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_READOPEN_DELAY_STR,
      'Deferred open read only feature is enabled');
  end;


  /**********************
   * Active Data Guard
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('Active Data Guard - Real-Time Query on Physical Standby',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_ACTIVE_DATA_GUARD',
      'Active Data Guard, a set of services, is being used to enhance ' ||
      'Data Guard');
  end;


  /**********************
   * Online Move Datafile
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('Online Move Datafile',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_MOVE_DATAFILE',
      'Online Move Datafile is being used to move datafiles');
  end;


  /*********************
   * Backup Rollforward
   *********************/

  declare
    DBFUS_BACKUP_ROLLFORWARD_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''BACKUP COPYROLLFORWARD%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Backup Rollforward',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BACKUP_ROLLFORWARD_STR,
      'Backup Rollforward strategy is being used to backup the database.');
  end;

  /************************
   * Data Recovery Advisor
   ************************/

  declare
    DBFUS_DATA_RCV_ADVISOR_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$ir_repair' ||
        '  where rownum = 1)';
  begin
    dbms_feature_usage.register_db_feature
     ('Data Recovery Advisor',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_DATA_RCV_ADVISOR_STR,
      'Data Recovery Advisor (DRA) is being used to repair the database.');
  end;

  /***********************
   * Backup and Restore of plugged database
   ***********************/

  declare
    DBFUS_BR_PLUGGED_DB_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''%PLUGGABLE DATABASE%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Backup and Restore of plugged database',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_BR_PLUGGED_DB_STR,
      'Backup and Restore of plugged database by RMAN is used.');
  end;

  /*********************
   * Recover Table, additional space after TABLE is intentional.
   *********************/

  declare
    DBFUS_RECOVER_TABLE_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''RECOVER TABLE %'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Recover Table',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_RECOVER_TABLE_STR,
      'Recover Table is used to recover a table in the database.');
  end;

  /*********************
   * Recover Until Snapshot
   *********************/

  declare
    DBFUS_RECOVER_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''RECOVER UNTIL SNAPSHOT%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Recover Until Snapshot',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_RECOVER_STR,
      'Recover until snapshot is used to recover the database.');
  end;

  /*********************
   * TRANSPORT TABLESPACE command
   *********************/

  declare
    DBFUS_TRANSPORT_TBS_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''TRANSPORT TABLESPACE%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('TRANSPORT TABLESPACE command',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_TRANSPORT_TBS_STR,
      'RMAN''s TRANSPORT TABLESPACE command used by the database.');
  end;

  /*********************
   * CONVERT command
   *********************/

  declare
    DBFUS_CONVERT_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''CONVERT%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('CONVERT command',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CONVERT_STR,
      'RMAN''s CONVERT command used by the database.');
  end;

  /*********************
   * Cross Platform Backup and Restore
   *********************/

  declare
    DBFUS_CROSS_PLATFORM_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation in '||
        '     (''RECOVER FROM PLATFORM'', ''BACKUP FOR TRANSPORT'', '||
        '      ''BACKUP FROM PLATFORM'', ''RESTORE FROM PLATFORM''))';
  begin
    dbms_feature_usage.register_db_feature
     ('Cross-Platform Backups',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CROSS_PLATFORM_STR,
      'Cross-Platform Backup and Restore used by the database.');
  end;

  /*********************
   * Duplicate from Active Database using BackupSet
   *********************/

  declare
    DBFUS_DUPDB_USINGBCK_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''DUPLICATE DB FROM ACTIVE USING B%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('Duplicate Db from Active Db using BackupSet',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_DUPDB_USINGBCK_STR,
      'Duplicate from Active Database using BackupSet is used.');
  end;

  /**********************
   * Resource Manager
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('Resource Manager',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_RESOURCE_MANAGER',
      'Oracle Database Resource Manager is being used to manage ' ||
      'database resources.');
  end;

  /**********************
   * Instance Caging
   **********************/

  declare
    DBFUS_DATA_INSTANCE_CAGING_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$rsrc_plan_history where ' ||
      'name != ''ORA$INTERNAL_CDB_PLAN'' and ' ||
      'name != ''INTERNAL_PLAN'' and name is not null and ' ||
      'instance_caging = ''ON'' and ' ||
      '(name != ''DEFAULT_MAINTENANCE_PLAN'' or ' ||
      '  (window_name is null or ' ||
      '   (window_name != ''MONDAY_WINDOW'' and ' ||
      '    window_name != ''TUESDAY_WINDOW'' and ' ||
      '    window_name != ''WEDNESDAY_WINDOW'' and ' ||
      '    window_name != ''THURSDAY_WINDOW'' and ' ||
      '    window_name != ''FRIDAY_WINDOW'' and ' ||
      '    window_name != ''SATURDAY_WINDOW'' and ' ||
      '    window_name != ''SUNDAY_WINDOW''))) ';
  begin
    dbms_feature_usage.register_db_feature
     ('Instance Caging',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_DATA_INSTANCE_CAGING_STR,
      'Instance Caging is being used to limit the CPU usage by the ' ||
      'database instance.');
  end;

  /**********************
   * dNFS
   **********************/

  declare
    DBFUS_DATA_DNFS_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$dnfs_servers';
  begin
    dbms_feature_usage.register_db_feature
     ('Direct NFS',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_DATA_DNFS_STR,
      'Direct NFS is being used to connect to an NFS server');
  end;

  /***********************
   * Server Flash Cache
   ***********************/

  declare
    DBFUS_SRV_FLASH_CACHE_SIZE_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$system_parameter where ' ||
        'name like ''%flash_cache_size'' and value != ''0''';

  begin
    dbms_feature_usage.register_db_feature
     ('Server Flash Cache',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_SRV_FLASH_CACHE_SIZE_STR,
      'Server Flash Cache is being used with this database.');
  end;

  /************************
   * Server Parameter File
   ************************/

  declare
    DBFUS_SPFILE_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$system_parameter where ' ||
        'name = ''spfile'' and value is not null';

  begin
    dbms_feature_usage.register_db_feature
     ('Server Parameter File',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_SPFILE_STR,
      'The server parameter file (SPFILE) was used to startup the database.');
  end;

  /**********************
   * Shared Server
   **********************/

  declare
    DBFUS_MTS_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from v$system_parameter ' ||
        'where name = ''shared_servers'' and value != ''0'' and ' ||
        'exists (select 1 from v$shared_server where requests > 0)';

  begin
    dbms_feature_usage.register_db_feature
     ('Shared Server',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_MTS_STR,
      'The database is configured as Shared Server, where one server ' ||
      'process can service multiple client programs.');
  end;

  /**********************************************
   * Database Resident Connection Pooling  (DRCP)
   **********************************************/

  declare
    DBFUS_DRCP_STR CONSTANT VARCHAR2(1000) :=
      'select count(maxsize), nvl(sum(maxsize),0), NULL from dba_cpool_info '||
      'where status=''ACTIVE''';

  begin
    dbms_feature_usage.register_db_feature
     ('Database Resident Connection Pooling (DRCP)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_DRCP_STR,
      'Active Database Resident Connection Pool has been detected');
  end;

  /**********************
   * Spatial
     If Spatial is installed then the second query returns 1;
     else it returns 0. So use that to multiply the metadata count
     to get only the Spatial install usage and not the Locator install
     usage.
   **********************/

  declare
    DBFUS_SPATIAL_STR CONSTANT VARCHAR2(1000) :=
     'select atc*ix, atc*ix, NULL from ' ||
       '(select count(*) atc ' ||
         'from mdsys.sdo_feature_usage '||
         'where used = ''Y'' and ' ||
         'feature_name in (''3D_FUNCTIONS'', ''AGGREGATES'', ''CSW'', ' ||
         ' ''GEOCODER'', ''GEORASTER'', ''LRS'', ''NDM'', ''OPEN_LS'', ' ||
         ' ''POINTCLOUD'', ''RELATE'', ''ROUTER'', ''SAM'', ''TIN'', ' ||
         ' ''TOPOLOGY'', ''UNION_INTERSECTION'', ''WFS'')), ' ||
       '(select count(*) ix ' ||
          'from  dba_registry where comp_id = ''SDO'')';

  begin
    dbms_feature_usage.register_db_feature
     ('Spatial',
      dbms_feature_usage.DBU_INST_OBJECT,
      'MDSYS.all_sdo_index_metadata',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_SPATIAL_STR,
      'There is at least one usage of the Oracle Spatial feature usage table.');
  end;

  /**********************
   * Locator
     If Locator is installed then the second query returns 1;
     else it returns 0. So use that to multiply the metadata count
     to get only the Locator install usage and not the Spatial install
     usage.
   **********************/

  declare
    DBFUS_LOCATOR_STR CONSTANT VARCHAR2(1000) :=
     'select atc*six, atc*six, NULL from ' ||
       '(select count(*) atc ' ||
         'from mdsys.sdo_feature_usage '||
         'where used = ''Y'' and ' ||
         'feature_name not in (''3D_FUNCTIONS'', ''AGGREGATES'', ''CSW'', ' ||
         ' ''GEOCODER'', ''GEORASTER'', ''LRS'', ''NDM'', ''OPEN_LS'', ' ||
         ' ''POINTCLOUD'', ''RELATE'', ''ROUTER'', ''SAM'', ''TIN'', ' ||
         ' ''TOPOLOGY'', ''UNION_INTERSECTION'', ''WFS'')), ' ||
     ' ( select decode(sx-ix, -1, 0, 0, 0, 1) six from ( ' ||
     ' select count(*) sx from  dba_registry where comp_id = ''ORDIM''), '||
     ' ( select count(*) ix from  dba_registry where comp_id = ''SDO'')) ';

  begin
    dbms_feature_usage.register_db_feature
     ('Locator',
      dbms_feature_usage.DBU_INST_OBJECT,
      'MDSYS.sdo_geom_metadata_table',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_LOCATOR_STR,
      'There is at least one usage of the Oracle Locator feature usage table.');
  end;


  /***********************************************************************
   * All advisors using the advisor framework. This includes all advisors
   * listed in DBA_ADVISOR_DEFINITIONS and DBA_ADVISOR_USAGE views.
   ************************************************************************/
  /* FIXME: Mike would like to use a pl/sql procedure instead of a query */
  declare
      dbu_detect_sql VARCHAR2(32767);
  begin
      FOR adv_rec IN (SELECT advisor_name, advisor_id
                      FROM dba_advisor_definitions
                      WHERE bitand(property, 64) != 64
                      ORDER BY advisor_id)
      LOOP
        -- build the query that will be executed to track an advisor usage

        -- clob column FEATURE_INFO will contain XML for advisor framework-
        -- level info, with advisor extra info sitting beneath the framework
        -- tag
        IF (adv_rec.advisor_name = 'ADDM') THEN
          dbu_detect_sql := ', xmltype(prvt_hdm.db_feature_clob) ';
        ELSE
          dbu_detect_sql := '';
        END IF;

        dbu_detect_sql :=
          ' xmlelement("advisor_usage",
              xmlelement("reports",
                xmlelement("first_report_time",
                            to_char(first_report_time,
                                    ''dd-mon-yyyy hh24:mi:ss'')),
                xmlelement("last_report_time",
                           to_char(last_report_time,
                                   ''dd-mon-yyyy hh24:mi:ss'')),
                xmlelement("num_db_reports", num_db_reports))
                ' || dbu_detect_sql || ').getClobVal(2,2) ';

        -- used:       1 if advisor executed since last sample
        -- sofar_exec: total # of executions since db create
        -- dbf_clob:   reporting, plus advisor-specific stuff
        dbu_detect_sql :=
          'SELECT used, sofar_exec, dbf_clob FROM
             (SELECT num_execs sofar_exec, ' || dbu_detect_sql || ' dbf_clob
              FROM   dba_advisor_usage u
              WHERE  u.advisor_name = ''' || adv_rec.advisor_name || '''), ' ||
            '(SELECT count(*) used
              FROM   dba_advisor_usage u
              WHERE u.advisor_name = ''' || adv_rec.advisor_name || ''' AND
                    (u.num_execs > 0 or u.num_db_reports > 0) and
                     greatest(nvl(u.last_exec_time, sysdate - 1000),
                              nvl(u.last_report_time, sysdate - 1000)) >=
                                       ' || DBFUS_LAST_SAMPLE_DATE_STR || ')';

        -- register the current advisor
        dbms_feature_usage.register_db_feature
          (adv_rec.advisor_name,
           dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
           NULL,
           dbms_feature_usage.DBU_DETECT_BY_SQL,
           dbu_detect_sql,
           adv_rec.advisor_name || ' has been used.');
      END LOOP;
  end;

  /******************************
   * Real-Time SQL Monitoring
   ******************************/
  declare
      dbu_detect_sql VARCHAR2(32767);
  begin
      -- used:       1 if db report for monitoring details requested since
      --             last sample (list report is not tracked)
      -- sofar_exec: total # of db reports requested since db creation
      -- dbf_clob:   extra XML info
      dbu_detect_sql :=
        'SELECT used, sofar_exec, dbf_clob
         FROM   (SELECT count(*) used
                 FROM   dba_sql_monitor_usage
                 WHERE  num_db_reports > 0 AND
                        last_db_report_time >= ' || DBFUS_LAST_SAMPLE_DATE_STR
                || '),
                (SELECT num_db_reports sofar_exec,
                        xmlelement("sqlmon_usage",
                         xmlelement("num_em_reports", num_em_reports),
                         xmlelement("first_db_report_time",
                           to_char(first_db_report_time,
                                   ''dd-mon-yyyy hh24:mi:ss'')),
                         xmlelement("last_db_report_time",
                           to_char(last_db_report_time,
                                   ''dd-mon-yyyy hh24:mi:ss'')),
                         xmlelement("first_em_report_time",
                           to_char(first_em_report_time,
                                   ''dd-mon-yyyy hh24:mi:ss'')),
                         xmlelement("last_em_report_time",
                           to_char(last_em_report_time,
                                   ''dd-mon-yyyy hh24:mi:ss''))
                        ).getClobVal(2,2) dbf_clob
                FROM dba_sql_monitor_usage)';

      -- register the feature
      dbms_feature_usage.register_db_feature
        ('Real-Time SQL Monitoring',
         dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
         NULL,
         dbms_feature_usage.DBU_DETECT_BY_SQL,
         dbu_detect_sql,
         'Real-Time SQL Monitoring Usage.');
  end;


  /******************************
   * SQL Tuning Set
   ******************************/
  declare
    -- A 'user' SQL Tuning Set is one not owned by SYS, and a 'system' SQL
    -- Tuning Set is one that is owned by SYS.  This will cover the $$ STSes
    -- that Access Advisor creates, and users do not use EM as SYS, so it should
    -- be good enough for now.
    DBFUS_USER_SQL_TUNING_SET_STR CONSTANT VARCHAR2(1000) :=
      'select numss, numref, NULL from ' ||
        '(select count(*) numss ' ||
        ' from wri$_sqlset_definitions ' ||
        ' where owner <> ''SYS''), ' ||
        '(select count(*) numref ' ||
        ' from wri$_sqlset_references r, wri$_sqlset_definitions d ' ||
        ' where d.id = r.sqlset_id and d.owner <> ''SYS'')';

    DBFUS_SYS_SQL_TUNING_SET_STR CONSTANT VARCHAR2(1000) :=
      'select numss, numref, NULL from ' ||
        '(select count(*) numss ' ||
        ' from wri$_sqlset_definitions ' ||
        ' where owner = ''SYS''), ' ||
        '(select count(*) numref ' ||
        ' from wri$_sqlset_references r, wri$_sqlset_definitions d ' ||
        ' where d.id = r.sqlset_id and d.owner = ''SYS'')';
  begin
    dbms_feature_usage.register_db_feature
     ('SQL Tuning Set (user)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_USER_SQL_TUNING_SET_STR,
      'A SQL Tuning Set has been created in the database in a user schema.');


    dbms_feature_usage.register_db_feature
     ('SQL Tuning Set (system)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_SYS_SQL_TUNING_SET_STR,
      'A SQL Tuning Set has been created in the database in the SYS schema.');
  end;

  /******************************
   * Automatic SQL Tuning Advisor
   ******************************/
  declare
    DBFUS_AUTOSTA_PROC VARCHAR2(100) := 'DBMS_FEATURE_AUTOSTA';
  begin
    dbms_feature_usage.register_db_feature
     ('Automatic SQL Tuning Advisor',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_AUTOSTA_PROC,
      'Automatic SQL Tuning Advisor has been used.');
  end;

  /******************************
   * SQL Profiles
   ******************************/
  /* FIXME: Mike would like to use a pl/sql procedure instead of a query */
  declare
    DBFUS_SQLPROFILE_STR CONSTANT VARCHAR2(32767) :=
      q'#SELECT used,
                prof_count,
                profs || ', ' || manual || ', ' || auto || ', ' ||
                enabl || ', ' || cat as details
         FROM (SELECT sum(decode(status, 'ENABLED', 1, 0)) used,
                      sum(1) prof_count,
                     'Total so far: ' || sum(1) profs,
                     'Enabled: ' || sum(decode(status, 'ENABLED', 1, 0)) enabl,
                     'Manual: ' || sum(decode(type, 'MANUAL', 1, 0)) manual,
                     'Auto: ' || sum(decode(type, 'AUTO', 1, 0)) auto,
                     'Category count: ' || count(unique category) cat
               FROM dba_sql_profiles)#';
  begin
    dbms_feature_usage.register_db_feature
     ('SQL Profile',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_SQLPROFILE_STR,
      'SQL profiles have been used.');
  end;

  /************************************************
   * Database Replay: Workload Capture and Replay *
   ************************************************/
  declare
    prev_sample_count     NUMBER;
    prev_sample_date      NUMBER;

    DBFUS_WCR_CAPTURE_PROC VARCHAR2(1000) := 'DBMS_FEATURE_WCR_CAPTURE';
    DBFUS_WCR_REPLAY_PROC  VARCHAR2(1000) := 'DBMS_FEATURE_WCR_REPLAY';
  begin
    dbms_feature_usage.register_db_feature
     ('Database Replay: Workload Capture',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_WCR_CAPTURE_PROC,
      'Database Replay: Workload was ever captured.');

    dbms_feature_usage.register_db_feature
     ('Database Replay: Workload Replay',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_WCR_REPLAY_PROC,
      'Database Replay: Workload was ever replayed.');
  end;

  /**********************
   * Streams (system)
   **********************/

  declare
    DBFUS_STREAMS_SYS_PROC CONSTANT VARCHAR2(1000) :=
       'dbms_feature_streams';

  begin
    dbms_feature_usage.register_db_feature
     ('Streams (system)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_STREAMS_SYS_PROC,
      'Oracle Streams processes have been configured');
  end;

  /**********************
   * Streams (user)
   **********************/

  declare
    DBFUS_STREAMS_USER_STR CONSTANT VARCHAR2(1000) :=
    -- for AQ, there are default queues in the sys, system, ix,
    -- wmsys, sysman, and gsmdamin_internal
    -- schemas which we do not want to count towards Streams user feature usage
    -- for Streams messaging these consumers are in db by default
     'select decode(strmsg + aq, 0, 0, 1), 0, NULL from ' ||
     '(select decode(count(*), 0, 0, 1) strmsg ' ||
     '  from dba_streams_message_consumers ' ||
     '  where streams_name != ''SCHEDULER_COORDINATOR'' and ' ||
     '  streams_name != ''SCHEDULER_PICKUP''),' ||
     '(select decode (count(*), 0, 0, 1) aq ' ||
     '  from system.aq$_queue_tables where schema not in ' ||
     '  (''SYS'', ''SYSTEM'', ''IX'', ''WMSYS'', ''SYSMAN'', ' ||
     '''GSMADMIN_INTERNAL''))';

  begin
    dbms_feature_usage.register_db_feature
     ('Streams (user)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_STREAMS_USER_STR,
      'Users have configured Oracle Streams AQ');
  end;

  /**********************
   * XStream In
   **********************/

  declare
    DBFUS_XSTREAM_IN_PROC CONSTANT VARCHAR2(1000) :=
       'dbms_feature_xstream_in';

  begin
    dbms_feature_usage.register_db_feature
     ('XStream In',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_XSTREAM_IN_PROC,
      'Oracle XStream Inbound servers have been configured');
  end;

  /**********************
   * XStream Out
   **********************/

  declare
    DBFUS_XSTREAM_OUT_PROC CONSTANT VARCHAR2(1000) :=
       'dbms_feature_xstream_out';

  begin
    dbms_feature_usage.register_db_feature
     ('XStream Out',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_XSTREAM_OUT_PROC,
      'Oracle XStream Outbound servers have been configured');
  end;

  /**********************
   * XStream Streams
   **********************/

  declare
    DBFUS_XSTREAM_STREAMS_PROC CONSTANT VARCHAR2(1000) :=
       'dbms_feature_xstream_streams';

  begin
    dbms_feature_usage.register_db_feature
     ('XStream Streams',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_XSTREAM_STREAMS_PROC,
      'Oracle Streams with XStream functionality has been configured');
  end;

  /**********************
   * GoldenGate
   **********************/

  declare
    DBFUS_GOLDENGATE_PROC CONSTANT VARCHAR2(1000) :=
    'dbms_feature_goldengate';

  begin
    dbms_feature_usage.register_db_feature
     ('GoldenGate',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_GOLDENGATE_PROC,
      'Oracle GoldenGate Capabilities are in use.');
  end;

  /**********************
   * Transparent Gateway
   **********************/

  declare
    DBFUS_GATEWAYS_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from hs_fds_class_date ' ||
        'where fds_class_name != ''BITE''';

  begin
    dbms_feature_usage.register_db_feature
     ('Transparent Gateway',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_GATEWAYS_STR,
      'Heterogeneous Connectivity, access to a non-Oracle system, has ' ||
      'been configured.');
  end;

  /***************************
   * Virtual Private Database
   ***************************/

  declare
    DBFUS_VPD_STR CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from DBA_POLICIES where OBJECT_OWNER ' ||
      'NOT IN (''SYSMAN'',''MDSYS'',''SYSMAN_MDS'',''XDB'',''CTXSYS'',' ||
      '''OE'',''LBACSYS'', ''GSMADMIN_INTERNAL'', ''SYSTEM'')';

  begin
    dbms_feature_usage.register_db_feature
     ('Virtual Private Database (VPD)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_VPD_STR,
      'Virtual Private Database (VPD) policies are being used.');
  end;

  /**********************
   * Workspace Manager
   **********************/

  declare
    DBFUS_OWM_STR CONSTANT VARCHAR2(1000) :=
     'select count(*), count(*), NULL ' ||
     'from wmsys.wm$versioned_tables';

  begin
    dbms_feature_usage.register_db_feature
     ('Workspace Manager',
      dbms_feature_usage.DBU_INST_OBJECT,
      'WMSYS.wm$versioned_tables',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_OWM_STR,
      'There is at least one version enabled table.');
  end;

  /**************************
   * XDB
   **************************/

  begin
    dbms_feature_usage.register_db_feature
     ('XDB',
      dbms_feature_usage.DBU_INST_OBJECT,
      'XDB.Resource_View',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_XDB',
      'XDB feature is being used.');
  end;

  /*****************************
   * JSON
   *****************************/

  begin
    dbms_feature_usage.register_db_feature
     ('JSON',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_JSON',
      'JSON feature is being used.');
  end;

  /*****************************
   * Application Express (APEX)
   *****************************/
  begin
    dbms_feature_usage.register_db_feature
    ( 'Application Express',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_APEX',
      'Application Express feature is being used.');
  end;

  /***************************
   * LOB
   ***************************/

  declare
    DBMS_FEATURE_LOB CONSTANT VARCHAR2(1000) :=
      'select count(*), NULL, NULL from sys.lob$ l, sys.obj$ o, sys.user$ u ' ||
       'where l.obj# = o.obj# ' ||
         'and o.owner# = u.user# ' ||
         'and u.name not in (select schema_name from v$sysaux_occupants) ' ||
         'and u.name not in (''OUTLN'', ''OE'', ''IX'', ''PM'', ''SH'',
                             ''OJVMSYS'', ''DVSYS'', ''GSMADMIN_INTERNAL'') ' ||
         'and u.name not like ''APEX_% '' ' ||
         'and u.name not like ''FLOWS_%''';

  begin
    dbms_feature_usage.register_db_feature
     ('LOB',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBMS_FEATURE_LOB,
      'Persistent LOBs are being used.');
  end;

  /***************************
   * OBJECT
   ***************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Object',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_OBJECT',
      'Object feature is being used.');
  end;

  /***************************
   * EXTENSIBILITY
   ***************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Extensibility',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_EXTENSIBILITY',
      'Extensibility feature is being used.');
  end;

  /******************************
   * SQL Plan Management
   ******************************/

  declare
    DBFUS_SQL_PLAN_MANAGEMENT_STR CONSTANT VARCHAR2(2000) :=
      q'#SELECT nvl(total_count, 0) total_count,
                nvl(enabled_count, 0) enabled_count,
                decode(total_count, null, null,
                                    0, null,
                                    (manual_load || ', ' ||
                                     auto_capture || ', ' ||
                                     manual_sqltune || ', ' ||
                                     auto_sqltune || ', ' ||
                                     stored_outline || ', ' ||
                                     evolve_advisor || ', ' ||
                                     accepted_count || ', ' ||
                                     fixed_count || ', ' ||
                                     reproduced_count)) as details
         FROM (SELECT
                 sum(1) total_count,
                 sum(decode(enabled, 'YES', 1, 0)) enabled_count,
                 'Manual-load: ' ||
                   sum(decode(origin, 'MANUAL-LOAD', 1, 0)) manual_load,
                 'Auto-capture: ' ||
                   sum(decode(origin, 'AUTO-CAPTURE', 1, 0)) auto_capture,
                 'Manual-sqltune: ' ||
                   sum(decode(origin, 'MANUAL-SQLTUNE', 1, 0)) manual_sqltune,
                 'Auto-sqltune: ' ||
                   sum(decode(origin, 'AUTO-SQLTUNE', 1, 0)) auto_sqltune,
                 'Stored-outline: ' ||
                   sum(decode(origin, 'STORED-OUTLINE', 1, 0)) stored_outline,
                 'Evolve-advisor: ' ||
                   sum(decode(origin, 'EVOLVE-ADVISOR', 1, 0)) evolve_advisor,
                 'Accepted: ' ||
                   sum(decode(accepted, 'YES', 1, 0)) accepted_count,
                 'Fixed: ' ||
                   sum(decode(fixed, 'YES', 1, 0)) fixed_count,
                 'Reproduced: ' ||
                   sum(decode(reproduced, 'YES', 1, 0)) reproduced_count
               FROM dba_sql_plan_baselines)#';
  begin
    dbms_feature_usage.register_db_feature
     ('SQL Plan Management',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_SQL_PLAN_MANAGEMENT_STR,
      'SQL Plan Management has been used.');
  end;

  /******************************
   * DBMS_FEATURE_ADAPTIVE_PLANS
   ******************************/
  begin
    dbms_feature_usage.register_db_feature
     ('Adaptive Plans',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_ADAPTIVE_PLANS',
      'Adaptive Plans have been used');
  end;

  /**********************************
   * DBMS_FEATURE_AUTO_REOPT
   **********************************/
  begin
    dbms_feature_usage.register_db_feature
     ('Automatic Reoptimization',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_AUTO_REOPT',
      'Automatic Reoptimization have been used');
  end;

  begin
    dbms_feature_usage.register_db_feature
     ('SQL Plan Directive',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_SPD',
      'Sql plan directive has been used');
  end;

  /******************************
   * DBMS_FEATURE_STATS_CONCURRENT
   ******************************/
  begin
    dbms_feature_usage.register_db_feature
     ('Concurrent Statistics Gathering',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_CONCURRENT_STATS',
      'Concurrent Statistics Gathering has been used');
  end;

  /******************************
   * DBMS_FEATURE_STATS_INCREMENTAL
   ******************************/
  begin
    dbms_feature_usage.register_db_feature
     ('DBMS_STATS Incremental Maintenance',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_STATS_INCREMENTAL',
      'DBMS_STATS Incremental Maintenance has been used.');
  end;


  /***************************
   * RULES MANAGER and EXPRESSION FILTER
   ***************************/
  begin
    dbms_feature_usage.register_db_feature
        ('Rules Manager',
          dbms_feature_usage.DBU_INST_OBJECT,
          'EXFSYS.exf$attrset',
          dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
          'DBMS_FEATURE_RULESMANAGER',
           'Rules Manager and Expression Filter');
  end;

  /***************************************************************
   *  DATABASE UTILITY: ORACLE DATAPUMP EXPORT
   ***************************************************************/
  declare
  begin
   dbms_feature_usage.register_db_feature
      ('Oracle Utility Datapump (Export)',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'dbms_feature_utilities1',
       'Oracle Utility Datapump (Export) has been used.');
  end;

  /***************************************************************
   *  DATABASE UTILITY: ORACLE DATAPUMP IMPORT
   ***************************************************************/
  declare
  begin
   dbms_feature_usage.register_db_feature
      ('Oracle Utility Datapump (Import)',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'dbms_feature_utilities2',
       'Oracle Utility Datapump (Import) has been used.');
  end;

  /***************************************************************
   *  DATABASE UTILITY: SQL*LOADER (DIRECT PATH LOAD)
   ***************************************************************/
  declare
   DBFUS_UTL_SQLLOADER_STR CONSTANT VARCHAR2(1000) :=
       'select usecnt, NULL, NULL from sys.ku_utluse                      ' ||
       ' where utlname = ''Oracle Utility SQL Loader (Direct Path Load)'' ' ||
       ' and   (last_used >=                                              ' ||
       '       (SELECT nvl(max(last_sample_date), sysdate-7)              ' ||
       '          FROM dba_feature_usage_statistics))';

  begin
   dbms_feature_usage.register_db_feature
      ('Oracle Utility SQL Loader (Direct Path Load)',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_SQL,
       DBFUS_UTL_SQLLOADER_STR,
       'Oracle Utility SQL Loader (Direct Path Load) has been used.');
  end;

  /***************************************************************
   *  DATABASE UTILITY: METADATA API
   ***************************************************************/
  declare
  begin
   dbms_feature_usage.register_db_feature
      ('Oracle Utility Metadata API',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'dbms_feature_utilities3',
       'Oracle Utility (Metadata API) has been used.');
  end;

  /***************************************************************
   *  DATABASE UTILITY: EXTERNAL TABLE
   ***************************************************************/
  declare
  begin
   dbms_feature_usage.register_db_feature
      ('Oracle Utility External Table',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'dbms_feature_utilities4',
       'Oracle Utility External Table has been used.');
  end;

  /***************************************************************
   *  RESULT CACHE
   ***************************************************************/
  declare
   DBFUS_RESULT_CACHE_STR CONSTANT VARCHAR2(1000) :=
       'select (select value from v$result_cache_statistics ' ||
       '        where name = ''Block Count Current''), '      ||
       '       (select value from v$result_cache_statistics ' ||
       '        where name = ''Find Count''), null '          ||
       'from dual';

  begin
   dbms_feature_usage.register_db_feature
      ('Result Cache',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_SQL,
       DBFUS_RESULT_CACHE_STR,
       'The Result Cache feature has been used.');
  end;

  /**************************************
   * TDE - Transparent Data Encryption
   **************************************/

  declare
    DBFUS_TDE_STR CONSTANT VARCHAR2(1000) :=
      'SELECT (T1.A + T2.B) IsFeatureUsed, ' ||
             '(T1.A + T2.B) AUX_COUNT, ' ||
             '''Encryption TABLESPACE Count = '' || T1.A || '','||
               'Encryption COLUMN Count = '' || T2.B REMARK ' ||
      'FROM   (SELECT count(*) A FROM DBA_TABLESPACES WHERE ' ||
                    ' UPPER(ENCRYPTED) = ''YES'') T1, ' ||
             '(SELECT count(*) B FROM DBA_ENCRYPTED_COLUMNS) T2 ' ;
  begin
    dbms_feature_usage.register_db_feature
     ('Transparent Data Encryption',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_TDE_STR,
      'Transparent Database Encryption is being used. There is' ||
      ' atleast one column or tablespace that is encrypted.');
  end;

  /*******************
   * Data Redaction
   *******************/

  /* Bug# 13888340: Data redaction feature usage tracking
   * Related test files are tmfudru.tsc and tmfudr.tsc.
   */
  begin
    dbms_feature_usage.register_db_feature
     ('Data Redaction',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_DATA_REDACTION',
      'Data redaction is being used. There is' ||
      ' at least one policy that is defined.');
  end;

  /**********************
   * Oracle Multimedia
   **********************/

  declare
    DBFUS_MULTIMEDIA_STR CONSTANT VARCHAR2(1000) :=
      'ordsys.CARTRIDGE.dbms_feature_multimedia';

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Multimedia',
      dbms_feature_usage.DBU_INST_OBJECT,
      'ORDSYS.ORDIMERRORCODES',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_MULTIMEDIA_STR,
      'Oracle Multimedia has been used');
  end;

  /*****************************************************************
   * Oracle Multimedia DICOM: medical imaging
   * DICOM stands for Digital Imaging and COmmunications in Medicine
   *****************************************************************/

  declare
    DBFUS_DICOM_STR CONSTANT VARCHAR2(1000) :=
      'ordsys.CARTRIDGE.dbms_feature_dicom';

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Multimedia DICOM',
      dbms_feature_usage.DBU_INST_OBJECT,
      'ORDSYS.ORDDICOM',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_DICOM_STR,
      'Oracle Multimedia DICOM (Digital Imaging and COmmunications in Medicine) has been used');
  end;

  /****************************
   * Materialized Views (User)
   ****************************/

  declare
    DBFUS_USER_MVS CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_USER_MVS';

  begin
    dbms_feature_usage.register_db_feature
     ('Materialized Views (User)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_USER_MVS,
      'User Materialized Views exist in the database');
  end;

  /***************************
   * Change Data Capture (CDC)
   ***************************/
  begin
    dbms_feature_usage.register_db_feature
        ('Change Data Capture',
          dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
          NULL,
          dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
          'DBMS_FEATURE_CDC',
           'Change Data Capture exit in the database');
  end;

  /********************************
   * Services
   *********************************/
  declare
    DBFUS_SERVICES_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_SERVICES';
  begin
    dbms_feature_usage.register_db_feature
     ('Services',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_SERVICES_PROC,
      'Oracle Services.');
  end;

  /***********************
   * Semantics/RDF/OWL
   ***********************/

   declare
     DBFUS_SEMANTICS_RDF_STR CONSTANT VARCHAR2(1000) :=
        'select cnt, cnt, null from ' ||
        ' (select count(*) cnt from mdsys.rdf_model$)';

   begin
     dbms_feature_usage.register_db_feature
       ('Semantics/RDF',
         dbms_feature_usage.DBU_INST_OBJECT,
         'MDSYS.RDF_Models',
         dbms_feature_usage.DBU_DETECT_BY_SQL,
         DBFUS_SEMANTICS_RDF_STR,
         'A semantic network has been created indicating usage of the ' ||
         'Oracle Semantics Feature.');
    end;

  /***********************
   * SecureFiles (user)
   ***********************/

  begin
   dbms_feature_usage.register_db_feature
      ('SecureFiles (user)',
        dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
        NULL,
        dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_SECUREFILES_USR',
       'SecureFiles is being used');
  end;

  /***********************
   * SecureFiles (system)
   ***********************/

  begin
   dbms_feature_usage.register_db_feature
      ('SecureFiles (system)',
        dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
        NULL,
        dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_SECUREFILES_SYS',
       'SecureFiles is being used by system users');
  end;

  /*********************************
   * SecureFile Encryption (user)
   *********************************/

  begin
   dbms_feature_usage.register_db_feature
      ('SecureFile Encryption (user)',
        dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
        NULL,
        dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_SFENCRYPT_USR',
       'SecureFile Encryption is being used');
  end;

  /*********************************
   * SecureFile Encryption (system)
   *********************************/

  begin
   dbms_feature_usage.register_db_feature
      ('SecureFile Encryption (system)',
        dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
        NULL,
        dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_SFENCRYPT_SYS',
       'SecureFile Encryption is being used by system users');
  end;

  /*********************************
   * SecureFile Compression (user)
   *********************************/

  begin
   dbms_feature_usage.register_db_feature
      ('SecureFile Compression (user)',
        dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
        NULL,
        dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_SFCOMPRESS_USR',
       'SecureFile Compression is being used');
  end;

  /*********************************
   * SecureFile Compression (system)
   *********************************/

  begin
   dbms_feature_usage.register_db_feature
      ('SecureFile Compression (system)',
        dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
        NULL,
        dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_SFCOMPRESS_SYS',
       'SecureFile Compression is being used by system users');
  end;

  /*********************************
   * SecureFile Deduplication (user)
   *********************************/

  begin
    dbms_feature_usage.register_db_feature
     ('SecureFile Deduplication (user)',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_SFDEDUP_USR',
      'SecureFile Deduplication is being used');
  end;

  /*********************************
   * SecureFile Deduplication (system)
   *********************************/

  begin
    dbms_feature_usage.register_db_feature
     ('SecureFile Deduplication (system)',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_SFDEDUP_SYS',
      'SecureFile Deduplication is being used by system users');
  end;

  /******************************
   * Segment Advisor
   ******************************/

  declare
    DBFUS_SEGADV_USER_PROC CONSTANT VARCHAR2(100) := 'DBMS_FEATURE_SEGADV_USER';
  begin
    dbms_feature_usage.register_db_feature
     ('Segment Advisor (user)',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_SEGADV_USER_PROC,
      'Segment Advisor has been used. There is at least one user task executed.');
  end;

  /***********************
   * Compression
   ***********************/

  begin
   dbms_feature_usage.register_db_feature
      ('HeapCompression',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_ADV_TABCMP',
       'Heap Compression is being used');
  end;

 /******************************
   * Advanced Index Compression
   *****************************/
  begin
    dbms_feature_usage.register_db_feature
     ('Advanced Index Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_ADV_IDXCMP',
      'Advanced Index Compression is used');
  end;

/******************************
   * Index Organized Tables
   *****************************/
  begin
    dbms_feature_usage.register_db_feature
     ('Index Organized Tables',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_IOT',
      'Index Organized Tables are being used');
  end;

/******************************
   * In-Memory Column Store
   *****************************/
  begin
    dbms_feature_usage.register_db_feature
     ('In-Memory Column Store',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_IMC',
      'In-Memory Column Store is being used');
  end;


 /******************************
   * Hybrid Columnar Compression
   *****************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Hybrid Columnar Compression',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_HCC',
      'Hybrid Columnar Compression is used');
  end;

 /************************************************
   * Hybrid Columnar Compression Row Level Locking
   **********************************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Hybrid Columnar Compression Row Level Locking',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_HCCRLL',
      'Hybrid Columnar Compression Row Level Locking is used');
  end;

  /*****************************************
    * Information Lifecycle Management (ILM)
    ****************************************/

  begin
    dbms_feature_usage.register_db_feature
      ('Information Lifecycle Management',
       dbms_feature_usage.DBU_INST_OBJECT,
       'SYS.ilm$',
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_ILM',
       'Information Lifecycle Management is used');
  end;

  /*****************************************
    * Heat Map
    ****************************************/

  begin
    dbms_feature_usage.register_db_feature
      ('Heat Map',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_HEATMAP',
       'Heat Map is used');
  end;


  /******************************
    * ZFS Storage
    ******************************/
  begin
    dbms_feature_usage.register_db_feature
      ('ZFS Storage',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_ZFS_STORAGE',
       'Tablespaces stored on Oracles Sun ZFS Storage');
  end;

  /******************************
    * Pillar Storage
    ******************************/
  begin
    dbms_feature_usage.register_db_feature
      ('Pillar Storage',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_PILLAR_STORAGE',
       'Tablespaces stored on Oracles Pillar Axiom Storage');
  end;

  /******************************
    * ZFS Storage + EHCC
    *****************************/
  begin
    dbms_feature_usage.register_db_feature
      ('Sun ZFS with EHCC',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_ZFS_EHCC',
       'EHCC used on tablespaces stored on Oracles Sun ZFS Storage');
  end;

  /******************************
    * Pillar Storage + EHCC
    *****************************/
  begin
    dbms_feature_usage.register_db_feature
      ('Pillar Storage with EHCC',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_PILLAR_EHCC',
       'EHCC used on tablespaces stored on Oracles Pillar Axiom Storage');
  end;

  /******************************
   * Segment Shrink
   ******************************/

  declare
    DBFUS_SEG_SHRINK_STR CONSTANT VARCHAR2(1000) :=
      'select  count(*), 0, null ' ||
        'from  sys.seg$ s ' ||
        'where s.scanhint != 0 and ' ||
              'bitand(s.spare1, 65793) = 257 and ' ||
              's.type# in (5, 6,8) ';
  begin
    dbms_feature_usage.register_db_feature
     ('Segment Shrink',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_SEG_SHRINK_STR,
      'Segment Shrink has been used.');
  end;

  /***************************
   * Job Scheduler
   ***************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Job Scheduler',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_JOB_SCHEDULER',
      'Job Scheduler feature is being used.');
  end;

  /***************************
   * Orcle Gateways
   ***************************/

  begin
    dbms_feature_usage.register_db_feature
     ('Gateways',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_GATEWAYS',
      'Gateways feature is being used.');
  end;

  /*******************************
   * Java Virtual Machine (user)
   *******************************/

  declare
    DBFUS_OJVM_STR CONSTANT VARCHAR2(1000) :=
      'sys.dbms_java.dbms_feature_ojvm';

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Java Virtual Machine (user)',
      dbms_feature_usage.DBU_INST_OBJECT,
      'SYS.JAVA$POLICY$',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_OJVM_STR,
      'OJVM has been used by at least one non-system user');
  end;

  /*********************************
   * Java Virtual Machine (system)
   *********************************/

  declare
    DBFUS_OJVM_SYS_STR CONSTANT VARCHAR2(1000) :=
      'sys.dbms_java.dbms_feature_system_ojvm';

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle Java Virtual Machine (system)',
      dbms_feature_usage.DBU_INST_OBJECT,
      'SYS.JAVA$POLICY$',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_OJVM_SYS_STR,
      'OJVM default system users');
  end;

  /**********************
   * In-Database Hadoop
   **********************/

  begin
    dbms_feature_usage.register_db_feature
     ('Oracle In-Database Hadoop',
      dbms_feature_usage.DBU_INST_OBJECT,
      'SYS.JAVA$POLICY$',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_IDH',
      'In-Database Hadoop for running MapReduce in java');
  end;


  /************************
   * DBFS Content
   ************************/

  declare
    DBFUS_DBFS_CONTENT_PROC CONSTANT VARCHAR2(1000) :=
      'sys.dbms_feature_dbfs_content';

  begin
    dbms_feature_usage.register_db_feature
     ('DBFS Content',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_DBFS_CONTENT_PROC,
      'Oracle Database FileSystem Content feature is being used');
  end;

  /************************
   * DBFS SecureFile Store
   ************************/

  declare
    DBFUS_DBFS_SFS_PROC CONSTANT VARCHAR2(1000) :=
      'sys.dbms_feature_dbfs_sfs';

  begin
    dbms_feature_usage.register_db_feature
     ('DBFS SFS',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_DBFS_SFS_PROC,
      'Oracle Database FileSystem SecureFile Store feature is being used');
  end;

  /**************************
   * DBFS Hierarchical Store
   **************************/

  declare
    DBFUS_DBFS_HS_PROC CONSTANT VARCHAR2(1000) :=
      'sys.dbms_feature_dbfs_hs';

  begin
    dbms_feature_usage.register_db_feature
     ('DBFS HS',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_DBFS_HS_PROC,
      'Oracle Database FileSystem Hierarchical Store feature is being used');
  end;

  /******************************
   * EXADATA
   ******************************/

  declare
    DBFUS_EXADATA_PROC CONSTANT VARCHAR2(1000) := 'DBMS_FEATURE_EXADATA';

  begin
    dbms_feature_usage.register_db_feature
     ('Exadata',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_EXADATA_PROC,
      'Exadata is being used');
  end;

  /**************************
   * GSM CATALOG
   *************************/

   declare
     DBFUS_GSMCAT_STR CONSTANT VARCHAR2(1000) :=
        'select count(*), 0, NULL from gsmadmin_internal.cloud';

   begin
    dbms_feature_usage.register_db_feature
     ('GDS Catalog',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_GSMCAT_STR,
      'Database is a GDS catalog database.');
   end;

  /**************************
   * GSM GLOBAL SERVICES
   *************************/

   declare
     DBFUS_GSMGLOB_STR CONSTANT VARCHAR2(1000) :=
        'select count(*), 0, NULL from dba_services ' ||
        'where global_service = ''YES''';

   begin
    dbms_feature_usage.register_db_feature
     ('Global Data Services',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_GSMGLOB_STR,
      'Database contains global services.');
   end;


  /*************************************
   * Real Application Security
   *************************************/

  declare
    DBFUS_RAS_STR CONSTANT VARCHAR2(1000) := 'SYS.DBMS_FEATURE_RAS';

  begin
    dbms_feature_usage.register_db_feature
     ('Real Application Security',
      dbms_feature_usage.DBU_INST_OBJECT,
      'SYS.XS$OBJ',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_RAS_STR,
      'Oracle Real Application Security is being used');
  end;

  /**********************
   * Privilege Capture  *
   **********************/

  declare
    DBFUS_PRIV_CAPTURE_PROC CONSTANT VARCHAR2(1000) :=
      'SYS.DBMS_FEATURE_PRIV_CAPTURE';

  begin
    dbms_feature_usage.register_db_feature
     ('Privilege Capture',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_PRIV_CAPTURE_PROC,
      'Privilege Capture is being used');
  end;

 /****************************
   * Online Redefintion
   ****************************/

  declare
    DBFUS_ONLINE_REDEF CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_ONLINE_REDEF';

  begin
    dbms_feature_usage.register_db_feature
     ('Online Redefinition',
       dbms_feature_usage.DBU_INST_OBJECT,
      'SYS.REDEF$',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBFUS_ONLINE_REDEF,
      'Online Redefinition is being used');
  end;

  /***************************************************************
   *  In-Memory Aggregation
   ***************************************************************/

  begin
   dbms_feature_usage.register_db_feature
      ('In-Memory Aggregation',
       dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
       NULL,
       dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
       'DBMS_FEATURE_IMA',
       'In-Memory Aggregation is being used.');
  end;

  /*********************************************
   * TEST features to test the infrastructure
   *********************************************/

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_1',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select 1, 0, NULL from dual',
      'Test sql 1');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_2',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select 0, 10, to_clob(''hi, mike'') from dual',
      'Test sql 2');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_3',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select 13, NULL, to_clob(''hello, mike'') from dual',
      'Test sql 3');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_4',
      dbms_feature_usage.DBU_INST_OBJECT +
      dbms_feature_usage.DBU_INST_TEST,
      'sys.tab$',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select 11, 11, to_clob(''test sql 4 check tab$'') from dual',
      'Test sql 4');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_5',
      dbms_feature_usage.DBU_INST_OBJECT +
      dbms_feature_usage.DBU_INST_TEST,
      'sys.foo',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select 2, 0, to_clob(''check foo'') from dual',
      'Test sql 5');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_6',
      dbms_feature_usage.DBU_INST_OBJECT +
      dbms_feature_usage.DBU_INST_TEST,
      'sys.tab$',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select 0, 0, to_clob(''should not see'') from dual',
      'Test sql 6');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_7',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_NULL,
      'junk',
      'Test sql 7');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_8',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select junk from foo',
      'Test sql 8 - Test error case');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_9',
      dbms_feature_usage.DBU_INST_OBJECT +
      dbms_feature_usage.DBU_INST_TEST,
      'test.test',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select junk from foo',
      'Test sql 9 - Test error case for install');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_SQL_10',
      dbms_feature_usage.DBU_INST_OBJECT +
      dbms_feature_usage.DBU_INST_TEST,
      'sys.dbu_test_table',
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      'select count(*), count(*), max(letter) from dbu_test_table',
      'Test sql 10 - Test infrastructure');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_PROC_1',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_TEST_PROC_1',
      'Test feature 1');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_PROC_2',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_TEST_PROC_2',
      'Test feature 2');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_PROC_3',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'Junk Procedure',
      'Test feature 3 - Bad procedure name');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_PROC_4',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_TEST_PROC_4',
      'Test feature 4');

  dbms_feature_usage.register_db_feature
     ('_DBFUS_TEST_PROC_5',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED +
      dbms_feature_usage.DBU_INST_TEST,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_TEST_PROC_5',
      'Test feature 5');

  /*********************************************
   * Transparent Sensitive Data Protection (TSDP)
   ********************************************/
  begin
    dbms_feature_usage.register_db_feature
     ('Transparent Sensitive Data Protection',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_TSDP',
      'Transparent Sensitive Data Protection (TSDP)');
  end;

  /*********************************************
   * Segment Maintenance Online Compress
   ********************************************/
  begin
    dbms_feature_usage.register_db_feature
     ('Segment Maintenance Online Compress',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_SEG_MAIN_ONL_COMP',
      'Segment Maintenance Online Compress');
  end;

  /**************************
   * EM Express
   **************************/
  begin
    dbms_feature_usage.register_db_feature
     ('EM Express',
      dbms_feature_usage.DBU_INST_OBJECT,
      'sys.wri$_emx_files',
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      'DBMS_FEATURE_EMX',
      'EM Database Express has been used');
  end;

  /*********************************************
   * BA Owner
   ********************************************/
  declare
    DBMS_FEATURE_BA_OWNER_STR CONSTANT VARCHAR2(1000) :=
       'DBMS_FEATURE_BA_OWNER';
  begin
    dbms_feature_usage.register_db_feature
     ('BA Owner',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_PROCEDURE,
      DBMS_FEATURE_BA_OWNER_STR,
      'BA OWNER');
   end;

  /******************************
   * INSTANT RESTORE command
   *********************************/
  declare
    DBFUS_INSTANT_RES_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from v$rman_status' ||
        '  where operation like ''RESTORE INSTANT%'')';
  begin
    dbms_feature_usage.register_db_feature
     ('INSTANT RESTORE command',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_INSTANT_RES_STR,
      'RMAN''s INSTANT RESTORE command used by the database.');
  end;

  /******************************
   * Container Usage
   *********************************/
  declare
    DBFUS_CONTAINER_STR CONSTANT VARCHAR2(1000) :=
      'select p, NULL, NULL from ' ||
        '(select count(*) p from sys.amgrp$)';
  begin
    dbms_feature_usage.register_db_feature
     ('Container Usage',
      dbms_feature_usage.DBU_INST_ALWAYS_INSTALLED,
      NULL,
      dbms_feature_usage.DBU_DETECT_BY_SQL,
      DBFUS_CONTAINER_STR,
      'CONTAINER FILES used by backup appliance.');
  end;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_REGISTER_ALLHWM"
as
begin

  /**************************
   * User Tables
   **************************/

  declare
    HWM_USER_TABLES_STR CONSTANT VARCHAR2(1000) :=
     'select count(*) from sys.tab$ t, sys.obj$ o ' ||
       'where t.obj# = o.obj# ' ||
         'and bitand(t.property, 1) = 0 ' ||
         'and bitand(o.flags, 128) = 0 ' ||
         'and o.owner# not in (select u.user# from user$ u ' ||
                                'where u.name in (''SYS'', ''SYSTEM''))';

  begin
    dbms_feature_usage.register_high_water_mark
     ('USER_TABLES',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_USER_TABLES_STR,
      'Number of User Tables');
  end;

  /**************************
   * Segment Size
   **************************/

  declare
    HWM_SEG_SIZE_STR CONSTANT VARCHAR2(1000) :=
      'select max(bytes) from dba_segments';

  begin
    dbms_feature_usage.register_high_water_mark
     ('SEGMENT_SIZE',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_SEG_SIZE_STR,
      'Size of Largest Segment (Bytes)');
  end;

  /**************************
   * Partition Tables
   **************************/

  declare
    HWM_PART_TABLES_STR CONSTANT VARCHAR2(1000) :=
     'select nvl(max(p.partcnt), 0) from sys.partobj$ p, sys.obj$ o ' ||
       'where p.obj# = o.obj# ' ||
         'and o.type# = 2 ' ||
         'and o.owner# not in (select u.user# from user$ u ' ||
                               'where u.name in (''SYS'', ''SYSTEM'', ''SH''))';

  begin
    dbms_feature_usage.register_high_water_mark
     ('PART_TABLES',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_PART_TABLES_STR,
      'Maximum Number of Partitions belonging to an User Table');
  end;

  /**************************
   * Partition Indexes
   **************************/

  declare
    HWM_PART_INDEXES_STR CONSTANT VARCHAR2(1000) :=
     'select nvl(max(p.partcnt), 0) from sys.partobj$ p, sys.obj$ o ' ||
       'where p.obj# = o.obj# ' ||
         'and o.type# = 1 ' ||
         'and o.owner# not in (select u.user# from user$ u ' ||
                               'where u.name in (''SYS'', ''SYSTEM'', ''SH''))';

  begin
    dbms_feature_usage.register_high_water_mark
     ('PART_INDEXES',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_PART_INDEXES_STR,
      'Maximum Number of Partitions belonging to an User Index');
  end;

  /**************************
   * User Indexes
   **************************/

  declare
    HWM_USER_INDEX_STR CONSTANT VARCHAR2(1000) :=
     'select count(*) from sys.ind$ i, sys.obj$ o ' ||
       'where i.obj# = o.obj# ' ||
         'and bitand(i.flags, 4096) = 0 ' ||
         'and o.owner# not in (select u.user# from user$ u ' ||
                                'where u.name in (''SYS'', ''SYSTEM''))';

  begin
    dbms_feature_usage.register_high_water_mark
     ('USER_INDEXES',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_USER_INDEX_STR,
      'Number of User Indexes');
  end;

  /**************************
   * Sessions
   **************************/

  declare
    HWM_SESSIONS_STR CONSTANT VARCHAR2(1000) :=
      'select sessions_highwater from V$LICENSE';

  begin
    dbms_feature_usage.register_high_water_mark
     ('SESSIONS',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_SESSIONS_STR,
      'Maximum Number of Concurrent Sessions seen in the database');
  end;

  /**************************
   * DB Size
   **************************/

  declare
    HWM_DB_SIZE_STR CONSTANT VARCHAR2(1000) :=
      'select sum(bytes) from dba_data_files';

  begin
    dbms_feature_usage.register_high_water_mark
     ('DB_SIZE',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_DB_SIZE_STR,
      'Maximum Size of the Database (Bytes)');
  end;

  /**************************
   * Datafiles
   **************************/

  declare
    HWM_DATAFILES_STR CONSTANT VARCHAR2(1000) :=
      'select count(*) from dba_data_files';

  begin
    dbms_feature_usage.register_high_water_mark
     ('DATAFILES',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_DATAFILES_STR,
      'Maximum Number of Datafiles');
  end;

  /**************************
   * Tablespaces
   **************************/

  declare
    HWM_TABLESPACES_STR CONSTANT VARCHAR2(1000) :=
     'select count(*) from sys.ts$ ts ' ||
       'where ts.online$ != 3 ' ||
         'and bitand(ts.flags, 2048) != 2048';

  begin
    dbms_feature_usage.register_high_water_mark
     ('TABLESPACES',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_TABLESPACES_STR,
      'Maximum Number of Tablespaces');
  end;

  /**************************
   * CPU count
   **************************/

  declare
    HWM_CPU_COUNT_STR CONSTANT VARCHAR2(1000) :=
      'select sum(cpu_count_highwater) from gv$license';

  begin
    dbms_feature_usage.register_high_water_mark
     ('CPU_COUNT',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_CPU_COUNT_STR,
      'Maximum Number of CPUs');
  end;

  /**************************
   * Query Length
   **************************/

  declare
    HWM_QUERY_LENGTH_STR CONSTANT VARCHAR2(1000) :=
      'select max(maxquerylen) from v$undostat';

  begin
    dbms_feature_usage.register_high_water_mark
     ('QUERY_LENGTH',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_QUERY_LENGTH_STR,
      'Maximum Query Length');
  end;

  /******************************
   * National Character Set Usage
   *******************************/

  declare
    HWM_NCHAR_COLUMNS_STR CONSTANT VARCHAR2(1000) :=
      'select count(*) from col$ c, obj$ o ' ||
      ' where c.charsetform = 2 and c.obj# = o.obj# ' ||
      ' and o.owner# not in ' ||
      ' (select distinct u.user_id from all_users u, ' ||
      ' sys.ku_noexp_view k where (k.OBJ_TYPE=''USER'' and ' ||
      ' k.name=u.username) or (u.username=''SYSTEM'')) ' ;

  begin
    dbms_feature_usage.register_high_water_mark
     ('SQL_NCHAR_COLUMNS',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_NCHAR_COLUMNS_STR,
      'Maximum Number of SQL NCHAR Columns');
  end;

  /********************************
   * Instances
   *********************************/
  declare
    HWM_INSTANCES_STR CONSTANT VARCHAR2(1000) :=
      'SELECT count(*) FROM gv$instance';
  begin
    dbms_feature_usage.register_high_water_mark
     ('INSTANCES',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_INSTANCES_STR,
      'Oracle Database instances');
  end;

  /****************************
   * Materialized Views (User)
   ****************************/

  declare
    HWM_USER_MV_STR CONSTANT VARCHAR2(1000) :=
     'select count(*) from dba_mviews ' ||
       'where owner not in (''SYS'',''SYSTEM'', ''SH'')';

  begin
    dbms_feature_usage.register_high_water_mark
     ('USER_MV',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_USER_MV_STR,
      'Maximum Number of Materialized Views (User)');
  end;


  /*******************
   * Active Sessions
   *******************/

  declare
    HWM_ACTIVE_SESSIONS_STR CONSTANT VARCHAR2(1000) :=
     'select max(value) from v$sysmetric_history ' ||
       'where metric_name = ''Average Active Sessions''';

  begin
    dbms_feature_usage.register_high_water_mark
     ('ACTIVE_SESSIONS',
      dbms_feature_usage.DBU_HWM_BY_SQL,
      HWM_ACTIVE_SESSIONS_STR,
      'Maximum Number of Active Sessions seen in the system');
  end;

  /*******************
   * DBMS_SCHEDULER   HWM is number of jobs per day
   *******************/

   declare
     HWM_DBMS_SCHEDULER_STR CONSTANT VARCHAR2(1000) :=
       'select '||
         'round(max(runs*((max_id-min_id)/2 + 1)/tot),0) '||
       'from '||
         '( select '||
             'trunc(log_date) day, '||
             'max(log_id) max_id, '||
             'min(log_id) min_id, '||
             'count(log_id) tot, '||
             'count(case when operation = ''RUN'' then 1 end) runs '||
           'from '||
             'scheduler$_event_log '||
           'where '||
             'log_date > systimestamp - interval ''8'' day '||
           'group by trunc(log_date) '||
          ')' ;
   begin
     dbms_feature_usage.register_high_water_mark
      ('HWM_DBMS_SCHEDULER',
       dbms_feature_usage.DBU_HWM_BY_SQL,
       HWM_DBMS_SCHEDULER_STR,
       'Number of job runs per day');
   end;

  /*******************
   * Exadata
   *******************/

   declare
     HWM_EXADATA_STR CONSTANT VARCHAR2(1000) :=
        'select replace(substr(statistics_value, 23), ''</nphysicaldisks_stats>'') from gv$cell_state where statistics_type = ''NPHYSDISKS''';
   begin
     dbms_feature_usage.register_high_water_mark
      ('EXADATA_DISKS',
       dbms_feature_usage.DBU_HWM_BY_SQL,
       HWM_EXADATA_STR,
       'Number of physical disks');
   end;

  /************************
   * GSM Global services
   ***********************/

   declare
     HWM_GSM_STR CONSTANT VARCHAR2(1000) :=
        'select count(*) from dba_services ' ||
        'where global_service = ''YES''';
   begin
     dbms_feature_usage.register_high_water_mark
      ('GLOBAL SERVICES',
       dbms_feature_usage.DBU_HWM_BY_SQL,
       HWM_GSM_STR,
       'Number of global services');
   end;

  /**************************
   * Test HWM
   **************************/

  declare
    HWM_TEST_PROC CONSTANT VARCHAR2(1000) :=
      'DBMS_FEATURE_TEST_PROC_3';

  begin
    dbms_feature_usage.register_high_water_mark
     ('_HWM_TEST_1',
      dbms_feature_usage.DBU_HWM_BY_PROCEDURE +
      dbms_feature_usage.DBU_HWM_TEST,
      HWM_TEST_PROC,
      'Test HWM 1');
  end;

  dbms_feature_usage.register_high_water_mark
     ('_HWM_TEST_2',
      dbms_feature_usage.DBU_HWM_NULL +
      dbms_feature_usage.DBU_HWM_TEST,
      'Junk',
      'Test HWM 2');

  dbms_feature_usage.register_high_water_mark
     ('_HWM_TEST_3',
      dbms_feature_usage.DBU_HWM_BY_SQL +
      dbms_feature_usage.DBU_HWM_TEST,
      'select 10 from dual',
      'Test HWM 3');

  dbms_feature_usage.register_high_water_mark
     ('_HWM_TEST_4',
      dbms_feature_usage.DBU_HWM_BY_SQL +
      dbms_feature_usage.DBU_HWM_TEST,
      'select 1240 from foo',
      'Test HWM 4 - Error case');

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RESOURCE_MANAGER"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
  feature_usage             varchar2(1000);
  non_maint_sql             varchar2(1000);
  non_maint_usage           number;
  non_maint_cpu             number;
  non_maint_other           number;
begin

  -- Initialize all variables

  feature_boolean := 0;
  aux_count       := 0;
  feature_info    := to_clob('Resource Manager usage not detected');

  feature_usage   := NULL;
  non_maint_sql   := NULL;
  non_maint_cpu   := 0;
  non_maint_other := 0;

  -- 'feature_boolean' is set to 1 if Resource Manager was enabled, not
  -- including for maintenance windows.

  non_maint_sql :=
      'select decode(count(*), 0, 0, 1) from v$rsrc_plan_history where ' ||
      'name != ''ORA$INTERNAL_CDB_PLAN'' and ' ||
      'name != ''INTERNAL_PLAN'' and name is not null and ' ||
      '(name != ''DEFAULT_MAINTENANCE_PLAN'' or ' ||
      '  (window_name is null or ' ||
      '   (window_name != ''MONDAY_WINDOW'' and ' ||
      '    window_name != ''TUESDAY_WINDOW'' and ' ||
      '    window_name != ''WEDNESDAY_WINDOW'' and ' ||
      '    window_name != ''THURSDAY_WINDOW'' and ' ||
      '    window_name != ''FRIDAY_WINDOW'' and ' ||
      '    window_name != ''SATURDAY_WINDOW'' and ' ||
      '    window_name != ''SUNDAY_WINDOW''))) ';

  execute immediate
    non_maint_sql
  into feature_boolean;

  -- 'aux_count' is not being used

  -- 'feature_info' is constructed of the following name-value pairs:
  --   Non-Maintenance CPU Management:
  --     This field is set to 1 if Resource Manager was enabled explicitly
  --     and the Resource Plan was managing CPU.
  --   Non-Maintenance Other Management:
  --     This field is set to 1 if Resource Manager was enabled explicitly
  --     and the Resource Plan was NOT managing CPU, i.e. the Resource Plan
  --     was managing idle time, switch time, DOP, etc.

  if feature_boolean > 0
  then
    execute immediate
      non_maint_sql || ' and cpu_managed = ''ON'' '
    into non_maint_cpu;

    execute immediate
      non_maint_sql || ' and cpu_managed = ''OFF'' '
    into non_maint_other;

    feature_usage :=
      'Non-Maintenance CPU Management: ' || non_maint_cpu ||
      ', Non-Maintenance Other Management: ' || non_maint_other;

    feature_info := to_clob(feature_usage);
  end if;

end dbms_feature_resource_manager;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_BACKUP"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => FALSE,
                    encrypted   => FALSE,
                    compalg     => NULL);

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_BASIC"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => FALSE,
                    encrypted   => FALSE,
                    compalg     => 'BASIC');

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_BZIP2"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => FALSE,
                    encrypted   => FALSE,
                    compalg     => 'BZIP2');

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_DISK_BACKUP"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => TRUE,
                    nondiskonly => FALSE,
                    encrypted   => FALSE,
                    compalg     => NULL);

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_HIGH"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => FALSE,
                    encrypted   => FALSE,
                    compalg     => 'HIGH');

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_LOW"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => FALSE,
                    encrypted   => FALSE,
                    compalg     => 'LOW');

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_MEDIUM"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => FALSE,
                    encrypted   => FALSE,
                    compalg     => 'MEDIUM');

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_TAPE_BACKUP"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly    => FALSE,
                    nondiskonly => TRUE,
                    encrypted   => FALSE,
                    compalg     => NULL);

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RMAN_ZLIB"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
BEGIN

    /* assume that feature is not used. */
    feature_boolean := 0;
    aux_count := 0;
    feature_info := NULL;

    aux_count := sys.dbms_backup_restore.rman_usage(
                    diskonly => FALSE,
                    nondiskonly => FALSE,
                    encrypted => FALSE,
                    compalg => 'ZLIB');

    IF aux_count > 0 THEN
       feature_boolean := 1;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ROND"
      (is_used OUT number, aux_count OUT number, feature_info OUT clob)
AS
  is_rac_on number;
  d_type varchar2(15);
  q_status number;
  ops_enabled number;
BEGIN
  is_used := 0;
  aux_count := 0;
  feature_info := NULL;
  d_type := NULL;
  q_status := 0;
  ops_enabled := 0;

  select count(*) into ops_enabled from x$kjidt;

  if (ops_enabled > 0) then
    select kjidtv, kjidtqs into d_type, q_status from x$kjidt;
    if (q_status = 0) then
      feature_info := to_clob('Database is not in RAC');
    elsif (q_status = 1) then
      if (upper(d_type) = 'RACONENODE') then
        is_used := 1;
        feature_info := to_clob('Database is of type RACOneNode');
      elsif (upper(d_type) = 'RAC') then
        feature_info := to_clob('Database is of type RAC');
      elsif (upper(d_type) = 'SINGLE') then
        feature_info := to_clob('Database is of type SINGLE');
      end if;
    elsif (q_status = 2) then
      feature_info := to_clob('Database type query failed');
    elsif (q_status = 3) then
      feature_info := to_clob('Database type query returned warning');
    end if;
  else
    feature_info := to_clob('Database is not RAC One Node');
  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_RULESMANAGER"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_rule_clss        number := 0;
  num_comp_rulcls       number := 0;
  max_pmevt_prcmp       number := 0;
  avg_pmevt_prcmp       number := 0;
  num_cllt_evts         number := 0;
  num_pure_expcols      number := 0;
  num_domain_idxs       number;

  feature_usage         varchar2(1000);
  TYPE cursor_t         IS REF CURSOR;
  cursor_udftype        cursor_t;
  total_count           number;
  flag                  number;

begin
  --initialize
  feature_boolean := 0;
  aux_count := 0;

  /* get the number of rule classes */
  begin
    execute immediate 'select count(*) from exfsys.adm_rlmgr_rule_classes'
                          into num_rule_clss;
  exception
    when others then
       num_rule_clss := 0;
  end;

  if (num_rule_clss > 0) then
    /* get the numbers on rule classes with composite events */
    execute immediate 'select count(*), avg(prmevtprc), max(prmevtprc)
     from (select count(*) as prmevtprc from
           exfsys.adm_rlmgr_comprcls_properties
           group by rule_class_owner, rule_class_name) ' into
         num_comp_rulcls, avg_pmevt_prcmp, max_pmevt_prcmp;

    /* rule class with collection events */
    execute immediate 'select count(*) from
            exfsys.adm_rlmgr_comprcls_properties
              where collection_enb = ''Y''' into num_cllt_evts;
  end if;

  /* expression columns outside the context of rule classes */
  execute immediate 'select count(*) from exfsys.adm_expfil_expression_sets
     where not(expr_column like ''RLM$%'')' into num_pure_expcols;

  if ((num_rule_clss > 0) OR (num_comp_rulcls > 0) OR (avg_pmevt_prcmp > 0)
      OR (max_pmevt_prcmp > 0) OR (num_pure_expcols > 0)) then
    feature_boolean := 1;
    feature_usage :=
       'num of rule classes: '||to_char(num_rule_clss) ||', '||
       'num of rule classes with composite events: '||
                          to_char(num_comp_rulcls) ||', '||
       'avg num of primitive events per composite: '||
                          to_char(avg_pmevt_prcmp) ||', '||
       'max num of primitive events for a rule class: '||
                          to_char(max_pmevt_prcmp) ||', '||
       'num expression columns(user): '||
                          to_char(num_pure_expcols);
     feature_info := to_clob(feature_usage);
  else
     feature_info := to_clob(
              'Rules Manager/Expression Filter usage not detected');
  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SECUREFILES_SYS"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SECUREFILES_USR"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SEGADV_USER"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  execs_since_sample    NUMBER;               -- # of execs since last sample
  total_execs           NUMBER;               -- total # of execs
  total_recs            NUMBER;               -- total # of recommendations
  total_space_saving    NUMBER;               -- total potential space saving
  tmp_buf               VARCHAR2(32767);      -- temp buffer
BEGIN
  -- executions since last sample
  SELECT  count(*)
  INTO    execs_since_sample
  FROM    dba_advisor_executions
  WHERE   advisor_name = 'Segment Advisor' AND
          task_name not like 'SYS_AUTO_SPCADV%' AND
          execution_last_modified >= (SELECT nvl(max(last_sample_date),
                                                sysdate-7)
                                     FROM   dba_feature_usage_statistics);

  -- total # of executions
  SELECT  count(*)
  INTO    total_execs
  FROM    dba_advisor_executions
  WHERE   advisor_name = 'Segment Advisor' AND
          task_name not like 'SYS_AUTO_SPCADV%';

  -- total # of recommendations and total potential space saving
  SELECT  count(task.task_id), NVL(sum(msg.p3),0)
  INTO    total_recs, total_space_saving
  FROM    dba_advisor_tasks task,
          sys.wri$_adv_findings fin,
          sys.wri$_adv_recommendations rec,
          sys.wri$_adv_message_groups msg
  WHERE   task.advisor_name = 'Segment Advisor' AND
          task.task_name not like 'SYS_AUTO_SPCADV%' AND
          task.task_id = rec.task_id AND
          nvl(rec.annotation,0) <> 3 AND
          fin.task_id = rec.task_id AND
          fin.id = rec.finding_id AND
          msg.task_id = fin.task_id AND
          msg.id = fin.more_info_id;

  -- set feature_used and aux_count
  feature_boolean := execs_since_sample;
  aux_count := execs_since_sample;

  -- prepare feature_info
  tmp_buf := 'Executions since last sample: ' || execs_since_sample || ', ' ||
             'Total Executions: ' || total_execs || ', ' ||
             'Total Recommendations: ' || total_recs   || ', ' ||
             'Projected Space saving (byte): ' || total_space_saving;

  dbms_lob.createtemporary(feature_info, TRUE);
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

END dbms_feature_segadv_user;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SEG_MAIN_ONL_COMP"
  (isAnyFragCompressed OUT  NUMBER,
   numFragsCompressed  OUT  NUMBER,
   fragObjNumList      OUT  CLOB)
AS
  partnFragsCompressed     NUMBER;
  subpartnFragsCompressed  NUMBER;
  fragObjNumListStr        VARCHAR2(1000);

  -- select from tabpart$
  cursor tp_cursor is      select tp.obj# from sys.tabpart$ tp
                           where bitand(tp.flags, 33554432) = 33554432;

  -- select from tabsubpart$
  cursor tsp_cursor is     select tsp.obj# from sys.tabsubpart$ tsp
                           where bitand(tsp.flags, 33554432) = 33554432;
BEGIN
  -- initialize
  isAnyFragCompressed := 0;
  numFragsCompressed  := 0;
  fragObjNumListStr   := NULL;

  -- count partitions compressed through an online PMOP
  select count(*) into partnFragsCompressed
  from sys.tabpart$ where bitand(flags, 33554432) = 33554432;

  -- count subpartitions compressed through an online PMOP
  select count(*) into subpartnFragsCompressed
  from sys.tabsubpart$ where bitand(flags, 33554432) = 33554432;

  -- loop through tabpart$
  if (partnFragsCompressed > 0) then
    isAnyFragCompressed := 1;
    fragObjNumListStr   := fragObjNumListStr || 'Partition Obj# list: ';
    for ri in tp_cursor
    loop
      fragObjNumListStr := fragObjNumListStr || ri.obj# || ':';
    end loop;
    fragObjNumListStr := fragObjNumListStr || chr(10);
  end if;

  -- loop through subpart$
  if (subpartnFragsCompressed > 0) then
    isAnyFragCompressed := 1;
    fragObjNumListStr   := fragObjNumListStr || 'Subpartition Obj# list: ';
    for ri in tsp_cursor
    loop
      fragObjNumListStr := fragObjNumListStr || ri.obj# || ':';
    end loop;
  end if;

  -- populate the variables to be returned
  if (partnFragsCompressed + subpartnFragsCompressed > 0) then
    isAnyFragCompressed := 1;
    numFragsCompressed  := partnFragsCompressed + subpartnFragsCompressed;
    fragObjNumList      := to_clob(fragObjNumListStr);
  end if;

END DBMS_FEATURE_SEG_MAIN_ONL_COMP;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SERVICES"
      (is_used OUT number, hwm OUT number, feature_info OUT clob)
AS
  -- Based off dba_services
  num_clb_long                            NUMBER := 0;
  num_clb_short                           NUMBER := 0;
  num_goal_service_time                   NUMBER := 0;
  num_goal_throughput                     NUMBER := 0;
  num_goal_none                           NUMBER := 0;
  num_goal_null                           NUMBER := 0;
  num_aq_notifications                    NUMBER := 0;

  -- Based off gv$active_services
  num_active_svcs                         NUMBER := 0;
  num_active_svcs_wo_distinct             NUMBER := 0;
  avg_active_cardinality                  NUMBER := 0;

  default_service_name                    varchar2(1000);
  default_xdb_service_name                varchar2(1000);
  db_domain                               varchar2(1000);

BEGIN
  -- initialize
  is_used      := 0;
  hwm          := 0;
  feature_info := 'Services usage not detected';

  -- get default service name - db_unique_name[.db_domain]

  SELECT value INTO default_service_name FROM v$parameter WHERE
        lower(name) = 'db_unique_name';

  SELECT value INTO db_domain FROM v$parameter WHERE
        lower(name) = 'db_domain';

  -- create default XDB service name
  default_xdb_service_name := default_service_name || 'XDB';

  -- append db_domain if it is set
  IF db_domain IS NOT NULL then
    default_service_name := default_service_name || '.' || db_domain;
  END IF;

  SELECT count(*) INTO hwm
  FROM dba_services
  WHERE
      NAME NOT LIKE 'SYS$%'
  AND NETWORK_NAME NOT LIKE 'SYS$%'
  AND NAME <> default_xdb_service_name
  AND NAME <> default_service_name;

  IF hwm > 0 THEN
    is_used := 1;
  END IF;

  -- if services is used
  IF (is_used = 1) THEN

    -- Get the counts for CLB_GOAL variations
    FOR item IN (
      SELECT clb_goal, count(*) cg_count
      FROM dba_services
      where
          NAME NOT LIKE 'SYS$%'
      AND NETWORK_NAME NOT LIKE 'SYS$%'
      AND NAME <> default_xdb_service_name
      AND NAME <> default_service_name
      GROUP BY clb_goal)

    LOOP

      IF item.clb_goal = 'SHORT' THEN
        num_clb_short := item.cg_count;
      ELSIF item.clb_goal = 'LONG' THEN
        num_clb_long  := item.cg_count;
      END IF;

    END LOOP;


    -- Get the counts for GOAL variations
    FOR item IN (
      SELECT goal, count(*) g_count
      FROM dba_services
      where
          NAME NOT LIKE 'SYS$%'
      AND NETWORK_NAME NOT LIKE 'SYS$%'
      AND NAME <> default_xdb_service_name
      AND NAME <> default_service_name
      GROUP BY goal)

    LOOP

      IF item.goal = 'SERVICE_TIME' THEN
        num_goal_service_time := item.g_count;
      ELSIF item.goal = 'THROUGHPUT' THEN
        num_goal_throughput  := item.g_count;
      ELSIF item.goal = 'NONE' THEN
        num_goal_none := item.g_count;
      ELSIF item.goal is NULL THEN
        num_goal_null := item.g_count;
      END IF;

    END LOOP;

    -- count goal is NULL as goal = NONE
    num_goal_none := num_goal_none + num_goal_null;

    -- Get the count for aq_ha_notifications
    SELECT count(*) into num_aq_notifications
    FROM dba_services
    where
        NAME NOT LIKE 'SYS$%'
    AND NETWORK_NAME NOT LIKE 'SYS$%'
    AND NAME <> default_xdb_service_name
    AND NAME <> default_service_name
    AND AQ_HA_NOTIFICATIONS = 'YES';


    SELECT count(distinct name), count(*)
      INTO num_active_svcs, num_active_svcs_wo_distinct
    FROM gv$active_services
    WHERE
        NAME NOT LIKE 'SYS$%'
    AND NETWORK_NAME NOT LIKE 'SYS$%'
    AND NAME <> default_xdb_service_name
    AND NAME <> default_service_name;

    IF num_active_svcs > 0 THEN

      avg_active_cardinality :=
        round(num_active_svcs_wo_distinct / num_active_svcs);

    END IF;

    feature_info :=
        ' num_clb_long: '          || num_clb_long
      ||' num_clb_short: '         || num_clb_short
      ||' num_goal_service_time: ' || num_goal_service_time
      ||' num_goal_throughput: '   || num_goal_throughput
      ||' num_goal_none: '         || num_goal_none
      ||' num_aq_notifications: '  || num_aq_notifications
      ||' num_active_services: '   || num_active_svcs
      ||' avg_active_cardinality: '|| avg_active_cardinality;

  END IF;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SFCOMPRESS_SYS"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(l.flags, 57344), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 57344), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 57344), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SFCOMPRESS_USR"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(l.flags, 57344), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 57344), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 57344), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SFDEDUP_SYS"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(l.flags, 458752), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 458752), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 458752), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SFDEDUP_USR"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(l.flags, 458752), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 458752), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 458752), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SFENCRYPT_SYS"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(l.flags, 4096), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 4096), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 4096), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# in (select user# from user$
                         where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SFENCRYPT_USR"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_count      NUMBER;
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  -- skip internal usage by flashback archive
  select count(*) into feature_count from (
    select l.obj#, l.lobj#, l.lobj#, l.lobj#, 'U' fragtype
      from tab$ t, lob$ l, obj$ o
      where l.obj#=t.obj# and
            decode(bitand(l.property, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(l.flags, 4096), 0, 'NO', 'YES')='YES' and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select pl.tabobj#, pl.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, partlob$ pl, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 4096), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=pl.lobj# and pl.tabobj#=t.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
    union
    select l.obj#, lc.lobj#, fragobj#, parentobj#, fragtype$
      from lobfrag$ lf, lobcomppart$ lc, lob$ l, tab$ t, obj$ o
      where decode(bitand(lf.fragpro, 2048), 0, 'NO', 'YES')='YES' and
            decode(bitand(lf.fragflags, 4096), 0, 'NO', 'YES')='YES' and
            lf.parentobj#=lc.partobj# and l.lobj#=lc.lobj# and
            t.obj#=l.obj# and
            decode(bitand(t.property, 8589934592), 0, 'NO', 'YES')='NO' and
            o.obj# = t.obj# and
            o.owner# not in (select user# from user$
                             where name in ('SYS', 'SYSTEM', 'XDB'))
  );

  feature_boolean := feature_count;
  aux_count       := feature_count;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_SPD"
  (feature_boolean    OUT  NUMBER,
   aux_count          OUT  NUMBER,
   feature_info       OUT  CLOB)
AS
  NEW_LINE      CONSTANT  VARCHAR2(8) := '
';
  num_dirs                NUMBER;   -- number of directives
  plan_dir_mgmt_control   NUMBER;
  dsdir_usage_control     NUMBER;
  spd_retention_weeks     NUMBER;
  num_dir_obj             NUMBER;
  num_dir_subobj          NUMBER;
  tmp_buf                 VARCHAR2(32767);
  CURSOR spd_reason_cursor IS
    select reason c1, count(*) c2 from dba_sql_plan_directives group by reason;
  CURSOR spd_state_cursor IS
    select state c1, count(*) c2 from dba_sql_plan_directives group by state;
  CURSOR spd_type_cursor IS
    select type c1, count(*) c2 from dba_sql_plan_directives group by type;
BEGIN
  -- get total number of rows in dba_sql_plan_directives
  SELECT count(*)
  INTO num_dirs
  FROM dba_sql_plan_directives;

  dbms_lob.createtemporary(feature_info, TRUE);

  -- # of directives with each type
  for spd_type_iter in spd_type_cursor
  loop
    tmp_buf := 'Number of directives with type, '||spd_type_iter.c1||': '||
               spd_type_iter.c2 || NEW_LINE;
    dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);
  end loop;

  -- # of directives with each reason
  for spd_reason_iter in spd_reason_cursor
  loop
    tmp_buf := 'Number of Directives with reason, '||spd_reason_iter.c1||': '||
               spd_reason_iter.c2||NEW_LINE;
    dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);
  end loop;

  -- # of directives with each state
  for spd_state_iter in spd_state_cursor
  loop
    tmp_buf := 'Number of Directives with state, '||spd_state_iter.c1||': '||
               spd_state_iter.c2 || NEW_LINE;
    dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);
  end loop;

  -- # of directive objects and subobjects
  select count(object_name), count(subobject_name)
  into num_dir_obj, num_dir_subobj
  from dba_sql_plan_dir_objects;

  tmp_buf := 'Number of Directive objects: '|| num_dir_obj ||
             ', subobjects: ' || num_dir_subobj || NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- # of retention weeks
  select dbms_spd.get_prefs('SPD_RETENTION_WEEKS')
  into spd_retention_weeks
  from dual;

  tmp_buf := 'spd_retention_weeks: '||spd_retention_weeks|| NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- get value of _sql_plan_directive_mgmt_control
  select ksppstvl value
  into plan_dir_mgmt_control
  from x$ksppi x, x$ksppcv y where (x.indx = y.indx) and
  ksppinm = '_sql_plan_directive_mgmt_control';

  tmp_buf := '_sql_plan_directive_mgmt_control: ' || plan_dir_mgmt_control
             || NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- get value of _optimizer_dsdir_usage_control
  select ksppstvl value
  into dsdir_usage_control
  from x$ksppi x, x$ksppcv y where (x.indx = y.indx) and
  ksppinm = '_optimizer_dsdir_usage_control';

  tmp_buf := '_optimizer_dsdir_usage_control: ' || dsdir_usage_control ||
             NEW_LINE;
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

  -- populate the outputs if some directive mgmt operation is enabled or
  -- if there is atleast one directive.
  if (plan_dir_mgmt_control > 0 or num_dirs > 0) then
    feature_boolean := plan_dir_mgmt_control;
  else
    feature_boolean := 0;
  end if;

  aux_count := num_dirs;

END dbms_feature_spd;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_STATS_INCREMENTAL"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  im_preference      VARCHAR2(30) := 'INCREMENTAL';
  global_on          VARCHAR2(20);
  table_im_on        NUMBER;
  table_im_off       NUMBER;
  stats_gathered_im  NUMBER;
  tmp_buf            VARCHAR2(32767);
BEGIN

  /*
   * We compute the following stats for db feature usage:
   *   whether global preference of incremental maintenance turned on
   *   # of tables with table level incremental maintenance preference
   *     turned on
   *   # of tables with table level incremental maintenance preference
   *     turned off
   *   # of tables that have had stats gathered in incremental mode
   */

  --whether global preference of incremental maintenance turned on
  SELECT decode(count(*), 0, 'FALSE', 'TRUE')
  INTO   global_on
  FROM   dual
  WHERE  dbms_stats.get_prefs(im_preference) = 'TRUE';

  --# of tables with table level incremental maintenance preference
  -- turned on
  SELECT count(*)
  INTO   table_im_on
  FROM   all_tab_stat_prefs
  WHERE  PREFERENCE_NAME = im_preference and PREFERENCE_VALUE = 'TRUE';

  -- # of tables with table level incremental maintenance preference
  -- turned off
  SELECT count(*)
  INTO   table_im_off
  FROM   all_tab_stat_prefs
  WHERE  PREFERENCE_NAME = im_preference and PREFERENCE_VALUE = 'FALSE';

  -- # of tables that have had stats gathered in incremental mode
  SELECT distinct count(bo#)
  INTO   stats_gathered_im
  FROM   sys.wri$_optstat_synopsis_head$
  WHERE  analyzetime is not null;

  -- the used boolean and aux count we set to the number of execs since last
  -- sample
  feature_boolean := stats_gathered_im;
  aux_count := stats_gathered_im;

  -- compose the CLOB
  tmp_buf := 'Incremental global preference on : ' || global_on || ', ' ||
    'Number of tables with table level incremental maintenance preference ' ||
      'turned on: ' || table_im_on || ', ' ||
    'Number of tables with table level incremental maintenance preference ' ||
      'turned off: ' || table_im_off || ', ' ||
    'Number of tables that have had statistics gathered in incremental mode: ' ||
      stats_gathered_im;

  dbms_lob.createtemporary(feature_info, TRUE);
  dbms_lob.writeappend(feature_info, length(tmp_buf), tmp_buf);

END dbms_feature_stats_incremental;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_STREAMS"
      (feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_capture                             NUMBER;
  num_ds_capture                          NUMBER;
  num_apply                               NUMBER;
  num_prop                                NUMBER;
  feature_usage                           VARCHAR2(2000);
  total_feature_usage                     NUMBER;
BEGIN
  -- initialize
  feature_boolean                  := 0;
  aux_count                        := 0;
  feature_info                     := NULL;
  num_capture                      := 0;
  num_ds_capture                   := 0;
  num_apply                        := 0;
  num_prop                         := 0;
  feature_usage                    := NULL;
  total_feature_usage              := 0;

  select decode (count(*), 0, 0, 1) into num_capture
     from dba_capture
     where UPPER(purpose) NOT IN ('GOLDENGATE CAPTURE','XSTREAM_OUT');

  select decode (count(*), 0, 0, 1) into num_ds_capture
     from dba_capture
     where UPPER(purpose) NOT IN ('GOLDENGATE CAPTURE','XSTREAM_OUT')
       and UPPER(capture_type) = 'DOWNSTREAM';

  select decode (count(*), 0, 0, 1) into num_apply
     from dba_apply
     where UPPER(purpose) NOT IN ('GOLDENGATE CAPTURE','GOLDENGATE APPLY',
                                  'XSTREAM IN', 'XSTREAM OUT');

  select decode (count(*), 0, 0, 1) into num_prop from dba_propagation;

  total_feature_usage := num_capture + num_apply + num_prop;

  feature_usage := feature_usage ||
        'tcap:'                  || num_capture
      ||' dscap:'                || num_ds_capture
      ||' app:'                  || num_apply
      ||' prop:'                 || num_prop;

  feature_info   := to_clob(feature_usage);
  if (total_feature_usage > 0) THEN
      feature_boolean := 1;
  end if;
  if(num_capture > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_apply > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_prop > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;

END dbms_feature_streams;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_1"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
begin

    /* doesn't matter what I do here as long as the values get
     * returned correctly
     */
    feature_boolean := 0;
    aux_count := 12;
    feature_info := NULL;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_2"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
begin

    /* doesn't matter what I do here as long as the values get
     * returned correctly
     */
    feature_boolean := 1;
    aux_count := 33;
    feature_info := 'Extra Feature Information for TEST_PROC_2';
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_3"
  ( current_value  OUT  NUMBER)
AS
begin

    /* doesn't matter what I do here as long as the values get
     * returned correctly.
     */
    current_value := 101;
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_4"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
begin

    /* raise an application error to make sure the error is being
     * handled correctly
     */
    raise_application_error(-20020, 'Error for Test Proc 4 ');

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_5"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
begin

    /* What happens if values are not set? */
    feature_info := 'TEST PROC 5';

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_TSDP"
    (feature_boolean  OUT  NUMBER,
     aux_count        OUT  NUMBER,
     feature_info     OUT  CLOB)
AS
    feature_usage         varchar2(1000);
    num_sensitive_cols    number;
    num_policies          number;
    num_columns_protected number;
    num_sensitive_types   number;

begin
    -- initialize
    feature_boolean := 0;
    aux_count := 0;
    num_sensitive_cols := 0;
    num_policies := 0;
    num_columns_protected := 0;
    num_sensitive_types := 0;

    -- check if sensitive columns have been identified.
    execute immediate 'select count(*) from DBA_SENSITIVE_DATA'
        into num_sensitive_cols;

    -- check if Sensitive Column Types have been created.
    execute immediate 'select count(*) from DBA_SENSITIVE_COLUMN_TYPES'
            into num_sensitive_types;

    -- check if TSDP policies have been created.
    execute immediate 'select count(*) from DBA_TSDP_POLICY_FEATURE'
            into num_policies;

    -- check for protected sensitive columns.
    execute immediate 'select count(*) from DBA_TSDP_POLICY_PROTECTION'
            into num_columns_protected;

    -- Feature_usage information will contain:
    -- number of Sensitive Column Types created,
    -- number of TSDP policies created, and
    -- number of Sensitive Columns protected using TSDP.
    -- Note: Number of Sensitive Columns identified is not shown here
    --       as it is a sensitive metric.
    feature_usage :=
                'Number of Sensitive Column Types created: ' ||
                 to_char(num_sensitive_types) ||
        ', ' || 'Number of TSDP policies created: ' ||
                 to_char(num_policies) ||
        ', ' || 'Number of Sensitive Columns protected using TSDP: ' ||
                 to_char(num_columns_protected)
        ;

    -- In order to conclude that TSDP is in use, we check if
    --   atleast one Sensitive Column Type is created,
    --   OR if atleast one column identified as sensitive,
    --   OR atleast two TSDP policies exist. (Note that
    --      REDACT_AUDIT policy is created by default,
    --      and this policy cannot be dropped).
    if ((num_sensitive_cols > 0) or (num_sensitive_types > 0)
        or (num_policies > 1))
     then
       feature_boolean := 1;
       feature_info := to_clob(feature_usage);

    else
       feature_info := to_clob('Transparent Sensitive Data Protection ' ||
                               'feature not used');

    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_UNIFIED_AUDIT"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_usage         VARCHAR2(1000);
   uniaud_linkon         NUMBER;
   unified_policies      NUMBER;
   unified_policies_enb  NUMBER;
   unified_policies_cond NUMBER;
   unified_policies_dv   NUMBER;
   unified_policies_ols  NUMBER;
   unified_policies_xs   NUMBER;
   unified_policies_dp   NUMBER;
   unified_contexts      NUMBER;
BEGIN

  -- Initialize
  feature_boolean       := 0;
  aux_count             := 0;
  feature_info          := NULL;
  unified_policies      := 0;
  unified_policies_enb  := 0;
  unified_policies_cond := 0;
  unified_policies_dv   := 0;
  unified_policies_ols  := 0;
  unified_policies_xs   := 0;
  unified_policies_dp   := 0;
  unified_contexts      := 0;

  -- Check if 'uniaud_on' is linked
  select count(*) into uniaud_linkon from v$option
    where parameter like '%Unified Auditing%' and value = 'TRUE';

  -- Get number of Unified Audit policies created in the database
  select count(*) into unified_policies from aud_policy$;

  -- Get number of Unified Audit policies enabled in the database
  select count(distinct policy#) into unified_policies_enb from audit_ng$;

  -- Get number of Unified Audit policies with condition
  select count(*) into unified_policies_cond from aud_policy$
    where condition is NOT NULL;

  -- Get number of Unified Audit policies for each componenet
  FOR item IN (SELECT audit_option_type, count(distinct policy_name) pol_cnt
               FROM AUDIT_UNIFIED_POLICIES group by audit_option_type)
  LOOP
    IF (item.audit_option_type LIKE 'DV%') THEN
      unified_policies_dv := item.pol_cnt;
    ELSIF (item.audit_option_type LIKE 'OLS%') THEN
      unified_policies_ols := item.pol_cnt;
    ELSIF (item.audit_option_type LIKE 'XS%') THEN
      unified_policies_xs := item.pol_cnt;
    ELSIF (item.audit_option_type LIKE 'DATAPUMP%') THEN
      unified_policies_dp := item.pol_cnt;
    END IF;
  END LOOP;

  -- Get number of contexts enabled for audit
  select count(*) into unified_contexts from aud_context$;

  -- If 'uniaud_on' is linked, then Unified audit feature is enabled.
  -- Else if atleast a single Unified audit policy is enabled,
  --   then Unified audit feature is enabled.
  if ((uniaud_linkon > 0) OR (unified_policies_enb > 0)) then
    feature_boolean := 1;
  end if;

  feature_usage := 'Number of Unified Audit policies=' ||
                   to_char(unified_policies) || '; ' ||
                   'Number of Enabled Unified Audit policies=' ||
                   to_char(unified_policies_enb) || '; ' ||
                   'Number of Unified Audit policies with condition=' ||
                   to_char(unified_policies_cond) || '; ' ||
                   'Number of Unified Audit policies on DV=' ||
                   to_char(unified_policies_dv) || '; ' ||
                   'Number of Unified Audit policies on OLS=' ||
                   to_char(unified_policies_ols) || '; ' ||
                   'Number of Unified Audit policies on XS=' ||
                   to_char(unified_policies_xs) || '; ' ||
                   'Number of Unified Audit policies on DATAPUMP=' ||
                   to_char(unified_policies_dp) || '; ' ||
                   'Number of Enabled Unified Audit Contexts=' ||
                   to_char(unified_contexts);
  feature_info := to_clob(feature_usage);

END dbms_feature_unified_audit;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_USER_MVS"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
 num_mv         number;     -- total number of user mvs (user mvs of all types)
 num_ondmd      number;                                   -- on-demand user mvs
 num_cmplx      number;  -- complex user mvs (mvs that can't be fast refreshed)
 num_mav        number;                                          -- (user) mavs
 num_mjv        number;                                          -- (user) mjvs
 num_mav1       number;                                         -- (user) mav1s
 num_oncmt      number;                                   -- on-commit user mvs
 num_enqrw      number;                           -- rewrite enabled (user) mvs
 num_rmt        number;                                    -- remote (user) mvs
 num_pk         number;                                        -- pk (user) mvs
 num_rid        number;                                     -- rowid (user) mvs
 num_obj        number;                                    -- object (user) mvs
 num_ofprf      number;                                 -- out-of-place refresh
 num_sync       number;                                     -- sync refresh mvs
 feature_usage  varchar2(1000);
 user_mv_test   varchar2(100);

BEGIN
  -- initialize
  num_mv := 0;
  num_ondmd := 0;
  num_cmplx := 0;
  num_mav := 0;
  num_mjv := 0;
  num_mav1 := 0;
  num_oncmt := 0;
  num_enqrw := 0;
  num_rmt := 0;
  num_pk := 0;
  num_rid := 0;
  num_obj := 0;
  num_ofprf := 0;
  num_sync := 0;
  user_mv_test := ' s.sowner not in (''SYS'', ''SYSTEM'', ''SH'', ''SYSMAN'')';

  feature_boolean := 0;
  aux_count := 0;

  /* get the user mv count (user mvs of all types) */
  execute immediate 'select count(*) from dba_mviews
                     where owner not in (''SYS'', ''SYSTEM'', ''SH'', ''SYSMAN'')'
  into num_mv;

  if (num_mv > 0)
  then

    /* get number of rowid (user) mvs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 16) = 16 and' || user_mv_test
    into num_rid;

    /* get number of pk (user) mvs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 32) = 32 and' || user_mv_test
    into num_pk;

    /* get number of on-demand user mvs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 64) = 64 and' || user_mv_test
    into num_ondmd;

    /* get number of complex user mvs (mvs that can't be fast refreshed) */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 256) = 256 and' || user_mv_test
    into num_cmplx;

    /* get number of (user) mavs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 4096) = 4096 and' || user_mv_test
    into num_mav;

    /* get number of (user) mjvs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 8192) = 8192 and' || user_mv_test
    into num_mjv;

    /* get number of (user) mav1s */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 16384) = 16384 and' || user_mv_test
    into num_mav1;

    /* get number of on-commit user mvs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 32768) = 32768 and' || user_mv_test
    into num_oncmt;

    /* get number of rewrite enabled (user) mvs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 1048576) = 1048576 and' ||
                       user_mv_test
    into num_enqrw;

    /* get number of remote (user) mvs */
    execute immediate 'select count(*) from snap$ s
                       where s.mlink is not null and' || user_mv_test
    into num_rmt;

    /* get number of object (user) mvs */
    execute immediate 'select count(*) from snap$ s
                       where bitand(s.flag, 536870912) = 536870912 and' ||
                       user_mv_test
    into num_obj;

    /* get number of SyncRefresh mvs */
    execute immediate 'select sum(count#) from mv_refresh_usage_stats$
                       where refresh_method# = ''SYNC'''

    into num_sync;

    /* get number of out-of-place refreshes */
    execute immediate 'select sum(count#) from SYS.MV_REFRESH_USAGE_STATS$
                       where OUT_OF_PLACE# = ''YES'''
    into num_ofprf;

    feature_boolean := 1;

    feature_usage := 'total number of user mvs (user mvs of all types):' || to_char(num_mv) ||
          ',' || ' num of (user) mavs:' || to_char(num_mav) ||
          ',' || ' num of (user) mjvs:' || to_char(num_mjv) ||
          ',' || ' num of (user) mav1s:' || to_char(num_mav1) ||
          ',' || ' num of on-demand user mvs:' || to_char(num_ondmd) ||
          ',' || ' num of on-commit user mvs:' || to_char(num_oncmt) ||
          ',' || ' num of remote (user) mvs:' || to_char(num_rmt) ||
          ',' || ' num of pk (user) mvs:' || to_char(num_pk) ||
          ',' || ' num of rowid (user) mvs:' || to_char(num_rid) ||
          ',' || ' num of object (user) mvs:' || to_char(num_obj) ||
          ',' || ' num of rewrite enabled (user) mvs:' || to_char(num_enqrw) ||
          ',' || ' num of complex user mvs:' || to_char(num_cmplx) ||
          ',' || ' num of out-of-place refreshes:' || to_char(num_ofprf) ||
          ',' || ' num of SyncRefresh mvs:' || to_char(num_sync) ||
          '.';

    feature_info := to_clob(feature_usage);
  else
    feature_info := to_clob('User MVs do not exist.');
  end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES1"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_usage      VARCHAR2(1000) := NULL;
   feature_count      NUMBER := 0;
   compression_count  NUMBER := 0;
   compressbas_count  NUMBER := 0;
   compresslow_count  NUMBER := 0;
   compressmed_count  NUMBER := 0;
   compresshgh_count  NUMBER := 0;
   encryption_count   NUMBER := 0;
   encrypt128_count   NUMBER := 0;
   encrypt192_count   NUMBER := 0;
   encrypt256_count   NUMBER := 0;
   encryptpwd_count   NUMBER := 0;
   encryptdual_count  NUMBER := 0;
   encrypttran_count  NUMBER := 0;
   parallel_count     NUMBER := 0;
   fulltts_count      NUMBER := 0;
BEGIN
  -- initialize
  feature_info      := NULL;

  -- Select stats from ku_utluse.
  begin
    select usecnt, encryptcnt, encrypt128, encrypt192, encrypt256,
           encryptpwd, encryptdual, encrypttran, compresscnt,
           compressbas, compresslow, compressmed, compresshgh, parallelcnt,
           fullttscnt
      into feature_count, encryption_count, encrypt128_count, encrypt192_count,
           encrypt256_count, encryptpwd_count, encryptdual_count,
           encrypttran_count, compression_count, compressbas_count,
           compresslow_count, compressmed_count, compresshgh_count,
           parallel_count, fulltts_count
      from sys.ku_utluse
     where utlname = 'Oracle Utility Datapump (Export)'
       and   (last_used >=
              (SELECT nvl(max(last_sample_date), sysdate-7)
                 FROM dba_feature_usage_statistics));
  exception
    when others then
      null;
  end;

  feature_usage := feature_usage || 'Oracle Utility Datapump (Export) ' ||
                'invoked: ' || feature_count ||
                ' times, compression used: '      || compression_count ||
                ' times (BASIC algorithm used: '  || compressbas_count ||
                ' times, LOW algorithm used: '    || compresslow_count ||
                ' times, MEDIUM algorithm used: ' || compressmed_count ||
                ' times, HIGH algorithm used: '   || compresshgh_count ||
                ' times), encryption used: '      || encryption_count  ||
                ' times (AES128 algorithm used: ' || encrypt128_count  ||
                ' times, AES192 algorithm used: ' || encrypt192_count  ||
                ' times, AES256 algorithm used: ' || encrypt256_count  ||
                ' times, PASSWORD mode used: '    || encryptpwd_count  ||
                ' times, DUAL mode used: '        || encryptdual_count ||
                ' times, TRANSPARENT mode used: ' || encrypttran_count ||
                ' times), parallel used: '        || parallel_count    ||
                ' times, full transportable used: ' || fulltts_count   ||
                ' times';

  feature_info := to_clob(feature_usage);

  feature_boolean := feature_count;
  aux_count       := feature_count;
END dbms_feature_utilities1;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES2"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_usage      VARCHAR2(1000) := NULL;
   feature_count      NUMBER := 0;
   parallel_count     NUMBER := 0;
   fulltts_count      NUMBER := 0;
BEGIN
  -- initialize
  feature_info := NULL;

  begin
    select usecnt, parallelcnt, fullttscnt
      into feature_count, parallel_count, fulltts_count
      from sys.ku_utluse
     where utlname = 'Oracle Utility Datapump (Import)'
       and   (last_used >=
              (SELECT nvl(max(last_sample_date), sysdate-7)
                 FROM dba_feature_usage_statistics));
  exception
    when others then
      null;
  end;

  feature_usage := feature_usage || 'Oracle Utility Datapump (Import) ' ||
                   'invoked: ' || feature_count ||
                   ' times, parallel used: ' || parallel_count ||
                   ' times, full transportable used: ' || fulltts_count ||
                   ' times';

  feature_info := to_clob(feature_usage);

  feature_boolean := feature_count;
  aux_count       := feature_count;
END dbms_feature_utilities2;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES3"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_usage      VARCHAR2(1000) := NULL;
   feature_count      NUMBER := 0;
BEGIN
  -- initialize
  feature_info      := NULL;

  begin
    select usecnt into feature_count from sys.ku_utluse
      where utlname = 'Oracle Utility Metadata API'
       and   (last_used >=
             (SELECT nvl(max(last_sample_date), sysdate-7)
               FROM dba_feature_usage_statistics));
  exception
    when others then
      null;
  end;

  feature_boolean := feature_count;
  aux_count       := feature_count;
END dbms_feature_utilities3;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES4"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
   feature_usage      VARCHAR2(1000) := NULL;
   feature_count      NUMBER := 0;
   compression_count  NUMBER := 0;
   compressbas_count  NUMBER := 0;
   compresslow_count  NUMBER := 0;
   compressmed_count  NUMBER := 0;
   compresshgh_count  NUMBER := 0;
   encryption_count   NUMBER := 0;
BEGIN
  -- initialize
  feature_info      := NULL;

  begin
    select usecnt, encryptcnt, compresscnt, compressbas, compresslow,
           compressmed, compresshgh
      into feature_count, encryption_count, compression_count,
           compressbas_count, compresslow_count, compressmed_count,
           compresshgh_count
      from sys.ku_utluse
      where utlname = 'Oracle Utility External Table'
      and   (last_used >=
            (SELECT nvl(max(last_sample_date), sysdate-7)
               FROM dba_feature_usage_statistics));
  exception
    when others then
      null;
  end;

  feature_usage := feature_usage || 'Oracle Utility External Table ' ||
                   'invoked: ' || feature_count ||
                   ' times, compression used: '      || compression_count ||
                   ' times (BASIC algorithm used: '  || compressbas_count ||
                   ' times, LOW algorithm used: '    || compresslow_count ||
                   ' times, MEDIUM algorithm used: ' || compressmed_count ||
                   ' times, HIGH algorithm used: '   || compresshgh_count ||
                   ' times), encryption used: '      || encryption_count  ||
                   ' times';

  feature_info := to_clob(feature_usage);

  feature_boolean := feature_count;
  aux_count       := feature_count;
END dbms_feature_utilities4;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_WCR_CAPTURE"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  prev_sample_count     NUMBER;
  prev_sample_date      DATE;
  prev_sample_date_dbtz DATE;
  date_format           CONSTANT VARCHAR2(64) := 'YYYY:MM:DD HH24:MI:SS';

  captures_since     NUMBER;             -- # of captures since last sample
BEGIN

  /*
   * We compute the total number of captures done on the
   * current database by finding the number of captures done
   * since the last sample and adding it to the current aux_count.
   */

  -- Find prev_sample_count and prev_sample_date first
  select nvl(max(aux_count), 0), nvl(max(last_sample_date), sysdate-7)
  into   prev_sample_count, prev_sample_date
  from   dba_feature_usage_statistics
  where  name = 'Database Replay: Workload Capture';

  -- convert date to db timezone
  select to_date(to_char(from_tz(cast(prev_sample_date as timestamp),
         sessiontimezone) at time zone dbtimezone, date_format),
         date_format) into prev_sample_date_dbtz from dual;

  -- Find # of workload captures since last sample in current DB
  select count(*)
  into   captures_since
  from   dba_workload_captures
  where  (prev_sample_date_dbtz is null OR start_time > prev_sample_date_dbtz)
   and   dbid = (select dbid from v$database);

  -- Mark boolean to be captures_since
  feature_boolean := captures_since;
  -- Add current aux_count with captures_since for new value
  aux_count       := prev_sample_count + captures_since;
  -- Feature_info not used
  feature_info    := NULL;

END dbms_feature_wcr_capture;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_WCR_REPLAY"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  prev_sample_count     NUMBER;
  prev_sample_date      DATE;
  prev_sample_date_dbtz DATE;
  date_format           CONSTANT VARCHAR2(64) := 'YYYY:MM:DD HH24:MI:SS';

  replays_since      NUMBER;             -- # of replays since last sample
BEGIN

  /*
   * We compute the total number of replays done on the
   * current database by finding the number of replays done
   * since the last sample and adding it to the current aux_count.
   */

  -- Find prev_sample_count and prev_sample_date first
  select nvl(max(aux_count), 0), nvl(max(last_sample_date), sysdate-7)
  into   prev_sample_count, prev_sample_date
  from   dba_feature_usage_statistics
  where  name = 'Database Replay: Workload Replay';

  -- convert date to db timezone
  select to_date(to_char(from_tz(cast(prev_sample_date as timestamp),
         sessiontimezone) at time zone dbtimezone, date_format),
         date_format) into prev_sample_date_dbtz from dual;

  -- Find # of workload replays since last sample in current DB
  select count(*)
  into   replays_since
  from   dba_workload_replays
  where  (prev_sample_date_dbtz is null OR start_time > prev_sample_date_dbtz)
    and  dbid = (select dbid from v$database);

  -- Mark boolean to be replays_since
  feature_boolean := replays_since;
  -- Add current aux_count with replays_since for new value
  aux_count       := prev_sample_count + replays_since;
  -- Feature_info not used
  feature_info    := NULL;

END dbms_feature_wcr_replay;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_XDB"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_xdb_res           number := 0;
  num_xdb_rc            number := 0;
  num_xdb_acl           number := 0;
  num_xdb_schemas       number := 0;
  num_sb_tbl            number := 0;
  num_xdb_tbl           number := 0;
  num_xdb_vw            number := 0;
  num_nsb_tbl           number := 0;
  num_sb_vw             number := 0;
  num_nsb_vw            number := 0;
  num_st_or             number := 0;
  num_st_lob            number := 0;
  num_st_clob           number := 0;
  num_st_bin            number := 0;
  feature_usage         varchar2(1000);
  TYPE cursor_t         IS REF CURSOR;
  cursor_objtype        cursor_t;
  total_count           number := 0;
  flag                  number := 0;
  objtype               number := 0;

begin
    /* get number of non system resources from resource_view */
    execute immediate q'[select count(*)
    from xdb.xdb$resource e, sys.user$ u
    where to_number(utl_raw.cast_to_binary_integer(e.xmldata.ownerid)) =
        u.user# and u.name not in ('XDB', 'SYS', 'MDSYS', 'EXFSYS', 'ORDSYS',
        'ORDDATA', 'OE', 'SH', 'HR', 'SCOTT') and u.name not like 'APEX_%'
        and u.name not like 'FLOWS_%']'
        into num_xdb_res;

    /* get number of non system xml schemas registered */
    execute immediate q'[select count(*)
    from dba_xml_schemas
    where owner not in ('XDB', 'SYS', 'MDSYS', 'EXFSYS', 'ORDSYS', 'ORDDATA',
        'OE', 'SH', 'HR', 'SCOTT') and owner not like 'APEX_%'
     and owner not like 'FLOWS_%']' into num_xdb_schemas ;

    /* count non system, SB and NSB xml columns */
       OPEN cursor_objtype FOR q'[
             select count(*), o.type#, bitand(p.flags, 2)
             from sys.opqtype$ p, sys.obj$ o, sys.user$ u
             where o.obj# = p.obj# and p.type = 1 and
                   (o.type# = 2 or o.type# = 4) and
                   o.owner# = u.user# and
                   u.name not in ('XDB', 'SYS', 'MDSYS', 'EXFSYS', 'ORDSYS',
                                  'ORDDATA', 'OE', 'SH', 'HR', 'SCOTT') and
                   u.name not like 'APEX_%'
                   and u.name not like 'FLOWS_%'
             group by (bitand(p.flags, 2), o.type#)]';

        LOOP
          BEGIN
            FETCH cursor_objtype INTO total_count, objtype, flag;
            EXIT WHEN cursor_objtype%NOTFOUND;


            /* get number of non schema based tables */
            IF (flag = 0) and (objtype = 2) THEN
              num_nsb_tbl := total_count;
            END IF;

            /* get number of non shema based views */
            IF (flag = 0) and (objtype = 4) THEN
              num_nsb_vw := total_count;
            END IF;

            /* get number of schema based tables */
            IF (flag = 2) and (objtype = 2) THEN
              num_sb_tbl := total_count;
            END IF;

            /* get number of schema based views */
            IF (flag = 2) and (objtype = 4) THEN
              num_sb_vw := total_count;
            END IF;
          END;
        END LOOP;


    num_xdb_vw := num_nsb_vw + num_sb_vw;
    num_xdb_tbl := num_nsb_tbl + num_sb_tbl;

    if (num_xdb_res > 0) or (num_xdb_schemas > 0) or
        (num_xdb_vw > 0) or (num_xdb_tbl > 0) then

        /* xdb is being used by user */
        OPEN cursor_objtype FOR q'[
             select count(*), bitand(p.flags, 69)
             from sys.opqtype$ p, sys.user$ u, sys.obj$ o
             where p.type = 1 and
                  (bitand(p.flags, 1) = 1 or bitand(p.flags, 4) = 4 or
                   bitand(p.flags, 68) = 68) and
                  p.obj# = o.obj# and
                  o.owner# = u.user# and
                  u.name not in ('XDB', 'SYS', 'MDSYS', 'EXFSYS', 'ORDSYS',
                                'ORDDATA', 'OE', 'SH', 'HR', 'SCOTT') and
                  u.name not like 'APEX_%'
                  and u.name not like 'FLOWS_%'
             group by (bitand(p.flags, 69))]';

        LOOP
          BEGIN
            FETCH cursor_objtype INTO total_count, flag;
            EXIT WHEN cursor_objtype%NOTFOUND;

            /* get number of xmltype columns stored as object */
            IF flag = 1 THEN
              num_st_or := total_count;
            END IF;

            /* get number of xmltype columns stored as lob */
            IF flag = 4 THEN
              num_st_clob := total_count;
            END IF;

            /* get number of xmltype columns stored as binary */
            IF flag = 68 THEN
              num_st_bin := total_count;
            END IF;
          END;
        END LOOP;

        /* get number of resconfigs */
        execute immediate 'select count(*) from xdb.xdb$resconfig' into
                                                        num_xdb_rc;
        /* get number of acls */
        execute immediate 'select count(*) from xdb.xdb$acl' into
                                                        num_xdb_acl;


        feature_boolean := 1;
        aux_count := 0;

        feature_usage := chr(10) ||
           '<xdb_feature_usage>'||
                chr(10)||chr(32)||chr(32)||
                '<user_resources>       '|| to_char(num_xdb_res)  ||
                ' </user_resources>'||
                chr(10) ||chr(32)||chr(32)||
                '<user_schemas>         '|| to_char(num_xdb_schemas) ||
                ' </user_schemas>'||
                chr(10)||chr(32)||chr(32)||
                '<user_SB_columns>      '|| to_char(num_sb_tbl)   ||
                ' </user_SB_columns>'||
                chr(10)||chr(32)||chr(32)||
                '<user_NSB_columns>     '|| to_char(num_nsb_tbl)  ||
                ' </user_NSB_columns>'||
                chr(10)||chr(32)||chr(32)||
                '<user_SB_views>        '|| to_char(num_sb_vw)    ||
                ' </user_SB_views>'||
                chr(10)||chr(32)||chr(32)||
                '<user_NSB_views>       '|| to_char(num_nsb_vw)   ||
                ' </user_NSB_views>'||
                chr(10)||chr(32)||chr(32)||
                '<user_OR_cols>         '|| to_char(num_st_or)    ||
                ' </user_OR_cols>'||
                chr(10)||chr(32)||chr(32)||
                '<user_CLOB_cols>       '|| to_char(num_st_clob)  ||
                ' </user_CLOB_cols>'||
                chr(10)||chr(32)||chr(32)||
                '<user_BINARY_cols>     '|| to_char(num_st_bin)   ||
                ' </user_BINARY_cols>'||
                chr(10)||chr(32)||chr(32)||
                '<all_resconfigs>       '|| to_char(num_xdb_rc)   ||
                ' </all_resconfigs>'||
                chr(10)||chr(32)||chr(32)||
                '<all_acls>             '|| to_char(num_xdb_acl)  ||
                ' </all_acls>'||
                chr(10) ||
           '</xdb_feature_usage>';

        feature_info := to_clob(feature_usage);
    else
        feature_boolean := 0;
        aux_count := 0;
        feature_info :=
            to_clob('<xdb_feature_usage>SYSTEM</xdb_feature_usage>');
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_XSTREAM_IN"
      (feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_apply                               NUMBER;
  feature_usage                           VARCHAR2(2000);
BEGIN
  -- initialize
  feature_boolean                  := 0;
  aux_count                        := 0;
  feature_info                     := NULL;
  num_apply                        := 0;
  feature_usage                    := NULL;

  select decode (count(*), 0, 0, 1) into num_apply
     from dba_apply where UPPER(purpose) = 'XSTREAM IN';

  feature_usage := feature_usage ||
        'app:'                   || num_apply;

  feature_info   := to_clob(feature_usage);
  if (num_apply > 0) THEN
      feature_boolean := 1;
      aux_count      :=  aux_count+1;
  end if;

END dbms_feature_xstream_in;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_XSTREAM_OUT"
      (feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_capture                             NUMBER;
  num_ds_capture                          NUMBER;
  num_apply                               NUMBER;
  feature_usage                           VARCHAR2(2000);
  total_feature_usage                     NUMBER;
BEGIN
  -- initialize
  feature_boolean                  := 0;
  aux_count                        := 0;
  feature_info                     := NULL;
  num_capture                      := 0;
  num_ds_capture                   := 0;
  num_apply                        := 0;
  feature_usage                    := NULL;
  total_feature_usage              := 0;

  select decode (count(*), 0, 0, 1) into num_capture
     from dba_capture where UPPER(purpose) = 'XSTREAM OUT';

  select decode (count(*), 0, 0, 1) into num_ds_capture
     from dba_capture where UPPER(purpose) = 'XSTREAM OUT' and
                            UPPER(capture_type) = 'DOWNSTREAM';

  select decode (count(*), 0, 0, 1) into num_apply
     from dba_apply where UPPER(purpose) = 'XSTREAM OUT';


  total_feature_usage := num_capture + num_apply;

  feature_usage := feature_usage ||
        'tcap:'                  || num_capture
      ||' dscap:'                || num_ds_capture
      ||' app:'                  || num_apply;

  feature_info   := to_clob(feature_usage);
  if (total_feature_usage > 0) THEN
      feature_boolean := 1;
  end if;
  if(num_capture > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_apply > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;

END dbms_feature_xstream_out;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_XSTREAM_STREAMS"
      (feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  num_capture                             NUMBER;
  num_ds_capture                          NUMBER;
  num_apply                               NUMBER;
  num_prop                                NUMBER;
  feature_usage                           VARCHAR2(2000);
  total_feature_usage                     NUMBER;
BEGIN
  -- initialize
  feature_boolean                  := 0;
  aux_count                        := 0;
  feature_info                     := NULL;
  num_capture                      := 0;
  num_ds_capture                   := 0;
  num_apply                        := 0;
  num_prop                         := 0;
  feature_usage                    := NULL;
  total_feature_usage              := 0;

  select decode (count(*), 0, 0, 1) into num_capture
     from dba_capture where UPPER(purpose) = 'XSTREAM STREAMS';

  select decode (count(*), 0, 0, 1) into num_ds_capture
     from dba_capture where UPPER(purpose) = 'XSTREAM STREAMS' and
                            UPPER(capture_type) = 'DOWNSTREAM';

  select decode (count(*), 0, 0, 1) into num_apply
     from dba_apply where UPPER(purpose) = 'XSTREAM STREAMS';

  select decode (count(*), 0, 0, 1) into num_prop from dba_propagation;

  total_feature_usage := num_capture + num_apply + num_prop;

  feature_usage := feature_usage ||
        'tcap:'                  || num_capture
      ||' dscap:'                || num_ds_capture
      ||' app:'                  || num_apply
      ||' prop:'                 || num_prop;

  feature_info   := to_clob(feature_usage);
  if (total_feature_usage > 0) THEN
      feature_boolean := 1;
  end if;
  if(num_capture > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_apply > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;
  if(num_prop > 0 ) THEN
       aux_count      :=  aux_count+1;
  end if;

END dbms_feature_xstream_streams;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ZFS_EHCC"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  feature_count NUMBER;
  feature_usage         varchar2(1000);
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  execute immediate 'select value from v$sysstat' ||
    ' where name like ''EHCC Used on ZFS Tablespace'''
    into feature_count;

  feature_usage := 'EHCC on ZFS: ' || to_char(feature_count);
  feature_info := to_clob(feature_usage);

  if (feature_count > 0) then
    feature_boolean := 1;
  else
    feature_boolean := 0;
  end if;
  aux_count       := feature_count;
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ZFS_STORAGE"
     ( feature_boolean  OUT  NUMBER,
       aux_count        OUT  NUMBER,
       feature_info     OUT  CLOB)
AS
  feature_count NUMBER;
  tsn           NUMBER;
  stortype      NUMBER;
  TYPE cursor_t         IS REF CURSOR;
  cursor_objtype        cursor_t;
  feature_usage         varchar2(1000);
BEGIN
  -- initialize
  feature_info      := NULL;
  feature_count     := 0;

  OPEN cursor_objtype FOR q'[select ts# from sys.ts$]';

  LOOP
    BEGIN
      FETCH cursor_objtype INTO tsn;
      EXIT WHEN cursor_objtype%NOTFOUND;
      kdzstoragetype(tsn, stortype);
      IF (stortype = 1) THEN
        feature_count := feature_count + 1;
      END IF;
    END;
  END LOOP;

  feature_usage := 'TS on ZFS: ' || to_char(feature_count);
  feature_info := to_clob(feature_usage);

  if (feature_count > 0) then
    feature_boolean := 1;
  else
    feature_boolean := 0;
  end if;
  aux_count       := feature_count;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_FEATURE_ZMAP"
      (is_used OUT number, zmap_ratio OUT number, clob_rest OUT clob)
AS
BEGIN
  -- initialize
  is_used := 0;
  zmap_ratio := 0;
  clob_rest := '{ "data": [';

FOR crec IN (SELECT
       -- zone map existent
       DECODE(xx.sumobj#,NULL,'N','Y') zmap_used,
       '{ ' ||
       -- zone map existent
       CASE WHEN xx.sumobj# IS NOT NULL THEN
         '"zmap": { '       ||
--         '"zmap":"'       || DECODE(xx.sumobj#,NULL,'N','Y')  ||'",' ||
         '"zm_w_attrcl":"' || DECODE(bitand(xx.cflags,8),8,'Y','N') ||'",' ||
         '"joined_zmap":"' || DECODE(bitand(xx.xpflags,137438953472),137438953472,'Y','N') || '",' ||
         '"zm_scale":'     || zmapscale     || ','||
         '"num_joins":'    || numjoins      || ','||
         '"num_tabs":'     || numdetailtab  || ','||
         '"num_cols":'     || (numaggregates - numjoins-1)/2 || ','||
         '"refresh_mode":"'|| DECODE(bitand(mflags,65536),65536,'C',
                                     DECODE(bitand(mflags,34359738368+68719476736),34359738368+68719476736,'L+M',
                                            34359738368,'L', 68719476736,'M','D'))    || '",'||
         '"disabled":"'    || DECODE(bitand(mflags,4),4,'Y','N')                      || '",'||
         '"unusable":"'    || DECODE(bitand(mflags,17179869184),17179869184,'Y','N')  || '",'||
         '"invalid":"'     || DECODE(bitand(mflags,64),64,'Y','N')                    || '",'||
         '"stale":"'       || DECODE(bitand(mflags,16+32),0,'Y','N')                  || '"},'
       END ||
       -- attribute clustering existent
       CASE WHEN xx.clstobj# IS NOT NULL THEN
         '"attrcl":{ '      ||
--         '"attrcl":"'      || DECODE(xx.clstobj#,NULL,'N','Y') ||'",' ||
         '"clst_type":"'    || DECODE(clstfunc,1,'I','L')                                 || '",'||
         '"clst_mode":"'    || DECODE(bitand(xx.cflags,1+2),1+2,'L+M',1,'L',2,'M','OFF')  || '",'||
         '"clst_dim":'      || (SELECT COUNT(*) FROM clstdimension$ d
                                WHERE d.clstobj#(+)=xx.clstobj#)                          || ','||
         '"clst_grp":'     || (SELECT COUNT(DISTINCT groupid) FROM clstkey$ k
                                       WHERE k.clstobj#(+)=xx.clstobj#)                   || ','||
         '"clst_cols":'     || (SELECT COUNT(*) FROM clstkey$ k
                                        WHERE k.clstobj#(+)=xx.clstobj#)                  || ','||
         '"clst_invalid":"' || DECODE(bitand(xx.flags,4),4,'Y','N')                       || '"},'
       END ||
       '"tab":{'    ||
       CASE
       WHEN bitand(xx.property,32) = 32 THEN
         '"parttab":"Y"'
       -- nonpartitioned tables with existing segments
       WHEN s.block# IS NOT NULL THEN
          '"parttab":"N",' ||
           '"imc_prio":"'      ||
           DECODE(bitand(s.spare1, 4294967296), 4294967296,
                 DECODE(bitand(s.spare1, 34359738368), 34359738368,
                        DECODE(bitand(s.spare1, 3848290697216), 549755813888,'LOW',
                                                               1099511627776,'MEDIUM',
                                                               2199023255552,'HIGH',
                                                               3298534883328,'CRITICAL','NONE'),'NONE'),'-')  || '",'||
          '"imc_dist":"'       ||
          DECODE(bitand(s.spare1, 4294967296), 4294967296,
                 DECODE(bitand(s.spare1, 8589934592),0,'DUPLICATE','AUTO DIST'),'-')                          || '",'||
          '"imc_comp":"'       ||
          DECODE(bitand(s.spare1, 4294967296), 4294967296,
                 DECODE(bitand(s.spare1, 274877906944), 0,
                       DECODE(bitand(s.spare1,17179869184),0,'BASIC','QUERY'),
                              DECODE(bitand(s.spare1,17179869184),0,'CAP LOW','CAP HIGH')),'-') ||'"'
          ELSE
          '"parttab":"N"'
      END
      || '} }' zmap_obj
FROM (SELECT *
      FROM (SELECT sumobj#, clstobj#, detailobj#, mflags, c.flags as cflags, clstfunc, numjoins,
                   numaggregates, numdetailtab, zmapscale, xpflags
            FROM ( SELECT sumobj#, detailobj#, mflags, numjoins, numaggregates, numdetailtab,
                          zmapscale, xpflags
                   FROM sum$ s
                            RIGHT OUTER JOIN sumdetail$ sd
                            ON (s.obj# = sd.sumobj#)
                            WHERE bitand(s.xpflags,34359738368)=34359738368
                            AND bitand(sd.flags,2) = 2
                  ) zm
            -- to accommodate either-or for zone maps or attribute clustering
            FULL OUTER JOIN clst$ c
            ON (zm.detailobj# = c.clstobj#)
            ) x
            JOIN tab$ t
            ON (t.obj#=DECODE(x.clstobj#,NULL,x.detailobj#,x.clstobj#))
     ) xx
     -- needed for deferred segments and partitioned objects
     LEFT OUTER JOIN seg$ s
     ON (xx.file#  = s.file#
     AND xx.block# = s.block#
     AND xx.ts#    = s.ts#)) loop

     IF (is_used = 0 AND crec.zmap_used= 'Y') THEN
       is_used:=1;
     END IF;

 clob_rest := clob_rest || crec.zmap_obj ||', ';
 END LOOP;

 clob_rest := substr(clob_rest,1,length(clob_rest)-2) ||' ] }';

   IF (is_used = 1) THEN
      -- ratio of tables with zone maps versus total # of tables in percent
      SELECT (COUNT(detailobj#)/COUNT(obj#))*100 INTO zmap_ratio
      FROM ( SELECT detailobj#
             FROM sum$ s
             JOIN sumdetail$ sd
       ON (s.obj# = sd.sumobj#)
       WHERE bitand(s.xpflags,34359738368)=34359738368
       AND bitand(sd.flags,2) = 2
       ) zm
      RIGHT OUTER JOIN tab$ t
      ON (t.obj#=zm.detailobj#);
   END IF;

 END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_LOGMNR_FFVTOLOGMNRT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
6ced 1913
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
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_PDB_EXEC_SQL" (sql_stmt varchar2)
as
begin
  dbms_pdb.exec_as_oracle_script(sql_stmt);
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."DBMS_PDB_NUM"
     ( feature_boolean  OUT NUMBER,
       aux_count        OUT NUMBER,
       feature_info     OUT CLOB)
AS
begin
  feature_boolean := 0;
  aux_count := 0;
  feature_info := NULL;

  select count(*) into feature_boolean from v$database where cdb = 'YES';
  if (feature_boolean = 1) then
    select count(*) into aux_count from v$pdbs where con_id > 2;
  end if;

end dbms_pdb_num;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."KDZSTORAGETYPE" (tsn IN number, type out NUMBER) as
  LANGUAGE C
  NAME "kdzstoragetype"
  LIBRARY DBMS_STORAGE_TYPE_LIB
  with context
  PARAMETERS (context, tsn OCINumber, type OCINumber);
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOAD_UNDO_STAT" (qlen IN NUMBER, ubks IN NUMBER)
IS
  loadsql varchar2(1024);
  val     number;
  cid     number;
  rows    integer;
BEGIN
  val := ubks * 100000 + qlen + 100;
  loadsql := 'alter system set "_undo_debug_usage" = ' || val;
  dbms_output.put_line(loadsql);
  cid := dbms_sql.open_cursor;
  dbms_sql.parse(cid, loadsql, dbms_sql.native);
  rows := dbms_sql.execute(cid);
  dbms_sql.close_cursor(cid);
END load_undo_stat;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOGMNR$ALWAYSSUPLOG_PROC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
348a f10
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
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOGMNR_DDL_TRIGGER_PROC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1022 66a
S/Q5vnuX3N2/3SFqoIA8GOzkPMcwg9fqHiBmeC+7F/kY99P0Q6DpXVIpbCGNR7mmBVbfgavx
z8JTmfDA1wLjDk1JQ9C7tPibFUDvJsMybIczNMF4KNQJNgTcFBVzBjMFagmaaGgePZu5M5+8
d9DZlZxgiSGmjh6VFiOdTvrnfT2EMTLcsBaxrsYJX8zlHoFOP0c5vVewHzCQ+jKulpN2Sftb
TW6HhSmNyy14iH18Xw3xs3CpCcc3CebKMFEE6lBtV7exewaeKW///+5dU5ln5KeUsIU98356
us4oSj+tKpLGWeVa6awLTTt4g1O+8E59SxPZSfmoDNLj8MbzLAQ/eawtTE7u+rCGjNDGLK5F
QCRv1vOcgyOlhLfQO/o4jhakroakNOTDUAdNVI66YXnF3EVjLn+IAY1+JTJ+m2yZae94zJmy
WC9/ZUi5+FbcUFAUqmncCJdTbzNg9N8YhBtqYchZx9/mpID0JZdQqxFfhhSxC0ro23wJfAFl
BGVCfaSfe5CngfTTK7Ats2o12/3fKswsX28eIu7MCh5/Fa0heewTZ0AhfuR6hI1xSd7L46mV
ngG3dThzGxR+IboOQIX9p61bKpNwc4zSSWocmdGDHcNAXO5at83PqXtE7bGsSJcTvLA4LUZ5
9FYUFjDRFuTye9hOPCpkqa+tbIVGPce9c+EbO0cZdGI92PdV8tx8jRh6FPr2q3aPfl7D8VyB
zQ7RsepsMnmfC/X3RpwJQrnMl7TQ4NL96c14D94/F0vO5DKBc1JIm72WlioEQkJS26ChEARq
VbZHHPJA4Y7SmL1t0uhd5YWOnG7l1C9heJTsq4XxkhuAE1jMF9fxBRVQoxflufJCQoGNFBDh
MjbzB9afE7bC21N8I79VXdiy8FIb6u7pOwlt+tj3kENh8X00Z9e3cF834bPoWoo60lhp2tSE
LMPaLN+LmKR8iJkqW+5K0ZqQVD8yaTr/z5e0+AlfqXplq/41zjP4FDW+KLfSWy2K1peFlgda
C4mKgj5o79tZVgiHMXqb5cLRLzX82dTtEROiajrJm3haSQ0aPuPflfJ2vQIpeYlQcPCGq+VX
Bh8r5YThlKuhZhFw6+eFGE7F3S1YbfDgdwH77t0Cy1jgRZYbNKNN3g+HZJvC280NasrMLhSa
iiIC1LVLYlRXncRGCgBqoHXtNJ1TEiuDYiKqEBlTkKM64nTC/FK8cRCWFgKIFCW61jADTr8z
IU6e2Hf95B7+fko83IVocGSfCSvIfe3CJ5ReAdctI5srjFlpc5tcjRdtmmRjfg0JOMsanzqF
/bPfkbyZ7GTWtrkcQR+qVQBoFeuKQuK9Z5Ip2YQxOgq9xHlW/bNvGvuZQLTctI5ih94PCNyu
cycf129YKxnC3hOSLL7PA88hh51qhmlK8OuHHZ/P3K6vB5Am1X9oWNmgj3jILLw3YYXv2Cpc
SeA9GUi6RQ7DlxrsUEwz9CwBkJXDRyqTtaU3Vo1ul/N9HvYEzsefvySdNz0VrKa81+oDEzEn
YPgrTkwbiQWXNwM7BHHr6crmRg+q1k8oStqA9vdNVSWQnUENDCOoaB40YXsg+P6YYcSwTvHp
vUUlsQfJ90P1RAzVFfdZYiF9+dIoAoQZ1g==
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOGMNR_GTLO3" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
60e6 1473
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
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOGMNR_KRVRDA_TEST_APPLY" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
4a1 284
eLkbCN7twvLblQcYhcJAXOQTAhYwg41eLq79fy/NrZ3gy3bxnwLxqU3hGvG/AMiUmJ9L7UZu
VhorAIlhFsoU+RDGLB4u5iuUItiKEE7UgnJOp/Jvhf0Cpc7+wbsk/fj2TkU6+XAPP3qdtAew
sMbE7qYOjo004gIn8twSLy6QjJd6Dpn3grKmW6mNoxymjsDebxidWxazO1fbhZOHVdKm9tb4
qX50utEKKs55NmD1q89wfy5YR/KrQmUCS54+oDhR1+fBx1eQ/9wXFw+wAwNtYR4EduBomuxV
sJqkx4rKJfuIxDSHuzXWdmQM9wklcmGJcpBhD/H5oqZQVDg45BBq0atExD4iHON/ZuL3Ld9m
Dz6TmOGBo/3Y0GoSuodvQKPfMKKoCkTFsDLbaHxHxIBqH8yHlfGdDRATREWZWhCpO8Rrpxvc
4dj1BnH5T4JKdnSluZuyNpRXb/GGS8jwfITiScZIin5QEomvV9a9EIyezUQiN+pRrjkOwyLF
4+7TIPotClt8r1vIPIfzIt9C7hAR/sOoeWj+OSMD15jutLKOv1xprxJWDEj9AmWsTiM+XbxW
OnzMbkn4Pl3Z2AMRgFHWLI7FE0ACYUi2KjTMvxiC9mn9HixdBuskG6EvkA==
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOGMNR_KRVRDLUID3" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
bd23 2f6e
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
ZToM0hub98quObWBtZ3+MJg=
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOGMNR_KRVRDREPDICT3" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
53c 2ee
7YcIqeTqFGOXZvuqxQ5PXFW2I+IwgwLDTCCDfI5Vgp0GIsOeEZNc2xryAZBdtB9L/LRYJA4Q
wugV36DmsNhMD5KGF9MdoUBF+I+FvMbBP24ejqPMkdzveno/mn4MtQPkXtHZPWRDkvned7s1
fGvovncZUou+dPgn99FyabCUZ+9eGf8h8asIKKZsTkDyT/NO33BrbdFwUIboFSGbtPiP/KvR
1A2cewBGEQ14e6Cjad7uGtC+ep1Ofsa06IoBV0PC4YFRpKw2NtnAhtcfUuKeiSJuq5Q+KEGs
EdZz/GBMC7HxmgoHPXO2tE4LOEk3pTvPaKm+gvMW2K6PgQ2MDFdaNGwxiLTrVpYkK0PllLLi
7sWX+TSHkoFvvEicaSK8fk94r3hZ3Ek/FlI/vdbcPYgo8v/0ixS2tGQYBxqkFKEFWL8+BNxT
oq6NuL5fjmqLkDCo/IPDHSD3e7rG8BYiN6jPks/bWVAlWCicLrId2oQxHsNgAmUEMnnCAr1p
Qv/NP7C9eOcJQmBWCLZDFP27W3tGucMrnI6D73a8zLSqA7TBUKtyI79u06qMwez0Z9r8SQIv
VtJzZgDcz4K4g0IVsDJkO3On6//rpF+o6A26cfOSrJgaVovwr9odH+8EoHzzkScVND2aKMhS
DBQe6gWO0VulHCJgzuBA7upDg4Jo7OhIB6Wn4Di+8bgayA6sfYPDJbtyDdNm79LobHlwtD4x
ik3UrFIngIa/qvtl8CQO
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."LOGMNR_RMT_BLD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
20b2 bb5
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
dFsF
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIANYDATADUMP" (ad IN SYS.AnyData)
IS
 BEGIN
  IF ad IS NOT NULL THEN
    CASE ad.gettypeName
      WHEN 'SYS.BINARY_DOUBLE' THEN
        dbms_output.put_line(ad.AccessBDouble());
      WHEN 'SYS.BINARY_FLOAT' THEN
        dbms_output.put_line(ad.AccessBFloat());
      WHEN 'SYS.CHAR' THEN
        dbms_output.put_line(ad.AccessChar());
      WHEN 'SYS.DATE' THEN
        dbms_output.put_line(ad.AccessDate());
      WHEN 'SYS.INTERVALYM' THEN
        dbms_output.put_line(ad.AccessIntervalYM());
      WHEN 'SYS.INTERVALDS' THEN
        dbms_output.put_line(ad.AccessIntervalDS());
      WHEN 'SYS.NCHAR' THEN
        dbms_output.put_line(ad.AccessNChar());
      WHEN 'SYS.NUMBER' THEN
        dbms_output.put_line(ad.AccessNumber());
      WHEN 'SYS.TIMESTAMP' THEN
        dbms_output.put_line(ad.AccessTimeStamp());
      WHEN 'SYS.TIMESTAMPLTZ' THEN
        dbms_output.put_line(ad.AccessTimeStampLTZ());
      WHEN 'SYS.TIMESTAMPTZ' THEN
        dbms_output.put_line(ad.AccessTimeStampTZ());
      WHEN 'SYS.NVARCHAR2' THEN
        dbms_output.put_line(ad.AccessNVarchar2());
      WHEN 'SYS.VARCHAR' THEN
        dbms_output.put_line(ad.AccessVarchar());
      WHEN 'SYS.VARCHAR2' THEN
        dbms_output.put_line(ad.AccessVarchar2());
      WHEN 'SYS.RAW' THEN
        dbms_output.put_line('Raw Datatype');
      ELSE
        dbms_output.put_line('NOT a Scalar Type in AnyData');
    END CASE;
  END IF;
 END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCICOLINFODUMP" (ci ODCIColInfo) IS
  col NUMBER;
BEGIN
  if ci is null then
   dbms_output.put_line('ODCIColInfo is null');
   return;
  end if;

  dbms_output.put_line('ODCIColInfo');
  dbms_output.put_line('Table owner : ' || ci.TableSchema);
  dbms_output.put_line('Table name : ' || ci.TableName);
  if (ci.TablePartition is not null) then
    dbms_output.put_line('Table partition name : ' || ci.TablePartition);
  end if;

  dbms_output.put_line('Column name: '|| ci.ColName);
  dbms_output.put_line('Column type :'|| ci.ColTypeName);
  dbms_output.put_line('Column type schema:'|| ci.ColTypeSchema);

  if (ci.ColInfoFlags != 0) then
       ODCIColInfoFlagsDump(ci.ColInfoFlags);
  end if;

  if (ci.OrderByPosition > 0) then
    dbms_output.put_line('Indexed column position in order by: '||
                           ci.OrderByPosition);
  end if;

  if (ci.TablePartitionTotal > 1) then
    dbms_output.put_line(' Total number of table partitions : ' ||
             ci.TablePartitionTotal);
  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCICOLINFOFLAGSDUMP" (op NUMBER) IS
BEGIN
   IF (bitand(op, ODCIConst.CompFilterByCol) = ODCIConst.CompFilterByCol) THEN
     dbms_output.put_line('ColInfoFlags : Filter By Column');
   END IF;

   IF (bitand(op, ODCIConst.CompOrderByCol) = ODCIConst.CompOrderByCol) THEN
     IF (bitand(op, ODCIConst.CompOrderDscCol) = ODCIConst.CompOrderDscCol)
          THEN
       dbms_output.put_line('ColInfoFlags : Order By Desc Column');
     ELSE
       dbms_output.put_line('ColInfoFlags : Order By Asc Column');
     END IF;
   END IF;

   IF (bitand(op, ODCIConst.CompUpdatedCol)=ODCIConst.CompUpdatedCol) THEN
     dbms_output.put_line('ColInfoFlags : Updated Column');
   END IF;

   IF (bitand(op, ODCIConst.CompRenamedCol) = ODCIConst.CompRenamedCol) THEN
     dbms_output.put_line('ColInfoFlags : Renamed Column');
   END IF;

   IF (bitand(op,ODCIConst.CompRenamedTopADT)=ODCIConst.CompRenamedTopADT) THEN
     dbms_output.put_line('ColInfoFlags : Renamed Top ADT');
   END IF;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIENVDUMP" (env ODCIEnv) IS
BEGIN
  if  env is null then
    dbms_output.put_line('ODCIEnv is null ');
    return;
  end if;

  dbms_output.put_line('ODCIEnv');
  IF (bitand( env.EnvFlags, ODCIConst.DebuggingOn)
      = ODCIConst.DebuggingOn)
  THEN
    dbms_output.put_line('      Debugging is ON');
    dbms_output.put_line('      DebugLevel is ' || env.DebugLevel);
  END IF;

  IF (bitand( env.EnvFlags, ODCIConst.NoData)
      = ODCIConst.NoData)
  THEN
    dbms_output.put_line('      No Data for Index or Index Partition');
  END IF;

  IF (bitand( env.EnvFlags, ODCIConst.UserParamString)
      = ODCIConst.UserParamString)
  THEN
    dbms_output.put_line('      User specified partition parameters string');
  END IF;

  IF (bitand( env.EnvFlags, ODCIConst.RowMigration)
      = ODCIConst.RowMigration)
  THEN
    dbms_output.put_line('      Row Migration Operation');
  END IF;

  IF (bitand( env.EnvFlags, ODCIConst.IndexKeyChanged)
      = ODCIConst.IndexKeyChanged)
  THEN
    dbms_output.put_line('      Index Key Changed');
  END IF;

  IF (env.CallProperty = ODCIConst.None)
  THEN
    dbms_output.put_line('      CallProperty is None ');
  ELSIF (env.CallProperty = ODCIConst.FirstCall)
  THEN
    dbms_output.put_line('      CallProperty is First Call ');
  ELSIF (env.CallProperty = ODCIConst.IntermediateCall)
  THEN
     dbms_output.put_line('      CallProperty is Intermediate Call ');
  ELSIF (env.CallProperty = ODCIConst.FinalCall)
  THEN
    dbms_output.put_line('      CallProperty is Final Call ');
  ELSIF (env.CallProperty = ODCIConst.RebuildIndex)
  THEN
    dbms_output.put_line('      CallProperty is Rebuild Index ');
  ELSIF (env.CallProperty = ODCIConst.RebuildPMO)
  THEN
    dbms_output.put_line('      CallProperty is Rebuild PMO ');
  ELSIF (env.CallProperty = ODCIConst.StatsGlobal)
  THEN
    dbms_output.put_line('      CallProperty is StatsGlobal ');
  ELSIF (env.CallProperty = ODCIConst.StatsGlobalAndPartition)
  THEN
    dbms_output.put_line('      CallProperty is StatsGlobalAndPartition ');
  ELSIF (env.CallProperty = ODCIConst.StatsPartition)
  THEN
    dbms_output.put_line('      CallProperty is StatsPartition ');
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIINDEXALTEROPTIONDUMP" (op NUMBER) IS
BEGIN
    dbms_output.put('Alter Option :');
    IF (op = ODCIConst.AlterIndexNone)
    THEN
       dbms_output.put_line(' None');
    END IF;
    IF (op = ODCIConst.AlterIndexRename)
    THEN
       dbms_output.put_line(' Rename');
    END IF;
    IF (op = ODCIConst.AlterIndexRebuild)
    THEN
       dbms_output.put_line(' Rebuild');
    END IF;
    IF (op = ODCIConst.AlterIndexRebuildOnline)
    THEN
       dbms_output.put_line(' Rebuild Online');
    END IF;
    IF (op = ODCIConst.AlterIndexModifyCol)
    THEN
        dbms_output.put_line(' Modify Column');
    END IF;
    IF (op = ODCIConst.AlterIndexUpdBlockRefs)
    THEN
        dbms_output.put_line(' Update Block References');
    END IF;
    IF (op = ODCIConst.AlterIndexRenameCol)
    THEN
        dbms_output.put_line(' Rename Column ');
    END IF;
    IF (op = ODCIConst.AlterIndexRenameTab)
    THEN
        dbms_output.put_line(' Rename Table ');
    END IF;
    IF (op = ODCIConst.AlterIndexMigrate)
    THEN
        dbms_output.put_line(' Migrate Index ');
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIINDEXCALLPROPERTYDUMP" (op NUMBER) IS
BEGIN
    IF (op IS NOT NULL AND op != ODCIConst.None ) THEN
      dbms_output.put('Call : ');
      IF (op = ODCIConst.FirstCall) THEN
        dbms_output.put_line('First Call');
      ELSIF (op = ODCIConst.IntermediateCall) THEN
        dbms_output.put_line('Intermediate Call');
      ELSIF (op = ODCIConst.FinalCall) THEN
        dbms_output.put_line('Final Call');
      ELSIF (op = ODCIConst.RebuildIndex) THEN
        dbms_output.put_line('Rebuild Index');
      ELSIF (op = ODCIConst.RebuildPMO) THEN
        dbms_output.put_line('Rebuild PMO');
      ELSIF (op = ODCIConst.StatsGlobal) THEN
        dbms_output.put_line('StatsGlobal');
      ELSIF (op = ODCIConst.StatsGlobalAndPartition) THEN
        dbms_output.put_line('StatsGlobalAndPartition');
      ELSIF (op = ODCIConst.StatsPartition) THEN
        dbms_output.put_line('StatsPartition');
      END IF;
    END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIINDEXINFODUMP" (ia ODCIIndexInfo) IS
  col NUMBER;
BEGIN
  if ia is null then
   dbms_output.put_line('ODCIIndexInfo is null');
   return;
  end if;

  dbms_output.put_line('ODCIIndexInfo');
  dbms_output.put_line('Index owner : ' || ia.IndexSchema);
  dbms_output.put_line('Index name : ' || ia.IndexName);
  if (ia.IndexPartition IS NOT NULL) then
    dbms_output.put_line('Index partition name : ' || ia.IndexPartition);
  end if;
  if (ia.IndexInfoFlags != 0) then
    ODCIIndexInfoFlagsDump(ia.IndexInfoFlags);
  end if;

  if (bitand(ia.IndexInfoFlags, ODCIConst.Parallel) = ODCIConst.Parallel) then
    if (ia.IndexParaDegree < ODCIConst.DefaultDegree and
        ia.IndexParaDegree > 0) then
      dbms_output.put_line('Parallel degree : ' || ia.IndexParaDegree);
    elsif ( ia.IndexParaDegree = ODCIConst.DefaultDegree) then
      dbms_output.put_line('Parallel degree : DEFAULT');
    end if;
  end if;

  -- use first index column's table name as table name for index
  -- (ok since all index columns  belong to same table)
  dbms_output.put_line('Table owner : ' || ia.IndexCols(1).TableSchema);
  dbms_output.put_line('Table name : ' || ia.IndexCols(1).TableName);
  if (ia.IndexCols(1).TablePartition IS NOT NULL) then
    dbms_output.put_line('Table partition name : ' ||
                          ia.IndexCols(1).TablePartition);
  end if;

  FOR col IN ia.IndexCols.FIRST..ia.IndexCols.LAST LOOP
     dbms_output.put_line('Indexed column : '||
                          ia.IndexCols(col).ColName);
     dbms_output.put_line('Indexed column type :'||
                          ia.IndexCols(col).ColTypeName);
     dbms_output.put_line('Indexed column type schema:'||
                          ia.IndexCols(col).ColTypeSchema);
     if (ia.IndexCols(col).ColInfoFlags != 0) then
       ODCIColInfoFlagsDump(ia.IndexCols(col).ColInfoFlags);
     end if;
     if (ia.IndexCols(col).OrderByPosition > 0) then
      dbms_output.put_line('Indexed column position in order by: '||
                           ia.IndexCols(col).OrderByPosition);
     end if;
  END LOOP;

  if (ia.IndexPartitionIden != 0) then
    dbms_output.put_line('Index partition identifier : ' ||
                            ia.IndexPartitionIden );
  end if;

  if (ia.IndexPartitionTotal > 1) then
    dbms_output.put_line('Index partition total : ' ||
                           ia.IndexPartitionTotal);
  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIINDEXINFOFLAGSDUMP" (op NUMBER) IS
BEGIN
  IF (bitand(op, ODCIConst.Local) = ODCIConst.Local) THEN

    IF (bitand(op, ODCIConst.RangePartn) = ODCIConst.RangePartn) THEN
      dbms_output.put_line('IndexInfoFlags : Local Range Partitioned');
    END IF;

    IF (bitand(op, ODCIConst.HashPartn) = ODCIConst.HashPartn) THEN
      dbms_output.put_line('IndexInfoFlags : Local Hash Partitioned');
    END IF;

    IF (bitand(op, ODCIConst.ListPartn) = ODCIConst.ListPartn) THEN
      dbms_output.put_line('IndexInfoFlags : Local List Partitioned');
    END IF;

    IF (bitand(op, ODCIConst.UpdateGlobalIndexes) =
         ODCIConst.UpdateGlobalIndexes) THEN
      dbms_output.put_line('IndexInfoFlags : Update Global Indexes');
    END IF;
  END IF;

  IF (bitand(op, ODCIConst.IndexOnIOT) = ODCIConst.IndexOnIOT) THEN
    dbms_output.put_line('IndexInfoFlags : Index on Index-organized Table');
  END IF;

  IF (bitand(op, ODCIConst.Unusable) = ODCIConst.Unusable) THEN
    dbms_output.put_line('IndexInfoFlags : Unusable');
  END IF;

  IF (bitand(op, ODCIConst.FunctionIdx) = ODCIConst.FunctionIdx) THEN
    dbms_output.put_line('IndexInfoFlags : Function based domain index');
  END IF;

  IF (bitand(op, ODCIConst.Online) = ODCIConst.Online) THEN
    dbms_output.put_line('IndexInfoFlags : Online Index Creation');
  END IF;

  IF (bitand(op, ODCIConst.Parallel) = ODCIConst.Parallel) THEN
    dbms_output.put_line('IndexInfoFlags : Parallel Index Creation');
  END IF;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIPARTINFODUMP" (pinfo IN SYS.ODCIPartInfo) IS
BEGIN
  dbms_output.put_line('ODCIPartInfo :');
  dbms_output.put_line('Table partition name : ' || pinfo.TablePartition);
  dbms_output.put_line('Index partition name : ' || pinfo.IndexPartition);
  dbms_output.put_line('Index partition iden : ' || pinfo.IndexPartitionIden);

  IF (pinfo.PartOp = ODCIConst.AddPartition) THEN
    dbms_output.put_line('Add Partition');
  ELSIF (pinfo.PartOp = ODCIConst.DropPartition) THEN
    dbms_output.put_line('Drop Partition');
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIPARTINFOLISTDUMP" (plist IN SYS.ODCIPartInfoList)
IS
 col NUMBER;
BEGIN
 dbms_output.put_line('ODCIPartInfoList :');
 FOR col IN plist.FIRST..plist.LAST LOOP
  dbms_output.put_line('ODCIPartInfo (' || col || ') :');
  ODCIPartInfoDump(plist(col));
 END LOOP;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIPREDINFODUMP" (op ODCIPredInfo) IS
BEGIN
  if op is null then
   dbms_output.put_line('ODCIPredInfo is null');
   return;
  end if;

  dbms_output.put_line('ODCIPredInfo');
  dbms_output.put_line('Object owner : ' ||op.ObjectSchema);
  dbms_output.put_line('Object name : '  ||op.ObjectName);
  dbms_output.put_line('Method name : '  ||op.MethodName);
  dbms_output.put_line('Predicate bounds flag :');

  IF (bitand(op.Flags, ODCIConst.PredExactMatch)
      = ODCIConst.PredExactMatch)
  THEN
    dbms_output.put_line('     Exact Match');
  END IF;

  IF (bitand(op.Flags, ODCIConst.PredPrefixMatch)
      = ODCIConst.PredPrefixMatch)
  THEN
    dbms_output.put_line('     Prefix Match');
  END IF;

  IF (bitand(op.Flags, ODCIConst.PredIncludeStart)
      = ODCIConst.PredIncludeStart)
  THEN
    dbms_output.put_line('     Include Start Key');
  END IF;

  IF (bitand(op.Flags, ODCIConst.PredIncludeStop)
      = ODCIConst.PredIncludeStop)
  THEN
    dbms_output.put_line('     Include Stop Key');
  END IF;

  IF (bitand(op.Flags, ODCIConst.PredMultiTable)
      = ODCIConst.PredMultiTable)
  THEN
    dbms_output.put_line('     Multiple Tables');
  END IF;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCIQUERYINFODUMP" (qi ODCIQueryInfo) IS
BEGIN
  if qi is null then
   dbms_output.put_line('ODCIQueryInfo is null');
   return;
  end if;

  dbms_output.put_line('ODCIQueryInfo');
  dbms_output.put_line('Flags :');

  IF (bitand(qi.Flags, ODCIConst.QueryFirstRows) > 0)
  THEN
    dbms_output.put_line('     First Rows');
  END IF;

  IF (bitand(qi.Flags, ODCIConst.QueryAllRows) > 0)
  THEN
    dbms_output.put_line('     All Rows');
  END IF;

  IF (bitand(qi.Flags, ODCIConst.QuerySortAsc) > 0)
  THEN
    dbms_output.put_line('     Sort Ascending');
  END IF;

  IF (bitand(qi.Flags, ODCIConst.QuerySortDesc) > 0)
  THEN
    dbms_output.put_line('     Sort Descending');
  END IF;

  IF (bitand(qi.Flags, ODCIConst.QueryBlocking) > 0)
  THEN
    dbms_output.put_line('     Blocking Operations');
  END IF;

  IF qi.AncOps IS NOT NULL AND qi.AncOps.COUNT > 0 THEN
    dbms_output.put_line('Ancillary Operators  ');
    FOR i IN qi.AncOps.FIRST..qi.AncOps.LAST LOOP
       dbms_output.put_line('   Name : '||
                            qi.AncOps(i).ObjectName);
       dbms_output.put_line('   Schema :'||
                            qi.AncOps(i).ObjectSchema);
    END LOOP;
  END IF;


  IF qi.CompInfo IS NOT NULL AND qi.CompInfo.PredInfo IS NOT NULL THEN
    dbms_output.put_line('Pushed Down Predicates');
    FOR i IN qi.CompInfo.PredInfo.FIRST..qi.CompInfo.PredInfo.LAST LOOP
       ODCIColInfoDump(qi.CompInfo.PredInfo(i).ColInfo);
       dbms_output.put_line('   Flags: '||
                            qi.CompInfo.PredInfo(i).Flags);
       IF qi.CompInfo.PredInfo(i).strt IS NOT NULL THEN
         dbms_output.put_line('   Start: ');
         ODCIAnyDataDump(qi.CompInfo.PredInfo(i).strt);
       END IF;
       IF qi.CompInfo.PredInfo(i).stop IS NOT NULL THEN
         dbms_output.put_line('   Stop: ');
         ODCIAnyDataDump(qi.CompInfo.PredInfo(i).stop);
       END IF;

    END LOOP;
  END IF;

  IF qi.CompInfo IS NOT NULL AND qi.CompInfo.ObyInfo IS NOT NULL THEN
    dbms_output.put_line('Order By Clause');

    FOR i IN qi.CompInfo.ObyInfo.FIRST..qi.CompInfo.ObyInfo.LAST LOOP
       dbms_output.put_line('   ExprType: '||
                            qi.CompInfo.ObyInfo(i).ExprType);
       dbms_output.put_line('   Schema : '||
                            qi.CompInfo.ObyInfo(i).ObjectSchema);
       dbms_output.put_line('   TableName : '||
                            qi.CompInfo.ObyInfo(i).TableName);
       dbms_output.put_line('   ColumnName : '||
                            qi.CompInfo.ObyInfo(i).ExprName);
       dbms_output.put_line('   SortOrder : '||
                            qi.CompInfo.ObyInfo(i).SortOrder);
    END LOOP;
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCISTATSOPTIONSDUMP" (so ODCIStatsOptions) IS
BEGIN
  if so is null then
   dbms_output.put_line('ODCIStatsOptions is null');
   return;
  end if;

  dbms_output.put_line('ODCIStatsOptions');
  IF (so.Flags = ODCIConst.ComputeStats)
  THEN
    dbms_output.put_line('     Compute Stats');
  END IF;
  IF (so.Flags = ODCIConst.EstimateStats)
  THEN
    dbms_output.put_line('     Estimate Stats');
    IF (so.Options = ODCIConst.PercentOption)
    THEN
      dbms_output.put_line('     Sample ' || so.Sample || ' Percent');
    ELSE
          dbms_output.put_line('     Sample ' || so.Sample || ' Rows');
    END IF;
  END IF;
  IF (so.Flags = ODCIConst.Validate)
  THEN
    dbms_output.put_line('     Validate');
  END IF;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."ODCITABFUNCINFODUMP" (ti IN ODCITabFuncInfo)
IS
  prec PLS_INTEGER;
  scale PLS_INTEGER;
  len PLS_INTEGER;
  csid PLS_INTEGER;
  csfrm PLS_INTEGER;
  cnt PLS_INTEGER;
  tc PLS_INTEGER;
  schema_name VARCHAR2(30);
  type_name VARCHAR2(30);
  version VARCHAR2(30);
BEGIN
  dbms_output.put_line('Dump of ODCITabFuncInfo (ti)');
  IF (ti IS NULL) THEN
    dbms_output.put_line('ti IS NULL');
  ELSE
    IF (ti.Attrs IS NULL) THEN
      dbms_output.put_line('ti.Attrs IS NULL');
    ELSE
      dbms_output.put('ti.Attrs = { ');
      FOR i IN 1..ti.Attrs.count LOOP
        IF (i>1) THEN
          dbms_output.put(' , ');
        END IF;
        dbms_output.put(ti.Attrs(i));
      END LOOP;
      dbms_output.put_line(' } ');
    END IF;

    IF (ti.RetType IS NULL) THEN
      dbms_output.put_line('ti.RetType IS NULL');
    ELSE
      tc:=ti.RetType.GetInfo(prec,scale,len,csid,csfrm,schema_name,
                             type_name,version,cnt);
      dbms_output.put_line('ti.RetType = ' || schema_name ||
                           '.' || type_name);
    END IF;
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."OLAPIHANDSHAKE2" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
139 113
nSbk7xj6vTe28Mc+ssoTMxiTWrEwg0xKLpnWfHRAvzPqNq6eQTS5jgVR+3lsLv5S0zjW8PB/
tLUHPS2tjsCXt0m7BQNeYFvfj7mGToNf0OseZRn/AehYn0CGMMBvhRXLkyqFAfu9qbUOLDI1
yW5JBBqossV8/dWE48S9IxGzPPv2HcWSUAmVhYBQXMFbseCuhHEu2+AXykw9oUkl74AbfyFe
/xitWvvZ7Nz3Hxu6ZPuTLp6VUn8Aow21DAx8DDoUzaGrzotIeCAjt1xF
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."RESET_UNDO_STAT"
IS
  resetsql varchar2(1024);
  val     number;
  cid     number;
  rows    integer;
BEGIN
  val := 2;
  resetsql := 'alter system set "_undo_debug_usage" = ' || val;
  cid := dbms_sql.open_cursor;
  dbms_sql.parse(cid, resetsql, dbms_sql.native);
  rows := dbms_sql.execute(cid);
  dbms_sql.close_cursor(cid);
END reset_undo_stat;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."SCHEDULER$_JOB_EVENT_HANDLER" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
232b b98
+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
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."SETMODFLG" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
490 288
e0akXR83wkx6dnMxD4rDK83CEU8wgzvDTPaMZ45VweQY+EsOwuKRY47sJVskuSsfpF4XaCqu
4FHeHas1sl2oJLzqjBrolpN93c8j/74Hvr9xQDcCn45mIUK6KzFhMI0dTiijZu6n1rz7qvBQ
wF9p6jg5eA03/3Qs3v6a9ZHLfytqSum89GvhObt95JUMolYiDoBCOkj5uGR6/9EIcjOBvVpP
csG2aRcJnQmrZxsimF8OhuShMAg2z5UqBdJC4LhKa1DI7aI33YefI/DBTetLeJ71HjfLuB5d
+ej/C5q2CmyeatLi5GkiIiPM/1buyv3D1AobtwmgoLI3uEc8q4G7MhnDByO3avNXnlcnxsKF
Jd89YemSg922kTrol8C+O/HXuqPZbQ/FVvXpROwHrh5ME7kDyy0kiR40p2Siw8gaMBHxonf4
mD9p7rZLx4072RtrlWtVlPpImicagysgOgiL5yQWqZuUM7zb13KHu56MFqVyNSMmnMfsHs+Z
mACFLoddE28R1bGefh7lNin17Ivk9fGg2ThPMHuso/fUmxUEO+MJzZIig0ic0i3LZrnCwQhS
8VUHN9ZH6OD9PC0CDO45ipt3+n/WqfzFXRAyLrXhVps0SvJm0ANIzjPLdB4q1g==
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."SUBPTXT" (name varchar2, subname varchar2, usr varchar2,
                             txt in out varchar2) is
begin
    subptxt2(name, subname, usr, null, null, txt);
end;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."SUBPTXT2" (name varchar2, subname varchar2, usr varchar2,
                             dbname varchar2, dbowner varchar2,
                             txt in out varchar2) is
status diutil.ub4;

begin -- main
    diutil.subptxt(name, subname, usr, dbname, dbowner, txt, status);
    if (status <> diutil.s_ok) then
        if (status = diutil.s_subpNotFound) then
            txt := '$$$ s_subpNotFound';
        elsif (status = diutil.s_stubTooLong) then
            txt := '$$$ s_stubTooLong';
        elsif (status = diutil.s_logic) then
            txt := '$$$ s_logic';
        elsif (status = diutil.s_notInPackage) then
            txt := '$$$ s_notInPackage';
        else txt := '$$$ s_other';
        end if;
    end if;
end subptxt2;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."VALIDATE_APEX"
as
    type obj_arr         is table of varchar2(30) index by binary_integer;
    g_objects            obj_arr;
    l_type#              binary_integer;
    l_owner#             binary_integer;
    l_ltype              varchar2(30) := 'FIRST';
    l_status             binary_integer;
    l_compile_sql        varchar2(2000);
    l_obj_found          boolean;
    l_start_time         date;
    l_user               varchar2(255);
    --
    l_obj_count          pls_integer := 0;
    l_obj_compile_count  pls_integer := 0;
    l_package_count      pls_integer := 0;
    l_table_count        pls_integer := 0;
    l_function_count     pls_integer := 0;
    l_package_body_count pls_integer := 0;
    l_sequence_count     pls_integer := 0;
    l_trigger_count      pls_integer := 0;
    l_index_count        pls_integer := 0;
    l_view_count         pls_integer := 0;
    l_library_count      pls_integer := 0;
    l_type_count         pls_integer := 0;
    l_type_body_count    pls_integer := 0;
    l_operator_count     pls_integer := 0;
    l_indextype_count    pls_integer := 0;
    l_procedure_count    pls_integer := 0;
    --
    l_invalid_object_cnt pls_integer := 0;
    l_exists_failure_cnt pls_integer := 0;

    INVALID_OBJECT_NAME EXCEPTION;
    PRAGMA EXCEPTION_INIT(INVALID_OBJECT_NAME, -44002);

    procedure log_action (
       p_message in varchar2 default null)
    is
    begin
       for c1 in (select sysdate d from dual) loop
           dbms_output.put_line(
                '...'||
                p_message||' '||
                to_char(c1.d,'HH24:MI:SS')
                );
       end loop;
    end log_action;
begin
  -------------------
  -- init logging env
  --

  select sysdate, user into l_start_time, l_user from dual;
  select user# into l_owner# from sys.user$ where name = 'APEX_040200';
  log_action('Database user "'||l_user||'", database schema "APEX_040200", user# "'||l_owner#||'"');

  --------------------------------------------
  -- Loop over all objects owned by APEX owner
  --
  for c1 in (select object_name, object_type
               from all_objects
              where owner        = 'APEX_040200' and
                    object_type not in 'SYNONYM' and
                    object_type not like 'LOB%'
              order by object_type, object_name)
  loop
    l_obj_count := l_obj_count + 1;

    ------------------------
    -- determine object type
    --
    if (c1.object_type != l_ltype) then
      select decode(c1.object_type, 'INDEX',         1,
                                    'TABLE',         2,
                                    'VIEW',          4,
                                    'SEQUENCE',      6,
                                    'PROCEDURE',     7,
                                    'FUNCTION',      8,
                                    'PACKAGE',       9,
                                    'PACKAGE BODY', 11,
                                    'TRIGGER',      12,
                                    'TYPE',         13,
                                    'TYPE BODY',    14,
                                    'LIBRARY',      22,
                                    'INDEXTYPE',    32,
                                    'OPERATOR',     33,
                                    0)
        into l_type#
        from dual;
      l_ltype := c1.object_type;
    end if;

    if c1.object_type = 'TABLE'          then l_table_count := l_table_count + 1; end if;
    if c1.object_type = 'FUNCTION'       then l_function_count := l_function_count + 1; end if;
    if c1.object_type = 'PACKAGE'        then l_package_count := l_package_count + 1; end if;
    if c1.object_type = 'PACKAGE BODY'   then l_package_body_count := l_package_body_count + 1; end if;
    if c1.object_type = 'SEQUENCE'       then l_sequence_count := l_sequence_count + 1; end if;
    if c1.object_type = 'TRIGGER'        then l_trigger_count := l_trigger_count + 1; end if;
    if c1.object_type = 'INDEX'          then l_index_count := l_index_count + 1; end if;
    if c1.object_type = 'VIEW'           then l_view_count := l_view_count + 1; end if;
    if c1.object_type = 'TYPE'           then l_type_count := l_type_count + 1; end if;
    if c1.object_type = 'TYPE BODY'      then l_type_body_count := l_type_body_count + 1; end if;
    if c1.object_type = 'LIBRARY'        then l_library_count := l_library_count + 1; end if;
    if c1.object_type = 'OPERATOR'       then l_operator_count := l_operator_count + 1; end if;
    if c1.object_type = 'INDEXTYPE'      then l_indextype_count := l_indextype_count + 1; end if;
    if c1.object_type = 'PROCEDURE'      then l_procedure_count := l_procedure_count + 1; end if;

    --------------------------
    -- determine object status
    --
    l_status := -1;
    for c2 in (select status from sys.obj$
                where owner# = l_owner#
                  and name = c1.object_name
                  and type# = l_type# )
    loop
      l_status := c2.status;
    end loop;

    if (l_status != 1) then
      -----------------------------------
      -- Compile objects that are invalid
      --
      l_compile_sql :=
        case c1.object_type
          when 'VIEW' then
            'alter view APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          when 'PROCEDURE' then
            'alter procedure APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          when 'FUNCTION' then
            'alter function APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          when 'PACKAGE' then
            'alter package APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          when 'PACKAGE BODY' then
            'alter package APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile body'
          when 'TYPE' then
            'alter type APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          when 'TYPE BODY' then
            'alter type APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile body'
          when 'INDEXTYPE' then
            'alter indextype APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          when 'OPERATOR' then
            'alter operator APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          when 'TRIGGER' then
            'alter trigger APEX_040200.' || dbms_assert.enquote_name(c1.object_name, FALSE) || ' compile'
          else null
        end;

      if l_compile_sql is not null and instr(l_compile_sql,'WWV_FLOW_CUSTOM_AUTH_SSO') = 0 then
        begin
          execute immediate l_compile_sql;
          l_obj_compile_count := l_obj_compile_count + 1;
          log_action('"'||l_compile_sql||'"');
        exception
          when others then
            log_action('FAILED CHECK FOR "'||c1.object_type||'" "'||c1.object_name||'" '||sqlerrm);
            log_action('command: "'||l_compile_sql||'"');
            l_invalid_object_cnt := l_invalid_object_cnt + 1;
            if l_invalid_object_cnt = 1 then
               dbms_registry.invalid('APEX');
               log_action('DBMS registry set to invalid for APEX');
            end if;
            --goto endfunc;
        end;
      end if;

    end if;


  end loop;
    log_action('Compiled '||l_obj_compile_count||' out of '||l_obj_count||' objects considered, '||l_invalid_object_cnt||' failed compilation');

    dbms_output.put_line ('...'||l_package_count||' packages');
    dbms_output.put_line ('...'||l_package_body_count||' package bodies');
    dbms_output.put_line ('...'||l_table_count||' tables');
    dbms_output.put_line ('...'||l_function_count||' functions');
    dbms_output.put_line ('...'||l_procedure_count||' procedures');
    dbms_output.put_line ('...'||l_sequence_count||' sequences');
    dbms_output.put_line ('...'||l_trigger_count||' triggers');
    dbms_output.put_line ('...'||l_index_count||' indexes');
    dbms_output.put_line ('...'||l_view_count||' views');
    dbms_output.put_line ('...'||l_library_count||' libraries');
    dbms_output.put_line ('...'||l_type_count||' types');
    dbms_output.put_line ('...'||l_type_body_count||' type bodies');
    dbms_output.put_line ('...'||l_operator_count||' operators');
    dbms_output.put_line ('...'||l_indextype_count||' index types');

    -----------------------------------
    -- populate array of APEX g_objects
    --
    log_action('Begin key object existence check');
    g_objects(g_objects.count+1) := 'WWV_FLOW_COLLECTIONS$';
    g_objects(g_objects.count+1) := 'WWV_FLOW_COMPANIES';
    g_objects(g_objects.count+1) := 'WWV_FLOW_FND_USER';
    g_objects(g_objects.count+1) := 'WWV_FLOW_ITEMS';
    g_objects(g_objects.count+1) := 'WWV_FLOW_LISTS';
    g_objects(g_objects.count+1) := 'WWV_FLOW_MAIL_QUEUE';
    g_objects(g_objects.count+1) := 'WWV_FLOW_MESSAGES$';
    g_objects(g_objects.count+1) := 'WWV_FLOW_PAGE_PLUGS';
    g_objects(g_objects.count+1) := 'WWV_FLOW_STEP_ITEMS';
    g_objects(g_objects.count+1) := 'WWV_FLOW_STEP_PROCESSING';
    g_objects(g_objects.count+1) := 'WWV_FLOW_STEP_VALIDATIONS';
    g_objects(g_objects.count+1) := 'WWV_FLOW_STEPS';
    g_objects(g_objects.count+1) := 'WWV_FLOW_SW_STMTS';
    g_objects(g_objects.count+1) := 'WWV_FLOWS';
    g_objects(g_objects.count+1) := 'WWV_FLOW_DML';
    g_objects(g_objects.count+1) := 'WWV_FLOW_ITEM';
    g_objects(g_objects.count+1) := 'WWV_FLOW_LANG';
    g_objects(g_objects.count+1) := 'WWV_FLOW_LOG';
    g_objects(g_objects.count+1) := 'WWV_FLOW_MAIL';
    g_objects(g_objects.count+1) := 'WWV_FLOW_SVG';
    g_objects(g_objects.count+1) := 'WWV_FLOW_SW_PARSER';
    g_objects(g_objects.count+1) := 'WWV_FLOW_SW_UTIL';
    g_objects(g_objects.count+1) := 'WWV_FLOW_UTILITIES';
    g_objects(g_objects.count+1) := 'F';
    g_objects(g_objects.count+1) := 'P';
    g_objects(g_objects.count+1) := 'Z';
    g_objects(g_objects.count+1) := 'V';
    --------------------------------------
    -- Check for existence of core objects
    --
    for j in 1.. g_objects.count loop

        l_obj_found := false;
        for c1 in (select null
                     from all_objects
                    where owner = 'APEX_040200'
                      and object_name = g_objects(j) ) loop

            l_obj_found := true;
        end loop;

        if not l_obj_found then
            dbms_output.put_line('FAILED Existence check for '||g_objects(j));
            l_exists_failure_cnt := l_exists_failure_cnt + 1;
            if l_exists_failure_cnt = 1 then
                dbms_registry.invalid('APEX');
                log_action('DBMS registry set to invalid for APEX');
            end if;
        end if;
    end loop;

    l_obj_found := false;
    for c1 in (select null
                 from all_objects
                where owner = 'SYS'
                  and object_name = 'WWV_DBMS_SQL' ) loop

        l_obj_found := true;

    end loop;

    if not l_obj_found then
        log_action('FAILED Existence check for WWV_DBMS_SQL');
        l_exists_failure_cnt := l_exists_failure_cnt + 1;
        if l_exists_failure_cnt = 1 then
            dbms_registry.invalid('APEX');
            log_action('DBMS registry set to invalid for APEX');
        end if;
    end if;

  log_action('Completed key object existence check');
  if l_exists_failure_cnt = 0 and l_invalid_object_cnt = 0 then
     log_action('Setting DBMS Registry');
     dbms_registry.valid('APEX');
     log_action('Setting DBMS Registry Complete');
  end if;
<<endfunc>>
  null;
  log_action('Exiting validate');
exception
  when others then
    dbms_registry.invalid('APEX');
    log_action('Error in validation: '||sqlerrm);
end validate_apex;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."VALIDATE_CONTEXT"
is
  l_type#       binary_integer;
  l_owner#      binary_integer;
  l_ltype       varchar2(30) := 'FIRST';
  l_status      binary_integer;
  l_compile_sql varchar2(2000);
  l_dbo_name    varchar2(32);
  l_errcnt      number := 0;
  l_upg_mode    boolean := FALSE;
begin

  select user# into l_owner# from sys.user$ where name = 'CTXSYS';
  for c1 in (select dbo_name, dbo_type
               from ctxsys.dr$dbo
              where dbo_type != 'PUBLIC SYNONYM'
              order by dbo_type, dbo_name)
  loop
    if (c1.dbo_type != l_ltype) then
      select decode(c1.dbo_type, 'INDEX',         1,
                                 'TABLE',         2,
                                 'VIEW',          4,
                                 'SEQUENCE',      6,
                                 'PROCEDURE',     7,
                                 'FUNCTION',      8,
                                 'PACKAGE',       9,
                                 'PACKAGE BODY', 11,
                                 'TYPE',         13,
                                 'TYPE BODY',    14,
                                 'LIBRARY',      22,
                                 'INDEXTYPE',    32,
                                 'OPERATOR',     33,
                                 0)
        into l_type#
        from dual;
      l_ltype := c1.dbo_type;
    end if;

    l_status := -1;
    for c2 in (select status from sys.obj$
                where owner# = l_owner#
                  and name = c1.dbo_name
                  and type# = l_type#)
    loop
      l_status := c2.status;
    end loop;

    if (l_status != 1) then
      -- 3591109: Attempt to recompile invalid objects before issuing the
      -- failure notice
      l_dbo_name := dbms_assert.enquote_name(c1.dbo_name);
      l_compile_sql :=
        case c1.dbo_type
          when 'VIEW' then
            'alter view ctxsys.' || l_dbo_name || ' compile'
          when 'PROCEDURE' then
            'alter procedure ctxsys.' || l_dbo_name || ' compile'
          when 'FUNCTION' then
            'alter function ctxsys.' || l_dbo_name || ' compile'
          when 'PACKAGE' then
            'alter package ctxsys.' || l_dbo_name || ' compile'
          when 'PACKAGE BODY' then
            'alter package ctxsys.' || l_dbo_name || ' compile body'
          when 'TYPE' then
            'alter type ctxsys.' || l_dbo_name || ' compile'
          when 'TYPE BODY' then
            'alter type ctxsys.' || l_dbo_name || ' compile body'
          when 'INDEXTYPE' then
            'alter indextype ctxsys.' || l_dbo_name || ' compile'
          when 'OPERATOR' then
            'alter operator ctxsys.' || l_dbo_name || ' compile'
          else null
        end;

      if l_compile_sql is null then
        dbms_output.put_line(
          'FAILED CHECK FOR '||c1.dbo_type||' '||c1.dbo_name);
        dbms_registry.invalid('CONTEXT');
        goto endfunc;
      else
        begin
          execute immediate l_compile_sql;
        exception
          when others then
            dbms_output.put_line(
              'FAILED CHECK FOR '||c1.dbo_type||' '||c1.dbo_name);
            dbms_registry.invalid('CONTEXT');
            goto endfunc;
        end;
      end if;
    end if;
  end loop;

  /* Bug 16936854 : Check if there were any errors during CONTEXT upgrade */
  l_upg_mode := sys.dbms_registry.is_in_upgrade_mode();
  if (l_upg_mode = TRUE) then
    select count(*) into l_errcnt
       from sys.registry$error
      where identifier = 'CONTEXT';
    if (l_errcnt != 0) then
      dbms_registry.invalid('CONTEXT');
      goto endfunc;
    end if;
  end if;

  dbms_registry.valid('CONTEXT');

<<endfunc>>
  null;

exception
  when others then
    ctxsys.drue.text_on_stack(sqlerrm, 'validate_context');
    dbms_registry.invalid('CONTEXT');
    ctxsys.drue.raise;
end validate_context;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."VALIDATE_DV" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
f9 113
XpxUQivg10LtWt37CPa5K+3ly1IwgwFKf5kVfC8CkE7VGacromhthINxIfEb8Qy6bhgO1o8W
+T9kBov1xghV/hmtsEqKyL27Hk5SmLy5Ts2yap5MVuOEmglIwwxbLJR14TJETKvgJjwqz1Yp
2T5TbiN1L4t3QUY4rS6A02IfXjnUHIPGszYgKlmgWl4aVuHDg0rPOO03Vtyx8Aml4qPYEoon
ie+hZXAFQcFWAFNd2TP2o4ecW2lwkhc/QiTynvddI7EWWNf8HRJuAME=
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."VALIDATE_OLS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
35b 223
luxabBT53Xe0ioTiklYtkiM4nn0wg/AJLvZqfHRVvp3mB+YlpJf/2WW44GyBuIrg2tUAWBWf
BI6ftLS7T5H+7x4rdWshWiMjriOj2gVRdqQVsUi1M8L4z/C7+CgvPzlw1DeqsntTZO7iUWn2
FQGFJyzGMiwt7Ue49UvTay0rjHxuqdwR0D3Yr4eI5QhNLbJQg7NGm5/7lzYT49oXWy+jgAV6
zEQe+7TYyImD8Kinq55V4zwgEPsVWqU1RrPHVFgXa41W0xQk0YXwUfMdrC03TQ56UFuwkhxM
/5B1KMwkKcfNLkY9JJFzHRMPL/DUdYASMFYEnU3JNp1hFGFmoY3w473X5gPIaFYuhPgvjG7B
pJDfgM0dy5X3j12OraImY345LKSTXdYF0Y3Ql0vG3FpZMkOsc1xViFTry4Bmh2uh77U+Os/F
JhsmF0Xv63aQA8sbK9X0G03cLfysj0ROZi5RRRqQFKUtUK9jOjBJxrv6TMB92Iqxzymjl3ci
1wL1a+ryKLAqYiLj7rWJtjd+d7xFOjlcf0eA
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."VALIDATE_ORDIM"
authid current_user
IS
 l_null char(1);
 b_valid       boolean := TRUE;           -- keep track installation status
                                          -- TRUE: valid (default),
                                          -- FALSE: invalid
 l_num_objects integer     :=0;
 l_num_classes integer     :=0;
 l_num_schemas integer     :=0;
 l_num_docs    integer     :=0;
 l_num_roles   integer     :=0;
 l_num_errors  number      :=0;
 err_code NUMBER;
 err_msg  VARCHAR2(100);
 l_prevDbVer varchar2(40);
 l_status  varchar2(100);
 l_dsql_block varchar2(500);
 l_sdo_status varchar2(20) := NULL;
 b_upgradeMode boolean     := FALSE;

BEGIN
  -- Now check whether Multimedia objects are created
  begin
    select count(*) into l_num_objects from sys.obj$ o, sys.user$ u
      where u.name = 'ORDSYS'
        and u.user# = o.owner#
        and o.type# = 13
        and o.name in
            ( 'ORDIMAGE', 'ORDAUDIO', 'ORDDOC', 'ORDVIDEO', 'ORDDICOM',
              'SI_COLOR', 'SI_STILLIMAGE', 'SI_AVERAGECOLOR',
              'SI_COLORHISTOGRAM', 'SI_POSITIONALCOLOR', 'SI_TEXTURE',
              'SI_FEATURELIST'
            )
    ;

    if ( l_num_objects != 12 ) then
      b_valid := FALSE;
      dbms_output.put_line('ORDIM created ' || l_num_objects || ' objects.');
      dbms_output.put_line('The following objects are not created:');

      for r in (
      (
        select 'ORDIMAGE' name from dual
        union
        select 'ORDAUDIO' name from dual
        union
        select 'ORDDOC' name from dual
        union
        select 'ORDVIDEO' name from dual
        union
        select 'ORDDICOM' name from dual
        union
        select 'SI_COLOR' name from dual
        union
        select 'SI_STILLIMAGE' name from dual
        union
        select 'SI_AVERAGECOLOR' name from dual
        union
        select 'SI_COLORHISTOGRAM' name from dual
        union
        select 'SI_POSITIONALCOLOR' name from dual
        union
        select 'SI_TEXTURE' name from dual
        union
        select 'SI_FEATURELIST' name from dual
      )
      minus
      (
        select o.name from sys.obj$ o, sys.user$ u
        where u.name = 'ORDSYS'
          and u.user# = o.owner#
          and o.type# = 13
          and o.name in
              ( 'ORDIMAGE', 'ORDAUDIO', 'ORDDOC', 'ORDVIDEO', 'ORDDICOM',
                'SI_COLOR', 'SI_STILLIMAGE', 'SI_AVERAGECOLOR',
                'SI_COLORHISTOGRAM', 'SI_POSITIONALCOLOR', 'SI_TEXTURE',
                'SI_FEATURELIST'
              )
      ) ) loop
        dbms_output.put_line(r.name);
      end loop;

    end if;

  exception
    WHEN NO_DATA_FOUND THEN
      b_valid := FALSE;
      dbms_output.put_line('ORDIM objects are not created.');

    WHEN OTHERS THEN
      b_valid := FALSE;
      err_code := SQLCODE;
      err_msg  := SUBSTR(SQLERRM, 1 , 100);
      DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
  end;

  -- Now check whether Multimedia java classes are loaded
  -- The following jars are checked:
  --  mlibwrapper_jai.jar, jai_codec.jar, jai_core.jar, ordimimg.jar
  --  ordimdcm.jar, ordimann.jar
  begin
    select count(*) into l_num_classes
      from sys.obj$ o, sys.user$ u, sys.javasnm$ j
      where u.name = 'ORDSYS'
        and u.user# = o.owner#
        and o.type# = 29
        and j.short(+) = o.name
        and nvl(j.longdbcs, o.name) in
            ( 'javax/media/jai/JAI', 'com/sun/media/jai/codec/ImageCodec',
              'com/sun/medialib/mlib/mediaLibImage', 'oracle/ord/media/img/PropsAdapter',
              'oracle/ord/dicom/attr/DicomAttrTag',
              'oracle/ord/media/annotator/servclt/AnnCltInServer'
            )
    ;

    if ( l_num_classes != 6 ) then
      b_valid := FALSE;
      dbms_output.put_line('The following ORDIM Java libs are not loaded correctly:');

      for r in (
      (
        select 'javax/media/jai/JAI' name, 'jai_core.jar' jar from dual
        union
        select 'com/sun/media/jai/codec/ImageCodec' name, 'jai_codec.jar' jar from dual
        union
        select 'com/sun/medialib/mlib/mediaLibImage' name, 'mlibwrapper_jai.jar' jar from dual
        union
        select 'oracle/ord/media/img/PropsAdapter' name, 'ordimimg.jar' jar from dual
        union
        select 'oracle/ord/dicom/attr/DicomAttrTag' name, 'ordimdcm.jar' jar from dual
        union
        select 'oracle/ord/media/annotator/servclt/AnnCltInServer' name, 'ordimann.jar' jar from dual
      )
      minus
      (
        select nvl(j.longdbcs, o.name) name,
          decode( nvl(j.longdbcs, o.name) , 'javax/media/jai/JAI', 'jai_core.jar',
                    'com/sun/media/jai/codec/ImageCodec', 'jai_codec.jar',
                    'com/sun/medialib/mlib/mediaLibImage', 'mlibwrapper_jai.jar',
                    'oracle/ord/media/img/PropsAdapter', 'ordimimg.jar',
                    'oracle/ord/dicom/attr/DicomAttrTag', 'ordimdcm.jar',
                    'oracle/ord/media/annotator/servclt/AnnCltInServer', 'ordimann.jar') jar
          from sys.obj$ o, sys.user$ u, sys.javasnm$ j
          where u.name = 'ORDSYS'
            and u.user# = o.owner#
            and o.type# = 29
            and j.short(+) = o.name
            and nvl(j.longdbcs, o.name) in
                ( 'javax/media/jai/JAI', 'com/sun/media/jai/codec/ImageCodec',
                  'com/sun/medialib/mlib/mediaLibImage', 'oracle/ord/media/img/PropsAdapter',
                  'oracle/ord/dicom/attr/DicomAttrTag',
                  'oracle/ord/media/annotator/servclt/AnnCltInServer'
                )
      ) ) loop
        dbms_output.put_line(r.jar);
      end loop;
    end if;

  exception
    WHEN NO_DATA_FOUND THEN
      b_valid := FALSE;
      dbms_output.put_line('ORDIM java classes are not loaded.');

    WHEN OTHERS THEN
      b_valid := FALSE;
      err_code := SQLCODE;
      err_msg  := SUBSTR(SQLERRM, 1 , 100);
      DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
  end;


  -- Now check whether there are invalid objects
  BEGIN
    SELECT NULL INTO l_null  FROM sys.dba_invalid_objects
    WHERE
          (owner = 'ORDSYS'
        OR owner = 'ORDPLUGINS'
        OR owner = 'SI_INFORMTN_SCHEMA'
        OR owner = 'ORDDATA')
       AND rownum <= 1;

    -- invalid objects found
    b_valid := FALSE;

    FOR ob IN (SELECT o.object_name, o.status, o.object_type
               FROM sys.dba_invalid_objects o
        WHERE
              (o.owner = 'ORDSYS'
            OR o.owner = 'ORDPLUGINS'
            OR o.owner = 'SI_INFORMTN_SCHEMA'
            OR o.owner = 'ORDDATA')
            AND rownum < 20) LOOP
      dbms_output.put_line ('ORDIM INVALID OBJECTS: ' || ob.object_name || ' - ' || ob.status || ' - ' || ob.object_type);
    END LOOP;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      -- no valid objects, don't need to do anything
      null;

    WHEN OTHERS THEN
      b_valid := FALSE;
      err_code := SQLCODE;
      err_msg  := SUBSTR(SQLERRM, 1 , 100);
      DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
  END;

  -- Now check whether XML schemas are registered
  begin
    select count(*) into l_num_schemas from sys.all_xml_schemas
      where owner = 'ORDSYS'
        and schema_url in
            (
             'http://xmlns.oracle.com/ord/meta/ordimage',
             'http://xmlns.oracle.com/ord/meta/exif',
             'http://xmlns.oracle.com/ord/meta/iptc',
             'http://xmlns.oracle.com/ord/meta/xmp',
             'http://xmlns.oracle.com/ord/meta/dicomImage',
             'http://xmlns.oracle.com/ord/dicom/rpdatatype_1_0',
             'http://xmlns.oracle.com/ord/dicom/datatype_1_0',
             'http://xmlns.oracle.com/ord/dicom/mddatatype_1_0',
             'http://xmlns.oracle.com/ord/dicom/anonymity_1_0',
             'http://xmlns.oracle.com/ord/dicom/attributeTag_1_0',
             'http://xmlns.oracle.com/ord/dicom/constraint_1_0',
             'http://xmlns.oracle.com/ord/dicom/metadata_1_0',
             'http://xmlns.oracle.com/ord/dicom/mapping_1_0',
             'http://xmlns.oracle.com/ord/dicom/manifest_1_0',
             'http://xmlns.oracle.com/ord/dicom/preference_1_0',
             'http://xmlns.oracle.com/ord/dicom/privateDictionary_1_0',
             'http://xmlns.oracle.com/ord/dicom/standardDictionary_1_0',
             'http://xmlns.oracle.com/ord/dicom/orddicom_1_0',
             'http://xmlns.oracle.com/ord/dicom/UIDdefinition_1_0'
          )
    ;

    if ( l_num_schemas != 19 ) then
      b_valid := FALSE;
      dbms_output.put_line('ORDIM registered ' || l_num_schemas || ' XML schemas.');
      dbms_output.put_line('The following XML schemas are not registered:');

      for r in (
      (
        select 'http://xmlns.oracle.com/ord/meta/ordimage' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/meta/exif' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/meta/iptc' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/meta/xmp' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/meta/dicomImage' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/rpdatatype_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/datatype_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/mddatatype_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/anonymity_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/attributeTag_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/constraint_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/metadata_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/mapping_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/manifest_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/preference_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/privateDictionary_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/standardDictionary_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/orddicom_1_0' schema_url from dual
        union
        select 'http://xmlns.oracle.com/ord/dicom/UIDdefinition_1_0' schema_url from dual
      )
      minus
      (
        select schema_url from sys.all_xml_schemas
          where owner = 'ORDSYS'
            and schema_url in
                (
                 'http://xmlns.oracle.com/ord/meta/ordimage',
                 'http://xmlns.oracle.com/ord/meta/exif',
                 'http://xmlns.oracle.com/ord/meta/iptc',
                 'http://xmlns.oracle.com/ord/meta/xmp',
                 'http://xmlns.oracle.com/ord/meta/dicomImage',
                 'http://xmlns.oracle.com/ord/dicom/rpdatatype_1_0',
                 'http://xmlns.oracle.com/ord/dicom/datatype_1_0',
                 'http://xmlns.oracle.com/ord/dicom/mddatatype_1_0',
                 'http://xmlns.oracle.com/ord/dicom/anonymity_1_0',
                 'http://xmlns.oracle.com/ord/dicom/attributeTag_1_0',
                 'http://xmlns.oracle.com/ord/dicom/constraint_1_0',
                 'http://xmlns.oracle.com/ord/dicom/metadata_1_0',
                 'http://xmlns.oracle.com/ord/dicom/mapping_1_0',
                 'http://xmlns.oracle.com/ord/dicom/manifest_1_0',
                 'http://xmlns.oracle.com/ord/dicom/preference_1_0',
                 'http://xmlns.oracle.com/ord/dicom/privateDictionary_1_0',
                 'http://xmlns.oracle.com/ord/dicom/standardDictionary_1_0',
                 'http://xmlns.oracle.com/ord/dicom/orddicom_1_0',
                 'http://xmlns.oracle.com/ord/dicom/UIDdefinition_1_0'
              )
      ) ) loop
        dbms_output.put_line(r.schema_url);
      end loop;

    end if;

  exception
    WHEN NO_DATA_FOUND THEN
      b_valid := FALSE;
      dbms_output.put_line('ORDIM XML schemas are not registered.');

    WHEN OTHERS THEN
      b_valid := FALSE;
      err_code := SQLCODE;
      err_msg  := SUBSTR(SQLERRM, 1 , 100);
      DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
  end;

  -- Now check whether default documents are inserted into the DICOM repository
  begin
    select count(*) into l_num_docs from orddata.orddcm_docs
      where doc_name in
          (
            'ordcman.xml',
            'ordcmcmc.xml',
            'ordcmcmd.xml',
            'ordcmct.xml',
            'ordcmmp.xml',
            'ordcmpf.xml',
            'ordcmpv.xml',
            'ordcmsd.xml',
            'ordcmui.xml'
          )
    ;

    if ( l_num_docs != 9 ) then
      b_valid := FALSE;
      dbms_output.put_line('ORDIM DICOM repository has ' || l_num_docs || ' documents.');
      dbms_output.put_line('The following default DICOM repository documents are not installed:');

      for r in (
      (
        select 'ordcman.xml' doc_name from dual
        union
        select 'ordcmcmc.xml' doc_name from dual
        union
        select 'ordcmcmd.xml' doc_name from dual
        union
        select 'ordcmct.xml' doc_name from dual
        union
        select 'ordcmmp.xml' doc_name from dual
        union
        select 'ordcmpf.xml' doc_name from dual
        union
        select 'ordcmpv.xml' doc_name from dual
        union
        select 'ordcmsd.xml' doc_name from dual
        union
        select 'ordcmui.xml' doc_name from dual
      )
      minus
      (
        select doc_name from orddata.orddcm_docs
          where doc_name in
            (
              'ordcman.xml',
              'ordcmcmc.xml',
              'ordcmcmd.xml',
              'ordcmct.xml',
              'ordcmmp.xml',
              'ordcmpf.xml',
              'ordcmpv.xml',
              'ordcmsd.xml',
              'ordcmui.xml'
            )
      ) ) loop
        dbms_output.put_line(r.doc_name);
      end loop;

    end if;

  exception
    WHEN NO_DATA_FOUND THEN
      b_valid := FALSE;
      dbms_output.put_line('ORDIM default DICOM repository documents are not installed.');

    WHEN OTHERS THEN
      b_valid := FALSE;
      err_code := SQLCODE;
      err_msg  := SUBSTR(SQLERRM, 1 , 100);
      DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
  end;

  -- Now check whether DICOM ORDADMIN role is created
  begin
    SELECT count(*) INTO l_num_roles  FROM sys.user$ u
    WHERE type# = 0 and name = 'ORDADMIN';

    if ( l_num_roles != 1 ) then
      b_valid := FALSE;
      dbms_output.put_line('ORDIM DICOM administrator role ORDADMIN is not created.');
    end if;

  exception
    when no_data_found then
      b_valid := FALSE;
      dbms_output.put_line('ORDIM DICOM administrator role ORDADMIN is not created.');

    when others then
      b_valid := FALSE;
      err_code := SQLCODE;
      err_msg  := SUBSTR(SQLERRM, 1 , 100);
      DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
  end;

  -- Check whether Locator is valid if SDO is not installed or is OPTION OFF
  -- by checking whether there are invalid objects under MDSYS
  BEGIN
    l_sdo_status := dbms_registry.status('SDO');
    if (l_sdo_status is NULL or l_sdo_status = 'OPTION OFF' or
        l_sdo_status = 'REMOVED') then
      SELECT NULL INTO l_null  FROM sys.dba_invalid_objects
      WHERE
            owner = 'MDSYS'
        AND rownum <= 1;

      -- invalid objects found
      b_valid := FALSE;

      FOR ob IN (SELECT o.object_name, o.status, o.object_type
                 FROM sys.dba_invalid_objects o
          WHERE
                o.owner = 'MDSYS'
            AND rownum < 20) LOOP
        dbms_output.put_line ('Locator INVALID OBJECTS: ' || ob.object_name || ' - ' || ob.status || ' - ' || ob.object_type);
      END LOOP;
    end if;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      -- no valid objects, don't need to do anything
      null;

    WHEN OTHERS THEN
      b_valid := FALSE;
      err_code := SQLCODE;
      err_msg  := SUBSTR(SQLERRM, 1 , 100);
      DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
  END;

--
-- verify that data from ordsys has been moved to orddata
-- Note: this check is performed only if upgrading from 11.1
--  and the status is 'UPGRADED'

  begin
    select prv_version into l_prevDbVer
    from sys.registry$ where cid='ORDIM';

    l_status := sys.dbms_registry.status('ORDIM');

    if (l_prevDbVer = '11.1.0') and (l_status = 'UPGRADED') then
    begin
      -- Dynamic sql is used for compilation purposes because the
      -- ordsys.orddcm_docs table will not exist for new installations
      -- or if not upgrading from 11.1.0 database.
      -- check for documents in ORDSYS schema
      execute immediate 'select count(*) into l_num_docs from ordsys.orddcm_docs
          where doc_name in
              (
                ''ordcman.xml'',
                ''ordcmcmc.xml'',
                ''ordcmcmd.xml'',
                ''ordcmct.xml'',
                ''ordcmmp.xml'',
                ''ordcmpf.xml'',
                ''ordcmpv.xml'',
                ''ordcmsd.xml'',
                ''ordcmui.xml''
              );';
      if (l_num_docs <> 9 ) then
        dbms_output.put_line('ORDSYS DICOM repos: '
                              || 'expected: 9 got: '
                              || l_num_docs || ' default docs');
      end if;

     exception
      WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('ORDSYS DICOM repository documents are not installed.');

      WHEN OTHERS THEN
        err_code := SQLCODE;
        err_msg  := SUBSTR(SQLERRM, 1 , 100);
        DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
     end;


     BEGIN
       --
       -- Expect no differences between the ORDSYS and ORDDATA repos
       --
       l_dsql_block := 'BEGIN
             for cur in (select doc_name from ordsys.orddcm_docs
                  minus select doc_name from orddata.orddcm_docs) loop
               dbms_output.put_line(''ORDSYS doc: ''
                            || cur.doc_name || '' not in ORDDATA'');
             end loop;
           end;';

       execute immediate l_dsql_block;

       l_dsql_block := 'BEGIN
            for cur in ( select doc_name from orddata.orddcm_docs
                    minus select doc_name from ordsys.orddcm_docs) loop
               dbms_output.put_line(''ORDData doc: ''
                              || cur.doc_name || '' not in ORDSYS'');
            end loop;
          END;';

       execute immediate l_dsql_block;


     exception

      WHEN OTHERS THEN
        b_valid := FALSE;
        err_code := SQLCODE;
        err_msg  := SUBSTR(SQLERRM, 1 , 100);
        DBMS_OUTPUT.put_line('In validate_ordim OTHER EXCEPTION happens: Error code ' || err_code || ': ' || err_msg);
    END;
   end if;

  END;

  --
  -- Finally, if in upgrade mode, check if there are errors in registry$error
  --
  b_upgradeMode := sys.dbms_registry.is_in_upgrade_mode();
  if b_upgradeMode then
    l_num_errors := sys.dbms_registry.count_errors_in_registry('ORDIM');
    if (l_num_errors > 0) then
      dbms_output.put_line
       ('There were ' || l_num_errors ||
        ' entries in sys.registry$error for ORDIM');
      b_valid := FALSE;
    end if;
  end if;

  --
  -- Set the registry status at the end
  --
  if NOT b_valid then
    sys.dbms_registry.invalid('ORDIM');
  else
    sys.dbms_registry.valid('ORDIM');
  end if;

END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."VALIDATE_OWM" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
3c 79
oz79zhDfdMyhx2r7jsBZEvCRnvUwg5nnm7+fMr2ywFwWDEf6WaFWofBylnJcpXSLwMAy/tKG
CWnn/rJKdDyZx9II9VJ0UvD+KP5cS4vAgcctyaamlmjzLA==
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."VALIDATE_SDO" IS
cnt number;
v_value varchar(64);
BEGIN

    SELECT value INTO  v_value from  v$option WHERE parameter = 'Spatial';
     if v_value = 'FALSE' then
       -- set status OPTION OFF
       sys.dbms_registry.set_rdbms_status('SDO',9);
       return;
     end if;

    select count(*) into cnt from dba_invalid_objects where status = 'INVALID'
           and OWNER='MDSYS';

     if cnt > 0 then
       dbms_registry.invalid('SDO');
       return;
     end if;

    select count(*) into cnt from dba_xml_schemas where OWNER = 'MDSYS';

     if cnt < 5 then
       dbms_registry.invalid('SDO');
       return;
     end if;

    dbms_registry.valid('SDO');
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."XMLVALIDATE" is
  p_num NUMBER;
begin
  SELECT COUNT(*) INTO p_num
  FROM obj$
  WHERE type# = 29 AND owner# = 0 AND status <> 1
    AND ( 1=0
        OR name like 'javax/xml%'
        OR name like 'javax/xml/namespace%'
        OR name like 'javax/xml/parsers%'
        OR name like 'javax/xml/transform%'
        OR name like 'javax/xml/transform/dom%'
        OR name like 'javax/xml/transform/sax%'
        OR name like 'javax/xml/transform/stream%'
        OR name like 'oracle/xml/async%'
        OR name like 'oracle/xml/comp%'
        OR name like 'oracle/xml/jaxp%'
        OR name like 'oracle/xml/jdwp%'
        OR name like 'oracle/xml/mesg%'
        OR name like 'oracle/xml/parser%'
        OR name like 'oracle/xml/sql%'
        OR name like 'oracle/xml/util%'
        OR name like 'oracle/xml/xpath%'
        OR name like 'oracle/xml/xqxp%'
        OR name like 'oracle/xml/xslt%'
        OR name like 'org/w3c/dom%'
        OR name like 'org/xml/sax%'
        OR name like 'OracleXML%'
        OR name like 'oracle/xquery%'
    );
  IF p_num != 0 THEN
    dbms_registry.invalid('XML');
  ELSE
    dbms_registry.valid('XML');
  END IF;
  EXCEPTION WHEN no_data_found THEN
    dbms_registry.valid('XML');
end xmlvalidate;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYS"."XOQ_VALIDATE" IS
  compat          VARCHAR2(30);
  dummy_num       NUMBER;
  dummy_out_1_str VARCHAR2(100);
  dummy_out_2_str VARCHAR2(100);
  ok              BOOLEAN := TRUE;
  v_Value         varchar2(64);
BEGIN

  begin
    SELECT value INTO v_Value FROM v$option WHERE parameter = 'OLAP';
    if v_Value = 'FALSE' then
      -- set status OPTION OFF
      sys.dbms_registry.Option_Off('XOQ');
      return;
    end if;
  exception
    when OTHERS then
      null;
  end;

  -- check compatible
  SELECT value INTO compat FROM v$parameter WHERE name='compatible';
  IF NOT (substr(compat,1,3) >= '9.2' OR substr(compat,1,2) >= '10') THEN
    ok := FALSE;
  END IF;

  IF ok THEN
    --check for errors during installation/upgrade
    BEGIN
      SELECT 0 INTO dummy_num from sys.registry$error
        WHERE identifier='XOQ'AND rownum <=1;
      -- at least one install error was found so component is invalid
      ok := FALSE;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
      -- no install errors were found so component remains valid
        NULL;
    END;
  END IF;

  IF ok THEN
    -- check that dependent component XDB is valid
    IF dbms_registry.is_valid('XDB', dbms_registry.release_version) != 1 THEN
      ok := FALSE;
    END IF;
  END IF;

  IF ok THEN
   -- check that expected XDB resources are there
    IF NOT (dbms_xdb.existsresource('/olap_data_security/public/acls') AND
            dbms_xdb.existsresource('/xds/dsd')) THEN
      ok := FALSE;
    END IF;
  END IF;

  IF ok THEN
    -- check that installed library is valid
    BEGIN
      SELECT 0 INTO dummy_num FROM DBA_LIBRARIES
        WHERE STATUS = 'INVALID' AND rownum <=1 AND
          OWNER='SYS' AND LIBRARY_NAME = 'DBMS_OLAPI_LIB';
      -- at least one object is invalid so component is invalid
      ok := FALSE;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
      -- no invalid objects were found so component remains valid
        NULL;
    END;
  END IF;

  IF ok THEN
    -- check very basic OLAP API function (including load of shared library)
    BEGIN
      dummy_num := OlapiBootstrap2(compat, dummy_out_1_str, dummy_out_2_str);
    EXCEPTION
      WHEN OTHERS THEN
        ok := FALSE;
    END;
  END IF;

  IF ok THEN
    -- check that Java classes are loaded successfully
    BEGIN
      SELECT 0 INTO dummy_num FROM dba_objects
        WHERE owner = 'SYS' AND
             status = 'INVALID' AND
             object_type = 'JAVA CLASS' AND
             object_name LIKE 'oracle/AWXML/%';
      -- at least one class is invalid so component is invalid
      ok := FALSE;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      -- no invalid components were found so component remains valid
      NULL;
    END;
  END IF;

  IF ok THEN
    -- check that installed types, packages, and procedures are valid
    BEGIN
      SELECT 0 INTO dummy_num FROM DBA_OBJECTS
        WHERE STATUS = 'INVALID' AND rownum <=1 AND
          OWNER='SYS' AND OBJECT_NAME IN
             ('DBMS_CUBE_ADVISE','DBMS_CUBE_ADVISE_SEC','DBMS_CUBE',
              'DBMS_CUBE_EXP','GENDATABASEINTERFACE','GENCONNECTIONINTERFACE',
              'GENSERVERINTERACE','GENMDMPROPERTYIDCONSTANTS',
              'GENMDMCLASSCONSTANTS','GENMDMOBJECTIDCONSTANTS',
              'GENMETADATAPROVIDERINTERFACE','GENCURSORMANAGERINTERFACE',
              'GENDATATYPEIDCONSTANTS','GENDEFINITIONMANAGERINTERFACE',
              'GENDATAPROVIDERINTERFACE','DBMS_AW_XML','DBMS_CUBE_UTIL',
              'COAD_ADVICE_T','COAD_ADVICE_REC','GENOLAPIEXCEPTION',
              'GENINTERFACESTUB', 'GENINTERFACESTUBSEQUENCE',
              'GENRAWSEQUENCE','GENWSTRINGSEQUENCE',
              'DBMS_CUBE_UTIL_EXT_MD_T','DBMS_CUBE_UTIL_EXT_MD_R',
              'OLAPIHANDSHAKE2','OLAPIBOOTSTRAP2');
      -- at least one object is invalid so component is invalid
      ok := FALSE;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
      -- no invalid objects were found so component remains valid
        NULL;
    END;
  END IF;

  IF ok THEN
    -- check for expected role
    BEGIN
      SELECT 0 INTO dummy_num FROM DBA_ROLES
        WHERE ROLE = 'OLAP_XS_ADMIN';
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        ok := FALSE;
    END;
  END IF;

  IF ok THEN
    -- Address bug 17997122 by carefully checking OLAP_XS_ADMIN role
    -- privileges against the DBA_TAB_PRIVS view.
    -- check for privileges granted as local granted privileges, COMMON='NO'
    SELECT COUNT(*) INTO dummy_num
    FROM DBA_TAB_PRIVS
    WHERE GRANTEE='OLAP_XS_ADMIN' AND
          ((PRIVILEGE='SELECT' AND OWNER='SYS' AND
             TABLE_NAME='XS$OLAP_POLICY' AND COMMON='NO') OR
           (PRIVILEGE='SELECT' AND OWNER='SYS' AND
             TABLE_NAME='DBA_ROLES' AND COMMON='NO') OR
           (PRIVILEGE='EXECUTE' AND OWNER='SYS' AND
             TABLE_NAME='DBMS_XDS' AND COMMON='NO'));

    IF dummy_num = 0 THEN
      -- No local granted privileges
      -- check to see if grants are common granted privileges, COMMON = 'YES'
      SELECT COUNT(*) INTO dummy_num
      FROM DBA_TAB_PRIVS
      WHERE GRANTEE='OLAP_XS_ADMIN' AND
            ((PRIVILEGE='SELECT' AND OWNER='SYS' AND
               TABLE_NAME='XS$OLAP_POLICY' AND COMMON='YES') OR
             (PRIVILEGE='SELECT' AND OWNER='SYS' AND
               TABLE_NAME='DBA_ROLES' AND COMMON='YES') OR
             (PRIVILEGE='EXECUTE' AND OWNER='SYS' AND
               TABLE_NAME='DBMS_XDS' AND COMMON='YES'));
      IF dummy_num != 3 THEN
        -- Incomplete set of common granted privileges granted, so invalid
        ok := FALSE;
      END IF;

    ELSIF dummy_num = 3 THEN
      --  Grants are valid for local granted privileges.
      --  Now grants may also be a common granted privilege, COMMON = 'YES'
      SELECT COUNT(*) INTO dummy_num
      FROM DBA_TAB_PRIVS
      WHERE GRANTEE='OLAP_XS_ADMIN' AND
            ((PRIVILEGE='SELECT' AND OWNER='SYS' AND
               TABLE_NAME='XS$OLAP_POLICY' AND COMMON='YES') OR
             (PRIVILEGE='SELECT' AND OWNER='SYS' AND
               TABLE_NAME='DBA_ROLES' AND COMMON='YES') OR
             (PRIVILEGE='EXECUTE' AND OWNER='SYS' AND
               TABLE_NAME='DBMS_XDS' AND COMMON='YES'));
      IF dummy_num = 0 THEN
        -- No Common granted privileges granted,
        -- but still valid because of valid local granted privileges
        ok := TRUE;
      ELSIF dummy_num != 3 THEN
        -- Incomplete set of common granted privileges granted, so invalid
        ok := FALSE;
      END IF;
    ELSE
      -- Incomplete set of local granted privileges granted, so invalid
      ok := FALSE;
    END IF;
  END IF;

  IF ok THEN
    sys.dbms_registry.valid('XOQ');
  ELSE
    sys.dbms_registry.invalid('XOQ');
  END IF;
END;
/


ALTER PROCEDURE "SYS"."SUBPTXT2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:50'
/


ALTER PROCEDURE "SYS"."SUBPTXT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:50'
/


ALTER PROCEDURE "SYS"."ODCIINDEXINFOFLAGSDUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCICOLINFOFLAGSDUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:12'
/


ALTER PROCEDURE "SYS"."ODCIINDEXINFODUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIPREDINFODUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCICOLINFODUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIANYDATADUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIQUERYINFODUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCISTATSOPTIONSDUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIENVDUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIINDEXALTEROPTIONDUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIINDEXCALLPROPERTYDUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIPARTINFODUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCIPARTINFOLISTDUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."ODCITABFUNCINFODUMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER PROCEDURE "SYS"."DBMS_PDB_EXEC_SQL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:17'
/


ALTER PROCEDURE "SYS"."LOAD_UNDO_STAT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:43'
/


ALTER PROCEDURE "SYS"."RESET_UNDO_STAT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:43'
/


ALTER PROCEDURE "SYS"."LOGMNR_KRVRDLUID3"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:45'
/


ALTER PROCEDURE "SYS"."LOGMNR_KRVRDREPDICT3"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:45'
/


ALTER PROCEDURE "SYS"."DBMS_LOGMNR_FFVTOLOGMNRT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:45'
/


ALTER PROCEDURE "SYS"."LOGMNR_KRVRDA_TEST_APPLY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:45'
/


ALTER PROCEDURE "SYS"."LOGMNR$ALWAYSSUPLOG_PROC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:45'
/


ALTER PROCEDURE "SYS"."LOGMNR_RMT_BLD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:45'
/


ALTER PROCEDURE "SYS"."SCHEDULER$_JOB_EVENT_HANDLER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:50:18'
/


ALTER PROCEDURE "SYS"."LOGMNR_GTLO3"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:50:21'
/


ALTER PROCEDURE "SYS"."LOGMNR_DDL_TRIGGER_PROC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:50:21'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_BA_OWNER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ASM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AUTOSTA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SPD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ADAPTIVE_PLANS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AUTO_REOPT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_CONCURRENT_STATS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_STATS_INCREMENTAL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_WCR_CAPTURE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_WCR_REPLAY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_PARTITION_USER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_PARTITION_SYSTEM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ZMAP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_PLSQL_NATIVE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_QOSM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ROND"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RAC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_XDB"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_JSON"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_APEX"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_OBJECT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_EXTENSIBILITY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RULESMANAGER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_CDC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SERVICES"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_STREAMS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_XSTREAM_OUT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_XSTREAM_IN"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_XSTREAM_STREAMS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_GOLDENGATE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_USER_MVS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_IOT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_IMC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ADV_TABCMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ADV_IDXCMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_HCC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_HCCRLL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ILM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_HEATMAP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."KDZSTORAGETYPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ZFS_STORAGE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_PILLAR_STORAGE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ZFS_EHCC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_PILLAR_EHCC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SECUREFILES_USR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SECUREFILES_SYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SFENCRYPT_USR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SFENCRYPT_SYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SFCOMPRESS_USR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SFCOMPRESS_SYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SFDEDUP_USR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SFDEDUP_SYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DATA_GUARD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ACTIVE_DATA_GUARD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_MOVE_DATAFILE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DATA_REDACTION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DATABASE_ODM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DYN_SGA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AUTO_SGA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AUTO_MEM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RESOURCE_MANAGER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_ZLIB"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_BZIP2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_BASIC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_LOW"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_MEDIUM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_HIGH"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_BACKUP_ENCRYPTION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_BACKUP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_DISK_BACKUP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RMAN_TAPE_BACKUP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AUTO_SSM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_LMT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SEGADV_USER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AUM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:40'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_JOB_SCHEDULER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_EXADATA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_IDH"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_GATEWAYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES1"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES3"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_UTILITIES4"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AWR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DATABASE_VAULT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DEFERRED_SEG_CRT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DBFS_CONTENT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DBFS_SFS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DBFS_HS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_DMU"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_RAS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_ONLINE_REDEF"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_1"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_3"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_4"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_TEST_PROC_5"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_AUDIT_OPTIONS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_FGA_AUDIT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_UNIFIED_AUDIT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_PDB_NUM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_LABEL_SECURITY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_PRIV_CAPTURE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_TSDP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_SEG_MAIN_ONL_COMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_EMX"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_IMA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_REGISTER_ALLFEAT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:41'
/


ALTER PROCEDURE "SYS"."DBMS_FEATURE_REGISTER_ALLHWM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:42'
/


ALTER PROCEDURE "SYS"."AW_TRUNC_PROC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER PROCEDURE "SYS"."AW_REN_PROC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER PROCEDURE "SYS"."AW_DROP_PROC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER PROCEDURE "SYS"."SETMODFLG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:33'
/


ALTER PROCEDURE "SYS"."VALIDATE_OWM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:06:04'
/


ALTER PROCEDURE "SYS"."XMLVALIDATE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:09:46'
/


ALTER PROCEDURE "SYS"."VALIDATE_CONTEXT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:11:29'
/


ALTER PROCEDURE "SYS"."VALIDATE_ORDIM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:16:42'
/


ALTER PROCEDURE "SYS"."APS_VALIDATE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:20:11'
/


ALTER PROCEDURE "SYS"."OLAPIHANDSHAKE2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:20:23'
/


ALTER PROCEDURE "SYS"."XOQ_VALIDATE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:20:31'
/


ALTER PROCEDURE "SYS"."VALIDATE_SDO"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:20:54'
/


ALTER PROCEDURE "SYS"."VALIDATE_OLS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:29:04'
/


ALTER PROCEDURE "SYS"."VALIDATE_APEX"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:29:17'
/


ALTER PROCEDURE "SYS"."VALIDATE_DV"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:56'
/

