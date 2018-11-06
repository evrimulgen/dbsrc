ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_GROUP_CHK" CHECK (cloud_group_name=upper(cloud_group_name)) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_SERVICE_CHK" CHECK (cloud_service_name=upper(cloud_service_name)) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_CLOUD_UK" UNIQUE ("CLOUD_GROUP_NAME", "CLOUD_SERVICE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD UNIQUE ("PROVISIONING_COMPANY_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_FILES_CK" CHECK (allow_team_dev_files_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_PURGE_CK" CHECK (allow_to_be_purged_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_RESTFUL_CK" CHECK (allow_restful_services_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_A_ARCH_CK" CHECK (auto_archive_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_EXPIRE" CHECK (expire_fnd_user_accounts in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_CK2" CHECK (account_status in ('AVAILABLE','ASSIGNED','SUSPENDED','TERMINATE','ASSIGN_LCK')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_HOST_CHK" CHECK (host_prefix=upper(host_prefix)) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANIES" ADD CONSTRAINT "WWV_FLOW_COMPANIES_PATH_CHK" CHECK (path_prefix=upper(path_prefix)) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANY_SCHEMAS" ADD CONSTRAINT "WWV_FLOW_COMP_SCHEMAS_APEX$_CK" CHECK (is_apex$_schema in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANY_SCHEMAS" ADD CONSTRAINT "WWV_FLOW_COMPANY_SCHEMAS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLATFORM_PREFS" ADD CONSTRAINT "WWV_FLOW_PLATFORM_PREFS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_NAME_CK" CHECK ( name = upper(name) and instr(name, ':') = 0 ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_NAME_UK" UNIQUE ("NAME", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BUILDER_FEATURES" ADD CONSTRAINT "WWV_FLOW_BLD_FEATURE_NAME_CK" CHECK ( name = upper(name) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_BUILDER_FEATURES" ADD CONSTRAINT "WWV_FLOW_BLD_FEATURE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BUILDER_FEATURES" ADD CONSTRAINT "WWV_FLOW_BLD_FEATURE_NAME_UK" UNIQUE ("NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPE_FEATURES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_FEATURE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPE_FEATURES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_FEATURE_UK" UNIQUE ("UI_TYPE_ID", "BUILDER_FEATURE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_CK_BROWSER_CACHE" CHECK (browser_cache in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_CK_BROWSER_FRAME" CHECK (browser_frame in ('D','A','S')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_CK_DEEP_LINKING" CHECK (deep_linking in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_CK_COMP_MODE" CHECK (compatibility_mode in ('4.0', '4.1', '4.2')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_CK_ESC_MODE" CHECK (html_escaping_mode in ('B', 'E')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_FLOW_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_PK_IDX" UNIQUE ("SECURITY_GROUP_ID", "ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_ALIAS_IDX" UNIQUE ("ALIAS", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_ALLOW_FEEDBACK_YN_CK" CHECK (allow_feedback_yn in (
                                  'Y',
                                  'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_VALID_FLOW_LOGGINGYESNO" CHECK (webdb_logging in (
                                  'YES',
                                  'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_VALID_FLOW_LANG_FROM" CHECK (flow_language_derived_from in (
                                  'FLOW_PRIMARY_LANGUAGE',
                                  'BROWSER',
                                  'ITEM_PREFERENCE',
                                  'FLOW_PREFERENCE',
                                  'SESSION',
                                  '0')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_NLS_COMP_CK" CHECK (nls_comp in (
                                  'BINARY',
                                  'LINGUISTIC'
                                  )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_VALID_AUTH" CHECK (authentication in (
                                  'DATABASE',
                                  'COOKIE',
                                  'ASFCOOKIE',
                                  'ORACLE_LOGIN_SERVER',
                                  'CUSTOM2',
                                  'CUSTOM',
                                  'PLUGIN')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_VALID_STATUS" CHECK (flow_status in (
                                  'AVAILABLE',
                                  'AVAILABLE_W_EDIT_LINK',
                                  'AVAILABLE_W_INLINE_EDIT',
                                  'DEVELOPERS_ONLY',
                                  'UNAVAILABLE_URL',
                                  'UNAVAILABLE_PLSQL',
                                  'RESTRICTED_ACCESS',
                                  'UNAVAILABLE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_EXACT_SUBS_FLAG" CHECK (exact_substitutions_only in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_CSV_ENCODING" CHECK (csv_encoding in (
                                  'Y',
                                  'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_AUTO_TIME_ZONE" CHECK (auto_time_zone in (
                                  'Y',
                                  'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_CDN_CK" CHECK ( content_delivery_network in ('GOOGLE', 'MICROSOFT', 'JQUERY') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_INC_LEGACY_JS_CK" CHECK (include_legacy_javascript in (
                                  'Y',
                                  'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_VALID_BUILD_STATUS" CHECK (build_status in (
                                  'RUN_AND_BUILD',
                                  'RUN_ONLY',
                                  'RUN_AND_HIDDEN')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_AUTHZ_PUBLIC_PAGES_CK" CHECK (authorize_public_pages_yn in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_VALID_REJOIN_ES" CHECK (rejoin_existing_sessions in (
                                  'Y',
                                  'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_DEFAULT_EDL" CHECK ( default_error_display_location in (
                                               'INLINE_WITH_FIELD',
                                               'INLINE_WITH_FIELD_AND_NOTIFICATION',
                                               'INLINE_IN_NOTIFICATION') ) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_PAGE_PROT_ENABLE_FLAG" CHECK (page_protection_enabled_y_n in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOW_APP_TYPE" CHECK (application_type in ('STANDARD','TEMPLATE','SAMPLE','TEMPLATE_HIDDEN','THEME')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_APPLICATION_GROUPS" ADD CONSTRAINT "WWV_FLOW_APP_GROUP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS_RESERVED" ADD CONSTRAINT "WWV_FLOW_RESERVED_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGES_RESERVED" ADD CONSTRAINT "WWV_FLOW_PAGES_RESERVED_PK" PRIMARY KEY ("ID", "FLOW_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_APP_COMMENTS" ADD CONSTRAINT "WWV_FLOW_APP_COMMENTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_USER_INTERFACES" ADD CONSTRAINT "WWV_FLOW_UI_USE_AUTO_DETECT_CK" CHECK ( use_auto_detect in ('Y', 'N' ) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_USER_INTERFACES" ADD CONSTRAINT "WWV_FLOW_UI_IS_DEFAULT_CK" CHECK ( is_default in ('Y', 'N' ) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_USER_INTERFACES" ADD CONSTRAINT "WWV_FLOW_UI_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_USER_INTERFACES" ADD CONSTRAINT "WWV_FLOW_USER_INT_TYPE_UK" UNIQUE ("FLOW_ID", "UI_TYPE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SECURITY_SCHEMES" ADD CONSTRAINT "WWV_FLOW_SEC_SCHEMES_TYPE_CK" CHECK (
                                  scheme_type in (
                                    'EXISTS',
                                    'NOT_EXISTS',
                                    'ITEM_IS_NULL',
                                    'ITEM_IS_NOT_NULL',
                                    'FUNCTION_RETURNING_BOOLEAN',
                                    'PREFERENCE_EQ_COND_TEXT',
                                    'PREFERENCE_NOT_EQ_COND_TEXT',
                                    'VAL_OF_ITEM_IN_COND_EQ_COND_TEXT',
                                    'VAL_OF_ITEM_IN_COND_NOT_EQ_COND_TEXT')
                                  or scheme_type like 'NATIVE\_%' escape '\'
                                  or scheme_type like 'PLUGIN\_%' escape '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SECURITY_SCHEMES" ADD CONSTRAINT "WWV_FLOW_SEC_SCHEME_CACHE" CHECK (caching in (
                              'BY_USER_BY_PAGE_VIEW',
                              'BY_USER_BY_SESSION')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SECURITY_SCHEMES" ADD CONSTRAINT "WWV_FLOW_SEC_SCHEME_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATE_PREFERENCES" ADD CONSTRAINT "WWV_FLOW_TEMPL_PREF_PK" PRIMARY KEY ("OWNER")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LANGUAGES" ADD CONSTRAINT "WWV_FLOW_LANGUAGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LANGUAGE_MAP" ADD CONSTRAINT "WWV_FLOW_LANG_MAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TRANSLATABLE_COLS$" ADD CONSTRAINT "WWV_FLOW_TRANS_COLS_CHK" CHECK (template_translatable in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TRANSLATABLE_COLS$" ADD CONSTRAINT "WWV_FLOW_TRANS_COLS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TRANSLATABLE_TEXT$" ADD CONSTRAINT "WWV_FLOW_TRANS_SPECIFIC_CHECK" CHECK (translation_specific_to_item in ('YES','NO')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TRANSLATABLE_TEXT$" ADD CONSTRAINT "WWV_FLOW_TRANS_TEMP_TRANS_CHK" CHECK (template_translatable in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TRANSLATABLE_TEXT$" ADD CONSTRAINT "WWV_FLOW_TRANS_TEXT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DYNAMIC_TRANSLATIONS$" ADD CONSTRAINT "WWV_FLOW_DYN_TRANS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DEVELOPER_LOG" ADD CONSTRAINT "WWV_FLOW_TRANS_LOG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_CACHE" ADD CONSTRAINT "WWV_FLOW_PAGE_CACHE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_CODE_CACHE" ADD CONSTRAINT "WWV_FLOW_PAGE_CODE_CACHE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_TEMPLATES_IS_POPUP_CK" CHECK ( is_popup in ('Y', 'N' ) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_TMPL_GRID_TYPE_CK" CHECK (grid_type in ('TABLE', 'FIXED', 'VARIABLE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_TMPL_GRID_MAX_COL_CK" CHECK (grid_max_columns between 1 and 99) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_TMPL_GRID_ALWAYS_MAX_CK" CHECK ( grid_always_use_max_columns in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_TMPL_GRID_COLSPAN_CK" CHECK ( grid_has_column_span in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_TMPL_GRID_LEADING_COLS_CK" CHECK ( grid_emit_empty_leading_cols in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_TMPL_GRID_TRAIL_COLS_CK" CHECK ( grid_emit_empty_trailing_cols in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_TMPL_EDIT_LINKS_CK" CHECK ( has_edit_links in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_MOBILE_TEMP" CHECK (mobile_page_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_TEMPLATES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PAGE_TMPL_DP_UPPER_CK" CHECK ( placeholder = upper(placeholder) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PAGE_TMPL_DP_GRID_CK" CHECK ( has_grid_support in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PAGE_TMPL_DP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PAGE_TMPL_DP_UK1" UNIQUE ("PAGE_TEMPLATE_ID", "PLACEHOLDER")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PAGE_TMPL_DP_UK2" UNIQUE ("PAGE_TEMPLATE_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REQUIRED_ROLES" ADD CONSTRAINT "WWV_FLOW_REQ_ROLES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FIELD_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_FIELD_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FIELD_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_FIELD_TEMPLATE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ICON_BAR_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_ICONBARATTR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ICON_BAR" ADD CONSTRAINT "VALID_FICON_BEGINONNEWLINE" CHECK (begins_on_new_line in ('NO','YES')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ICON_BAR" ADD CONSTRAINT "VALID_FICON_NAVISFEEDBACK" CHECK (nav_entry_is_feedback_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ICON_BAR" ADD CONSTRAINT "WWV_FLOW_ICON_BAR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROCESSING" ADD CONSTRAINT "WWV_FLOW_PROC_EDL" CHECK (error_display_location in ('INLINE_IN_NOTIFICATION', 'ON_ERROR_PAGE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PROCESSING" ADD CONSTRAINT "WWV_FLOW_PROCESSING_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROCESSING" ADD CONSTRAINT "VALID_FPROC_PROCPOINT" CHECK (process_point in (
                      'ON_DEMAND',
                      'ON_SUBMIT_BEFORE_COMPUTATION',
                      'AFTER_AUTHENTICATION',
                      'BEFORE_HEADER',
                      'AFTER_HEADER',
                      'AFTER_ERROR_HEADER',
                      'BEFORE_ERROR_FOOTER',
                      'BEFORE_BOX_BODY',
                      'BEFORE_SHOW_ITEMS', -- obsolete
                      'AFTER_SHOW_ITEMS', -- obsolete
                      'AFTER_BOX_BODY',
                      'BEFORE_FOOTER',
                      'AFTER_FOOTER',
                      'AFTER_SUBMIT_BEFORE_VALIDATION',
                      'AFTER_SUBMIT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROCESSING" ADD CONSTRAINT "WWV_VALID_PROC_TYPE" CHECK (process_type in (
                           'SET_ITEM_USING_STATIC_ASSIGNMENT',
                           'SET_ITEM_USING_PLSQL_FUNCTION_BODY',
                           'SET_ITEM_USING_PLSQL_EXPRESSION',
                           'SET_ITEM_USING_SQL_EXPRESSION',
                           'SET_ITEM_USING_SQL_QUERY',
                           'PLSQL',
                           'INITIALIZE_ALL_PAGE_ITEMS'
                           ) or
                           process_type like 'NATIVE\_%' ESCAPE '\' or
                           process_type like 'PLUGIN\_%' ESCAPE '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ITEMS" ADD CONSTRAINT "WWV_FLOW_ITEMS_CK_SCOPE" CHECK (scope in ('APP','GLOBAL')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ITEMS" ADD CONSTRAINT "VALID_FITEMS_DATATYPE" CHECK (data_type in (
                               'VARCHAR',
                               'NUMBER',
                               'DATE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ITEMS" ADD CONSTRAINT "VALID_FITEMS_ISPERS" CHECK (is_Persistent in ('Y','N','U','A')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ITEMS" ADD CONSTRAINT "VALID_FITEMS_PROTECTION_LEVEL" CHECK (protection_level in ('N','B','P','S','I')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ITEMS" ADD CONSTRAINT "WWV_FLOW_ITEMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_VALIDATIONS" ADD CONSTRAINT "WWV_VALID_APP_VAL_VTYPE" CHECK (validation_type in (
                                  'SQL_EXPRESSION',
                                  'PLSQL_EXPRESSION',
                                  'REGULAR_EXPRESSION',
                                  'FUNC_BODY_RETURNING_ERR_TEXT',
                                  'FUNC_BODY_RETURNING_BOOLEAN',
                                  'NOT_EXISTS',
                                  'EXISTS'
                                  )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_VAL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPUTATIONS" ADD CONSTRAINT "VALID_FCOMP_POINT" CHECK (computation_point in (
                          'ON_NEW_INSTANCE',
                          'BEFORE_HEADER',
                          'AFTER_ERROR_HEADER',
                          'BEFORE_ERROR_FOOTER',
                          'AFTER_HEADER',
                          'BEFORE_BOX_BODY',
                          'AFTER_BOX_BODY',
                          'BEFORE_FOOTER',
                          'AFTER_FOOTER',
                          'AFTER_SUBMIT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPUTATIONS" ADD CONSTRAINT "VALID_FCOMP_ITEMTYPE" CHECK (computation_item_type in (
                          'VARCHAR',
                          'VC_ARR',
                          'NUMBER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPUTATIONS" ADD CONSTRAINT "VALID_FCOMP_COMPTYPE" CHECK (computation_type in (
                          'SET_ITEM_EQUAL_THIS_PREFERENCE',
                          'STATIC_ASSIGNMENT',
                          'FUNCTION_BODY',
                          'QUERY',
                          'QUERY_COLON',
                          'PLSQL_EXPRESSION',
                          'SQL_EXPRESSION',
                          'SQL_EXPRESION',
                          'ITEM_VALUE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPUTATIONS" ADD CONSTRAINT "VALID_FCOMP_COMPPROC" CHECK (computation_processed in (
                          'ON_NEW_INSTANCE',
                          'REPLACE_EXISTING',
                          'ADD_TO_EXISTING',
                          'RAISE_ERROR_ON_REPLACE',
                          'REPLACE_NULL_VALUES')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPUTATIONS" ADD CONSTRAINT "WWV_FLOW_COMPUTATIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TABS" ADD CONSTRAINT "WWV_FLOW_TABS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TOPLEVEL_TABS" ADD CONSTRAINT "WWV_FLOW_TOPLEV_TAB_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREES" ADD CONSTRAINT "WWV_FLOW_TREE_TYPE" CHECK (tree_type in ('DYNAMIC','STATIC')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TREES" ADD CONSTRAINT "WWV_FLOW_VALID_LEVEL" CHECK (max_levels between 1 and 100) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TREES" ADD CONSTRAINT "WWV_FLOW_TREE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LISTS_OF_VALUES$" ADD CONSTRAINT "WWV_FLOW_LOV_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_OF_VALUES_DATA" ADD CONSTRAINT "WWV_FLOW_LOV_DATA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "VALID_FSTEPS_SUBTITLETYPE" CHECK (step_sub_title_type in (
                        'NO_DISPLAY_FOR_CUSTOM_LOOK1',
                        'NO_DISPLAY_FOR_CUSTOM_LOOK2',
                        'NO_DISPLAY_FOR_CUSTOM_LOOK3',
                        'DISPLAY_FOR_CUSTOM_LOOK1_ONLY',
                        'DISPLAY_FOR_CUSTOM_LOOK2_ONLY',
                        'DISPLAY_FOR_CUSTOM_LOOK3_ONLY',
                        'TEXT_WITH_SUBSTITUTIONS',
                        'SQL_EXPRESSION',
                        'SQL_EXPRESION')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "VALID_ALL_DUP_PAGE_SUB" CHECK (allow_duplicate_submissions in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FLOW_PAGES_PGPUB_FLAG" CHECK (page_is_public_y_n in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "VALID_FSTEPS_PROTECTION_LEVEL" CHECK (protection_level in ('N','C','U','D')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FSTEPS_CK_BROWSER_CACHE" CHECK (browser_cache in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FSTEPS_CK_DEEP_LINKING" CHECK (deep_linking in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FLOW_STEP_AUTOCOMPLETE_CK" CHECK (autocomplete_on_off in ('ON', 'OFF')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FLOW_STEP_PAGE_TRANS_CK" CHECK ( page_transition in ('NONE', 'FADE', 'POP', 'FLIP', 'TURN', 'FLOW', 'SLIDEFADE', 'SLIDE', 'SLIDEUP', 'SLIDEDOWN') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FLOW_STEP_POPUP_TRANS_CK" CHECK ( popup_transition in ('NONE', 'FADE', 'POP', 'FLIP', 'TURN', 'FLOW', 'SLIDEFADE', 'SLIDE', 'SLIDEUP', 'SLIDEDOWN') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FLOW_STEPS_PK" PRIMARY KEY ("FLOW_ID", "ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_QUERY_NUM_ROWS_TYPE" CHECK (plug_query_num_rows_type in (
                                 'NEXT_PREVIOUS_LINKS',
                                 'COMPUTED_BUT_NOT_DISPLAYED',
                                 'ROW_RANGES',
                                 'ROW_RANGES_RIGHT',
                                 'ROW_RANGES_WITH_LINKS_RIGHT',
                                 'ROW_RANGES_WITH_LINKS',
                                 'ROW_RANGES_IN_SELECT_LIST',
                                 'ROW_RANGES_IN_SELECT_LIST_RIGHT',
                                 'ROWS_PER_PAGE_FROM_ITEM',
                                 'ROWS_X_TO_Y_OF_Z',
                                 'ROWS_X_TO_Y',
                                 'SEARCH_ENGINE',
                                 'SEARCH_ENGINE_RIGHT',
                                 '0'
                                 )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_REST_CHK" CHECK (rest_enabled in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_STRIP_HTML" CHECK (plug_query_strip_html in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_VALID_CACHING" CHECK (plug_caching in (
                                 'NOT_CACHED',
                                 'CACHED',
                                 'CACHED_BY_USER',
                                 'CACHED_BY_USER_AND_SESSION')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_BREAK_FLAG_CC" CHECK (break_type_flag in (
                                'REPEAT_HEADINGS_ON_BREAK_1',
                                'DEFAULT_BREAK_FORMATTING')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_CSV_OUTPUT_FLAG_CK" CHECK (csv_output in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_OUTPUT" CHECK (prn_output in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_FORMAT" CHECK (prn_format in (
                                          'PDF',
                                          'RTF',
                                          'XLS',
                                          'HTM',
                                          'XML'
                                      )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_SHOW_LINK" CHECK (prn_output_show_link in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_CONTENT_DISP" CHECK (prn_content_disposition in (
                                         'INLINE',
                                         'ATTACHMENT'
                                     )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_DOC_HEADER" CHECK (prn_document_header in (
                                         'SERVER',
                                         'APEX'
                                     )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_UNITS" CHECK (prn_units in (
                                         'POINTS',
                                         'INCHES',
                                         'MILLIMETERS',
                                         'CENTIMETERS'
                                     )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_PAPER_SIZE" CHECK (prn_paper_size in (
                                        'CUSTOM',
                                        'LETTER',
                                        'LEGAL',
                                        'TABLOID',
                                        'A4',
                                        'A3'
                                     )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_WIDTH_UNITS" CHECK (prn_width_units in (
                                         'PERCENTAGE',
                                         'POINTS'
                                     )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_ORIENTATION" CHECK (prn_orientation in (
                                         'HORIZONTAL',
                                         'VERTICAL'
                                     )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_HEADER_ALIGN" CHECK (prn_page_header_alignment in ('LEFT','CENTER','RIGHT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "PLUG_PRN_FOOTER_ALIGN" CHECK (prn_page_footer_alignment in ('LEFT','CENTER','RIGHT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_TRANSLATE_TITLE_CK" CHECK (translate_title in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PP_SORT_NULL_CK" CHECK (sort_null in (null,'F','L')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_FLOW_PAGE_PLUGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_NEW_GRID" CHECK (plug_new_grid in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_NEW_GRID_ROW" CHECK (plug_new_grid_row in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_NEW_GRID_COLUMN" CHECK (plug_new_grid_column in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_VALID_PLUG_DISP_COLUMN" CHECK (plug_display_column between 1 and 99) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_GRID_COL_SPAN" CHECK (plug_grid_column_span between 1 and 99) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_VALID_PLUG_DISPPOINT" CHECK (plug_display_point in (
                                 'REGION_POSITION_01',
                                 'REGION_POSITION_02',
                                 'REGION_POSITION_03',
                                 'REGION_POSITION_04',
                                 'REGION_POSITION_05',
                                 'REGION_POSITION_06',
                                 'REGION_POSITION_07',
                                 'REGION_POSITION_08',
                                 'REGION_POSITION_09',
                                 'REGION_POSITION_10',
                                 'REGION_POSITION_11',
                                 'REGION_POSITION_12',
                                 'REGION_POSITION_13',
                                 'REGION_POSITION_14',
                                 'REGION_POSITION_15',
                                 'REGION_POSITION_16',
                                 'REGION_POSITION_17',
                                 'REGION_POSITION_18',
                                 'REGION_POSITION_19',
                                 'REGION_POSITION_20',
                                 'REGION_POSITION_21',
                                 'REGION_POSITION_22',
                                 'REGION_POSITION_23',
                                 'REGION_POSITION_24',
                                 'REGION_POSITION_25',
                                 'REGION_POSITION_26',
                                 'REGION_POSITION_27',
                                 'REGION_POSITION_28',
                                 'REGION_POSITION_29',
                                 'REGION_POSITION_30',
                                 'AFTER_HEADER',
                                 'BODY_1',
                                 'BODY_2',
                                 'BODY_3',
                                 'BEFORE_FOOTER',
                                 -- obsolete but required for migration
                                 'BEFORE_BOX_BODY',
                                 'BEFORE_SHOW_ITEMS',
                                 'AFTER_SHOW_ITEMS')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_ITEM_DISP_POINT" CHECK (plug_item_display_point in ('ABOVE', 'BELOW')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_ESCAPE_ON_HTTP_OUTP" CHECK (escape_on_http_output in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_PLUG_HEAD_TYPE_CHECK" CHECK (plug_query_headings_type in (
                                 'NO_HEADINGS',
                                 'SORT_ENABLED_COLON_DELMITED_LIST',
                                 'SORT_ENABLED_QUERY_COLUMNS',
                                 'SORT_ENABLED_QUERY_COLUMNS_INITCAP',
                                 'COLON_DELMITED_LIST',
                                 'COLON_DELIMITED_LIST',
                                 'PIPE_DELMITED_LIST',
                                 'BACKSLASH_DELMITED_LIST',
                                 'QUERY_COLUMNS',
                                 'QUERY_COLUMNS_INITCAP',
                                 'FUNCTION_BODY_RETURNING_COLON_DELIMITED_LIST',
                                 'FUNCTION_BODY_RETURNING_PIPE_DELIMITED_LIST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_GENERIC_ATTR" ADD CONSTRAINT "WWV_FLOW_PAGE_GENERIC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_REGIONS" ADD CONSTRAINT "WWV_TREE_TEMPLATES_CON" CHECK (tree_template in (
                                        'classic',
                                        'apple',
                                        'default',
                                        'themeroller'
                                 )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_REGIONS" ADD CONSTRAINT "WWV_TREE_CLICK_ACT" CHECK (tree_click_action in ('S','D')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_REGIONS" ADD CONSTRAINT "WWV_NODE_LINK_CHECKSUM_TYPE" CHECK (node_link_checksum_type in (
                                    '1', -- workspace
                                    '2', -- user
                                    '3'  -- session
                                 )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_REGIONS" ADD CONSTRAINT "WWV_FLOW_TREEREGION_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "VALID_FSTEPB_POSITION" CHECK (button_position in (
                              'LEFT_OF_TITLE',
                              'RIGHT_OF_TITLE',
                              'ABOVE_BOX',
                              'TOP',
                              'BOTTOM',
                              'TOP_AND_BOTTOM',
                              'TEMPLATE_DEFAULT',
                              'BELOW_BOX',
                              'REGION_TEMPLATE_CREATE',
                              'REGION_TEMPLATE_CREATE2',
                              'REGION_TEMPLATE_CLOSE',
                              'REGION_TEMPLATE_EXPAND',
                              'REGION_TEMPLATE_EDIT',
                              'REGION_TEMPLATE_NEXT',
                              'REGION_TEMPLATE_PREVIOUS',
                              'REGION_TEMPLATE_CHANGE',
                              'REGION_TEMPLATE_DELETE',
                              'REGION_TEMPLATE_COPY',
                              'REGION_TEMPLATE_HELP',
                              'RIGHT_OF_IR_SEARCH_BAR'
                              ) and button_position is not null) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_VALID_FBUTTON_ALIGN" CHECK (button_alignment in ('LEFT','MIDDLE','RIGHT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_VALID_FBUTTON_ACTION" CHECK (button_action in (
                              'SUBMIT',
                              'REDIRECT_URL',
                              'REDIRECT_PAGE',
                              'DEFINED_BY_DA')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_VALID_FBUTTON_EXECVAL" CHECK (button_execute_validations in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_STEP_BUTTONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_VALID_FBUTTON_HOT" CHECK (button_is_hot in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCHES" ADD CONSTRAINT "VALID_FSBRANCH_POINT" CHECK (branch_point in (
                      'BEFORE_HEADER',
                      'BEFORE_COMPUTATION',
                      'BEFORE_VALIDATION',
                      'BEFORE_PROCESSING',
                      'AFTER_PROCESSING')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCHES" ADD CONSTRAINT "VALID_FSBRANCH_BRANCHTYPE" CHECK (branch_type in (
                      'BRANCH_TO_FUNCTION_RETURNING_PAGE',
                      'BRANCH_TO_FUNCTION_RETURNING_URL',
                      'BRANCH_TO_PAGE_IDENT_BY_ITEM',
                      'BRANCH_TO_URL_IDENT_BY_ITEM',
                      'BRANCH_TO_STEP',
                      'BRANCH_TO_PAGE_ACCEPT',
                      'PLSQL',
                      'REDIRECT_URL',
                      'BRANCH_TO_ENTRY_POINT',
                      'BRANCH_TO_ENTRY_POINT_IDENT_BY_ITEM')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCHES" ADD CONSTRAINT "WWV_FLOW_STEP_BRANCHES_SVSTATE" CHECK (save_state_before_branch_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCHES" ADD CONSTRAINT "WWV_FLOW_STEP_BRANCHES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCH_ARGS" ADD CONSTRAINT "VALID_FSTEPBRANCHARG_SRCTYPE" CHECK (branch_arg_source_type in (
         'VALUE_OF_ITEM',
         'STATIC_ASSIGNMENT',
         'FUNCTION_BODY',
         'QUERY',
         'PLSQL_EXPRESSION',
         'SQL_EXPRESSION')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCH_ARGS" ADD CONSTRAINT "WWV_FLOW_STEP_BRANCH_ARGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_DISPLAYAS" CHECK (display_as in (
                                'DISPLAY_ONLY_PLSQL',
                                'FILE',
                                'BUTTON',
                                'HIDDEN',
                                'HIDDEN_PROTECTED',
                                'DISPLAY_ONLY_HTML',
                                'STOP_AND_START_HTML_TABLE',
                                'DISPLAY_ONLY_ESCAPE_SC',
                                'IMAGE',
                                'DISPLAY_AND_SAVE',
                                'DISPLAY_AND_SAVE_LOV',
                                'CHECKBOX',
                                'POPUP',
                                'POPUP_FILTER',
                                'POPUP2',
                                'POPUP3',
                                'POPUP4',
                                'POPUP5',
                                'POPUP6',
                                'POPUP_KEY_LOV',
                                'POPUP_KEY_LOV_NOFETCH',
                                'POPUP_COLOR',
                                'PICK_DATE_USING_FLOW_FORMAT_MASK',
                                'PICK_DATE_USING_APP_FORMAT_MASK',
                                'PICK_DATE_USING_APP_DATE_FORMAT',
                                'PICK_DATE_USING_FORMAT_MASK',
                                'PICK_DATE_DD_MON_RR',
                                'PICK_DATE_DD_MON_RR_HH_MI',
                                'PICK_DATE_DD_MON_RR_HH24_MI',
                                'PICK_DATE_DD_MON_YYYY',
                                'PICK_DATE_DD_MON_YYYY_HH_MI',
                                'PICK_DATE_DD_MON_YYYY_HH24_MI',
                                'PICK_DATE_DD_MM_YYYY',
                                'PICK_DATE_DD_MM_YYYY_HH_MI',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI',
                                'PICK_DATE_MM_DD_YYYY',
                                'PICK_DATE_MM_DD_YYYY_HH_MI',
                                'PICK_DATE_MM_DD_YYYY_HH24_MI',
                                'PICK_DATE_DD_MON_YY',
                                'PICK_DATE_DD_MON_YY_HH_MI',
                                'PICK_DATE_DD_MON_YY_HH24_MI',
                                'PICK_DATE_YYYY_MM_DD',
                                'PICK_DATE_YYYY_MM_DD_HH_MI',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI',
                                'PICK_DATE_RR_MON_DD',
                                'PICK_DATE_RR_MON_DD_HH_MI',
                                'PICK_DATE_RR_MON_DD_HH24_MI',
                                'PICK_DATE_DD_MM_YYYY_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                                'PICK_DATE_YYYY_DD_MM_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                                'PICK_DATE_YYYY_MM_DD_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH',
                                'DISPLAY_ONLY_LOV',
                                'COMBOBOX',
                                'SHOW_AS_SL_WITH_POPUP',
                                'COMBOBOX_WITH_URL_REDIRECT',
                                'COMBOBOX_WITH_BRANCH_TO_PAGE',
                                'COMBOBOX_WITH_SUBMIT',
                                'COMBOBOX_WITH_JS_POST',
                                'COMBOBOX_WITH_JS_REDIRECT',
                                'MULTIPLESELECT',
                                'SHUTTLE',
                                'RADIOGROUP',
                                'RADIOGROUP2',
                                'RADIOGROUP_WITH_REDIRECT',
                                'RADIOGROUP_WITH_SUBMIT',
                                'RADIOGROUP_WITH_JS_SUBMIT',
                                'TEXTAREA',
                                'TEXTAREA_WITH_SPELL_CHECK',
                                'TEXTAREA-AUTO-HEIGHT',
                                'TEXTAREA_WITH_CONTROLS',
                                'TEXTAREA_WITH_HTML_EDITOR_BASIC',
                                'TEXTAREA_WITH_HTML_EDITOR_STANDARD',
                                'TEXTAREA_CHAR_COUNT',
                                'TEXTAREA_CHAR_COUNT_SPELL',
                                'TEXT',
                                'TEXT_WITH_ENTER_SUBMIT',
                                'TEXT_DISABLED',
                                'TEXT_DISABLED_AND_SAVE',
                                'TEXT_WITH_CALCULATOR',
                                'PASSWORD',
                                'PASSWORD_WITH_ENTER_SUBMIT',
                                'PASSWORD_DNSS',
                                'PASSWORD_WITH_SUBMIT_DNSS',
                                'LIST_MGR',
                                'LIST_MGR2',
                                'LIST_MGR3',
                                'LIST_MGR_VIEW',
                                'LIST_MGR_VIEW2',
                                -- 4.0
                                'SELECT_LIST_WITH_POPUP',
                                'TEXT_WITH_SELECT_LIST',
                                'TEXTAREA_WITH_POPUP',
                                'TEXTAREA_RESIZABLE'
                                ) or
                                display_as like 'NATIVE\_%' ESCAPE '\' or
                                display_as like 'PLUGIN\_%' ESCAPE '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_LOVEXTRA" CHECK (lov_display_extra in (
                            'YES',
                            'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_LOVDISPNULL" CHECK (lov_display_null in (
                            'YES',
                            'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_LOV_TRANS" CHECK (lov_translated in ('Y','N',null)) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_AJAX_OPT_REFRESH" CHECK (ajax_optimize_refresh in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_STEP_ITEMS_NEW_GRID_CK" CHECK (new_grid in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_BEGINONNEWLINE" CHECK (begin_on_new_line in (
                            'YES',
                            'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_BEGINONNEWFIELD" CHECK (begin_on_new_field in (
                            'YES',
                            'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_STEP_ITEMS_GRID_COL_CK" CHECK (grid_column between 1 and 99) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_LABELALIGN" CHECK (label_alignment in (
                            'LEFT',
                            'RIGHT',
                            'CENTER',
                            'ABOVE',
                            'BELOW',
                            'LEFT-TOP',
                            'RIGHT-TOP',
                            'CENTER-TOP',
                            'LEFT-BOTTOM',
                            'RIGHT-BOTTOM',
                            'CENTER-BOTTOM',
                            'LEFT-CENTER',
                            'RIGHT-CENTER',
                            'CENTER-CENTER'
                            )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_B_HOT" CHECK (button_is_hot in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_FLOW_STEP_ITEMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_DATATYPE" CHECK (data_type in (
                            'VARCHAR',
                            'NUMBER',
                            'DATE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_IS_REQUIRED" CHECK (is_required in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_STD_VAL" CHECK (standard_validations in ('BROWSER', 'SERVER', 'BROWSER_AND_SERVER', 'NONE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_ACCPPROC" CHECK (accept_processing in (
                            'REPLACE_EXISTING',
                            'REPLACE_NULL_VALUES',
                            'RAISE_ERROR_ON_REPLACE',
                            'ADD_TO_EXISTING')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_USECACHE" CHECK (use_cache_before_default in (
                            'YES',
                            'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_IDT" CHECK (item_default_type in (
                            'STATIC_TEXT_WITH_SUBSTITUTIONS',
                            'PLSQL_FUNCTION_BODY',
                            'PLSQL_EXPRESSION',
                            'SQL_QUERY')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_SOURCETYPE" CHECK (source_type in (
                            'PREFERENCE',
                            'ALWAYS_NULL',
                            'STATIC',
                            'QUERY',
                            'QUERY_COLON',
                            'ITEM',
                            'FUNCTION',
                            'FUNCTION_BODY',
                            'DB_COLUMN',
                            'PLSQL_ANONYMOUS_BLOCK')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_FIELDALIGN" CHECK (field_alignment in (
                            'LEFT',
                            'RIGHT',
                            'CENTER',
                            'LEFT-TOP',
                            'RIGHT-TOP',
                            'CENTER-TOP',
                            'LEFT-BOTTOM',
                            'RIGHT-BOTTOM',
                            'CENTER-BOTTOM',
                            'LEFT-CENTER',
                            'RIGHT-CENTER',
                            'CENTER-CENTER'
                            )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_ISPERSISTENT" CHECK (is_Persistent in ('Y','N','U')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALID_FSITEM_PROTECTION_LEVEL" CHECK (protection_level in ('N','B','P','S','I')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALFSITEM_ESCAPE_ON_HTTP_INPUT" CHECK (escape_on_http_input in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALFSITEM_ESCAPE_ON_HTTP_OUTP" CHECK (escape_on_http_output in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "VALFSITEM_RESTRICTED_CHARS" CHECK (restricted_characters in ('US_ONLY', 'WEB_SAFE', 'NO_SPECIAL_CHAR', 'NO_SPECIAL_CHAR_NL', 'WORKSPACE_SCHEMA')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_B_EXEC_VAL" CHECK (button_execute_validations in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_VALID_FSITEM_B_ACTION" CHECK (button_action in (
                              'SUBMIT',
                              'REDIRECT_URL',
                              'REDIRECT_PAGE',
                              'DEFINED_BY_DA')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEM_HELP" ADD CONSTRAINT "WWV_FLOW_PAGE_HELPTEXT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS" ADD CONSTRAINT "VALID_FSTEPCOMP_POINT" CHECK (computation_point in (
                          'ON_NEW_INSTANCE',
                          'BEFORE_HEADER',
                          'AFTER_HEADER',
                          'BEFORE_BOX_BODY',
                          'AFTER_BOX_BODY',
                          'BEFORE_FOOTER',
                          'AFTER_FOOTER',
                          'AFTER_SUBMIT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS" ADD CONSTRAINT "VALID_FSTEPCOMP_ITEMTYPE" CHECK (computation_item_type in (
                          'VARCHAR',
                          'VC_ARR',
                          'NUMBER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS" ADD CONSTRAINT "VALID_FSTEPCOMP_COMPTYPE" CHECK (computation_type in (
                          'STATIC_ASSIGNMENT',
                          'FUNCTION_BODY',
                          'QUERY',
                          'QUERY_COLON',
                          'PLSQL_EXPRESSION',
                          'SQL_EXPRESSION',
                          'SQL_EXPRESION',
                          'ITEM_VALUE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS" ADD CONSTRAINT "VALID_FSTEPCOMP_COMPPROC" CHECK (computation_processed in (
                          'ON_NEW_INSTANCE',
                          'REPLACE_EXISTING',
                          'ADD_TO_EXISTING',
                          'RAISE_ERROR_ON_REPLACE',
                          'REPLACE_NULL_VALUES')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS" ADD CONSTRAINT "WWV_FLOW_STEP_COMP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_VALID_FSVAL_VALTYPE" CHECK (validation_type in (
                              'ITEM_NOT_NULL',
                              'ITEM_NOT_NULL_OR_ZERO',
                              'ITEM_NOT_ZERO',
                              'ITEM_IS_ALPHANUMERIC',
                              'ITEM_IS_NUMERIC',
                              'ITEM_IS_NOT_NUMERIC',
                              'ITEM_IS_DATE',
                              'ITEM_IS_TIMESTAMP',
                              'ITEM_CONTAINS_NO_SPACES',
                              'SQL_EXPRESION',
                              'SQL_EXPRESSION',
                              'PLSQL_EXPRESION',
                              'PLSQL_EXPRESSION',
                              'REGULAR_EXPRESSION',
                              'FUNC_BODY_RETURNING_ERR_TEXT',
                              'FUNC_BODY_RETURNING_BOOLEAN',
                              'PLSQL_ERROR',
                              'NOT_EXISTS',
                              'EXISTS',
                              'ITEM_IN_VALIDATION_IN_STRING2',
                              'ITEM_IN_VALIDATION_NOT_IN_STRING2',
                              'ITEM_IN_VALIDATION_EQ_STRING2',
                              'ITEM_IN_VALIDATION_NOT_EQ_STRING2',
                              'ITEM_IN_VALIDATION_CONTAINS_AT_LEAST_ONE_CHAR_IN_STRING2',
                              'ITEM_IN_VALIDATION_CONTAINS_ONLY_CHAR_IN_STRING2',
                              'ITEM_IN_VALIDATION_CONTAINS_NO_CHAR_IN_STRING2',
                              'COL_NOT_NULL',
                              'COL_NOT_NULL_OR_ZERO',
                              'COL_NOT_ZERO',
                              'COL_IS_ALPHANUMERIC',
                              'COL_IS_NUMERIC',
                              'COL_IS_NOT_NUMERIC',
                              'COL_IS_DATE',
                              'COL_IS_TIMESTAMP',
                              'COL_CONTAINS_NO_SPACES',
                              'COL_IN_VALIDATION_IN_STRING2',
                              'COL_IN_VALIDATION_NOT_IN_STRING2',
                              'COL_IN_VALIDATION_EQ_STRING2',
                              'COL_IN_VALIDATION_NOT_EQ_STRING2',
                              'COL_IN_VALIDATION_CONTAINS_AT_LEAST_ONE_CHAR_IN_STRING2',
                              'COL_IN_VALIDATION_CONTAINS_ONLY_CHAR_IN_STRING2',
                              'COL_IN_VALIDATION_CONTAINS_NO_CHAR_IN_STRING2'
                              )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_VALID_VAL_EXEC_VAL" CHECK (always_execute in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_VALID_VAL_COND_EACH_ROW" CHECK (exec_cond_for_each_row in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_VALID_VAL_CHANGED_ROWS" CHECK (only_for_changed_rows in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_VALID_VAL_EDL" CHECK (error_display_location in (
                              'INLINE_WITH_FIELD',
                              'INLINE_WITH_FIELD_AND_NOTIFICATION',
                              'INLINE_IN_NOTIFICATION',
                              'ON_ERROR_PAGE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_STEP_VAL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_VALID_FSPROC_TYPE" CHECK (process_type in (
                           'CLEAR_CACHE_CURRENT_FLOW',
                           'CLEAR_CACHE_FOR_FLOWS',
                           'SET_ITEM_USING_STATIC_ASSIGNMENT',
                           'SET_ITEM_USING_PLSQL_FUNCTION_BODY',
                           'SET_ITEM_USING_PLSQL_EXPRESSION',
                           'SET_ITEM_USING_SQL_QUERY',
                           'SET_ITEM_USING_SQL_EXPRESSION',
                           'WEB_SERVICE',
                           'ON_DEMAND',
                           'PLSQL',
                           'PLSQL_DBMS_JOB',
                           'RESET_PAGINATION',
                           'RESET_SESSION_STATE',
                           'CLEAR_CACHE_FOR_PAGES',
                           'CLEAR_CACHE_FOR_ITEMS',
                           'SET_PREFERENCE_TO_ITEM_VALUE',
                           'SET_PREFERENCE_TO_ITEM_VALUE_IF_ITEM_NOT_NULL',
                           'MULTI_ROW_UPDATE',
                           'MULTI_ROW_DELETE',
                           'ADD_ROWS_TO_TABULAR_FORM',
                           'RESET_PAGINATION_FOR_REGION',
                           'RESET_SORTING_FOR_REGION',
                           'DML_FETCH_ROW',
                           'DML_PROCESS_ROW',
                           'DML_PROCESS_INSERT_ROW',
                           'DML_PROCESS_UPDATE_ROW',
                           'DML_PROCESS_DELETE_ROW',
                           'RESET_USER_PREFERENCES',
                           'INITIALIZE_ALL_PAGE_ITEMS',
                           'INITIALIZE_SESSION',
                           'INITIALIZE_PAGE_PAGINATION',
                           'INITIALIZE_PAGINATION_FOR_ALL_PAGES',
                           'GET_NEXT_OR_PREV_PK',
                           'CLOSE_WINDOW'
                           ) or
                           process_type like 'NATIVE\_%' ESCAPE '\' or
                           process_type like 'PLUGIN\_%' ESCAPE '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_FLOW_STEP_PROC_EDL" CHECK (error_display_location in ('INLINE_IN_NOTIFICATION', 'ON_ERROR_PAGE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_VALID_FSPROC_COND_EACH_ROW" CHECK (exec_cond_for_each_row in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_VALID_FSPROC_CHANGED_ROWS" CHECK (only_for_changed_rows in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "VALID_FSPROC_WHENTYPE2" CHECK (process_when_type2 in (
                           'CURRENT_PAGE_NOT_IN_CONDITION',
                           'CURRENT_PAGE_IN_CONDITION',
                           'NEVER',
                           'CONDITION_IN_REQUEST',
                           'CONDITION_NOT_IN_REQUEST',
                           'REQUEST_EQUALS_CONDITION',
                           'REQUEST_IN_CONDITION',
                           'REQUEST_NOT_IN_CONDITION',
                           'ITEM_IS_NULL',
                           'ITEM_IS_NOT_NULL',
                           'ITEM_IS_NOT_NULL_OR_ZERO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "VALID_FSPROC_STATEFUL" CHECK (process_is_stateful_y_n in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_FLOW_STEP_PROC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "VALID_FSPROC_POINT" CHECK (process_point in (
                           'AFTER_AUTHENTICATION',
                           'ON_SUBMIT_BEFORE_COMPUTATION',
                           'BEFORE_HEADER',
                           'AFTER_HEADER',
                           'BEFORE_BOX_BODY',
                           'BEFORE_SHOW_ITEMS', -- obsolete
                           'AFTER_SHOW_ITEMS', -- obsolete
                           'AFTER_BOX_BODY',
                           'BEFORE_FOOTER',
                           'AFTER_FOOTER',
                           'AFTER_SUBMIT',
                           'AFTER_SUBMIT_BEFORE_VALIDATION',
                           'ON_DEMAND',
                           'AFTER_ERROR_HEADER',
                           'BEFORE_ERROR_FOOTER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BUTTON_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_BUTTON_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_BUTTON_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_BUTTON_TEMP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_LAYOUT_CK" CHECK ( layout in ('TABLE', 'FIELD_TEMPLATE', 'FLEXIBLE' ) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "PAGE_PLUG_TEMPL_FORM_AS_TABLE" CHECK (render_form_items_in_table in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_LABEL_A_CK" CHECK (default_label_alignment in ( 'LEFT',
                                                                            'RIGHT',
                                                                            'CENTER',
                                                                            'ABOVE',
                                                                            'BELOW',
                                                                            'LEFT-TOP',
                                                                            'RIGHT-TOP',
                                                                            'CENTER-TOP',
                                                                            'LEFT-BOTTOM',
                                                                            'RIGHT-BOTTOM',
                                                                            'CENTER-BOTTOM',
                                                                            'LEFT-CENTER',
                                                                            'RIGHT-CENTER',
                                                                            'CENTER-CENTER'
                                                                            )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_FIELD_A_CK" CHECK (default_field_alignment in ( 'LEFT',
                                                                            'RIGHT',
                                                                            'CENTER',
                                                                            'LEFT-TOP',
                                                                            'RIGHT-TOP',
                                                                            'CENTER-TOP',
                                                                            'LEFT-BOTTOM',
                                                                            'RIGHT-BOTTOM',
                                                                            'CENTER-BOTTOM',
                                                                            'LEFT-CENTER',
                                                                            'RIGHT-CENTER',
                                                                            'CENTER-CENTER'
                                                                            )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_REGION_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUG_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PLUG_TMPL_DP_UPPER_CK" CHECK ( placeholder = upper(placeholder) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUG_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PLUG_TMPL_DP_GRID_CK" CHECK ( has_grid_support in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUG_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PLUG_TMPL_DP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUG_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PLUG_TMPL_DP_UK1" UNIQUE ("PLUG_TEMPLATE_ID", "PLACEHOLDER")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUG_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PLUG_TMPL_DP_UK2" UNIQUE ("PLUG_TEMPLATE_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ROW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_ROW_TEMPLATE_TY" CHECK (row_template_type in (
                                  'GENERIC_COLUMNS',
                                  'NAMED_COLUMNS')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ROW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_REPORT_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ROW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_ROW_TEMPLATE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_LIST_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_LIST_TEMPLATE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_VAL_CALENDAR_SI" CHECK (begin_at_start_of_interval in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_DIS_CALENDAR_TYP" CHECK (display_type in ('NONE','COL','CUS')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_DIS_TIME_FORMAT" CHECK (time_format in ('12HOUR','24HOUR') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_ITEM_LINK_IN_CK" CHECK (  item_link_open_in in ('W','P')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_AGENDA_TYPE_IN_CK" CHECK (  agenda_cal_days_type in ('MONTH','YEAR','CUSTOM')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_CALS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CAL_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_CAL_TEMPLATES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEMES" ADD CONSTRAINT "WWV_FLOW_THEME_IS_LOCKED_CK" CHECK ( is_locked in ('Y', 'N' ) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_THEMES" ADD CONSTRAINT "WWV_FLOW_THEME_PAGE_TRANS_CK" CHECK ( default_page_transition in ('NONE', 'FADE', 'POP', 'FLIP', 'TURN', 'FLOW', 'SLIDEFADE', 'SLIDE', 'SLIDEUP', 'SLIDEDOWN') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_THEMES" ADD CONSTRAINT "WWV_FLOW_THEME_POPUP_TRANS_CK" CHECK ( default_popup_transition in ('NONE', 'FADE', 'POP', 'FLIP', 'TURN', 'FLOW', 'SLIDEFADE', 'SLIDE', 'SLIDEUP', 'SLIDEDOWN') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_THEMES" ADD CONSTRAINT "WWV_FLOW_THEMES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_STYLES" ADD CONSTRAINT "WWV_FLOW_THEME_STYLE_CURR_CK" CHECK ( is_current in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_STYLES" ADD CONSTRAINT "WWV_FLOW_THEME_STYLE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_STYLES" ADD CONSTRAINT "WWV_FLOW_THEME_STYLE_UK" UNIQUE ("FLOW_ID", "THEME_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_DISPLAY_POINTS" ADD CONSTRAINT "WWV_THEME_DISP_POINT_UK1" UNIQUE ("FLOW_ID", "THEME_ID", "PLACEHOLDER")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_DISPLAY_POINTS" ADD CONSTRAINT "WWV_THEME_DISP_POINT_UK2" UNIQUE ("FLOW_ID", "THEME_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_DISPLAY_POINTS" ADD CONSTRAINT "WWV_THEME_DISP_POINT_UPPER_CK" CHECK ( placeholder = upper(placeholder) ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_DISPLAY_POINTS" ADD CONSTRAINT "WWV_THEME_DISP_POINT_GRID_CK" CHECK ( has_grid_support in ( 'Y', 'N') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_DISPLAY_POINTS" ADD CONSTRAINT "WWV_THEME_DISP_POINT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SESSIONS$" ADD CONSTRAINT "VALID_SESSION_LANG" CHECK (regexp_instr(trim(lower(session_lang)), '^[a-z]{2}(-[a-z]{2})?$') = 1) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_SESSIONS$" ADD CONSTRAINT "WWV_FLOW_SESSIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DATA" ADD CONSTRAINT "VALID_ITEM_FILTER" CHECK (item_filter in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_DATA" ADD CONSTRAINT "VALID_SESSION_STATE_STATUS" CHECK (session_state_status in ('I','U','R')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_DATA" ADD CONSTRAINT "WWV_FLOW_DATA_PK" PRIMARY KEY ("FLOW_INSTANCE", "ITEM_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PREFERENCES$" ADD CONSTRAINT "WWV_FLOW_PREFS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MESSAGES$" ADD CONSTRAINT "WWV_FLOW_MESSAGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PATCHES" ADD CONSTRAINT "WWV_FLOW_PATCH_VALID_STATUS" CHECK (patch_status in ('INCLUDE','EXCLUDE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PATCHES" ADD CONSTRAINT "WWV_FLOW_PATCHES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER" ADD CONSTRAINT "FND_USER_ACCOUNT_LOCKED" CHECK (account_locked in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER" ADD CONSTRAINT "FND_USER_FIRST_PW_USE" CHECK (first_password_use_occurred in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER" ADD CONSTRAINT "FND_USER_CHANGE_PW_ON_FIRST" CHECK (change_password_on_first_use in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER" ADD CONSTRAINT "WWV_FLOW_FND_USER_PK" UNIQUE ("USER_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DEVELOPER_ROLES" ADD PRIMARY KEY ("DEVELOPER_ROLE")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DEVELOPERS" ADD CONSTRAINT "WWV_FLOW_DEVELOPERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LISTS" ADD CONSTRAINT "WWV_FLOW_VAL_LIST_TYPE" CHECK (list_type in ('STATIC','SQL_QUERY','FUNCTION_RETURNING_SQL_QUERY')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LISTS" ADD CONSTRAINT "WWV_FLOWS_VAL_LIST_STATUS" CHECK (list_status in ('PERSONAL','PUBLIC')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LISTS" ADD CONSTRAINT "WWV_FLOW_VAL_LISTDISPLAYED1" CHECK (list_displayed in ('ON_DEMAND','ALWAYS','NEVER','BY_DEFAULT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LISTS" ADD CONSTRAINT "WWV_FLOW_LISTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOWS_VAL_LISTITEMTYPE" CHECK (list_item_type in ('LINK','FILE','TABLE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOWS_VAL_LISTITEMSTATUS" CHECK (list_item_status in ('PERSONAL','PUBLIC')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOW_VAL_LISTDISPLAYED" CHECK (item_displayed in ('ON_DEMAND','ALWAYS','NEVER','BY_DEFAULT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOW_LST_CURR_TYPE_VAL" CHECK (list_item_current_type in (
                                  'COLON_DELIMITED_PAGE_LIST',
                                  'PLSQL_EXPRESSION',
                                  'ALWAYS',
                                  'NEVER',
                                  'EXISTS',
                                  'NOT_EXISTS',
                                  'TARGET_PAGE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOW_LIST_COUNT_CHK" CHECK (list_countclicks_y_n in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOW_LIST_ITEMS_CK1" CHECK (translate_list_text_y_n in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOW_LIST_ITEMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QUERIES" ADD CONSTRAINT "WWV_FLOW_SHARED_QRY_XML_STRC" CHECK (xml_structure in (
                                 'STANDARD',
                                 'APEX'
                             )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QUERIES" ADD CONSTRAINT "WWV_FLOW_SHARED_QRY_FORMAT" CHECK (format in (
                                 'PDF',
                                 'RTF',
                                 'XLS',
                                 'HTM',
                                 'XML'
                             )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QUERIES" ADD CONSTRAINT "SHARED_QRY_CONTENT_DISP" CHECK (content_disposition in (
                                  'INLINE',
                                  'ATTACHMENT'
                              )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QUERIES" ADD CONSTRAINT "SHARED_QRY_HEADER" CHECK (document_header in (
                                 'SERVER',
                                 'APEX'
                             )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QUERIES" ADD CONSTRAINT "WWV_FLOW_SHARED_QRY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QRY_SQL_STMTS" ADD CONSTRAINT "WWV_FLOW_SQRY_SQL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_IMAGE_REPOSITORY" ADD CONSTRAINT "WWV_FLOW_IMAGE_REPO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CSS_REPOSITORY" ADD CONSTRAINT "WWV_FLOW_CSS_REPO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HTML_REPOSITORY" ADD CONSTRAINT "WWV_FLOW_HTML_REPO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOV_VALUES" ADD CONSTRAINT "WWV_FLOW_LOV_VALUES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_EFFECTIVE_USERID_MAP" ADD CONSTRAINT "WWV_FLOW_EFF_USERID_MAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHORTCUTS" ADD CONSTRAINT "WWV_FLOW_VALID_SHORTCUT_TYPE" CHECK (shortcut_type in (
                             'HTML_TEXT',
                             'HTML_TEXT_ESCAPE_SC',
                             'FUNCTION_BODY',
                             'IMAGE',
                             'MESSAGE',
                             'MESSAGE_ESCAPE_JS',
                             'TEXT_ESCAPE_JS')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHORTCUTS" ADD CONSTRAINT "WWV_FLOW_SHORTCUTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHORTCUT_USAGE_MAP" ADD CHECK (reference_id_type in (
                              'PAGE_HELP',
                              'ITEM_PROMPT',
                              'PAGE_PROCESS',
                              'REGION_TEMPLATE',
                              'PAGE_TEMPLATE',
                              'ROW_TEMPLATE',
                              'LIST_TEMPLATE',
                              'FLOW_PROCESS')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MAIL_QUEUE" ADD CONSTRAINT "WWV_FLOW_MAIL_QUEUE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MAIL_ATTACHMENTS" ADD CONSTRAINT "WWV_FLOW_MAIL_ATTACHMENTS_CK1" CHECK (inline in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_MAIL_ATTACHMENTS" ADD CONSTRAINT "WWV_FLOW_MAIL_ATTACHMENTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_BINDS" ADD CONSTRAINT "WWV_VALID_BIND_TYPE" CHECK (bind_type in (
                         'BIND',
                         'SUBSTITUTION')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_BINDS" ADD CONSTRAINT "WWV_FLOW_SW_BIND_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_RESULTS" ADD CONSTRAINT "WWV_FLOW_RESULT_STATUS" CHECK (status in (
                          'SUBMITTED',
                          'EXECUTING',
                          'COMPLETE',
                          'CANCELED',
                          'CANCELING')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_RESULTS" ADD CONSTRAINT "WWV_FLOW_SW_RESULT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_DETAIL_RESULTS" ADD CONSTRAINT "WWV_RUN_SUCCESS_FLG" CHECK (success in (
                          'Y',
                          'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_DETAIL_RESULTS" ADD CONSTRAINT "WWV_RUN_FAILURE_FLAG" CHECK (failure in (
                          'Y',
                          'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_DETAIL_RESULTS" ADD CONSTRAINT "WWV_STMT_RUN_COMPLETE_FLAG" CHECK (run_complete in (
                          'Y',
                          'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_DETAIL_RESULTS" ADD CONSTRAINT "WWV_FLOW_SW_D_RESULT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_SQLPLUS_CMD" ADD PRIMARY KEY ("COMMAND")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_SQL_CMDS" ADD CONSTRAINT "WWV_FLOW_SW_SQL_CMDS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_STMTS" ADD CONSTRAINT "WWV_FLOW_SW_STMTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_MAIN_KEYWORDS" ADD CONSTRAINT "WWV_FLOW_SW_MKEYWORDS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_SET_KEYWORDS" ADD CONSTRAINT "WWV_FLOW_SW_SKEYWORDS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_CREATE_KEYWORDS" ADD CONSTRAINT "WWV_FLOW_SW_CKEYWORDS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_JOBS" ADD CONSTRAINT "WWV_FLOW_JOBS_PK" PRIMARY KEY ("JOB")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_SUBMISSIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_SUBMISSIONS_PK" PRIMARY KEY ("SUBMIT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_IMPORT_EXPORT" ADD CONSTRAINT "WWV_FLOW_IMP_EXP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COLLECTIONS$" ADD CONSTRAINT "WWV_FLOW_COLLECTIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COLLECTIONS$" ADD CONSTRAINT "WWV_FLOW_COLLECTIONS_UK" UNIQUE ("SESSION_ID", "USER_ID", "FLOW_ID", "COLLECTION_NAME", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COLLECTION_MEMBERS$" ADD CONSTRAINT "WWV_FLOW_COLLECTION_MEMBERS_PK" PRIMARY KEY ("COLLECTION_ID", "SEQ_ID", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PASSWORD_HISTORY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER_GROUPS" ADD CONSTRAINT "FND_FLOW_USER_GROUP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER_GROUPS" ADD CONSTRAINT "WWV_FLOW_FND_USER_GROUPS_UK1" UNIQUE ("GROUP_NAME", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_UPD_RPT_COLS" ADD CONSTRAINT "WWV_FLOW_UPC_DISPLAY_AS" CHECK ( display_as in (
                                 'DISPLAY_AND_SAVE',
                                 'WITHOUT_MODIFICATION',
                                 'ESCAPE_SC',
                                 'TEXT',
                                 'TEXTAREA',
                                 'SELECT_LIST',
                                 'SELECT_LIST_FROM_LOV',
                                 'SELECT_LIST_FROM_QUERY',
                                 'HIDDEN',
                                 'POPUP',
                                 'DATE_POPUP'
                                 )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_UPD_RPT_COLS" ADD CONSTRAINT "WWV_FLOW_UPD_RPT_COLS_LOVN" CHECK (lov_show_nulls in (
                                 'YES',
                                 'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_UPD_RPT_COLS" ADD CONSTRAINT "WWV_FLOW_UPD_RPT_COL" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES$" ADD CONSTRAINT "WWV_FLOW_TMPLT_TYPE" CHECK (template_type in(
                              'Page',
                              'Region',
                              'List',
                              'Field',
                              'Report',
                              'Button',
                              'Menu',
                              'PopUp')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES$" ADD CONSTRAINT "WWV_FLOW_TMPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATE_THEMES$" ADD CONSTRAINT "WWV_FL_TMP_THM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_POPUP_LOV_TEMPLATE" ADD CONSTRAINT "WWV_FLOW_POPUP_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_POPUP_LOV_TEMPLATE" ADD CONSTRAINT "WWV_FLOW_PK_POPLOV_TEMP" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MENUS" ADD CONSTRAINT "WWV_FLOW_MENUS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MENU_OPTIONS" ADD CONSTRAINT "WWV_FLOW_MENU_OPTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MENU_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_MENU_TRANS_TEMP" CHECK (translate_this_template in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_MENU_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_MENU_TEMPLS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_VERSION$" ADD CONSTRAINT "WWV_FLOW_VERSION$_PK" PRIMARY KEY ("SEQ")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_CUSTOM_AUTH_CHK1" CHECK (use_secure_cookie_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_AUTH_SETUPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_AUTHENTICATIONS" ADD CONSTRAINT "WWV_FLOW_AUTHENTICATIONS_CK1" CHECK (use_secure_cookie_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_AUTHENTICATIONS" ADD CONSTRAINT "WWV_FLOW_AUTHENTICATIONS_CK2" CHECK (
                                                             scheme_type like 'NATIVE\_%' escape '\'
                                                          or scheme_type like 'PLUGIN\_%' escape '\' ) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_AUTHENTICATIONS" ADD CONSTRAINT "WWV_FLOW_AUTHENTICATIONS_CK3" CHECK (invalid_session_type in ('LOGIN','BUILTIN_LOGIN','URL')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_AUTHENTICATIONS" ADD CONSTRAINT "WWV_FLOW_AUTHENTICATIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_AUTHENTICATIONS" ADD CONSTRAINT "WWV_FLOW_AUTHENTICATIONS_UK" UNIQUE ("FLOW_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ENTRY_POINTS" ADD CONSTRAINT "WWV_FLOW_ENTRY_POINTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ENTRY_POINT_ARGS" ADD CONSTRAINT "WWV_FLOW_ENTRY_POINT_ARGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_WEB_SERVICES" ADD CONSTRAINT "WWV_FLOW_WEB_SERVICES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_OPERATIONS" ADD CONSTRAINT "WWV_FLOW_WS_OPERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PARAMETERS" ADD CONSTRAINT "WWV_FLOW_WS_PARMS_CHK1" CHECK (input_or_output in ('I','O','H','A')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PARAMETERS" ADD CONSTRAINT "WWV_FLOW_WS_PARMS_CHK2" CHECK (type_is_xsd in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PARAMETERS" ADD CONSTRAINT "WWV_FLOW_WS_PARMS_CHK3" CHECK (form_qualified in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PARAMETERS" ADD CONSTRAINT "WWV_FLOW_WS_PARMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PROCESS_PARMS_MAP" ADD CONSTRAINT "WWV_FLOW_WS_MAP_CHK" CHECK (map_type in ('ITEM','STATIC','FUNCTION','COLLECTION')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PROCESS_PARMS_MAP" ADD CONSTRAINT "WWV_FLOW_WS_MAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOCK_PAGE" ADD CONSTRAINT "WWV_FLOW_LOCK_PAGE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOCK_PAGE_LOG" ADD CONSTRAINT "DEV_FILE_LOCK_LOG_ACTION" CHECK ( action in ('LOCK','UNLOCK','UPDATE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOCK_PAGE_LOG" ADD CONSTRAINT "WWV_FLOW_LOCK_PG_LOG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UPG_TAB_OBSOLETE" ADD CONSTRAINT "WWV_FLOW_UPG_TAB_OBS_DONE" CHECK (change_made in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_UPG_TAB_OBSOLETE" ADD CONSTRAINT "WWV_FLOW_UPG_TAB_OBS_PK" PRIMARY KEY ("TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UPG_TAB_NAME_CHANGES" ADD CONSTRAINT "WWV_FLOW_UPG_TAB_NAME_CHG_DONE" CHECK (change_made in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_UPG_TAB_NAME_CHANGES" ADD CONSTRAINT "WWV_FLOW_UPG_TAB_NAME_CHNG_PK" PRIMARY KEY ("OLD_TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UPG_TAB_NAME_CHANGES" ADD CONSTRAINT "WWV_FLOW_UPG_TAB_NAME_CHNG_UK" UNIQUE ("NEW_TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UPG_COL_NAME_CHANGES" ADD CONSTRAINT "WWV_FLOW_UPG_COL_NAME_CHG_DONE" CHECK (change_made in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_UPG_COL_NAME_CHANGES" ADD CONSTRAINT "WWV_FLOW_UPG_COL_NAME_CHNG_PK" PRIMARY KEY ("OLD_TABLE_NAME", "OLD_COLUMN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_TABLE_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_TABLE_INFO_PK" PRIMARY KEY ("TABLE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_TABLE_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_TABLE_INFO_UK" UNIQUE ("SCHEMA", "TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_GROUPS" ADD CONSTRAINT "WWV_FLOW_HNT_GROUPS_PK" PRIMARY KEY ("GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_GROUPS" ADD CONSTRAINT "WWV_FLOW_HNT_GROUPS_UK" UNIQUE ("TABLE_ID", "GROUP_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_DISPLAY_AS_TAB_FORM" CHECK (display_as_tab_form in (
                               'READONLY',
                               'DISPLAY_AND_SAVE',
                               'WITHOUT_MODIFICATION',
                               'ESCAPE_SC',
                               'TEXT',
                               'TEXT_FROM_LOV',
                               'TEXTAREA',
                               'SELECT_LIST',
                               'SELECT_LIST_FROM_LOV',
                               'SELECT_LIST_FROM_QUERY',
                               'CHECKBOX',
                               'SIMPLE_CHECKBOX',
                               'RADIOGROUP',
                               'HIDDEN',
                               'HIDDEN_PROTECTED',
                               'POPUP',
                               'POPUP_QUERY',
                               'DATE_POPUP',
                               'DATE_PICKER',
                               'PICK_DATE_USING_APP_FORMAT_MASK',
                               'PICK_DATE_USING_APP_DATE_FORMAT',
                               'PICK_DATE_USING_FORMAT_MASK',
                               'PICK_DATE_DD_MON_RR',
                               'PICK_DATE_DD_MON_RR_HH_MI',
                               'PICK_DATE_DD_MON_RR_HH24_MI',
                               'PICK_DATE_DD_MON_YYYY',
                               'PICK_DATE_DD_MON_YYYY_HH_MI',
                               'PICK_DATE_DD_MON_YYYY_HH24_MI',
                               'PICK_DATE_DD_MM_YYYY',
                               'PICK_DATE_DD_MM_YYYY_HH_MI',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI',
                               'PICK_DATE_MM_DD_YYYY',
                               'PICK_DATE_MM_DD_YYYY_HH_MI',
                               'PICK_DATE_MM_DD_YYYY_HH24_MI',
                               'PICK_DATE_DD_MON_YY',
                               'PICK_DATE_DD_MON_YY_HH_MI',
                               'PICK_DATE_DD_MON_YY_HH24_MI',
                               'PICK_DATE_YYYY_MM_DD',
                               'PICK_DATE_YYYY_MM_DD_HH_MI',
                               'PICK_DATE_YYYY_MM_DD_HH24_MI',
                               'PICK_DATE_RR_MON_DD',
                               'PICK_DATE_RR_MON_DD_HH_MI',
                               'PICK_DATE_RR_MON_DD_HH24_MI',
                               'PICK_DATE_DD_MM_YYYY_DASH',
                               'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                               'PICK_DATE_DD_MM_YYYY_DOT',
                               'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                               'PICK_DATE_YYYY_DD_MM_DOT',
                               'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                               'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                               'PICK_DATE_YYYY_MM_DD_SLASH',
                               'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                               'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_DISPLAY_IN_REPORT" CHECK (display_in_report in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_DISPLAY_AS_REPORT" CHECK (display_as_report in (
                               'READONLY',
                               'DISPLAY_AND_SAVE',
                               'WITHOUT_MODIFICATION',
                               'ESCAPE_SC',
                               'TEXT',
                               'TEXT_FROM_LOV',
                               'TEXTAREA',
                               'SELECT_LIST',
                               'SELECT_LIST_FROM_LOV',
                               'SELECT_LIST_FROM_QUERY',
                               'CHECKBOX',
                               'SIMPLE_CHECKBOX',
                               'RADIOGROUP',
                               'HIDDEN',
                               'HIDDEN_PROTECTED',
                               'POPUP',
                               'POPUP_QUERY',
                               'DATE_POPUP',
                               'DATE_PICKER',
                               'PICK_DATE_USING_APP_FORMAT_MASK',
                               'PICK_DATE_USING_APP_DATE_FORMAT',
                               'PICK_DATE_USING_FORMAT_MASK',
                               'PICK_DATE_DD_MON_RR',
                               'PICK_DATE_DD_MON_RR_HH_MI',
                               'PICK_DATE_DD_MON_RR_HH24_MI',
                               'PICK_DATE_DD_MON_YYYY',
                               'PICK_DATE_DD_MON_YYYY_HH_MI',
                               'PICK_DATE_DD_MON_YYYY_HH24_MI',
                               'PICK_DATE_DD_MM_YYYY',
                               'PICK_DATE_DD_MM_YYYY_HH_MI',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI',
                               'PICK_DATE_MM_DD_YYYY',
                               'PICK_DATE_MM_DD_YYYY_HH_MI',
                               'PICK_DATE_MM_DD_YYYY_HH24_MI',
                               'PICK_DATE_DD_MON_YY',
                               'PICK_DATE_DD_MON_YY_HH_MI',
                               'PICK_DATE_DD_MON_YY_HH24_MI',
                               'PICK_DATE_YYYY_MM_DD',
                               'PICK_DATE_YYYY_MM_DD_HH_MI',
                               'PICK_DATE_YYYY_MM_DD_HH24_MI',
                               'PICK_DATE_RR_MON_DD',
                               'PICK_DATE_RR_MON_DD_HH_MI',
                               'PICK_DATE_RR_MON_DD_HH24_MI',
                               'PICK_DATE_DD_MM_YYYY_DASH',
                               'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                               'PICK_DATE_DD_MM_YYYY_DOT',
                               'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                               'PICK_DATE_YYYY_DD_MM_DOT',
                               'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                               'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                               'PICK_DATE_YYYY_MM_DD_SLASH',
                               'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                               'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_AGGREGATE_BY" CHECK (aggregate_by in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_REQUIRED" CHECK (required in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_ALIGNMENT" CHECK (alignment in ('L','C','R')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_GROUP_BY" CHECK (group_by in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_ORDER_BY" CHECK (order_by_asc_desc in ('A','D')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_SEARCHABLE" CHECK (searchable in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_COLUMN_INFO_PK" PRIMARY KEY ("COLUMN_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_COLUMN_INFO_UK" UNIQUE ("TABLE_ID", "COLUMN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_DISPLAY_AS_FORM" CHECK (display_as_form in (
                                'DISPLAY_ONLY_PLSQL',
                                'FILE',
                                'BUTTON',
                                'HIDDEN',
                                'HIDDEN_PROTECTED',
                                'DISPLAY_ONLY_HTML',
                                'STOP_AND_START_HTML_TABLE',
                                'DISPLAY_ONLY_ESCAPE_SC',
                                'IMAGE',
                                'DISPLAY_AND_SAVE',
                                'DISPLAY_AND_SAVE_LOV',
                                'CHECKBOX',
                                'POPUP',
                                'POPUP_FILTER',
                                'POPUP2',
                                'POPUP3',
                                'POPUP4',
                                'POPUP5',
                                'POPUP6',
                                'POPUP_KEY_LOV',
                                'POPUP_KEY_LOV_NOFETCH',
                                'POPUP_COLOR',
                                'PICK_DATE_USING_FLOW_FORMAT_MASK',
                                'PICK_DATE_USING_APP_FORMAT_MASK',
                                'PICK_DATE_USING_APP_DATE_FORMAT',
                                'PICK_DATE_USING_FORMAT_MASK',
                                'PICK_DATE_DD_MON_RR',
                                'PICK_DATE_DD_MON_RR_HH_MI',
                                'PICK_DATE_DD_MON_RR_HH24_MI',
                                'PICK_DATE_DD_MON_YYYY',
                                'PICK_DATE_DD_MON_YYYY_HH_MI',
                                'PICK_DATE_DD_MON_YYYY_HH24_MI',
                                'PICK_DATE_DD_MM_YYYY',
                                'PICK_DATE_DD_MM_YYYY_HH_MI',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI',
                                'PICK_DATE_MM_DD_YYYY',
                                'PICK_DATE_MM_DD_YYYY_HH_MI',
                                'PICK_DATE_MM_DD_YYYY_HH24_MI',
                                'PICK_DATE_DD_MON_YY',
                                'PICK_DATE_DD_MON_YY_HH_MI',
                                'PICK_DATE_DD_MON_YY_HH24_MI',
                                'PICK_DATE_YYYY_MM_DD',
                                'PICK_DATE_YYYY_MM_DD_HH_MI',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI',
                                'PICK_DATE_RR_MON_DD',
                                'PICK_DATE_RR_MON_DD_HH_MI',
                                'PICK_DATE_RR_MON_DD_HH24_MI',
                                'PICK_DATE_DD_MM_YYYY_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                                'PICK_DATE_YYYY_DD_MM_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                                'PICK_DATE_YYYY_MM_DD_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH',
                                'DISPLAY_ONLY_LOV',
                                'COMBOBOX',
                                'SHOW_AS_SL_WITH_POPUP',
                                'COMBOBOX_WITH_URL_REDIRECT',
                                'COMBOBOX_WITH_BRANCH_TO_PAGE',
                                'COMBOBOX_WITH_SUBMIT',
                                'COMBOBOX_WITH_JS_POST',
                                'COMBOBOX_WITH_JS_REDIRECT',
                                'MULTIPLESELECT',
                                'SHUTTLE',
                                'RADIOGROUP',
                                'RADIOGROUP2',
                                'RADIOGROUP_WITH_REDIRECT',
                                'RADIOGROUP_WITH_SUBMIT',
                                'RADIOGROUP_WITH_JS_SUBMIT',
                                'TEXTAREA',
                                'TEXTAREA_WITH_SPELL_CHECK',
                                'TEXTAREA-AUTO-HEIGHT',
                                'TEXTAREA_WITH_CONTROLS',
                                'TEXTAREA_WITH_HTML_EDITOR_BASIC',
                                'TEXTAREA_WITH_HTML_EDITOR_STANDARD',
                                'TEXTAREA_CHAR_COUNT',
                                'TEXTAREA_CHAR_COUNT_SPELL',
                                'TEXT',
                                'TEXT_WITH_ENTER_SUBMIT',
                                'TEXT_DISABLED',
                                'TEXT_DISABLED_AND_SAVE',
                                'TEXT_WITH_CALCULATOR',
                                'PASSWORD',
                                'PASSWORD_WITH_ENTER_SUBMIT',
                                'PASSWORD_DNSS',
                                'PASSWORD_WITH_SUBMIT_DNSS',
                                'LIST_MGR',
                                'LIST_MGR2',
                                'LIST_MGR3',
                                'LIST_MGR_VIEW',
                                'LIST_MGR_VIEW2',
                                -- 4.0
                                'SELECT_LIST_WITH_POPUP',
                                'TEXT_WITH_SELECT_LIST',
                                'TEXTAREA_WITH_POPUP'
                                ) or
                                display_as_form like 'NATIVE\_%' escape '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FHC_DISPLAY_IN_FORM" CHECK (display_in_form in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_LOV_DATA" ADD CONSTRAINT "WWV_FLOW_HNT_LOV_DATA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT" ADD CONSTRAINT "WWV_FHCD_FORM_DATA_TYPE" CHECK (form_data_type in (
                            'VARCHAR',
                            'NUMBER',
                            'DATE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT" ADD CONSTRAINT "WWV_FHCD_COL_ALIGNMENT" CHECK (report_col_alignment in ('LEFT','CENTER','RIGHT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT" ADD CONSTRAINT "WWV_FHCD_PK" PRIMARY KEY ("COLUMN_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT" ADD CONSTRAINT "WWV_FHCD_UK" UNIQUE ("SECURITY_GROUP_ID", "COLUMN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COL_DICT_SYN" ADD CONSTRAINT "WWV_FLOW_HNT_COL_DICT_SYN_PK" PRIMARY KEY ("SYN_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COL_DICT_SYN" ADD CONSTRAINT "WWV_FLOW_HNT_COL_DICT_SYN_UK" UNIQUE ("SECURITY_GROUP_ID", "SYN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_CHART_SER_ATTR" ADD CONSTRAINT "WWV_FLOW_CHART_SERIES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_DEFINITION" ADD CONSTRAINT "QUERY_DEFINITION_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_OBJECT" ADD CONSTRAINT "QUERY_OBJECT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_COLUMN" ADD CONSTRAINT "QUERY_COLUMN_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_CONDITION" ADD CONSTRAINT "VALID_COND_ROOT" CHECK (cond_root in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_CONDITION" ADD CONSTRAINT "VALID_COMPOUND_OPERATOR" CHECK (operator in (
                                         'AND',
                                         'OR',
                                         'NOT',
                                         'JOIN',
                                         'NJOIN',
                                         'NONE'
                                        )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_CONDITION" ADD CONSTRAINT "WWV_FLOW_QUERY_CONDITION_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_REGREPCOL_DISPLAY_AS" CHECK ( display_as in (
                               'READONLY',
                               'DISPLAY_AND_SAVE',
                               'WITHOUT_MODIFICATION',
                               'ESCAPE_SC',
                               'TEXT',
                               'TEXT_FROM_LOV',
                               'TEXTAREA',
                               'SELECT_LIST',
                               'SELECT_LIST_FROM_LOV',
                               'SELECT_LIST_FROM_QUERY',
                               'CHECKBOX',
                               'SIMPLE_CHECKBOX',
                               'CHECKBOX_FROM_LOV',
                               'SIMPLE_CHECKBOX',
                               'RADIOGROUP',
                               'RADIOGROUP_FROM_LOV',
                               'RADIOGROUP_FROM_QUERY',
                               'HIDDEN',
                               'HIDDEN_PROTECTED',
                               'POPUP',
                               'POPUP_QUERY',
                               'POPUPKEY',
                               'POPUPKEY_QUERY',
                               'DATE_POPUP',
                               'DATE_PICKER',
                               'PICK_DATE_USING_APP_FORMAT_MASK',
                               'PICK_DATE_USING_APP_DATE_FORMAT',
                               'PICK_DATE_USING_FORMAT_MASK',
                               'PICK_DATE_DD_MON_RR',
                               'PICK_DATE_DD_MON_RR_HH_MI',
                               'PICK_DATE_DD_MON_RR_HH24_MI',
                               'PICK_DATE_DD_MON_YYYY',
                               'PICK_DATE_DD_MON_YYYY_HH_MI',
                               'PICK_DATE_DD_MON_YYYY_HH24_MI',
                               'PICK_DATE_DD_MM_YYYY',
                               'PICK_DATE_DD_MM_YYYY_HH_MI',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI',
                               'PICK_DATE_MM_DD_YYYY',
                               'PICK_DATE_MM_DD_YYYY_HH_MI',
                               'PICK_DATE_MM_DD_YYYY_HH24_MI',
                               'PICK_DATE_DD_MON_YY',
                               'PICK_DATE_DD_MON_YY_HH_MI',
                               'PICK_DATE_DD_MON_YY_HH24_MI',
                               'PICK_DATE_YYYY_MM_DD',
                               'PICK_DATE_YYYY_MM_DD_HH_MI',
                               'PICK_DATE_YYYY_MM_DD_HH24_MI',
                               'PICK_DATE_RR_MON_DD',
                               'PICK_DATE_RR_MON_DD_HH_MI',
                               'PICK_DATE_RR_MON_DD_HH24_MI',
                               'PICK_DATE_DD_MM_YYYY_DASH',
                               'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                               'PICK_DATE_DD_MM_YYYY_DOT',
                               'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                               'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                               'PICK_DATE_YYYY_DD_MM_DOT',
                               'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                               'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                               'PICK_DATE_YYYY_MM_DD_SLASH',
                               'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                               'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH'
                               ) or
                               display_as like 'NATIVE\_%' escape '\' or
                               display_as like 'PLUGIN\_%' Escape '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_FLOW_REGREPCOL_LOVN" CHECK (lov_show_nulls in (
                               'YES',
                               'NO')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_FLOW_REGREPCOL_IS_REQUIRED" CHECK (is_required in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_FLOW_REGREPCOL_STD_VAL" CHECK (standard_validations in ('BROWSER', 'SERVER', 'BROWSER_AND_SERVER', 'NONE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_FLOW_REGREPCOL_SRC_TYPE" CHECK (pk_col_source_type in (
                                   'S',
                                   'F',
                                   'T')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_FLOW_REGREPCOL_DERV_COL" CHECK (derived_column in (
                                   'Y',
                                   'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_FLOW_REGREPCOL_INCL_EXP" CHECK (include_in_export in (
                                   'Y',
                                   'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "REPORT_COLUMN_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_FLOW_REGREPCOL_ROW_HDR" CHECK (use_as_row_header in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "WWV_REGREPCOL_CHECKSUM_TYPE" CHECK (column_link_checksum_type in (
                                '1', -- workspace
                                '2', -- user
                                '3'  -- session
                                )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_FILTER" ADD CONSTRAINT "VALID_REP_COMPOUND_OPERATOR" CHECK (compound_operator in (
                                         'and',
                                         'or',
                                         'not'
                                        )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_FILTER" ADD CONSTRAINT "REPORT_FILTER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_PROCEDURE_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_PROC_INFO_PK" PRIMARY KEY ("PROCEDURE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_PROCEDURE_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_PROC_INFO_UK" UNIQUE ("SCHEMA", "PROCEDURE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_DISPLAY_AS_FORM" CHECK (display_as_form in (
                                    'DISPLAY_ONLY_PLSQL',
                                    'FILE',
                                    'BUTTON',
                                    'HIDDEN',
                                    'HIDDEN_PROTECTED',
                                    'DISPLAY_ONLY_HTML',
                                    'STOP_AND_START_HTML_TABLE',
                                    'DISPLAY_ONLY_ESCAPE_SC',
                                    'IMAGE',
                                    'DISPLAY_AND_SAVE',
                                    'DISPLAY_AND_SAVE_LOV',
                                    'CHECKBOX',
                                    'POPUP',
                                    'POPUP_FILTER',
                                    'POPUP2',
                                    'POPUP3',
                                    'POPUP4',
                                    'POPUP5',
                                    'POPUP6',
                                    'POPUP_KEY_LOV',
                                    'PICK_DATE_USING_APP_FORMAT_MASK',
                                    'PICK_DATE_USING_APP_DATE_FORMAT',
                                    'PICK_DATE_USING_FORMAT_MASK',
                                    'PICK_DATE_DD_MON_RR',
                                    'PICK_DATE_DD_MON_RR_HH_MI',
                                    'PICK_DATE_DD_MON_RR_HH24_MI',
                                    'PICK_DATE_DD_MON_YYYY',
                                    'PICK_DATE_DD_MON_YYYY_HH_MI',
                                    'PICK_DATE_DD_MON_YYYY_HH24_MI',
                                    'PICK_DATE_DD_MM_YYYY',
                                    'PICK_DATE_DD_MM_YYYY_HH_MI',
                                    'PICK_DATE_DD_MM_YYYY_HH24_MI',
                                    'PICK_DATE_MM_DD_YYYY',
                                    'PICK_DATE_MM_DD_YYYY_HH_MI',
                                    'PICK_DATE_MM_DD_YYYY_HH24_MI',
                                    'PICK_DATE_DD_MON_YY',
                                    'PICK_DATE_DD_MON_YY_HH_MI',
                                    'PICK_DATE_DD_MON_YY_HH24_MI',
                                    'PICK_DATE_YYYY_MM_DD',
                                    'PICK_DATE_YYYY_MM_DD_HH_MI',
                                    'PICK_DATE_YYYY_MM_DD_HH24_MI',
                                    'PICK_DATE_RR_MON_DD',
                                    'PICK_DATE_RR_MON_DD_HH_MI',
                                    'PICK_DATE_RR_MON_DD_HH24_MI',
                                    'PICK_DATE_DD_MM_YYYY_DASH',
                                    'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                                    'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                                    'PICK_DATE_DD_MM_YYYY_DOT',
                                    'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                                    'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                                    'PICK_DATE_YYYY_DD_MM_DOT',
                                    'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                                    'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                                    'PICK_DATE_YYYY_MM_DD_SLASH',
                                    'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                                    'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH',
                                    'DISPLAY_ONLY_LOV',
                                    'COMBOBOX',
                                    'SHOW_AS_SL_WITH_POPUP',
                                    'COMBOBOX_WITH_URL_REDIRECT',
                                    'COMBOBOX_WITH_BRANCH_TO_PAGE',
                                    'COMBOBOX_WITH_SUBMIT',
                                    'COMBOBOX_WITH_JS_POST',
                                    'COMBOBOX_WITH_JS_REDIRECT',
                                    'MULTIPLESELECT',
                                    'RADIOGROUP',
                                    'RADIOGROUP2',
                                    'RADIOGROUP_WITH_REDIRECT',
                                    'RADIOGROUP_WITH_SUBMIT',
                                    'RADIOGROUP_WITH_JS_SUBMIT',
                                    'TEXTAREA',
                                    'TEXTAREA_WITH_SPELL_CHECK',
                                    'TEXTAREA-AUTO-HEIGHT',
                                    'TEXTAREA_WITH_CONTROLS',
                                    'TEXTAREA_WITH_HTML_EDITOR_BASIC',
                                    'TEXTAREA_WITH_HTML_EDITOR_STANDARD',
                                    'TEXTAREA_CHAR_COUNT',
                                    'TEXTAREA_CHAR_COUNT_SPELL',
                                    'TEXT',
                                    'TEXT_DISABLED',
                                    'TEXT_DISABLED_AND_SAVE',
                                    'TEXT_WITH_CALCULATOR',
                                    'PASSWORD',
                                    'LIST_MGR',
                                    'LIST_MGR2',
                                    'LIST_MGR3',
                                    'LIST_MGR_VIEW',
                                    'LIST_MGR_VIEW2',
                                    -- 4.0
                                    'SELECT_LIST_WITH_POPUP',
                                    'TEXT_WITH_SELECT_LIST',
                                    'TEXTAREA_WITH_POPUP',
                                    'TEXTAREA_RESIZABLE'
                                    )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO" ADD CHECK (required in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO" ADD CHECK (alignment in ('L','C','R')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_ARG_INFO_PK" PRIMARY KEY ("ARGUMENT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_ARG_INFO_UK" UNIQUE ("PROCEDURE_ID", "ARGUMENT_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_DISPLAY_IN_FORM" CHECK (display_in_form in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CHARSETS" ADD CONSTRAINT "WWV_FLOW_CHARSETS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CUSTOMIZED_TASKS" ADD CONSTRAINT "WWV_FLOW_CTASKS_LOCATION" CHECK (display_location in ('WORKSPACE_HOME','WORKSPACE_LOGIN')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CUSTOMIZED_TASKS" ADD CONSTRAINT "WWV_FLOW_CTASKS_DISPLAYED" CHECK (displayed in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_CUSTOMIZED_TASKS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_GROUPS" ADD CONSTRAINT "WWV_FLOW_PAGE_GRP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ONLINE_HELP" ADD CONSTRAINT "WWV_FLOW_ONLINE_HELP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ONLINE_HELP_JA" ADD CONSTRAINT "WWV_FLOW_ONLINE_HELP_JA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RESTRICTED_SCHEMAS" ADD CONSTRAINT "WWV_FLOW_RESTRICT_SCHEMA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RSCHEMA_EXCEPTIONS" ADD CONSTRAINT "WWV_FLOW_RSCHEMA_EXCEPTIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_QUERY" ADD CHECK (query_type in ('P','R','W')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_QUERY" ADD CONSTRAINT "WWV_FLOW_QB_SAVED_QUERY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_COND" ADD CONSTRAINT "WWV_FLOW_QB_SAVED_COND_OUT" CHECK (out in ('true','false')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_COND" ADD CONSTRAINT "WWV_FLOW_QB_SAVED_COND_ST" CHECK (st in ('ASC','DESC')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_COND" ADD CONSTRAINT "WWV_FLOW_QB_SAVED_COND_GRP" CHECK (grp in ('true','false')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_COND" ADD CONSTRAINT "PK_WWV_FLOW_QB_SAVED_COND" PRIMARY KEY ("ID", "COL")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_JOIN" ADD CONSTRAINT "PK_WWV_FLOW_QB_SAVED_JOIN" PRIMARY KEY ("ID", "FIELD1", "FIELD2")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_TABS" ADD CONSTRAINT "PK_WWV_FLOW_QB_SAVED_TABS" PRIMARY KEY ("ID", "OID", "CNT")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODELS" ADD CONSTRAINT "WWV_FLOW_MODEL_COMPLETE" CHECK (model_complete in (
                                 'Y',
                                 'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODELS" ADD CONSTRAINT "WWV_FLOW_MODELS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGES" ADD CONSTRAINT "WWV_FLOW_MP_PAGE_TYPE" CHECK (page_type in (
                                    'BLANK',
                                    'REPORT',
                                    'LISTVIEW',
                                    'FORM',
                                    'TABULARFORM',
                                    'REPORTANDFORM',
                                    'LISTVIEWANDFORM',
                                    'CHART',
                                    'MASTERDETAIL')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGES" ADD CONSTRAINT "WWV_FLOW_MP_PAGE_SOURCE" CHECK (page_source in (
                                    'TABLE',
                                    'QUERY',
                                    'SPREADSHEET')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGES" ADD CONSTRAINT "WWV_FLOW_MODEL_PAGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_REGIONS" ADD CONSTRAINT "WWV_FLOW_MPR_RPT_IMPL_TYPE" CHECK (report_implementation in  (
                                    'CLASSIC',
                                    'INTERACTIVE'
                                )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_REGIONS" ADD CONSTRAINT "WWV_FLOW_MPR_SEARCH_ENABLES" CHECK (search_enabled in (
                                    'Y',
                                    'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_REGIONS" ADD CONSTRAINT "WWV_FLOW_MPR_CHART_RENDER" CHECK (chart_rendering in ('FLASH_PREFERRED', 'SVG_ONLY')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_REGIONS" ADD CONSTRAINT "WWV_FLOW_MPR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_COLS" ADD CONSTRAINT "WWV_MPC_DISPLAY_AS_TAB_FORM" CHECK (display_as_tab_form in (
                                'READONLY',
                                'DISPLAY_AND_SAVE',
                                'WITHOUT_MODIFICATION',
                                'ESCAPE_SC',
                                'TEXT',
                                'TEXTAREA',
                                'TEXT_FROM_LOV',
                                'SELECT_LIST',
                                'SELECT_LIST_FROM_LOV',
                                'SELECT_LIST_FROM_QUERY',
                                'HIDDEN',
                                'HIDDEN_PROTECTED',
                                'POPUP',
                                'POPUP_QUERY',
                                'DATE_POPUP',
                                'DATE_PICKER',
                                'PICK_DATE_USING_APP_FORMAT_MASK',
                                'PICK_DATE_USING_APP_DATE_FORMAT',
                                'PICK_DATE_USING_FORMAT_MASK',
                                'PICK_DATE_DD_MON_RR',
                                'PICK_DATE_DD_MON_RR_HH_MI',
                                'PICK_DATE_DD_MON_RR_HH24_MI',
                                'PICK_DATE_DD_MON_YY',
                                'PICK_DATE_DD_MON_YY_HH_MI',
                                'PICK_DATE_DD_MON_YY_HH24_MI',
                                'PICK_DATE_DD_MON_YYYY',
                                'PICK_DATE_DD_MON_YYYY_HH_MI',
                                'PICK_DATE_DD_MON_YYYY_HH24_MI',
                                'PICK_DATE_DD_MM_YYYY',
                                'PICK_DATE_DD_MM_YYYY_HH_MI',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI',
                                'PICK_DATE_MM_DD_YYYY',
                                'PICK_DATE_MM_DD_YYYY_HH_MI',
                                'PICK_DATE_MM_DD_YYYY_HH24_MI',
                                'PICK_DATE_YYYY_MM_DD',
                                'PICK_DATE_YYYY_MM_DD_HH_MI',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI',
                                'PICK_DATE_RR_MON_DD',
                                'PICK_DATE_RR_MON_DD_HH_MI',
                                'PICK_DATE_RR_MON_DD_HH24_MI',
                                'PICK_DATE_YYYY_MM_DD_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH',
                                'PICK_DATE_YYYY_DD_MM_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                                'PICK_DATE_DD_MM_YYYY_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                                'CHECKBOX',
                                'SIMPLE_CHECKBOX',
                                'RADIOGROUP')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_COLS" ADD CONSTRAINT "DATATYPE" CHECK (datatype in ('DATE','NUMBER','TIMESTAMP','TIMESTAMP_LTZ','VARCHAR2','BLOB','CLOB')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_COLS" ADD CONSTRAINT "WWV_FLOW_MPC_ALIGNMENT" CHECK (alignment in ('LEFT','CENTER','RIGHT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_COLS" ADD CONSTRAINT "WWV_FLOW_MODEL_PAGE_COLS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_COLS" ADD CONSTRAINT "WWV_MPC_DISPLAY_AS_FORM" CHECK (display_as_form in (
                                'DISPLAY_ONLY_PLSQL',
                                'FILE',
                                'BUTTON',
                                'HIDDEN',
                                'HIDDEN_PROTECTED',
                                'DISPLAY_ONLY_HTML',
                                'STOP_AND_START_HTML_TABLE',
                                'DISPLAY_ONLY_ESCAPE_SC',
                                'IMAGE',
                                'DISPLAY_AND_SAVE',
                                'DISPLAY_AND_SAVE_LOV',
                                'CHECKBOX',
                                'POPUP',
                                'POPUP_FILTER',
                                'POPUP2',
                                'POPUP3',
                                'POPUP4',
                                'POPUP5',
                                'POPUP6',
                                'POPUP_KEY_LOV',
                                'POPUP_KEY_LOV_NOFETCH',
                                'PICK_DATE_USING_FLOW_FORMAT_MASK',
                                'PICK_DATE_USING_APP_FORMAT_MASK',
                                'PICK_DATE_USING_APP_DATE_FORMAT',
                                'PICK_DATE_USING_FORMAT_MASK',
                                'PICK_DATE_DD_MON_RR',
                                'PICK_DATE_DD_MON_RR_HH_MI',
                                'PICK_DATE_DD_MON_RR_HH24_MI',
                                'PICK_DATE_DD_MON_YY',
                                'PICK_DATE_DD_MON_YY_HH_MI',
                                'PICK_DATE_DD_MON_YY_HH24_MI',
                                'PICK_DATE_DD_MON_YYYY',
                                'PICK_DATE_DD_MON_YYYY_HH_MI',
                                'PICK_DATE_DD_MON_YYYY_HH24_MI',
                                'PICK_DATE_DD_MM_YYYY',
                                'PICK_DATE_DD_MM_YYYY_HH_MI',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI',
                                'PICK_DATE_MM_DD_YYYY',
                                'PICK_DATE_MM_DD_YYYY_HH_MI',
                                'PICK_DATE_MM_DD_YYYY_HH24_MI',
                                'PICK_DATE_YYYY_MM_DD',
                                'PICK_DATE_YYYY_MM_DD_HH_MI',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI',
                                'PICK_DATE_RR_MON_DD',
                                'PICK_DATE_RR_MON_DD_HH_MI',
                                'PICK_DATE_RR_MON_DD_HH24_MI',
                                'PICK_DATE_YYYY_MM_DD_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH_MI_SLASH',
                                'PICK_DATE_YYYY_MM_DD_HH24_MI_SLASH',
                                'PICK_DATE_YYYY_DD_MM_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH_MI_DOT',
                                'PICK_DATE_YYYY_DD_MM_HH24_MI_DOT',
                                'PICK_DATE_DD_MM_YYYY_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DASH',
                                'PICK_DATE_DD_MM_YYYY_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH_MI_DOT',
                                'PICK_DATE_DD_MM_YYYY_HH24_MI_DOT',
                                'DISPLAY_ONLY_LOV',
                                'COMBOBOX',
                                'SHOW_AS_SL_WITH_POPUP',
                                'COMBOBOX_WITH_URL_REDIRECT',
                                'COMBOBOX_WITH_BRANCH_TO_PAGE',
                                'COMBOBOX_WITH_SUBMIT',
                                'COMBOBOX_WITH_JS_POST',
                                'COMBOBOX_WITH_JS_REDIRECT',
                                'MULTIPLESELECT',
                                'RADIOGROUP',
                                'RADIOGROUP2',
                                'RADIOGROUP_WITH_REDIRECT',
                                'RADIOGROUP_WITH_SUBMIT',
                                'RADIOGROUP_WITH_JS_SUBMIT',
                                'TEXTAREA',
                                'TEXTAREA_WITH_SPELL_CHECK',
                                'TEXTAREA-AUTO-HEIGHT',
                                'TEXTAREA_WITH_CONTROLS',
                                'TEXTAREA_WITH_HTML_EDITOR_BASIC',
                                'TEXTAREA_WITH_HTML_EDITOR_STANDARD',
                                'TEXTAREA_CHAR_COUNT',
                                'TEXTAREA_CHAR_COUNT_SPELL',
                                'TEXT',
                                'TEXT_WITH_ENTER_SUBMIT',
                                'TEXT_DISABLED',
                                'TEXT_DISABLED_AND_SAVE',
                                'TEXT_WITH_CALCULATOR',
                                'PASSWORD',
                                'PASSWORD_WITH_ENTER_SUBMIT',
                                'PASSWORD_DNSS',
                                'PASSWORD_WITH_SUBMIT_DNSS',
                                'LIST_MGR',
                                'LIST_MGR2',
                                'LIST_MGR3',
                                'LIST_MGR_VIEW',
                                'LIST_MGR_VIEW2',
                                -- 4.0
                                'SELECT_LIST_WITH_POPUP',
                                'TEXT_WITH_SELECT_LIST',
                                'TEXTAREA_WITH_POPUP'
                                ) or
                                display_as_form like 'NATIVE\_%' escape '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SC_TRANS" ADD CONSTRAINT "WWV_FLOW_SC_TRANS_CK1" CHECK (transaction_type in (
                                 'STOP',
                                 'SQL',
                                 'PLSQL')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SC_TRANS" ADD CONSTRAINT "WWV_FLOW_SC_TRANS_CK2" CHECK (transaction_status in (
                                 'N',
                                 'R')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SC_TRANS" ADD CONSTRAINT "WWV_FLOW_SC_TRANS_PK" PRIMARY KEY ("SESSION_ID", "TRANSACTION_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REPORT_LAYOUTS" ADD CONSTRAINT "WWV_FLOW_REPORT_LAYOUT_TYPE" CHECK (report_layout_type in (
                                          'RTF_FILE',
                                          'XSL_FILE',
                                          'XSL_GENERIC'
                                      )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REPORT_LAYOUTS" ADD CONSTRAINT "WWV_FLOW_REPORT_LAYOUTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_13" CHECK (prompt_substitution_13_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_14" CHECK (prompt_substitution_14_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_15" CHECK (prompt_substitution_15_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_16" CHECK (prompt_substitution_16_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_17" CHECK (prompt_substitution_17_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_18" CHECK (prompt_substitution_18_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_19" CHECK (prompt_substitution_19_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_20" CHECK (prompt_substitution_20_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_AUTH_PROMPT" CHECK (prompt_if_mult_auth_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_FLOW_INSTALL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_IN_EXPORT" CHECK (include_in_export_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_01" CHECK (prompt_substitution_01_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_02" CHECK (prompt_substitution_02_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_03" CHECK (prompt_substitution_03_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_04" CHECK (prompt_substitution_04_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_05" CHECK (prompt_substitution_05_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_06" CHECK (prompt_substitution_06_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_07" CHECK (prompt_substitution_07_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_08" CHECK (prompt_substitution_08_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_09" CHECK (prompt_substitution_09_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_10" CHECK (prompt_substitution_10_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_11" CHECK (prompt_substitution_11_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_INSTALL_SUB_12" CHECK (prompt_substitution_12_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_SCRIPTS" ADD CONSTRAINT "WWV_FLOW_INSTALL_ST_CK" CHECK (script_type in ('INSTALL','UPGRADE','DEINSTALL')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_SCRIPTS" ADD CONSTRAINT "WWV_FLOW_INSTALL_SCRIPTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_CHECKS" ADD CONSTRAINT "WWV_FLOW_INSTALL_CHECKS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_BUILD_OPT" ADD CONSTRAINT "WWV_FLOW_INSTALL_BUILD_OPT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BUILDER_AUDIT_TRAIL" ADD CONSTRAINT "WWV_FLOW_BLD_AUDIT_CK_A" CHECK (audit_action in ('I','U','D')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_BUILDER_AUDIT_TRAIL" ADD CONSTRAINT "WWV_FLOW_BLD_AUDIT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_ICONS" ADD CONSTRAINT "WWV_FLOW_STANDARD_ICONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_CSS" ADD CONSTRAINT "WWV_FLOW_STANDARD_CSS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_JS" ADD CONSTRAINT "WWV_FLOW_STANDARD_JS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_ITEM_TYPES" ADD CONSTRAINT "WWV_FLOW_STD_ITEM_TYPE_NAME_CK" CHECK (upper(name)=name) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_ITEM_TYPES" ADD CONSTRAINT "WWV_FLOW_STD_ITEM_TYPE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_ITEM_TYPES" ADD CONSTRAINT "WWV_FLOW_STD_ITEM_TYPE_UK" UNIQUE ("NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_APP_BUILD_PREF" ADD CONSTRAINT "WWV_FLOW_APP_BLDPRF_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_XGROUP" CHECK (x_axis_group_sep in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_YGROUP" CHECK (y_axis_group_sep in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_UPDATE" CHECK (async_update in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_XML" CHECK (use_chart_xml in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHART_SERIES" ADD CONSTRAINT "WWV_FLOW_FLASH_QUERY_TYPE" CHECK (series_query_type in ('SQL_QUERY','FUNCTION_RETURNING_SQL_QUERY')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHART_SERIES" ADD CONSTRAINT "WWV_FLOW_FLASH_CHART_SERIES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5" ADD CONSTRAINT "WWV_FLOW_FLASH_5_RENDERING" CHECK (chart_rendering in ('FLASH_PREFERRED', 'SVG_ONLY')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5" ADD CONSTRAINT "WWV_FLOW_FLASH_5_UPDATE" CHECK (async_update in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5" ADD CONSTRAINT "WWV_FLOW_FLASH_5_XML" CHECK (use_chart_xml in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_5_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHART5_SERIES" ADD CONSTRAINT "WWV_FLOW_FLASH5_QRY_TYPE" CHECK (series_query_type in ('SQL_QUERY','FUNCTION_RETURNING_SQL_QUERY')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHART5_SERIES" ADD CONSTRAINT "WWV_CHART_LINK_CHECKSUM_TYPE" CHECK (action_link_checksum_type in (
                                    '1', -- workspace
                                    '2', -- user
                                    '3'  -- session
                                )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHART5_SERIES" ADD CONSTRAINT "WWV_FLOW_FLASH_5_SERIES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_MAP_FOLDERS" ADD CONSTRAINT "WWV_FLOW_FLASH_MAP_FOLDERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_MAP_FILES" ADD CONSTRAINT "WWV_FLOW_FLASH_MAP_PROJECT" CHECK (projection in ('Bonne',
                                                          'Eckert1',
                                                          'Eckert3',
                                                          'Equirectangular',
                                                          'Fahey',
                                                          'HammerAitoff',
                                                          'Mercator',
                                                          'Orthographic',
                                                          'Robinson',
                                                          'Wagner3')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_MAP_FILES" ADD CONSTRAINT "WWV_FLOW_FLASH_MAP_FILES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_MAP_REGIONS" ADD CONSTRAINT "WWV_FLOW_FLASH_MAP_REG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RANDOM_IMAGES" ADD CONSTRAINT "WWV_FLOW_RANDOM_IMAGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REQUEST_VERIFICATIONS" ADD CONSTRAINT "WWV_FLOW_REQUEST_VERIF_PK" PRIMARY KEY ("SESSION_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_STATUS_CK" CHECK (status in (
                              'AVAILABLE_FOR_OWNER',
                              'NOT_AVAILABLE',
                              'AVAILABLE',
                              'ACL')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_ALLOW_SAVE_CK" CHECK (allow_report_saving in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_ALLOW_SAVE_PUB_CK" CHECK (allow_save_rpt_public in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_ALLOW_CAT_CK" CHECK (allow_report_categories in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_PAG_TYPE" CHECK (pagination_type in (
                              'ROWS_X_TO_Y_OF_Z',
                              'ROWS_X_TO_Y'
                              )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_SHOW_FND_DROP_CK" CHECK (show_finder_drop_down in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_SHOW_ROW_CNT_CK" CHECK (show_display_row_count in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_SHOW_SEARCH_BAR_CK" CHECK (show_search_bar in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_SHOW_SEARCH_BOX_CK" CHECK (show_search_textbox in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_SHOW_ACTIONS_CK" CHECK (show_actions_menu in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_LIST_REPS_CK" CHECK (report_list_mode in (
                              'TABS',
                              'NONE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_COL_CK" CHECK (show_select_columns in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_ROWS_CK" CHECK (show_rows_per_page in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_FILTER_CK" CHECK (show_filter in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_SORT_CK" CHECK (show_sort in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_BREAK_CK" CHECK (show_control_break in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_HL_CK" CHECK (show_highlight in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_COMP_CK" CHECK (show_computation in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_AGG_CK" CHECK (show_aggregate in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_CHART_CK" CHECK (show_chart in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_NOTIFY_CK" CHECK (show_notify in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_GROUP_BY_CK" CHECK (show_group_by in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_CAL_CK" CHECK (show_calendar in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_FB_CK" CHECK (show_flashback in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_RESET_CK" CHECK (show_reset in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_DL_CK" CHECK (show_download in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_SHOW_HELP_CK" CHECK (show_help in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_DETAIL_LINK_CK" CHECK (show_detail_link in (
                              'Y',
                              'N',
                              'C')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_IR_LINK_CHECKSUM_TYPE" CHECK (detail_link_checksum_type in (
                                '1', -- workspace
                                '2', -- user
                                '3'  -- session
                                )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_EXCLUDE_NULL_CK" CHECK (allow_exclude_null_values in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_HIDE_EXTRA_CK" CHECK (allow_hide_extra_columns in (
                              'Y',
                              'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_IV_ENAB_CK" CHECK (icon_view_enabled_yn in (
                              'Y','N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_IV_CUS_CK" CHECK (icon_view_use_custom in (
                              'Y','N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WS_ENAB_DV_CK" CHECK (detail_view_enabled_yn in (
                              'Y','N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WORKSHEETS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_CAT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_TABLES" ADD CONSTRAINT "WWV_FLOW_WS_TABLES_CK1" CHECK (has_constraints in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_TABLES" ADD CONSTRAINT "WWV_FLOW_WS_TABLES_CK2" CHECK (has_triggers in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_TABLES" ADD CONSTRAINT "WWV_FLOW_WS_TABLES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_TAB_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_TAB_COLS_NULL_CK" CHECK (nullable in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_TAB_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_TAB_COLUMNS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_INDEXES" ADD CONSTRAINT "WWV_FLOW_WS_INDEXES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_IND_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_IND_COLUMNS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_CONSTRAINTS" ADD CONSTRAINT "WWV_FLOW_WS_CONSTRAINTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_TRIGGERS" ADD CONSTRAINT "WWV_FLOW_WS_TRIGGERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APP_STATUS_CK" CHECK (status in (
                                  'AVAILABLE',
                                  'DEVELOPERS_ONLY',
                                  'UNAVAILABLE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APP_ACL_TYP_CK" CHECK (acl_type in (
                                  'DEFAULT',
                                  'CUSTOM')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APP_RPWD_CK" CHECK (show_reset_passwd_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APP_ALLOW_PUB_CK" CHECK (allow_public_access_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APP_LOGO_CK" CHECK (logo_type in (
                                     'NONE','TEXT','IMAGE','FILEPATH')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APP_TYPE" CHECK (application_type in ('STANDARD','TEMPLATE','SAMPLE','TEMPLATE_HIDDEN')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APPLICATIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APP_SUG_OBJECTS" ADD CONSTRAINT "WWWV_FLOW_WS_APP_SO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_WS_CUSTOM_AUTH_CHK1" CHECK (use_secure_cookie_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_WS_LDAP_USERESC_CHK1" CHECK (ldap_username_escaping in ('STD','ONLY','NO')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_WS_LDAP_USE_SSL_CHK1" CHECK (ldap_use_ssl in ('Y','N','A')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_WS_LDAP_USE_EXDN_CHK1" CHECK (ldap_use_exact_dn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_WS_AUTH_SETUPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ADD CONSTRAINT "WWV_FLOW_WS_ATTR_STATUS_CK" CHECK (status in (
                            'PRIVATE',
                            'PROJECT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ADD CONSTRAINT "WWV_FLOW_WS_ATTR_PUBLISH_CK" CHECK (publish_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ADD CONSTRAINT "WWV_FLOW_WS_ATTR_WS_TYPE_CK" CHECK (websheet_type in (
                            'DATA',
                            'REPORT',
                            'TEMPLATE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ADD CONSTRAINT "WWV_FLOW_WS_ATTR_RESP_CK" CHECK (geo_resp_type in ('XML','TEXT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ADD CONSTRAINT "WWV_FLOW_WS_WEBSHEET_ATTR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COL_GROUPS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_GRPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COL_GROUPS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_GRPS_UK" UNIQUE ("WORKSHEET_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOVS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOVS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOVS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOVS_UK" UNIQUE ("WORKSHEET_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOV_ENTRIES" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOV_ENT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOV_ENTRIES" ADD CONSTRAINT "WWV_FLOW_WS_LOV_ENTS_UK" UNIQUE ("LOV_ID", "ENTRY_TEXT")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WSCOL_ALLOW_NULL" CHECK (allow_null in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_TZ_DEP_CK" CHECK (tz_dependent in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WSCOL_LOV" CHECK (rpt_distinct_lov in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WSCOL_SHOWFIL_LOV_CK" CHECK (rpt_show_filter_lov in ('D','S','N','C','1','2')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WSCOL_FIL_DTRNG_CK" CHECK (rpt_filter_date_ranges in ('ALL','PAST','FUTURE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_LOV_ALLOW_NEW" CHECK (lov_allow_new_values in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_LOV_DISTINCT_VALS" CHECK (lov_is_distinct_values in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COLUMNS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COLUMNS_UK2" UNIQUE ("WORKSHEET_ID", "DB_COLUMN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_VAL_WSCOL_SYNC_LAB" CHECK (sync_form_label in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_DISPLAY_COL" CHECK (display_in_default_rpt in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_CHECKSUM_TYPE" CHECK (column_link_checksum_type in (
                              '1', -- workspace
                              '2', -- user
                              '3'  -- session
                              )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_SORT_CK" CHECK (is_sortable in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_SORTING_CK" CHECK (allow_sorting in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_FILTER_CK" CHECK (allow_filtering in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_HIGHLIGHT_CK" CHECK (allow_highlighting in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_CTRL_CK" CHECK (allow_ctrl_breaks in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_AGG_CK" CHECK (allow_aggregations in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_COMP_CK" CHECK (allow_computations in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_CHART_CK" CHECK (allow_charting in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_GROUP_BY_CK" CHECK (allow_group_by in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_HIDE_CK" CHECK (allow_hide in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_VALID_WS_COL_TYPE" CHECK (column_type in (
                        'STRING',
                        'DATE',
                        'NUMBER',
                        'CLOB',
                        'FILE',
                        'COMPUTED',
                        'DETAIL_LINK',
                        'OTHER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_DISP_AS_CK" CHECK (display_as in (
                        'READONLY',
                        'TEXT',
                        'TEXTAREA',
                        'SELECTLIST',
                        'CHECKBOX',
                        'RADIOGROUP',
                        'POPUP_LOV',
                        'DATE_PICKER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_DISP_TXT_AS_CK" CHECK (display_text_as in (
                        'WITHOUT_MODIFICATION',
                        'ESCAPE_SC',
                        'STRIP_HTML_ESCAPE_SC',
                        'LOV_ESCAPE_SC',
                        'HIDDEN')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_HEAD_AL_CK" CHECK (heading_alignment in (
                        'LEFT',
                        'RIGHT',
                        'CENTER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WS_COL_COL_AL_CK" CHECK (column_alignment in (
                        'LEFT',
                        'RIGHT',
                        'CENTER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WS_RPT_STATUS_CK" CHECK (status in (
                           'PRIVATE',
                           'PUBLIC')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WS_RPT_VM_CK" CHECK (view_mode in ('REPORT','ICON','DETAIL')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WS_RPT_DEF_CK" CHECK (is_default in (
                           'Y',
                           'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WS_RPT_FB_CK" CHECK (flashback_enabled in (
                           'Y',
                           'N')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WS_RPT_CHART_AGG_CK" CHECK (chart_aggregate in (
                           'SUM',
                           'AVG',
                           'MIN',
                           'MAX',
                           'COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WS_RPT_CHRT_CK" CHECK (chart_sorting in (
                           'DEFAULT',
                           'VALUE_DESC',
                           'VALUE_ASC',
                           'LABEL_DESC',
                           'LABEL_ASC')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_RPTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CONDITIONS" ADD CONSTRAINT "WWV_FLOW_WS_C_TYPE_CK" CHECK (condition_type in ('FILTER','HIGHLIGHT','SEARCH')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CONDITIONS" ADD CONSTRAINT "WWV_FLOW_WS_C_DEL_CK" CHECK (allow_delete in ('Y','N','R')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CONDITIONS" ADD CONSTRAINT "WWV_FLOW_WS_C_ENABLED_CK" CHECK (enabled in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CONDITIONS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COND_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COMPUTATION" ADD CONSTRAINT "WWV_FLOW_VALID_WS_COMP_TYPE" CHECK (column_type in (
                         'STRING',
                         'DATE',
                         'NUMBER',
                         'CLOB',
                         'OTHER')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COMPUTATION" ADD CONSTRAINT "WWV_FLOW_WS_COMP_COLS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COMPUTATION" ADD CONSTRAINT "WWV_FLOW_WS_COMP_COLS_UK" UNIQUE ("REPORT_ID", "DB_COLUMN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COMPUTATION" ADD CONSTRAINT "WWV_FLOW_WS_COMP_COLS_UK2" UNIQUE ("REPORT_ID", "COLUMN_IDENTIFIER")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR6_CK" CHECK (sort_direction_06 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR7_CK" CHECK (sort_direction_07 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR8_CK" CHECK (sort_direction_08 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR9_CK" CHECK (sort_direction_09 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR10_CK" CHECK (sort_direction_10 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR11_CK" CHECK (sort_direction_11 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR12_CK" CHECK (sort_direction_12 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GROUPBY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN1_CK" CHECK (function_01 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN2_CK" CHECK (function_02 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN3_CK" CHECK (function_03 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN4_CK" CHECK (function_04 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN5_CK" CHECK (function_05 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN6_CK" CHECK (function_06 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN7_CK" CHECK (function_07 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN8_CK" CHECK (function_08 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN9_CK" CHECK (function_09 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN10_CK" CHECK (function_10 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN11_CK" CHECK (function_11 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_FUNTN12_CK" CHECK (function_12 in (
                                'SUM',
                                'AVG',
                                'MAX',
                                'MIN',
                                'MEDIAN',
                                'COUNT',
                                'COUNT_DISTINCT',
                                'RATIO_TO_REPORT_SUM',
                                'RATIO_TO_REPORT_COUNT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR1_CK" CHECK (sort_direction_01 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR2_CK" CHECK (sort_direction_02 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR3_CK" CHECK (sort_direction_03 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR4_CK" CHECK (sort_direction_04 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GRPBY_SORTDIR5_CK" CHECK (sort_direction_05 in (
                                'ASC',
                                'ASC NULLS LAST',
                                'ASC NULLS FIRST',
                                'DESC',
                                'DESC NULLS LAST',
                                'DESC NULLS FIRST')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_NOTIFY" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_NOTIFY_CK" CHECK (notify_interval in ('H','D','BW','W','M')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_NOTIFY" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_NSTATUS_CK" CHECK (status in ('SUBMITTED','SENT','ERROR')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_NOTIFY" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_NOTIFY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBPAGES" ADD CONSTRAINT "WWV_FLOW_WS_WEBPG_STATUS_CK" CHECK (status in (
                    'AVAILABLE_FOR_OWNER',
                    'NOT_AVAILABLE',
                    'AVAILABLE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBPAGES" ADD CONSTRAINT "WWV_FLOW_WS_WEBPAGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_COL_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_WS_VAL_LEVEL_CK" CHECK (validation_level in (
                         'REPORT',
                         'FORM',
                         'BOTH')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_COL_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_WS_COL_VAL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_DATA_GRID_Q" ADD CONSTRAINT "WWV_FLOW_WS_DGQ_DB_OBJ_CK" CHECK (db_obj_found in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WS_DATA_GRID_Q" ADD CONSTRAINT "WWV_FLOW_WS_DATA_GRID_Q_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DICTIONARY_VIEWS" ADD CONSTRAINT "WWV_FLOW_DICT_VIEWS_NAME_CK" CHECK (upper(view_name)=view_name) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_DICTIONARY_VIEWS" ADD CONSTRAINT "WWV_FLOW_DICT_VIEWS_PK_COL_CK" CHECK (upper(pk_column_name)=pk_column_name) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_DICTIONARY_VIEWS" ADD CONSTRAINT "WWV_FLOW_DICT_VIEWS_LOOKUP_CK" CHECK (upper(lookup_or_lov_columns)=lookup_or_lov_columns) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_DICTIONARY_VIEWS" ADD CONSTRAINT "WWV_FLOW_DICT_VIEWS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DICTIONARY_VIEWS" ADD CONSTRAINT "WWV_FLOW_DICT_VIEW_NAME_UK" UNIQUE ("VIEW_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_ADV_CAT_CODE_CK" CHECK (upper(code)=code) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_ADV_CAT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_ADV_CAT_CODE_UK" UNIQUE ("CODE")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECKS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_CODE_CK" CHECK (upper(code)=code) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECKS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_IS_DEFAULT_CK" CHECK (is_default in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECKS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_IS_CUSTOM_CK" CHECK (is_custom in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECKS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECKS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_CODE_UK" UNIQUE ("CODE")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECK_MSGS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_MSG_CODE_CK" CHECK (upper(code)=code) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECK_MSGS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_MSG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECK_MSGS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_MSG_CODE_UK" UNIQUE ("CHECK_ID", "CODE")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_TYPE_CK" CHECK (plugin_type in ( 'ITEM TYPE',
                                                                       'DYNAMIC ACTION',
                                                                       'REGION TYPE',
                                                                       'VALIDATION TYPE',
                                                                       'PROCESS TYPE',
                                                                       'REPORT COLUMN TYPE',
                                                                       'AUTHORIZATION TYPE',
                                                                       'AUTHENTICATION TYPE' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_NAME_CK" CHECK (upper(name)=name) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_MINCOL_CK" CHECK (sql_min_column_count > 0) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_MAXCOL_CK" CHECK (sql_max_column_count > 0) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_SUBST_ATTR_CK" CHECK (substitute_attributes in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_SETTINGS_CK" CHECK (subscribe_plugin_settings in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_UK" UNIQUE ("FLOW_ID", "PLUGIN_TYPE", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_UK" UNIQUE ("PLUGIN_ID", "ATTRIBUTE_SCOPE", "ATTRIBUTE_SEQUENCE")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_SCOPE_CK" CHECK (attribute_scope in ('APPLICATION', 'COMPONENT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_SEQ_CK" CHECK (attribute_sequence between 1 and 25) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_TYPE_CK" CHECK (attribute_type in (
                                                        'CHECKBOX',
                                                        'CHECKBOXES',
                                                        'SELECT LIST',
                                                        'TEXT',
                                                        'TEXTAREA',
                                                        'NUMBER',
                                                        'INTEGER',
                                                        'PAGE ITEM',
                                                        'PAGE ITEMS',
                                                        'PAGE NUMBER',
                                                        'SQL',
                                                        'PLSQL',
                                                        'PLSQL EXPRESSION',
                                                        'PLSQL FUNCTION BODY',
                                                        'REGION SOURCE COLUMN',
                                                        'DATA LOAD TABLE ID' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_REQ_CK" CHECK (is_required in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_DISP_L_CK" CHECK (display_length between 1 and 4000) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_MAX_L_CK" CHECK (max_length between 1 and 4000) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_MINCOL_CK" CHECK (sql_min_column_count > 0) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_MAXCOL_CK" CHECK (sql_max_column_count > 0) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_TRANSL_CK" CHECK (is_translatable in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_COND_CK" CHECK (depending_on_condition_type in (
                                                      'EQUALS',
                                                      'NOT_EQUALS',
                                                      'NULL',
                                                      'NOT_NULL',
                                                      'IN_LIST',
                                                      'NOT_IN_LIST' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTR_VALUES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTRV_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_FILES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_FILE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_FILES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_FILE_UK" UNIQUE ("PLUGIN_ID", "FILE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_EVENTS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_EVNT_NAME_CK" CHECK (lower(name)=name) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_EVENTS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_EVNT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_EVENTS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_EVNT_UK" UNIQUE ("PLUGIN_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_SETTINGS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_SET_TYPE_CK" CHECK (plugin_type in ( 'ITEM TYPE',
                                                                       'DYNAMIC ACTION',
                                                                       'REGION TYPE',
                                                                       'VALIDATION TYPE',
                                                                       'PROCESS TYPE',
                                                                       'REPORT COLUMN TYPE',
                                                                       'AUTHORIZATION TYPE',
                                                                       'AUTHENTICATION TYPE' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_SETTINGS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_SET_PLUGIN_CK" CHECK (  plugin like 'NATIVE\_%' escape '\'
                                                     or plugin like 'PLUGIN\_%' escape '\' ) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_SETTINGS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_SET_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_SETTINGS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_SET_UK" UNIQUE ("FLOW_ID", "PLUGIN_TYPE", "PLUGIN")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_EVENTS" ADD CONSTRAINT "WWV_FLOW_STD_EVNT_NAME_CK" CHECK (lower(name)=name) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_EVENTS" ADD CONSTRAINT "WWV_FLOW_STD_EVNT_TYPE_CK" CHECK (event_type in (
                                                    'BROWSER',
                                                    'APEX',
                                                    'CUSTOM' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_EVENTS" ADD CONSTRAINT "WWV_FLOW_STD_EVNT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STANDARD_EVENTS" ADD CONSTRAINT "WWV_FLOW_STD_EVNT_UK" UNIQUE ("NAME", "EVENT_TYPE")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_COND_CK" CHECK (triggering_condition_type in (
                                                    'EQUALS',
                                                    'NOT_EQUALS',
                                                    'GREATER_THAN',
                                                    'GREATER_THAN_OR_EQUAL',
                                                    'LESS_THAN',
                                                    'LESS_THAN_OR_EQUAL',
                                                    'NULL',
                                                    'NOT_NULL',
                                                    'IN_LIST',
                                                    'NOT_IN_LIST',
                                                    'JAVASCRIPT_EXPRESSION')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_TYPE_CK" CHECK (bind_type in (
                                                    'bind',
                                                    'live',
                                                    'one')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_BTYPE_CK" CHECK (bind_event_type in (
                                                    'focusout',
                                                    'focusin',
                                                    'load',
                                                    'resize',
                                                    'scroll',
                                                    'unload',
                                                    'click',
                                                    'dblclick',
                                                    'mousedown',
                                                    'mouseup',
                                                    'mousemove',
                                                    'mouseenter',
                                                    'mouseleave',
                                                    'change',
                                                    'select',
                                                    'keydown',
                                                    'keypress',
                                                    'keyup',
                                                    'ready',
                                                    'apexbeforerefresh',
                                                    'apexafterrefresh',
                                                    'apexbeforepagesubmit',
                                                    'custom',
                                                    'tap',
                                                    'taphold',
                                                    'swipe',
                                                    'swipeleft',
                                                    'swiperight',
                                                    'vmousedown',
                                                    'vmousemove',
                                                    'vmouseup',
                                                    'vclick',
                                                    'vmousecancel',
                                                    'orientationchange',
                                                    'scrollstart',
                                                    'scrollstop' ) or
                                                    bind_event_type like 'NATIVE\_%' escape '\' or
                                                    bind_event_type like 'PLUGIN\_%' escape '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_TE_TYPE_CK" CHECK (triggering_element_type in (
                                                    'ITEM',
                                                    'REGION',
                                                    'COLUMN',
                                                    'DOM_OBJECT',
                                                    'JQUERY_SELECTOR',
                                                    'BUTTON' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_ER_CK" CHECK (event_result in (
                                                'TRUE',
                                                'FALSE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_ON_INIT_CK" CHECK (execute_on_page_init in (
                                                'Y',
                                                'N' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_WFR_CK" CHECK (wait_for_result in (
                                                'Y',
                                                'N' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_ACTION_CK" CHECK (
                                                action like 'NATIVE\_%' escape '\' or
                                                action like 'PLUGIN\_%' escape '\') ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_AE_TYPE_CK" CHECK (affected_elements_type in (
                                               'ITEM',
                                               'BUTTON',
                                               'REGION',
                                               'COLUMN',
                                               'DOM_OBJECT',
                                               'JQUERY_SELECTOR',
                                               'TRIGGERING_ELEMENT',
                                               'EVENT_SOURCE' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_ON_ERR_CK" CHECK (stop_execution_on_error in (
                                                'Y',
                                                'N' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSPACE_SUMMARY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_UK1" UNIQUE ("FLOW_ID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_CK1" CHECK (is_uk1_case_sensitive in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_CK2" CHECK (is_uk2_case_sensitive in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_CK3" CHECK (is_uk3_case_sensitive in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_LOOKUPS" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_LK_CK1" CHECK (insert_new_value in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_LOOKUPS" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_LK_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_LOOKUPS" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_LK_UK1" UNIQUE ("LOAD_TABLE_ID", "LOAD_COLUMN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_RULES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_RULE_CK1" CHECK (rule_type in (
                                                'TO_UPPER_CASE',
                                                'TO_LOWER_CASE',
                                                'REPLACE',
                                                'TRIM','LTRIM','RTRIM',
                                                'SINGLE_WHITESPACES',
                                                'PLSQL_EXPRESSION',
                                                'REGULAR_EXPRESSION',
                                                'PLSQL_FUNCTION_BODY',
                                                'SQL_QUERY_SINGLE_VALUE',
                                                'SQL_QUERY_SEMI_COLON' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_RULES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_RULE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_RULES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_RULE_UK1" UNIQUE ("LOAD_TABLE_ID", "LOAD_COLUMN_NAME", "RULE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEEDBACK" ADD CONSTRAINT "WWV_FLOW_FEEDBACK_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEEDBACK_FOLLOWUP" ADD CONSTRAINT "WWV_FLOW_FEEDBACK_FUP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_TAGS" ADD CONSTRAINT "WWV_FLOW_TEAM_TAGS_TP" CHECK (tag_type in ('BUG','FEATURE','FEEDBACK','MILESTONE','DOCUMENT', 'LINK',  'TODO')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_TAGS" ADD CONSTRAINT "WWV_FLOW_TEAM_TAGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DEBUG_MESSAGES" ADD CONSTRAINT "WWV_FLOW_DEBUG_MESSAGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DEBUG_MESSAGES2" ADD CONSTRAINT "WWV_FLOW_DEBUG_MESSAGES2_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_WORKSPACES" ADD CONSTRAINT "WWV_PURGE_WORKSPACES_CK1" CHECK (status in ('NEW', 'STAGE1', 'STAGE2', 'RETAIN', 'PURGING', 'PURGED')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_PURGE_WORKSPACES" ADD CONSTRAINT "WWV_PURGE_WORKSPACES_PK" PRIMARY KEY ("ID", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_LOG" ADD CONSTRAINT "WWV_PURGE_LOG_CK1" CHECK (log_code in ('NEW','DELETE','EMAIL','RESPONSE_RETAIN',
                           'RESPONSE_PURGE','MOVED_TO_NEW','EMAIL_COMPLETE','REMINDER_EMAIL_COMPLETE','BEGIN_PURGE','PURGE_SCHEMA_EVAL',
                           'PURGE_TABLESPACE_EVAL','PURGE_COMPLETE', 'ERROR_DROP_USER', 'ERROR_DROP_TABLESPACE', 'BEGIN_DROP_USER',
                           'END_DROP_USER', 'BEGIN_DROP_TABLESPACE', 'END_DROP_TABLESPACE', 'BEGIN_DELETE_WORKSPACE',
                           'END_DELETE_WORKSPACE', 'ERROR_DELETE_WORKSPACE')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_LOG" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_EMAILS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_WORKSPACE_RESPONSES" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_DATAFILES" ADD CONSTRAINT "WWV_PURGE_DATAFILES_CK1" CHECK (status in('NOT_EVAL','QUOTA_BY_OTHER','OTHER_WORKSPACE','NOT_FLOW_TABLESPACE','PURGE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_PURGE_DATAFILES" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_SCHEMAS" ADD CONSTRAINT "WWV_PURGE_SCHEMAS_CK1" CHECK (status in('NOT_EVAL','INTERNAL','OTHER_WORKSPACE','RESTRICTED','NOT_FLOW_DEFAULT_TABLESPACE','PURGE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_PURGE_SCHEMAS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_AUTHORIZED_URLS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_STATE" ADD CONSTRAINT "WWV_FLOW_TREE_STATE$PK" PRIMARY KEY ("ID", "TREE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_AUTO_FILE_DELETE_LOG" ADD CONSTRAINT "WWV_FLOW_AUTO_FILE_DEL_LOG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOG_NUMBERS" ADD CONSTRAINT "WWV_FLOW_LOG_NUMBER_CK1" CHECK (current_log_number in (1,2)) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOG_NUMBERS" ADD CONSTRAINT "WWV_FLOW_LOG_NUMBERS_CK2" CHECK (log_switch_after_days between 1 and 180) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOG_NUMBERS" ADD CONSTRAINT "WWV_FLOW_LOG_NUMBERS_CK3" CHECK (log_name in ('ACCESS','ACTIVITY','CLICKTHRU','DEBUG')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_LOG_NUMBERS" ADD CONSTRAINT "WWV_FLOW_LOG_NUMBERS_CK4" CHECK (trunc(abs(log_switch_after_days)) = log_switch_after_days) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_PKG_APP_CATS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_PKG_APP_CATS_UK1" UNIQUE ("CATEGORY_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_UNLOCK_OK_CK" CHECK (unlock_allowed in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_CC1" CHECK (app_status in ('AVAILABLE','COMING_SOON','HIDDEN')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_UK1" UNIQUE ("APEX_APPLICATION_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_UK2" UNIQUE ("ROW_KEY")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_UK3" UNIQUE ("APEX_WEBSHEET_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_IMAGES" ADD CONSTRAINT "WWV_FLOW_PKG_APP_IMAGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_MAP" ADD CONSTRAINT "WWV_FLOW_PKG_APP_LOCKED_CK" CHECK (application_locked in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_MAP" ADD CONSTRAINT "WWV_FLOW_PKG_APP_MAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_INSTALL_LOG" ADD CONSTRAINT "WWV_FLOW_PAI_LOG_TYPE_CK" CHECK (log_type in (
                            'INFORMATION',
                            'SUCCESS',
                            'WARNING',
                            'ERROR')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_INSTALL_LOG" ADD CONSTRAINT "WWV_FLOW_PAI_LOG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_INSTALL_LOG" ADD CONSTRAINT "WWV_FLOW_PAI_LOG_APP_TYPE_CK" CHECK (app_type in (
                            'DATABASE',
                            'WEBSHEET')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PRIVILEGES" ADD CONSTRAINT "WWV_FLOW_RT$PRIVS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PRIVILEGE_GROUPS" ADD CONSTRAINT "WWV_FLOW_RT$PRIV_GROUPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$MODULES" ADD CONSTRAINT "WWV_FLOW_RT$MODULES_STATUS_CK" CHECK (status in ('PUBLISHED','NOT_PUBLISHED')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$MODULES" ADD CONSTRAINT "WWV_FLOW_RT$MODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$TEMPLATES" ADD CONSTRAINT "WWV_FLOW_RT$TEMPS_PRIORITY_CK" CHECK (priority between 0 and 9) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$TEMPLATES" ADD CONSTRAINT "WWV_FLOW_RT$TEMPS_ETAG_CK" CHECK (etag_type in ('HASH', 'QUERY','NONE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$TEMPLATES" ADD CONSTRAINT "WWV_FLOW_RT$TEMPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_ST_CK" CHECK (source_type in ('QUERY' , 'QUERY_1_ROW', 'FEED' , 'PLSQL' , 'MEDIA')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_FT_CK" CHECK (format in ('CSV','DEFAULT')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_MD_CK" CHECK (method in ('PUT', 'GET', 'POST', 'DELETE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_RH_CK" CHECK (require_https in ('YES', 'NO')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PARAMETERS" ADD CONSTRAINT "WWV_FLOW_RT$PARAMS_ST_CK" CHECK ( source_type in ( 'URI','HEADER','RESPONSE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PARAMETERS" ADD CONSTRAINT "WWV_FLOW_RT$PARAMS_AM_CK" CHECK ( access_method in ( 'IN','OUT','INOUT') ) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PARAMETERS" ADD CONSTRAINT "WWV_FLOW_RT$PARAMS_PT_CK" CHECK (param_type in ( 'STRING','INT','DOUBLE','BOOLEAN','LONG','TIMESTAMP')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PARAMETERS" ADD CONSTRAINT "WWV_FLOW_RT$PARAMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENTS" ADD CONSTRAINT "WWV_FLOW_RT$CLIENTS_AF_CK" CHECK (auth_flow in ('AUTH_CODE','IMPLICIT','PASSWORD','CLIENT_CRED','EXCHANGE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENTS" ADD CONSTRAINT "WWV_FLOW_RT$CLIENTS_RT_CK" CHECK (response_type in ( 'CODE','TOKEN')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENTS" ADD CONSTRAINT "WWV_FLOW_RT$CLIENTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENT_PRIVILEGES" ADD CONSTRAINT "WWV_FLOW_RT$CLIENT_PRIVS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$APPROVALS_ST_CK" CHECK (status in ( 'PENDING','APPROVED','DENIED')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$APPROVALS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PENDING_APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$PEND_APPRV_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PENDING_APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$PEND_APPRV_UNIQUE1" UNIQUE ("APPROVAL_ID", "CLIENT_STATE")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVAL_PRIVS" ADD CONSTRAINT "WWV_FLOW_RT$APP_PRIVS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$USER_SESSIONS" ADD CONSTRAINT "WWV_FLOW_RT$USER_SESS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$ERRORS" ADD CONSTRAINT "WWV_FLOW_RT$ERRORS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_COLUMN_EXCEPTIONS" ADD CONSTRAINT "COL_EXCEPTIONS_PK" PRIMARY KEY ("TABLE_NAME", "COLUMN_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_SERICE_MOD" ADD CONSTRAINT "WWV_FLOW_CK_SERVICE_NAME" CHECK (service_name in (
                                 'NEW_SCHEMA',
                                 'REMOVE_EXISTING_SERVICE',
                                 'REMOVE_EXISTING_SCHEMA',
                                 'CHANGE_DB_SIZE',
                                 'CHANGE_COMPANY_NAME',
                                 'CHANGE_END_SERVICE_DATE',
                                 'CHANGE_ADMIN_EMAIL',
                                 'CHANGE_ADMIN_NAME',
                                 'CHANGE_COMPANY_ADDRESS',
                                 'CHANGE_MAX_END_USERS',
                                 'CHANGE_MAX_PG_VIEWS_DAY')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_SERICE_MOD" ADD CONSTRAINT "WWV_FLOW_CK_PROV_SMOD_STATUS" CHECK (request_status in (
                                 'IN_PROGRESS',
                                 'REQUESTED',
                                 'DECLINED',
                                 'APPROVED')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_SERICE_MOD" ADD CONSTRAINT "WWV_FLOWPK_PROV_SERVICE_MOD" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROV_SIGNUP_Q" ADD CONSTRAINT "WWV_FLOW_PROV_SIGNUP_AE" CHECK (agreement_enabled_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PROV_SIGNUP_Q" ADD CONSTRAINT "WWV_FLOW_PROV_SIGNUP_SE" CHECK (survey_enabled_yn in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PROV_SIGNUP_Q" ADD CONSTRAINT "PK_WWV_FLOW_PROV_SIGNUP_Q" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_COMPANY" ADD CHECK (oracle_partner in ('YES','NO')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_COMPANY" ADD CHECK (service_use_status in ('FULL_USE','TRIAL')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_COMPANY" ADD CONSTRAINT "CK_FLOW_PROV_PROJ_STATUS" CHECK (project_status in (
                                 'IN_PROGRESS',
                                 'REQUESTED',
                                 'ACCEPTED',
                                 'DECLINED',
                                 'APPROVED',
                                 'TERMINATION_IN_PROGRESS',
                                 'TERMINATION_IN_PROGRESS2',
                                 'TERMINATION_IN_PROGRESS3',
                                 'TERMINATION_IN_PROGRESS4',
                                 'TERMINATION_IN_PROGRESS5',
                                 'TERMINATION_IN_PROGRESS6',
                                 'TERMINATED')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_COMPANY" ADD CONSTRAINT "PK_FLOW_PROV_PROJECT_ID" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROVISION_AGREEMENT" ADD CONSTRAINT "PK_FLOW_PROV_AGREE_ID" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PICK_PAGE_VIEWS" ADD CONSTRAINT "WWV_FLOW_PICK_P_VS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PICK_END_USERS" ADD CONSTRAINT "WWV_FLOW_PICK_E_USR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PICK_DATABASE_SIZE" ADD CONSTRAINT "WWV_FLOW_PICK_DB_SIZE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSPACE_REQ_SIZE" ADD CONSTRAINT "WWV_FLOW_WKSP_REQUEST_TYPE" CHECK (request_type in ('N','C')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSPACE_REQ_SIZE" ADD CONSTRAINT "WWV_FLOW_WKSP_REQ_SIZE_DISPLAY" CHECK (display in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSPACE_REQ_SIZE" ADD CONSTRAINT "WWV_FLOW_WKSP_REQ_SIZE_DEFAULT" CHECK (default_size in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSPACE_REQ_SIZE" ADD CONSTRAINT "WWV_FLOW_WORKSPACE_REQ_SIZE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANY_TYPES" ADD CONSTRAINT "WWV_FLOW_COMPANY_TYPES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COUNTRIES" ADD PRIMARY KEY ("COUNTRY_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DATA_LOAD_UNLOAD" ADD CONSTRAINT "VALID_FLOW_DATA_TYPE" CHECK (data_type in (
                                  'XML IMPORT',
                                  'XML EXPORT',
                                  'ASCII EXPORT',
                                  'ASCII IMPORT',
                                  'EXCEL IMPORT')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DATA_LOAD_UNLOAD" ADD CONSTRAINT "WWV_FLOW_DATA_LOAD_UNLOAD_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$_ACL" ADD CONSTRAINT "APEX$_ACL_PRIV_CK" CHECK (priv in ('R','C','A')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_ACL" ADD CONSTRAINT "APEX$_ACL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_WEBPG_SECTIONS" ADD CONSTRAINT "APEX$_WS_WEBPG_SECTION_TYPE_CK" CHECK (section_type in ('TEXT','DATA','CHART','NAV_PAGE','NAV_SECTION','PLSQL')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_WEBPG_SECTIONS" ADD CONSTRAINT "APEX$_WS_WEBPG_SECTION_LINK_CK" CHECK (nav_include_link in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_WEBPG_SECTIONS" ADD CONSTRAINT "APEX$_WS_WEBPG_SECTION_AR_CK" CHECK (show_add_row in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_WEBPG_SECTIONS" ADD CONSTRAINT "APEX$_WS_WEBPG_SECTION_ER_CK" CHECK (show_edit_row in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_WEBPG_SECTIONS" ADD CONSTRAINT "APEX$_WS_WEBPG_SECTION_SER_CK" CHECK (show_search in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_WEBPG_SECTIONS" ADD CONSTRAINT "APEX$_WS_WEBPG_SECTION_3D_CK" CHECK (chart_3d in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_WEBPG_SECTIONS" ADD CONSTRAINT "APEX$_WS_WEBPG_SECTIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_ROWS" ADD CONSTRAINT "APEX$_WS_ROWS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_NOTES" ADD CONSTRAINT "APEX$_WS_NOTES_CL_CK" CHECK (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_NOTES" ADD CONSTRAINT "APEX$_WS_NOTES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_LINKS" ADD CONSTRAINT "APEX$_WS_LINKS_CL_CK" CHECK (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_LINKS" ADD CONSTRAINT "APEX$_WS_LINKS_SH_CK" CHECK (show_on_homepage in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_LINKS" ADD CONSTRAINT "APEX$_WS_LINKS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_TAGS" ADD CONSTRAINT "APEX$_WS_TAGS_CL_CK" CHECK (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_TAGS" ADD CONSTRAINT "APEX$_WS_TAGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_FILES" ADD CONSTRAINT "APEX$_WS_FILES_CL_CK" CHECK (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE')) ENABLE;
ALTER TABLE "APEX_040200"."APEX$_WS_FILES" ADD CONSTRAINT "APEX$_WS_FILES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$ARCHIVE_HEADER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$ARCHIVE_CONTENTS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$ARCHIVE_HISTORY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$ARCHIVE_LOG" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."APEX$ARCHIVE_PREF" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_NEWS" ADD CONSTRAINT "WWV_NEWS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LINKS" ADD CONSTRAINT "WWV_FLOW_LINKS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BUGS" ADD CONSTRAINT "WWV_FLOW_BUG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_EVENTS" ADD CONSTRAINT "WWV_FLOW_EVENTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURES" ADD CONSTRAINT "WWV_FLOW_FEATURES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURE_HISTORY" ADD CONSTRAINT "WWV_FLOW_FEATURE_HIST_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURE_PROGRESS" ADD CONSTRAINT "WWV_FLOW_FEATURE_PROG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TASKS" ADD CONSTRAINT "WWV_FLOW_TASKS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TASK_PROGRESS" ADD CONSTRAINT "WWV_FLOW_TASKS_PROG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TASK_DEFAULTS" ADD CONSTRAINT "WWV_FLOW_TASKS_DEF_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAMDEV_TAG_CLOUD" ADD CONSTRAINT "WWV_FLOW_TEAMDEV_TC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILE_TP" CHECK (file_type in ('FEATURE','TODO','BUG','MILESTONE','FEEDBACK')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECTS" ADD CONSTRAINT "VALID_MIG_TYPE" CHECK (migration_type in ('access','forms')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_PROJECTS" ADD CONSTRAINT "WWV_MIG_PROJ_APP_FLAG" CHECK (app_flag in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_PROJECTS" ADD CONSTRAINT "WWV_MIG_PROJ_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECTS" ADD CONSTRAINT "WWV_MIG_PROJ_UK1" UNIQUE ("MIGRATION_NAME", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACCESS" ADD CONSTRAINT "WWV_MIG_ACCESS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACCESS" ADD UNIQUE ("DBID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACCESS" ADD CONSTRAINT "WWV_MIG_ACCESS_UK1" UNIQUE ("PROJECT_ID", "DBID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_EXPORTER" ADD CONSTRAINT "WWV_MIG_EXPORTER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS" ADD CONSTRAINT "WWV_MIG_ACC_FORM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS" ADD CONSTRAINT "WWV_MIG_ACC_FORMS_UK1" UNIQUE ("PROJECT_ID", "DBID", "FORMID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS_CONTROLS" ADD CONSTRAINT "WWV_MIG_FRMS_CTL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS_MODULES" ADD CONSTRAINT "WWV_MIG_ACC_FRM_MDL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS_PERM" ADD CONSTRAINT "WWV_MIG_ACC_FORM_PERM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_REPORTS" ADD CONSTRAINT "WWV_MIG_ACC_REPORTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_REPORTS" ADD CONSTRAINT "WWV_MIG_ACC_REPORTS_UK1" UNIQUE ("PROJECT_ID", "DBID", "REPORTID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RPTS_CONTROLS" ADD CONSTRAINT "WWV_FLOW_REP_CTL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RPTS_MODULES" ADD CONSTRAINT "WWV_MIG_ACC_REP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RPT_PERMS" ADD CONSTRAINT "WWV_MIG_ACC_REP_PERM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_TABLES" ADD CONSTRAINT "WWV_FLOW_ACC_TBL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_TABLES" ADD CONSTRAINT "WWV_MIG_ACC_TABLES_UK1" UNIQUE ("PROJECT_ID", "DBID", "TBLID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_COLUMNS" ADD CONSTRAINT "WWV_MIG_ACC_COL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_INDEXES" ADD CONSTRAINT "WWV_MIG_ACC_IDX_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_INDEXES" ADD CONSTRAINT "WWV_MIG_ACC_INDEXES_UK1" UNIQUE ("PROJECT_ID", "DBID", "TBLID", "INDID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_INDEXES_COLS" ADD CONSTRAINT "WWV_MIG_ACC_IDX_COL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_TAB_PERM" ADD CONSTRAINT "WWV_MIG_ACC_TAB_PERM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_QUERIES" ADD CONSTRAINT "WWV_MIG_ACC_TAB_QRY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_QUERIES" ADD CONSTRAINT "WWV_MIG_ACC_QRY_UK1" UNIQUE ("PROJECT_ID", "DBID", "QRYID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RELATIONS" ADD CONSTRAINT "WWV_MIG_ACC_TAB_REL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RELATIONS" ADD CONSTRAINT "WWV_MIG_ACC_RELATIONS_UK1" UNIQUE ("PROJECT_ID", "DBID", "RELID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RELATION_COLS" ADD CONSTRAINT "WWV_MIG_ACC_RELCOL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_USERS" ADD CONSTRAINT "WWV_MIG_ACC_USERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_USERS" ADD CONSTRAINT "WWV_MIG_ACC_USERS_UK1" UNIQUE ("PROJECT_ID", "DBID", "USERID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_GROUPS" ADD CONSTRAINT "WWV_MIG_ACC_GROUPS_UK1" UNIQUE ("PROJECT_ID", "DBID", "GROUPID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_GROUPS" ADD CONSTRAINT "WWV_MIG_ACC_GROUPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_GRPSMEMBERS" ADD CONSTRAINT "WWV_MIG_ACCGRPMBR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_MODULES" ADD CONSTRAINT "WWV_MIG_ACC_MODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_MODULES" ADD CONSTRAINT "WWV_MIG_ACC_MODULES_UK1" UNIQUE ("PROJECT_ID", "DBID", "MODULEID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_MODULES_PERM" ADD CONSTRAINT "WWV_MIG_ACC_MDL_PERM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_PAGES" ADD CONSTRAINT "WWV_MIG_ACC_PAGE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_TABLES" ADD CONSTRAINT "WWV_FLOW_REV_TBL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_QUERIES" ADD CONSTRAINT "WWV_FLOW_REV_QRY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_REPORTS" ADD CONSTRAINT "WWV_FLOW_REV_RPT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_FORMS" ADD CONSTRAINT "WWV_FLOW_REV_FRM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_APEXAPP" ADD CONSTRAINT "WWV_FLOW_REV_APEX_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_GENERATED_APPLICATIONS" ADD CONSTRAINT "WWV_MIG_GEN_APP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_FRM_XMLTAGTABLEMAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_FRM_XTTM_TABLE_NAME_UK" UNIQUE ("TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_RPT_XMLTAGTABLEMAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_RPT_XTTM_TABLE_NAME_UK" UNIQUE ("TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_COMPONENTS" ADD CONSTRAINT "WWV_MIG_PROJ_COMP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_COMPONENTS" ADD CONSTRAINT "WWV_MIG_PROJ_COMP_UK1" UNIQUE ("ID", "PROJECT_ID", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_TRIGGERS" ADD CONSTRAINT "WWV_MIG_PROJ_TRIG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_TRIGGERS" ADD CONSTRAINT "WWV_MIG_PROJ_TRIG_UK1" UNIQUE ("ID", "PROJECT_ID", "SECURITY_GROUP_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FORMS" ADD CONSTRAINT "WWV_MIG_FRM_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FORMS" ADD CONSTRAINT "WWV_MIG_FORMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FORMS" ADD CONSTRAINT "WWV_MIG_FORMS_UK" UNIQUE ("FILE_NAME", "PROJECT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PLSQL_LIBS" ADD CONSTRAINT "WWV_MIG_PLL_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_PLSQL_LIBS" ADD CONSTRAINT "WWV_MIG_PLLS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PLSQL_LIBS" ADD CONSTRAINT "WWV_MIG_PLLS_UK" UNIQUE ("FILE_NAME", "PROJECT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULES" ADD CONSTRAINT "WWV_MIG_FRM_MDL_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULES" ADD CONSTRAINT "WWV_MIG_FRM_MODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_FRMMDL_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_FORMMODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ATTACHEDLIBRARY" ADD CONSTRAINT "WWV_MIG_FRM_ATLIB_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ATTACHEDLIBRARY" ADD CONSTRAINT "WWV_MIG_FRM_ATTACHEDLIBRARY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULEPARAMETER" ADD CONSTRAINT "WWV_MIG_FRM_MP_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULEPARAMETER" ADD CONSTRAINT "WWV_MIG_FRM_MODULEPARAMETER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU" ADD CONSTRAINT "WWV_MIG_FRM_MENU_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU" ADD CONSTRAINT "WWV_MIG_FRM_MENU_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_FMB_MENUITEM_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_FMB_MENU_MENUITEM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_FMB_MNUITMRL_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_FRM_FMB_MNUITM_ROLE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REPORT" ADD CONSTRAINT "WWV_MIG_FRM_REPORT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REPORT" ADD CONSTRAINT "WWV_MIG_FRM_REPORT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_FRM_OBJGP_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_FRM_OBJECTGROUP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUPCHILD" ADD CONSTRAINT "WWV_MIG_FRM_OBJGPC_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUPCHILD" ADD CONSTRAINT "WWV_MIG_FRM_OBJGROUPCHILD_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_COORDINATES" ADD CONSTRAINT "WWV_MIG_FRM_CRDNT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_COORDINATES" ADD CONSTRAINT "WWV_MIG_FRM_COORDINATES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ALERTS" ADD CONSTRAINT "WWV_MIG_FRM_ALERTS_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ALERTS" ADD CONSTRAINT "WWV_MIG_FRM_ALERTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_TRG_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_TRG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLOCKS" ADD CONSTRAINT "USE_QUERY_OPTION" CHECK (use_query in ('CUSTOM', 'ENHANCED','ORIGINAL','NONE')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_BLOCKS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_BI_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_ITEMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BITRG_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_ITEM_TRG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_FRM_BIL_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_FRM_BLK_ITEM_LIE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_RADIO" ADD CONSTRAINT "WWV_MIG_FRM_BIR_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_RADIO" ADD CONSTRAINT "WWV_MIG_FRM_BLK_ITEM_RADIO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSA" ADD CONSTRAINT "WWV_MIG_FRM_BLKDSA_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSA" ADD CONSTRAINT "WWV_MIG_FRM_BLK_DSA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSC" ADD CONSTRAINT "WWV_MIG_FRM_BLKDSC_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSC" ADD CONSTRAINT "WWV_MIG_FRM_BLK_DSC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BLKTRG_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_TRG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_RELATIONS" ADD CONSTRAINT "WWV_MIG_FRM_BLKREL_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_RELATIONS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_REL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CANVAS" ADD CONSTRAINT "WWV_MIG_FRM_CNVS_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CANVAS" ADD CONSTRAINT "WWV_MIG_FRM_CANVAS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_FRM_CNVGRP_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_FRM_CNVS_GRAPHICS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_FRM_CPDTXT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_FRM_CNVG_CPDTXT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CPDTXT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_FRM_TXTSGT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CPDTXT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_FRM_CPDTXT_TXTSEGMT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_TABPAGE" ADD CONSTRAINT "WWV_MIG_FRM_CNVTP_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_TABPAGE" ADD CONSTRAINT "WWV_MIG_FRM_CNVS_TABPAGE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_EDITOR" ADD CONSTRAINT "WWV_MIG_FRM_EDTR_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_EDITOR" ADD CONSTRAINT "WWV_MIG_FRM_EDITOR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOV" ADD CONSTRAINT "WWV_MIG_FRM_LOV_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOV" ADD CONSTRAINT "WWV_MIG_FRM_LOV_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOVCOLUMNMAPPING" ADD CONSTRAINT "WWV_MIG_FRM_LCMP_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOVCOLUMNMAPPING" ADD CONSTRAINT "WWV_MIG_FRM_LOVCM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_FRM_PGUNT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_FRM_PROGRAMUNIT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_FRM_PPTCLS_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_FRM_PROPCLS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPS" ADD CONSTRAINT "WWV_MIG_FRM_RECGRP_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPS" ADD CONSTRAINT "WWV_MIG_FRM_RECGP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPCOLUMN" ADD CONSTRAINT "WWV_MIG_FRM_RGC_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPCOLUMN" ADD CONSTRAINT "WWV_MIG_FRM_RGC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_VISUALATTRIBUTES" ADD CONSTRAINT "WWV_MIG_FRM_VISAT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_VISUALATTRIBUTES" ADD CONSTRAINT "WWV_MIG_FRM_VISAT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_WINDOWS" ADD CONSTRAINT "WWV_MIG_FRM_WINDOW_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_WINDOWS" ADD CONSTRAINT "WWV_MIG_FRM_WINDOW_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_APEX_APP" ADD CONSTRAINT "WWV_MIG_FRM_REV_APEX_APP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_REV_FRMMDL_SEL" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_REV_FORMMODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BLK_SEL" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BLOCKS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BI_SEL" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BLK_ITEMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOV" ADD CONSTRAINT "WWV_MIG_FRM_LOV_SELECT" CHECK (select_for_app in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOV" ADD CONSTRAINT "WWV_MIG_FRM_REV_LOV_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOVCOLMAPS" ADD CONSTRAINT "WWV_MIG_FRM_LCM_SELECT" CHECK (select_for_app in ('Y','N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOVCOLMAPS" ADD CONSTRAINT "WWV_MIG_FRM_REV_LCM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPTS" ADD CONSTRAINT "WWV_MIG_RPTS_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPTS" ADD CONSTRAINT "WWV_MIG_RPTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPTS" ADD CONSTRAINT "WWV_MIG_RPTS_UK" UNIQUE ("FILE_NAME", "PROJECT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REPORT" ADD CONSTRAINT "WWV_MIG_REP_UNIT_MEASURE" CHECK (unitofmeasurement in ('inch','centimeter','point')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_REPORT" ADD CONSTRAINT "WWV_MIG_REP_DESIGNUNIT" CHECK (designincharacterunits in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_REPORT" ADD CONSTRAINT "WWV_MIG_REP_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_REPORT" ADD CONSTRAINT "WWV_MIG_REP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA" ADD CONSTRAINT "WWV_MIG_REPDATA_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA" ADD CONSTRAINT "WWV_MIG_REPDATA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC" ADD CONSTRAINT "WWV_MIG_REPSRC_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC" ADD CONSTRAINT "WWV_MIG_REPSRC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_SELECT" ADD CONSTRAINT "WWV_MIG_SELECT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_SELECT" ADD CONSTRAINT "WWV_MIG_SELECT_PARSE" CHECK (canparse in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_SELECT" ADD CONSTRAINT "WWV_MIG_SELECT_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ADD CONSTRAINT "WWV_MIG_GRP_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ADD CONSTRAINT "WWV_MIG_GRP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRP_ITEM_TYPE" CHECK (datatype in ('character','number',
                                                              'date','graphic',
                                                              'long','raw',
                                                              'longRaw','vchar2',
                                                              'vchar','rowid',
                                                              'mlabel','ref',
                                                              'object','collect',
                                                              'blob','clob',
                                                              'nclob','bfile','unknown' )) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRP_ITEM_READ" CHECK (readfromfile in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRP_FILEFORMAT" CHECK (fileformat in ('text','image',
                                                               'CGM','OracleDrawing',
                                                               'OracleImage','sound',
                                                               'video','OLE2','imageURL')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRP_BREAKORDER" CHECK (breakorder in ('none','ascending','descending')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRPITEM_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRP_DATAITEM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_DESC" ADD CONSTRAINT "WWV_MIG_GRP_ITEMDESC_TYPE" CHECK (datatype in('character','number',
                                                             'date','graphic',
                                                             'long','raw',
                                                             'longRaw','vchar2',
                                                             'vchar','rowid',
                                                             'mlabel','ref','object',
                                                             'collect','blob','clob',
                                                             'nclob','bfile','unknown')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_DESC" ADD CONSTRAINT "WWV_MIG_GRP_ITEMDESC_DESC" CHECK (refdescendant in('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_DESC" ADD CONSTRAINT "WWV_MIG_ITEMDESC_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_DESC" ADD CONSTRAINT "WWV_MIG_GRP_ITEMDESC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_PRIV" ADD CONSTRAINT "WWV_MIG_RPT_GRP_ITEMPRIV_REF" CHECK (refexpanded in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_PRIV" ADD CONSTRAINT "WWV_MIG_RPT_GRP_ITEMPRIV_DIS" CHECK (displaywithparentcolumn in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_PRIV" ADD CONSTRAINT "WWV_MIG_ITEMPRIV_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_PRIV" ADD CONSTRAINT "WWV_MIG_GRP_ITEMPRIV_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_SUMMARY" ADD CONSTRAINT "WWV_MIG_GRP_SUM_FUNC" CHECK (function in ('sum','average','median',
                                                              'minimum','maximum','count',
                                                              'first','last','percentOfTotal',
                                                              'percentile','stdDeviation','variance')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_SUMMARY" ADD CONSTRAINT "WWV_MIG_GRP_SUM_READ" CHECK (readfromfile in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_SUMMARY" ADD CONSTRAINT "WWV_MIG_GRP_SUM_FORMAT" CHECK (fileformat in ('text','image','CGM',
                                                                'OracleDrawing','OracleImage',
                                                                'sound','video','OLE2','imageURL')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_SUMMARY" ADD CONSTRAINT "WWV_MIG_GRPSUM_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_SUMMARY" ADD CONSTRAINT "WWV_MIG_GRP_SUM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FORM_TYPE" CHECK (datatype in ('number','character','date')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FORM_BRK" CHECK (breakorder in ('none','ascending','descending')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FORM_FLE" CHECK (readfromfile in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FORM_FMT" CHECK (fileformat in ('text','image','CGM',
                                                                'OracleDrawing','OracleImage',
                                                                'sound','video','OLE2','imageURL')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_RPT_GRP_TEMP" CHECK (templatesection in ('none','header','main','trailer')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_GRPFORM_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_GRP_FORM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_ROWDELIM" ADD CONSTRAINT "WWV_MIG_GRPROW_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_ROWDELIM" ADD CONSTRAINT "WWV_MIG_GRP_ROW_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FILTER" ADD CONSTRAINT "WWV_MIG_GRP_FLTR_TYPE" CHECK (type in ('plsql','first','last')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FILTER" ADD CONSTRAINT "WWV_MIG_FLTR_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FILTER" ADD CONSTRAINT "WWV_MIG_GRP_FLTR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FLD_VIS" CHECK (visible in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FLD_BRK" CHECK (breakorder in ('none','ascending','descending')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FLD_ST" CHECK (fontstyle in ('regular','italic','bold','boldItalic')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FLD_EF" CHECK (fonteffect in ('regular','strikeout','underline','strikeoutUnderline')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FLD_ALIGN" CHECK (alignment in ('start','left','center','right','end','flush')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_RPT_GRP_FLD_TEMP" CHECK (templatesection in ('none','header','main','trailer')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_FLD_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_GRP_FLD_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA_SUMMARY" ADD CONSTRAINT "WWV_MIG_REPSUM_FUNC" CHECK (function in ('sum','average','median',
                                                              'minimum','maximum','count',
                                                              'first','last','percentOfTotal',
                                                              'percentile','stdDeviation','variance')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA_SUMMARY" ADD CONSTRAINT "WWV_MIG_REPSUM_READ" CHECK (readfromfile in ('yes','no')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA_SUMMARY" ADD CONSTRAINT "WWV_MIG_REPSUM_FORMAT" CHECK (fileformat in ('text','image','CGM',
                                                                'OracleDrawing','OracleImage',
                                                                'sound','video','OLE2','imageURL')) ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA_SUMMARY" ADD CONSTRAINT "WWV_MIG_REPSUM_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA_SUMMARY" ADD CONSTRAINT "WWV_MIG_REPSUM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_REPORTPRIVATE" ADD CONSTRAINT "WWV_MIG_RPTPRIV_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_RPT_REPORTPRIVATE" ADD CONSTRAINT "WWV_MIG_RPTPRIV_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS" ADD CONSTRAINT "WWV_MIG_MNU_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS" ADD CONSTRAINT "WWV_MIG_MENUS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS" ADD CONSTRAINT "WWV_MIG_MENUS_UK" UNIQUE ("FILE_NAME", "PROJECT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MODULES" ADD CONSTRAINT "WWV_MIG_MNU_MDL_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MODULES" ADD CONSTRAINT "WWV_MIG_MNU_MODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MENUMODULES" ADD CONSTRAINT "WWV_MIG_MNU_MNUMDL_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MENUMODULES" ADD CONSTRAINT "WWV_MIG_MNU_MNUMODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUSMODULEROLES" ADD CONSTRAINT "WWV_MIG_MMODROLE_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUSMODULEROLES" ADD CONSTRAINT "WWV_MIG_MMODROLE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU" ADD CONSTRAINT "WWV_MIG_MNU_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU" ADD CONSTRAINT "WWV_MIG_MNU_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_MNUITEM_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_MNUITEM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_MNUITEMRL_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_MNUITEMROLE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_MNUPU_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_MNUPROGUNIT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_MENU_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_MENU_XMLTAGTABLEMAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_MENU_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_MNU_TABLE_NAME_UK" UNIQUE ("TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OLB_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_OLB_XMLTAGTABLEMAP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OLB_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_OLB_XTTM_TABLE_NAME_UK" UNIQUE ("TABLE_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB" ADD CONSTRAINT "WWV_MIG_OLB_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB" ADD CONSTRAINT "WWV_MIG_OLB_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB" ADD CONSTRAINT "WWV_MIG_OLB_UK" UNIQUE ("FILE_NAME", "PROJECT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_MODULES" ADD CONSTRAINT "WWV_MIG_OLB_MDL_SELECT_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_MODULES" ADD CONSTRAINT "WWV_MIG_OLB_MODULES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ADD CONSTRAINT "WWV_MIG_OLB_OBJLIB_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ADD CONSTRAINT "WWV_MIG_OLB_OBJECTLIBRARY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ADD CONSTRAINT "WWV_MIG_OLB_OLT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ADD CONSTRAINT "WWV_MIG_OLB_OBJLIBTAB_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_BLOCK_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_BLOCK_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_CANVAS_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_CANVAS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_OLB_PU_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_OLB_PROGRAMUNIT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_OLB_PC_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_OLB_PROPERTYCLASS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_VISUALATTRIBUTE" ADD CONSTRAINT "WWV_MIG_OLB_VA_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_VISUALATTRIBUTE" ADD CONSTRAINT "WWV_MIG_OLB_VISUALATTRIBUTE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_WINDOW_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_WINDOW_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ALERT" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ALRT_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ALERT" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ALERT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_T_BLOCK_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_T_BLOCK_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_T_CANVAS_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_CANVAS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_GRPHCS_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_GRAPHICS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ITEM_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ITEM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MENU_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MENU_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_OLB_T_OBJGRP_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_OLB_OLT_OBJGRP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_REPORT" ADD CONSTRAINT "WWV_MIG_OLB_T_REPORT_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_REPORT" ADD CONSTRAINT "WWV_MIG_OLB_OLT_REPORT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPAGE" ADD CONSTRAINT "WWV_MIG_OLB_T_TABPAG_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPAGE" ADD CONSTRAINT "WWV_MIG_OLB_OLT_TABPAGE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_VISUALATTRBUTE" ADD CONSTRAINT "WWV_MIG_OLB_OLT_VA_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_VISUALATTRBUTE" ADD CONSTRAINT "WWV_MIG_OLB_OLT_VA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_OLT_WNDW_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_OLT_WINDOW_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_BLK_ITEM_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_BLK_ITEM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_OLB_BIL_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_OLB_BLK_ITM_LIE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BIT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BLK_ITM_TRG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_DATASOURCECOL" ADD CONSTRAINT "WWV_MIG_OLB_BLK_DSC_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_DATASOURCECOL" ADD CONSTRAINT "WWV_MIG_OLB_BLK_DSC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BLK_TRGR_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BLK_TRIGGER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_CG_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_CNVS_GRAPHICS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BI_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BLK_ITEM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_CG_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_CNVS_GRAPHICS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MMI_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MENU_MITEM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OB_OBJGRPCHILD" ADD CONSTRAINT "WWV_MIG_OLB_OLT_OB_OGCHILD_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OB_OBJGRPCHILD" ADD CONSTRAINT "WWV_MIG_OLB_OGC_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_TPG_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_TABPG_GRPHS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_G_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_G_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_G_GRAPHICS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_CT_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_CPDTXT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGCTTS_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_CT_TSGT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGG_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_GRAPHCS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGG_CT_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGG_CPDTXT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGCTTS_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGG_CT_TST_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGG_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGG_GRPHCS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGCT_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGGG_CT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CT_TXSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGCTTS_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CT_TXSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGCT_TXSGT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGG_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGGG_GRPHS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGGCT_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGGGG_CT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CT_TXST" ADD CONSTRAINT "WWV_MIG_OLB_TTP5GCTTS_SFA" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CT_TXST" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGGCT_TXST_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM_TRIGR" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BIT_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM_TRIGR" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BLK_ITM_TRG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_OLB_CG_CT_SEL_FOR_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_OLB_CG_COMPOUNDTEXT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_CT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_OLB_CG_CT_TS_SEL_F_APP" CHECK (select_for_app in ('Y', 'N')) ENABLE;
ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_CT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_OLB_CG_CT_TXTSEGMNT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_DEMO_DEPT" ADD PRIMARY KEY ("DEPTNO")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_DEMO_EMP" ADD PRIMARY KEY ("EMPNO")
  USING INDEX  ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPANY_SCHEMAS" ADD CONSTRAINT "WWV_FLOW_COMP_SCHEMAS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLATFORM_PREFS" ADD CONSTRAINT "WWV_FLOW_PLATFORM_PREFS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_BASED_ON_FK" FOREIGN KEY ("BASED_ON_UI_TYPE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_UI_TYPES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPE_FEATURES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_FEATURE_FK1" FOREIGN KEY ("UI_TYPE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_UI_TYPES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_UI_TYPE_FEATURES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_FEATURE_FK2" FOREIGN KEY ("BUILDER_FEATURE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_BUILDER_FEATURES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_FK_AUTHENTICATION" FOREIGN KEY ("AUTHENTICATION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_AUTHENTICATIONS" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOWS" ADD CONSTRAINT "WWV_FLOWS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_APPLICATION_GROUPS" ADD CONSTRAINT "WWV_FLOW_APP_GROUPS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGES_RESERVED" ADD CONSTRAINT "WWV_FLOW_PAGES_RESERVED_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_APP_COMMENTS" ADD CONSTRAINT "WWV_FLOW_APP_COMMENTS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_USER_INTERFACES" ADD CONSTRAINT "WWV_FLOW_USER_INT_PAGE_FK" FOREIGN KEY ("FLOW_ID", "GLOBAL_PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_USER_INTERFACES" ADD CONSTRAINT "WWV_FLOW_UI_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_USER_INTERFACES" ADD CONSTRAINT "WWV_FLOW_UI_TYPE_FK" FOREIGN KEY ("UI_TYPE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_UI_TYPES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SECURITY_SCHEMES" ADD CONSTRAINT "WWV_FLOW_SEC_SCHEMES_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATE_PREFERENCES" ADD CONSTRAINT "WWV_FLOW_TEMPL_PREF_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BANNER" ADD CONSTRAINT "WWV_FLOW_BANNER_FK" FOREIGN KEY ("ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LANGUAGE_MAP" ADD CONSTRAINT "WWV_FLOW_LANG_FLOW_ID_FK" FOREIGN KEY ("PRIMARY_LANGUAGE_FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TRANSLATABLE_TEXT$" ADD CONSTRAINT "WWV_FLOW_TRANS_TEXT_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DYNAMIC_TRANSLATIONS$" ADD CONSTRAINT "WWV_FLOW_DYNAMIC_TRANS_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DYNAMIC_TRANSLATIONS$" ADD CONSTRAINT "WWV_FLOW_DYNAMIC_TRANS_FK1" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_CACHE" ADD CONSTRAINT "WWV_FLOW_PAGE_CACHE_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_CODE_CACHE" ADD CONSTRAINT "WWV_FLOW_PAGE_CODE_CACHE_FK" FOREIGN KEY ("PAGE_CACHE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_CACHE" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_TEMPLATES_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PAGE_TMPL_DP_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PAGE_TMPL_DP_PARENT_FK" FOREIGN KEY ("PAGE_TEMPLATE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_TEMPLATES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REQUIRED_ROLES" ADD CONSTRAINT "WWV_FLOW_REQ_ROLES_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FIELD_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_FIELD_TEMP_F_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ICON_BAR_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_ICONBARATTR_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ICON_BAR" ADD CONSTRAINT "WWV_FLOW_ICON_BAR_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PROCESSING" ADD CONSTRAINT "WWV_FLOW_PROCESSING_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ITEMS" ADD CONSTRAINT "WWV_FLOW_ITEMS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_VAL_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COMPUTATIONS" ADD CONSTRAINT "WWV_FLOW_COMPUTATIONS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TABS" ADD CONSTRAINT "WWV_FLOW_TABS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TOPLEVEL_TABS" ADD CONSTRAINT "WWV_FLOW_TOPLEV_TAB_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREES" ADD CONSTRAINT "WWV_FLOW_TREE_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LISTS_OF_VALUES$" ADD CONSTRAINT "WWV_FLOW_LOV_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_OF_VALUES_DATA" ADD CONSTRAINT "WWV_FLOW_LOV_DATA_FK" FOREIGN KEY ("LOV_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_LISTS_OF_VALUES$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FLOW_STEP_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEPS" ADD CONSTRAINT "WWV_FLOW_STEP_UI_FK" FOREIGN KEY ("USER_INTERFACE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_USER_INTERFACES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_FLOW_PLUG_TO_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_FLOW_PLUG_PARENT_FK" FOREIGN KEY ("PARENT_PLUG_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ADD CONSTRAINT "WWV_FLOW_PLUG_TO_PAGE_FK" FOREIGN KEY ("FLOW_ID", "PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_GENERIC_ATTR" ADD CONSTRAINT "WWV_FLOW_GENATTR_TO_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_REGIONS" ADD CONSTRAINT "WWV_FLOW_TREEREGION_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_REGIONS" ADD CONSTRAINT "WWV_FLOW_TREEREGION_FK2" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_STEP_BUTTONS_FK1" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_STEP_BUTTONS_PLUG_FK" FOREIGN KEY ("BUTTON_PLUG_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BUTTONS" ADD CONSTRAINT "WWV_FLOW_STEP_BUTTONS_FK2" FOREIGN KEY ("FLOW_ID", "FLOW_STEP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCHES" ADD CONSTRAINT "WWV_FLOW_STEP_BRANCHES_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCHES" ADD CONSTRAINT "WWV_FLOW_STEP_BRANCHES_FK2" FOREIGN KEY ("FLOW_ID", "FLOW_STEP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_BRANCH_ARGS" ADD CONSTRAINT "WWV_FLOW_STEP_BRANCH_ARGS_FK" FOREIGN KEY ("FLOW_STEP_BRANCH_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEP_BRANCHES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_FLOW_STEP_ITEMS_FK2" FOREIGN KEY ("FLOW_ID", "FLOW_STEP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_FLOW_STEP_ITEMS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEMS" ADD CONSTRAINT "WWV_FLOW_STEP_ITEMS_PLUG_FK" FOREIGN KEY ("ITEM_PLUG_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEM_HELP" ADD CONSTRAINT "WWV_FLOW_PAGE_HELPTEXT_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_ITEM_HELP" ADD CONSTRAINT "WWV_FLOW_ITEM_HELPTEXT_FK" FOREIGN KEY ("FLOW_ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEP_ITEMS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS" ADD CONSTRAINT "WWV_FLOW_STEP_COMP_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS" ADD CONSTRAINT "WWV_FLOW_STEP_COMP_FK2" FOREIGN KEY ("FLOW_ID", "FLOW_STEP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_STEP_VAL_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_STEP_VAL_TO_REG_FK" FOREIGN KEY ("TABULAR_FORM_REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_STEP_VAL_FK2" FOREIGN KEY ("FLOW_ID", "FLOW_STEP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_FLOW_STEP_PROC_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_FLOW_STEP_PROC_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ADD CONSTRAINT "WWV_FLOW_STEP_PROC_FK2" FOREIGN KEY ("FLOW_ID", "FLOW_STEP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BUTTON_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_BUTTONT_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_FIELD_FK" FOREIGN KEY ("DEFAULT_FIELD_TEMPLATE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FIELD_TEMPLATES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_REQ_FLD_FK" FOREIGN KEY ("DEFAULT_REQ_FIELD_TEMPLATE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FIELD_TEMPLATES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_PLUG_TEMP_BUTTON_FK" FOREIGN KEY ("DEFAULT_BUTTON_TEMPLATE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_BUTTON_TEMPLATES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUG_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PLUG_TMPL_DP_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUG_TMPL_DISP_POINTS" ADD CONSTRAINT "WWV_PLUG_TMPL_DP_PARENT_FK" FOREIGN KEY ("PLUG_TEMPLATE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPLATES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ROW_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_ROW_TEMPLATE_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_LIST_TEMPLATE_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_CAL_TO_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_PLUG_CALENDAR_FK" FOREIGN KEY ("PLUG_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CALS" ADD CONSTRAINT "WWV_FLOW_STEP_PROCESS_FK" FOREIGN KEY ("DRAG_DROP_PROCESS_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ("ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CAL_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_CAL_TEMPL_TO_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEMES" ADD CONSTRAINT "WWV_FLOW_THEMES_2F_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEMES" ADD CONSTRAINT "WWV_FLOW_THEME_UI_TYPE_FK" FOREIGN KEY ("UI_TYPE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_UI_TYPES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_STYLES" ADD CONSTRAINT "WWV_FLOW_THEME_STYLE_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_THEME_DISPLAY_POINTS" ADD CONSTRAINT "WWV_THEME_DISP_POINT_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DATA" ADD CONSTRAINT "WWV_FLOW_DATA_SESSION_FK" FOREIGN KEY ("FLOW_INSTANCE")
	  REFERENCES "APEX_040200"."WWV_FLOW_SESSIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PREFERENCES$" ADD CONSTRAINT "WWV_FLOW_PREFS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MESSAGES$" ADD CONSTRAINT "WWV_FLOW_MESSAGES_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PATCHES" ADD CONSTRAINT "WWV_FLOW_PATCHES_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER" ADD CONSTRAINT "WWV_FLOW_FND_USER_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DEVELOPERS" ADD CONSTRAINT "WWV_FLOW_DEV_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FND_USER" ("USER_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DEVELOPERS" ADD CONSTRAINT "WWV_FLOW_DEV_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LISTS" ADD CONSTRAINT "WWV_FLOW_LISTS_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "WWV_FLOW_LIST_ITEMS_FK" FOREIGN KEY ("LIST_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_LISTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LIST_ITEMS" ADD CONSTRAINT "PARENT_LIST_ITEM_FK" FOREIGN KEY ("PARENT_LIST_ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_LIST_ITEMS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QUERIES" ADD CONSTRAINT "WWV_FLOW_SHDQRY_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QRY_SQL_STMTS" ADD CONSTRAINT "WWV_FLOW_SQRY_SQL_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_QRY_SQL_STMTS" ADD CONSTRAINT "WWV_FLOW_SQRY_SQL_SQRY_FK" FOREIGN KEY ("SHARED_QUERY_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SHARED_QUERIES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_IMAGE_REPOSITORY" ADD CONSTRAINT "WWV_FLOW_IMG_REP_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CSS_REPOSITORY" ADD CONSTRAINT "WWV_FLOW_CSS_REP_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HTML_REPOSITORY" ADD CONSTRAINT "WWV_FLOW_HTML_REP_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_EFFECTIVE_USERID_MAP" ADD CONSTRAINT "WWV_FLOW_EFF_USR_MAP_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHORTCUTS" ADD CONSTRAINT "WWV_FLOW_SHORTCUTS_TO_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MAIL_ATTACHMENTS" ADD CONSTRAINT "WWV_FLOW_MAIL_ATTACHMENTS_FK1" FOREIGN KEY ("MAIL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_MAIL_QUEUE" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_BINDS" ADD CONSTRAINT "WWV_FLOW_SW_BIND_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_BINDS" ADD CONSTRAINT "WWV_FLOW_SW_BIND_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_RESULTS" ADD CONSTRAINT "WWV_FLOW_SW_RESULT_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_RESULTS" ADD CONSTRAINT "WWV_FLOW_SW_RESULT_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_DETAIL_RESULTS" ADD CONSTRAINT "WWV_FLOW_SW_D_RESULT_FK" FOREIGN KEY ("RESULT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SW_RESULTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_DETAIL_RESULTS" ADD CONSTRAINT "WWV_FLOW_SW_D_RESULT_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_SQL_CMDS" ADD CONSTRAINT "WWV_FLOW_SW_SQL_CMDS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_STMTS" ADD CONSTRAINT "WWV_FLOW_SW_STMTS_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SW_STMTS" ADD CONSTRAINT "WWV_FLOW_SW_STMTS_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_SUBMISSIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_SUB_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_SUBMISSIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_SUB_SESS_FK" FOREIGN KEY ("SESSION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SESSIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_IMPORT_EXPORT" ADD CONSTRAINT "WWV_FLOW_IMP_EXP_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_IMPORT_EXPORT" ADD CONSTRAINT "WWV_FLOW_IMPORT_EXPORT_FK" FOREIGN KEY ("DATA_ID")
	  REFERENCES "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COLLECTIONS$" ADD CONSTRAINT "WWV_FLOW_COLLECTION_FK" FOREIGN KEY ("SESSION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SESSIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_COLLECTION_MEMBERS$" ADD CONSTRAINT "WWV_FLOW_COLLECTION_MEMBES_FK" FOREIGN KEY ("COLLECTION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COLLECTIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PASSWORD_HISTORY" ADD CONSTRAINT "WWV_FLOW_PWHIST_UID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FND_USER" ("USER_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PASSWORD_HISTORY" ADD CONSTRAINT "WWV_FLOW_PWHIST_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FND_USER_GROUPS" ADD CONSTRAINT "WWV_FLOW_FND_USER_GRPS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FND_GROUP_USERS" ADD CONSTRAINT "WWV_FLOW_FND_GU_INT_G_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FND_USER_GROUPS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FND_GROUP_USERS" ADD CONSTRAINT "WWV_FLOW_FND_GU_INT_U_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FND_USER" ("USER_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_UPD_RPT_COLS" ADD CONSTRAINT "WWV_FLOW_URC_TO_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_UPD_RPT_COLS" ADD CONSTRAINT "WWV_FLOW_URC_TO_PLUG_FK" FOREIGN KEY ("PLUG_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_POPUP_LOV_TEMPLATE" ADD CONSTRAINT "WWV_FLOW_FK_POPLOV_TEMP" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MENUS" ADD CONSTRAINT "WWV_FLOW_MENUS_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MENU_OPTIONS" ADD CONSTRAINT "WWV_FLOW_OPT_MENUS_FK" FOREIGN KEY ("MENU_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_MENUS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MENU_TEMPLATES" ADD CONSTRAINT "WWV_FLOW_MENUS_T_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_AUTH_SETUPS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_AUTHENTICATIONS" ADD CONSTRAINT "WWV_FLOW_AUTHENTICATIONS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ENTRY_POINTS" ADD CONSTRAINT "WWV_FLOW_ENTRY_POINTS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ENTRY_POINT_ARGS" ADD CONSTRAINT "WWV_FLOW_ENTRY_POINT_ARGS_FK" FOREIGN KEY ("FLOW_ENTRY_POINT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_ENTRY_POINTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SHARED_WEB_SERVICES" ADD CONSTRAINT "WWV_FLOW_WS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_OPERATIONS" ADD CONSTRAINT "WWV_FLOW_WS_OPERS_FK" FOREIGN KEY ("WS_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SHARED_WEB_SERVICES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PARAMETERS" ADD CONSTRAINT "WWV_FLOW_WS_PARMS_FK" FOREIGN KEY ("WS_OPERS_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_OPERATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PROCESS_PARMS_MAP" ADD CONSTRAINT "WWV_FLOWS_WS_MAP_FK1" FOREIGN KEY ("PARAMETER_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_PARAMETERS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_PROCESS_PARMS_MAP" ADD CONSTRAINT "WWV_FLOW_WS_MAP_FK2" FOREIGN KEY ("PROCESS_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEP_PROCESSING" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOCK_PAGE" ADD FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_GROUPS" ADD CONSTRAINT "WWV_FLOW_HNT_GROUPS_TAB_FK" FOREIGN KEY ("TABLE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_HNT_TABLE_INFO" ("TABLE_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_COL_INFO_TAB_FK" FOREIGN KEY ("TABLE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_HNT_TABLE_INFO" ("TABLE_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_COL_INFO_GRP_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_HNT_GROUPS" ("GROUP_ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_LOV_DATA" ADD CONSTRAINT "WWV_FLOW_HNT_LOV_DATA_COL_FK" FOREIGN KEY ("COLUMN_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_HNT_COLUMN_INFO" ("COLUMN_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT" ADD CONSTRAINT "WWV_FHCD_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_COL_DICT_SYN" ADD CONSTRAINT "WWV_FLOW_HNT_COL_DICT_SYN_FK" FOREIGN KEY ("COLUMN_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT" ("COLUMN_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_CHART_SER_ATTR" ADD CONSTRAINT "WWV_FLOW_SEATTR_TO_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_DEFINITION" ADD CONSTRAINT "QUERY_DEF_TO_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_OBJECT" ADD CONSTRAINT "QUERY_OBJECT_TO_QUERY_FK" FOREIGN KEY ("QUERY_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_QUERY_DEFINITION" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_COLUMN" ADD CONSTRAINT "QUERY_COLUMN_TO_QUERY_FK" FOREIGN KEY ("QUERY_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_QUERY_DEFINITION" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_COLUMN" ADD CONSTRAINT "QUERY_COLUMN_TO_QRY_OBJECT_FK" FOREIGN KEY ("QUERY_OBJECT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_QUERY_OBJECT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QUERY_CONDITION" ADD CONSTRAINT "QUERY_CONDITION_TO_QUERY_FK" FOREIGN KEY ("QUERY_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_QUERY_DEFINITION" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_COLUMN" ADD CONSTRAINT "REPORT_COLUMN_TO_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REGION_REPORT_FILTER" ADD FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO" ADD CONSTRAINT "WWV_FLOW_HNT_ARG_INFO_PROC_FK" FOREIGN KEY ("PROCEDURE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_HNT_PROCEDURE_INFO" ("PROCEDURE_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_GROUPS" ADD FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RSCHEMA_EXCEPTIONS" ADD CONSTRAINT "WWV_FLOW_RSCHEMA_EXCEPTIONS_FK" FOREIGN KEY ("SCHEMA_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RESTRICTED_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_QUERY" ADD CONSTRAINT "WWV_FLOW_QB_SAVED_QUERY_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_COND" ADD FOREIGN KEY ("ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_QB_SAVED_QUERY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_JOIN" ADD FOREIGN KEY ("ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_QB_SAVED_QUERY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_QB_SAVED_TABS" ADD FOREIGN KEY ("ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_QB_SAVED_QUERY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODELS" ADD CONSTRAINT "WWV_FLOW_MODELS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGES" ADD CONSTRAINT "WWV_FLOW_MODEL_PAGES_FK" FOREIGN KEY ("MODEL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_MODELS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGES" ADD CONSTRAINT "WWV_FLOW_MODEL_PAGES_FK2" FOREIGN KEY ("PARENT_PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_MODEL_PAGES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_REGIONS" ADD CONSTRAINT "WWV_FLOW_MPR_FK" FOREIGN KEY ("MODEL_PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_MODEL_PAGES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_MODEL_PAGE_COLS" ADD CONSTRAINT "WWV_FLOW_MODEL_PAGE_COLS_FK" FOREIGN KEY ("MODEL_REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_MODEL_PAGE_REGIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SC_TRANS" ADD CONSTRAINT "WWV_FLOW_SC_TRANS_FK2" FOREIGN KEY ("SESSION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SESSIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_SC_TRANS" ADD CONSTRAINT "WWV_FLOW_SC_TRANS_FK1" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REPORT_LAYOUTS" ADD CONSTRAINT "WWV_FLOW_REPORT_LAYOUTSE_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_FLOW_INSTALL_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL" ADD CONSTRAINT "WWV_FLOW_INSTALL_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_SCRIPTS" ADD CONSTRAINT "WWV_FLOW_INSTALL_SCRIPTS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_SCRIPTS" ADD CONSTRAINT "WWV_FLOW_INSTALL_SCRIPTS_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_SCRIPTS" ADD CONSTRAINT "WWV_FLOW_INSTALL_SCRIPTS_FK3" FOREIGN KEY ("INSTALL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_INSTALL" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_CHECKS" ADD CONSTRAINT "WWV_FLOW_INSTALL_CHECKS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_CHECKS" ADD CONSTRAINT "WWV_FLOW_INSTALL_CHECKS_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_CHECKS" ADD CONSTRAINT "WWV_FLOW_INSTALL_CHECKS_FK3" FOREIGN KEY ("INSTALL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_INSTALL" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_BUILD_OPT" ADD CONSTRAINT "WWV_FLOW_INSTALL_BUILD_OPT_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_BUILD_OPT" ADD CONSTRAINT "WWV_FLOW_INSTALL_BUILD_OPT_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_BUILD_OPT" ADD CONSTRAINT "WWV_FLOW_INSTALL_BUILD_OPT_FK3" FOREIGN KEY ("INSTALL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_INSTALL" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_INSTALL_BUILD_OPT" ADD CONSTRAINT "WWV_FLOW_INSTALL_BUILD_OPT_FK4" FOREIGN KEY ("BUILD_OPT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PATCHES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_APP_BUILD_PREF" ADD CONSTRAINT "WWV_FLOW_APP_BLDPRF_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_FK2" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHART_SERIES" ADD CONSTRAINT "WWV_FLOW_FLASH_CHART_SERIES_FK" FOREIGN KEY ("CHART_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FLASH_CHARTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_5_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5" ADD CONSTRAINT "WWV_FLOW_FLASH_CHARTS_5_FK2" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_CHART5_SERIES" ADD CONSTRAINT "WWV_FLOW_FLASH_5_SERIES_FK" FOREIGN KEY ("CHART_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_MAP_FILES" ADD CONSTRAINT "WWV_FLOW_FLASH_MAP_FILES_FK" FOREIGN KEY ("FOLDER_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FLASH_MAP_FOLDERS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FLASH_MAP_REGIONS" ADD CONSTRAINT "WWV_FLOW_FLASH_MAP_REG_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FLASH_MAP_FILES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_REQUEST_VERIFICATIONS" ADD CONSTRAINT "WWV_FLOW_REQUEST_VERIF_FK" FOREIGN KEY ("SESSION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SESSIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WORKSHEETS_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEETS" ADD CONSTRAINT "WWV_FLOW_WORKSHEETS_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_CAT_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CATEGORIES" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_CAT_FK2" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_WS_APPLICATIONS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_APP_SUG_OBJECTS" ADD CONSTRAINT "WWV_FLOW_WS_APP_SO_FK1" FOREIGN KEY ("WS_APP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_CUSTOM_AUTH_SETUPS" ADD CONSTRAINT "WWV_FLOW_WS_AUTH_SETUPS_FK" FOREIGN KEY ("WEBSHEET_APPLICATION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ADD CONSTRAINT "WWV_FLOW_WS_WEBSHEET_ATTR_FK2" FOREIGN KEY ("WS_APP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ADD CONSTRAINT "WWWV_FLOW_WS_WEBSHEET_ATTR_FK" FOREIGN KEY ("WORKSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEETS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COL_GROUPS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_GRWS_FK" FOREIGN KEY ("WORKSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEETS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COL_GROUPS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_GRP_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COL_GROUPS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_GRP_FK2" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOVS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOVS_FK2" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOVS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOVS_FK" FOREIGN KEY ("WORKSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEETS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOV_ENTRIES" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOV_ENT_FK3" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOV_ENTRIES" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOV_ENT_FK" FOREIGN KEY ("WORKSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEETS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_LOV_ENTRIES" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_LOV_ENT_FK2" FOREIGN KEY ("LOV_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEET_LOVS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_FK2" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COLUMNS_FK" FOREIGN KEY ("WORKSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEETS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COLUMNS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COL_GRPS_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEET_COL_GROUPS" ("ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WS_RPT_FK" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_RPTS_FK" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEET_CATEGORIES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_RPTS_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CONDITIONS" ADD CONSTRAINT "WWV_FLOW_WS_CONDITION_FK" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_CONDITIONS" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_COND_FK" FOREIGN KEY ("REPORT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COMPUTATION" ADD CONSTRAINT "WWV_FLOW_WS_COMPUTATION_FK" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_COMPUTATION" ADD CONSTRAINT "WWV_FLOW_WS_COMP_COLS_FK" FOREIGN KEY ("REPORT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GROUPBY_FK" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_GROUP_BY" ADD CONSTRAINT "WWV_FLOW_WS_GROUPBY_FK2" FOREIGN KEY ("REPORT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_NOTIFY" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_NOTIFY_FK4" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_NOTIFY" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_NOTIFY_FK2" FOREIGN KEY ("REPORT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEET_RPTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WORKSHEET_NOTIFY" ADD CONSTRAINT "WWV_FLOW_WORKSHEET_NOTIFY_FK5" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBPAGES" ADD CONSTRAINT "WWV_FLOW_WS_WEBPAGES_FK" FOREIGN KEY ("WS_APP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_WEBPAGES" ADD CONSTRAINT "WWV_FLOW_WS_WEBPAGES_FK2" FOREIGN KEY ("PARENT_PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBPAGES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_COL_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_WS_COL_VAL_FK3" FOREIGN KEY ("WS_APP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_COL_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_WS_COL_VAL_FK" FOREIGN KEY ("WORKSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WORKSHEETS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_COL_VALIDATIONS" ADD CONSTRAINT "WWV_FLOW_WS_COL_VAL_FK2" FOREIGN KEY ("WEBSHEET_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_DATA_GRID_Q" ADD CONSTRAINT "WWV_FLOW_WS_DATA_GRID_Q_FK" FOREIGN KEY ("WS_APP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_WS_DATA_GRID_Q" ADD CONSTRAINT "WWV_FLOW_WS_DATA_GRID_Q_FK2" FOREIGN KEY ("PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_WEBPAGES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DICTIONARY_VIEWS" ADD CONSTRAINT "WWV_FLOW_DICT_VIEW_PARENT_FK" FOREIGN KEY ("PARENT_VIEW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_DICTIONARY_VIEWS" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECKS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_CAT_FK" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_ADVISOR_CATEGORIES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_ADVISOR_CHECK_MSGS" ADD CONSTRAINT "WWV_FLOW_ADV_CHK_MSG_CHECK_FK" FOREIGN KEY ("CHECK_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_ADVISOR_CHECKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGINS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_PARENT_FK" FOREIGN KEY ("PLUGIN_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PLUGINS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTR_DEPEND_FK" FOREIGN KEY ("DEPENDING_ON_ATTRIBUTE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ("ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTR_VALUES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTRV_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_ATTR_VALUES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_ATTRV_ATTR_FK" FOREIGN KEY ("PLUGIN_ATTRIBUTE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_FILES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_FILE_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_FILES" ADD CONSTRAINT "WWV_FLOW_PLUGIN_FILE_PARENT_FK" FOREIGN KEY ("PLUGIN_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PLUGINS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_EVENTS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_EVNT_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_EVENTS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_EVNT_PARENT_FK" FOREIGN KEY ("PLUGIN_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PLUGINS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PLUGIN_SETTINGS" ADD CONSTRAINT "WWV_FLOW_PLUGIN_SET_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_FLOW_FK" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_TR_FK" FOREIGN KEY ("TRIGGERING_REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_E_PAGE_FK" FOREIGN KEY ("FLOW_ID", "PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_EVNT_FK" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_AR_FK" FOREIGN KEY ("AFFECTED_REGION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PAGE_PLUGS" ("ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS" ADD CONSTRAINT "WWV_FLOW_PAGE_DA_A_PAGE_FK" FOREIGN KEY ("FLOW_ID", "PAGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_STEPS" ("FLOW_ID", "ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_FK1" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_FK2" FOREIGN KEY ("COLUMN_NAMES_LOV_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_LISTS_OF_VALUES$" ("ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_LOOKUPS" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_LK_FK1" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_LOOKUPS" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_LK_FK2" FOREIGN KEY ("LOAD_TABLE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_LOAD_TABLES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_RULES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_RULE_FK1" FOREIGN KEY ("FLOW_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LOAD_TABLE_RULES" ADD CONSTRAINT "WWV_FLOW_LOAD_TAB_RULE_FK2" FOREIGN KEY ("LOAD_TABLE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_LOAD_TABLES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEEDBACK" ADD CONSTRAINT "WWV_FLOW_FEEDBACK_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEEDBACK_FOLLOWUP" ADD CONSTRAINT "WWV_FLOW_FEEDBACK_FUP_FK" FOREIGN KEY ("FEEDBACK_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEEDBACK" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_TAGS" ADD CONSTRAINT "WWV_FLOW_TEAM_TAGS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_EMAILS" ADD CONSTRAINT "WWV_PURGE_EMAILS_FK1" FOREIGN KEY ("PURGE_WORKSPACE_ID", "SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_PURGE_WORKSPACES" ("ID", "SECURITY_GROUP_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_WORKSPACE_RESPONSES" ADD CONSTRAINT "WWV_PURGE_WORKSPACE_RESP_FK1" FOREIGN KEY ("PURGE_EMAIL_ID")
	  REFERENCES "APEX_040200"."WWV_PURGE_EMAILS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_DATAFILES" ADD CONSTRAINT "WWV_PURGE_DATAFILES_FK1" FOREIGN KEY ("PURGE_WORKSPACE_ID", "SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_PURGE_WORKSPACES" ("ID", "SECURITY_GROUP_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_PURGE_SCHEMAS" ADD CONSTRAINT "WWV_PURGE_SCHEMAS_FK1" FOREIGN KEY ("PURGE_WORKSPACE_ID", "SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_PURGE_WORKSPACES" ("ID", "SECURITY_GROUP_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TREE_STATE" ADD CONSTRAINT "WWV_FLOW_TREE_STATE$FK" FOREIGN KEY ("ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SESSIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_FK1" FOREIGN KEY ("APP_CATEGORY_ID_1")
	  REFERENCES "APEX_040200"."WWV_FLOW_PKG_APP_CATEGORIES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_FK2" FOREIGN KEY ("APP_CATEGORY_ID_2")
	  REFERENCES "APEX_040200"."WWV_FLOW_PKG_APP_CATEGORIES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ADD CONSTRAINT "WWV_FLOW_PKG_APP_FK3" FOREIGN KEY ("APP_CATEGORY_ID_3")
	  REFERENCES "APEX_040200"."WWV_FLOW_PKG_APP_CATEGORIES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_IMAGES" ADD CONSTRAINT "WWV_FLOW_PKG_APP_IMAGES_FK1" FOREIGN KEY ("APP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_PKG_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_MAP" ADD CONSTRAINT "WWV_FLOW_PKG_APP_MAP_FK" FOREIGN KEY ("INSTALLED_APP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_PKG_APP_MAP" ADD CONSTRAINT "WWV_FLOW_PKG_APP_MAP_FK2" FOREIGN KEY ("INSTALLED_WS_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_WS_APPLICATIONS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PRIVILEGES" ADD CONSTRAINT "WWV_FLOW_RT$PRIVS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PRIVILEGE_GROUPS" ADD CONSTRAINT "WWV_FLOW_RT$PRIV_GROUPS_FK" FOREIGN KEY ("PRIVILEGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PRIVILEGE_GROUPS" ADD CONSTRAINT "WWV_FLOW_RT$PRIV_GROUPS_FK2" FOREIGN KEY ("USER_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FND_USER_GROUPS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PRIVILEGE_GROUPS" ADD CONSTRAINT "WWV_FLOW_RT$PRIV_GROUPS_FK3" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$MODULES" ADD CONSTRAINT "WWV_FLOW_RT$MODULES_PRIV_FK" FOREIGN KEY ("PRIVILEGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$PRIVILEGES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$MODULES" ADD CONSTRAINT "WWV_FLOW_RT$MODULES_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$TEMPLATES" ADD CONSTRAINT "WWV_FLOW_RT$TEMPS_MOD_FK" FOREIGN KEY ("MODULE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$MODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$TEMPLATES" ADD CONSTRAINT "WWV_FLOW_RT$TEMPS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_TEMPS_FK" FOREIGN KEY ("TEMPLATE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$TEMPLATES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_PRIV_FK" FOREIGN KEY ("PRIVILEGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$PRIVILEGES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$HANDLERS" ADD CONSTRAINT "WWV_FLOW_RT$HANDLERS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PARAMETERS" ADD CONSTRAINT "WWV_FLOW_RT$PARAMS_HANDLER_FK" FOREIGN KEY ("HANDLER_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$HANDLERS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PARAMETERS" ADD CONSTRAINT "WWV_FLOW_RT$PARAMS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENTS" ADD CONSTRAINT "WWV_FLOW_RT$CLIENTS_APPID_FK" FOREIGN KEY ("APEX_APPLICATION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENTS" ADD CONSTRAINT "WWV_FLOW_RT$CLIENTS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENT_PRIVILEGES" ADD CONSTRAINT "WWV_FLOW_RT$CLIENT_PRIVS_FK" FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$CLIENTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENT_PRIVILEGES" ADD CONSTRAINT "WWV_FLOW_RT$CLIENT_PRIVS_FK2" FOREIGN KEY ("PRIVILEGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$CLIENT_PRIVILEGES" ADD CONSTRAINT "WWV_FLOW_RT$CLIENT_PRIVS_FK3" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$APPROVALS_FK" FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$CLIENTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$APPROVALS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PENDING_APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$PEND_APPRV_FK" FOREIGN KEY ("APPROVAL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$APPROVALS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$PENDING_APPROVALS" ADD CONSTRAINT "WWV_FLOW_RT$PEND_APPRV_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVAL_PRIVS" ADD CONSTRAINT "WWV_FLOW_RT$APP_PRIVS_FK" FOREIGN KEY ("APPROVAL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$APPROVALS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVAL_PRIVS" ADD CONSTRAINT "WWV_FLOW_RT$APP_PRIVS_FK2" FOREIGN KEY ("PRIVILEGE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$APPROVAL_PRIVS" ADD CONSTRAINT "WWV_FLOW_RT$APP_PRIVS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$USER_SESSIONS" ADD CONSTRAINT "WWV_FLOW_RT$USER_SESS_FK" FOREIGN KEY ("APPROVAL_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$APPROVALS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$USER_SESSIONS" ADD CONSTRAINT "WWV_FLOW_RT$USER_SESS_FK1" FOREIGN KEY ("APEX_SESSION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_SESSIONS$" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$USER_SESSIONS" ADD CONSTRAINT "WWV_FLOW_RT$USER_SESS_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$ERRORS" ADD CONSTRAINT "WWV_FLOW_RT$ERRORS_HANDLER_FK" FOREIGN KEY ("HANDLER_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_RT$HANDLERS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_RT$ERRORS" ADD CONSTRAINT "WWV_FLOW_RT$ERRORS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DATA_LOAD_UNLOAD" ADD CONSTRAINT "WWV_FLOW_DATA_LOAD_UNLOAD_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DATA_LOAD_BAD_LOG" ADD CONSTRAINT "WWV_FLOW_DATA_LOAD_BAD_LOG_FK1" FOREIGN KEY ("LOAD_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_DATA_LOAD_UNLOAD" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_DATA_LOAD_BAD_LOG" ADD CONSTRAINT "WWV_FLOW_DATA_LOAD_BAD_LOG_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_NOTES" ADD CONSTRAINT "APEX$_WS_NOTES_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "APEX_040200"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_LINKS" ADD CONSTRAINT "APEX$_WS_LINKS_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "APEX_040200"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_TAGS" ADD CONSTRAINT "APEX$_WS_TAGS_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "APEX_040200"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."APEX$_WS_FILES" ADD CONSTRAINT "APEX$_WS_FILES_FK" FOREIGN KEY ("ROW_ID")
	  REFERENCES "APEX_040200"."APEX$_WS_ROWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."APEX$ARCHIVE_CONTENTS" ADD FOREIGN KEY ("HEADER_ID")
	  REFERENCES "APEX_040200"."APEX$ARCHIVE_HEADER" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_NEWS" ADD CONSTRAINT "WWV_NEWS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_LINKS" ADD CONSTRAINT "WWV_LINKS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_BUGS" ADD CONSTRAINT "WWV_FLOW_BUG_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_EVENTS" ADD CONSTRAINT "WWV_EVENTS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURES" ADD CONSTRAINT "WWV_FEATURES_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURES" ADD CONSTRAINT "WWV_FLOW_FEATURES_PAR_FEAT_FK" FOREIGN KEY ("PARENT_FEATURE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEATURES" ("ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURE_HISTORY" ADD CONSTRAINT "WWV_FLOW_FEATURE_HIST_FK" FOREIGN KEY ("FEATURE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEATURES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURE_HISTORY" ADD CONSTRAINT "WWV_FLOW_FEATURE_HIST_WG_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURE_PROGRESS" ADD CONSTRAINT "WWV_FLOW_FEATURE_PROG_FK" FOREIGN KEY ("FEATURE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEATURES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_FEATURE_PROGRESS" ADD CONSTRAINT "WWV_FLOW_FEATURE_PROG_WG_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TASKS" ADD CONSTRAINT "WWV_FLOW_TASKS_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TASK_PROGRESS" ADD CONSTRAINT "WWV_FLOW_TASK_PROG_FK" FOREIGN KEY ("TASK_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_TASKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TASK_PROGRESS" ADD CONSTRAINT "WWV_FLOW_TASK_PROG_WG_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TASK_DEFAULTS" ADD CONSTRAINT "WWV_FLOW_TASK_DEF_WG_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAMDEV_TAG_CLOUD" ADD CONSTRAINT "WWV_FLOW_TEAMDEV_TC_F" FOREIGN KEY ("FEATURE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEATURES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAMDEV_TAG_CLOUD" ADD CONSTRAINT "WWV_FLOW_TEAMDEV_TC_T" FOREIGN KEY ("TASK_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_TASKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAMDEV_TAG_CLOUD" ADD CONSTRAINT "WWV_FLOW_TEAMDEV_TC_B" FOREIGN KEY ("BUG_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_BUGS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAMDEV_TAG_CLOUD" ADD CONSTRAINT "WWV_FLOW_TASK_TC_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILES_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILES_FK1" FOREIGN KEY ("FEATURE_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEATURES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILES_FK2" FOREIGN KEY ("TASK_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_TASKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILES_FK3" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_EVENTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILES_FK4" FOREIGN KEY ("FEEDBACK_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEEDBACK" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_FLOW_TEAM_FILES" ADD CONSTRAINT "WWV_FLOW_TEAM_FILES_FK5" FOREIGN KEY ("BUG_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_FEEDBACK" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECTS" ADD CONSTRAINT "WWV_MIG_PROJ_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACCESS" ADD CONSTRAINT "WWV_MIG_ACC_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_EXPORTER" ADD CONSTRAINT "WWV_MIG_EXPORTER_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS" ADD CONSTRAINT "WWV_MIG_ACC_FRM_DBID_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS_CONTROLS" ADD CONSTRAINT "WWV_MIG_ACC_FRM_CTL_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "FORMID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_FORMS" ("PROJECT_ID", "DBID", "FORMID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS_MODULES" ADD CONSTRAINT "WWV_MIG_ACC_FRM_MDL_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "FORMID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_FORMS" ("PROJECT_ID", "DBID", "FORMID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_FORMS_PERM" ADD CONSTRAINT "WWV_MIG_ACC_FRM_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "FORMID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_FORMS" ("PROJECT_ID", "DBID", "FORMID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_REPORTS" ADD CONSTRAINT "WWV_MIG_ACC_REPORTS_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RPTS_CONTROLS" ADD CONSTRAINT "WWV_MIG_ACC_REP_CTL_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "REPORTID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_REPORTS" ("PROJECT_ID", "DBID", "REPORTID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RPTS_MODULES" ADD CONSTRAINT "ACCFORMS_ACCREPORTMODULE_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "REPORTID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_REPORTS" ("PROJECT_ID", "DBID", "REPORTID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RPT_PERMS" ADD CONSTRAINT "WWV_MIG_ACC_RPT_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "REPORTID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_REPORTS" ("PROJECT_ID", "DBID", "REPORTID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_TABLES" ADD CONSTRAINT "WWV_MIG_ACC_TBL_DBID_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_COLUMNS" ADD CONSTRAINT "WWV_MIG_ACC_COL_DBID_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "TBLID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_TABLES" ("PROJECT_ID", "DBID", "TBLID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_INDEXES" ADD CONSTRAINT "WWV_MIG_ACC_IND_DBID_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "TBLID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_TABLES" ("PROJECT_ID", "DBID", "TBLID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_INDEXES_COLS" ADD CONSTRAINT "WWV_MIG_ACC_IND_COL_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "TBLID", "INDID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_INDEXES" ("PROJECT_ID", "DBID", "TBLID", "INDID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_TAB_PERM" ADD CONSTRAINT "WWV_MIG_ACC_TAB_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "TBLID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_TABLES" ("PROJECT_ID", "DBID", "TBLID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_QUERIES" ADD CONSTRAINT "WWV_MIG_ACC_QRY_DBID_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RELATIONS" ADD CONSTRAINT "WWV_MIG_ACC_REL_DBID_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_RELATION_COLS" ADD CONSTRAINT "WWV_MIG_ACC_RELCOL_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "RELID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_RELATIONS" ("PROJECT_ID", "DBID", "RELID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_USERS" ADD CONSTRAINT "WWV_MIG_ACCUSRSFK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_GROUPS" ADD CONSTRAINT "WWV_MIG_ACC_GROUPS_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_GRPSMEMBERS" ADD CONSTRAINT "WWV_MIG_ACCGRPSMBR_USR_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "USERID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_USERS" ("PROJECT_ID", "DBID", "USERID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_GRPSMEMBERS" ADD CONSTRAINT "WWV_MIG_ACCGRPSMBR_GRP_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "GROUPID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_GROUPS" ("PROJECT_ID", "DBID", "GROUPID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_MODULES" ADD CONSTRAINT "WWV_MIG_ACC_MODULES" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_MODULES_PERM" ADD CONSTRAINT "WWV_MIG_ACC_MDL_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "MODULEID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_MODULES" ("PROJECT_ID", "DBID", "MODULEID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_ACC_PAGES" ADD CONSTRAINT "WWV_MIG_ACC_PAGE_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_TABLES" ADD CONSTRAINT "WWV_MIG_REV_TBL_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "TBLID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_TABLES" ("PROJECT_ID", "DBID", "TBLID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_QUERIES" ADD CONSTRAINT "WWV_MIG_REV_QRY_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "QRYID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_QUERIES" ("PROJECT_ID", "DBID", "QRYID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_REPORTS" ADD CONSTRAINT "WWV_MIG_REV_RPT_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "REPORTID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_REPORTS" ("PROJECT_ID", "DBID", "REPORTID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_FORMS" ADD CONSTRAINT "WWV_MIG_REV_FRM_FK" FOREIGN KEY ("PROJECT_ID", "DBID", "FORMID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACC_FORMS" ("PROJECT_ID", "DBID", "FORMID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REV_APEXAPP" ADD CONSTRAINT "WWV_MIG_REV_APEX_FK" FOREIGN KEY ("PROJECT_ID", "DBID")
	  REFERENCES "APEX_040200"."WWV_MIG_ACCESS" ("PROJECT_ID", "DBID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_GENERATED_APPLICATIONS" ADD CONSTRAINT "WWV_MIG_GEN_APP_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_GENERATED_APPLICATIONS" ADD CONSTRAINT "WWV_MIG_GEN_APP_PROJ_ID_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_GENERATED_APPLICATIONS" ADD CONSTRAINT "WWV_MIG_GEN_APP_FLOW_ID_FK" FOREIGN KEY ("APPLICATION_ID")
	  REFERENCES "APEX_040200"."WWV_FLOWS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_FRM_XMLTAGTABLEMAP_FK" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_XMLTAGTABLEMAP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_RPT_XMLTAGTABLEMAP_FK" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_XMLTAGTABLEMAP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_COMPONENTS" ADD CONSTRAINT "WWV_MIG_PROJ_COMP_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_COMPONENTS" ADD CONSTRAINT "WWV_MIG_PROJ_COMP_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_TRIGGERS" ADD CONSTRAINT "WWV_MIG_PROJ_TRIG_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PROJECT_TRIGGERS" ADD CONSTRAINT "WWV_MIG_PROJ_TRIG_FK2" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FORMS" ADD CONSTRAINT "WWV_MIG_FORMS_PROJECT_ID_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FORMS" ADD CONSTRAINT "WWV_MIG_FORMS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PLSQL_LIBS" ADD CONSTRAINT "WWV_MIG_PLLS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_PLSQL_LIBS" ADD CONSTRAINT "WWV_MIG_PLLS_PROJECT_ID_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULES" ADD CONSTRAINT "WWV_MIG_FRM_MODULES_FILE_ID_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FORMS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULES" ADD CONSTRAINT "WWV_MIG_FRM_MODULES_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_FRMMDL_MDL_ID_FK" FOREIGN KEY ("MODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_FRMMDL_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ATTACHEDLIBRARY" ADD CONSTRAINT "WWV_MIG_FRM_ATLIB_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ATTACHEDLIBRARY" ADD CONSTRAINT "WWV_MIG_FRM_ATLIB_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULEPARAMETER" ADD CONSTRAINT "WWV_MIG_FRM_MDLPR_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MODULEPARAMETER" ADD CONSTRAINT "WWV_MIG_FRM_MDLPR_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU" ADD CONSTRAINT "WWV_MIG_FRM_MENU_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU" ADD CONSTRAINT "WWV_MIG_FRM_MENU_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_FMB_MENUITEM_MENUID_FK" FOREIGN KEY ("MENU_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FMB_MENU" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_FMB_MENUITEM_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_FMB_MNUITEMRL_MITM_FK" FOREIGN KEY ("MENUITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FMB_MENU_MENUITEM" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_FMB_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_FMB_MNUITEMRL_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REPORT" ADD CONSTRAINT "WWV_MIG_FRM_RPT_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REPORT" ADD CONSTRAINT "WWV_MIG_FRM_RPT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_FRM_OBJGP_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_FRM_OBJGP_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUPCHILD" ADD CONSTRAINT "WWV_MIG_FRM_OBJGPC_OBJGP_ID_FK" FOREIGN KEY ("OBJECTGROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_OBJECTGROUP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OBJECTGROUPCHILD" ADD CONSTRAINT "WWV_MIG_FRM_OBJGPC_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_COORDINATES" ADD CONSTRAINT "WWV_MIG_FRM_CRDNT_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_COORDINATES" ADD CONSTRAINT "WWV_MIG_FRM_CRDNT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ALERTS" ADD CONSTRAINT "WWV_MIG_FRM_ALRT_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_ALERTS" ADD CONSTRAINT "WWV_MIG_FRM_ALRT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_TRG_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_TRG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_BI_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLOCKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_BI_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BI_TRG_ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BI_TRG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_FRM_BI_LIE_ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_FRM_BI_LIE_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_RADIO" ADD CONSTRAINT "WWV_MIG_FRM_BIR_ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_ITEM_RADIO" ADD CONSTRAINT "WWV_MIG_FRM_BIR_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSA" ADD CONSTRAINT "WWV_MIG_FRM_BLK_DSA_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLOCKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSA" ADD CONSTRAINT "WWV_MIG_FRM_BLK_DSA_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSC" ADD CONSTRAINT "WWV_MIG_FRM_BLK_DSC_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLOCKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_DSC" ADD CONSTRAINT "WWV_MIG_FRM_BLK_DSC_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_TRG_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLOCKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_TRIGGERS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_TRG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_RELATIONS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_REL_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLOCKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_BLK_RELATIONS" ADD CONSTRAINT "WWV_MIG_FRM_BLK_REL_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CANVAS" ADD CONSTRAINT "WWV_MIG_FRM_CANVS_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CANVAS" ADD CONSTRAINT "WWV_MIG_FRM_CANVS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_FRM_CG_CNVS_ID_FK" FOREIGN KEY ("CANVAS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_CANVAS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_FRM_CG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_FRM_CPDTXT_GRPHS_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_CNVS_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_FRM_CPDTXT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CPDTXT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_FRM_TXTSGMT_CPD_ID_FK" FOREIGN KEY ("COMPOUNDTEXT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_CNVG_COMPOUNDTEXT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CPDTXT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_FRM_TXTSGMT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_TABPAGE" ADD CONSTRAINT "WWV_MIG_FRM_CTP_CNVS_ID_FK" FOREIGN KEY ("CANVAS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_CANVAS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_CNVS_TABPAGE" ADD CONSTRAINT "WWV_MIG_FRM_CTP_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_EDITOR" ADD CONSTRAINT "WWV_MIG_FRM_EDTR_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_EDITOR" ADD CONSTRAINT "WWV_MIG_FRM_EDTR_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOV" ADD CONSTRAINT "WWV_MIG_FRM_LOV_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOV" ADD CONSTRAINT "WWV_MIG_FRM_LOV_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOVCOLUMNMAPPING" ADD CONSTRAINT "WWV_MIG_FRM_LVCM_FRMMDL_ID_FK" FOREIGN KEY ("LOV_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_LOV" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_LOVCOLUMNMAPPING" ADD CONSTRAINT "WWV_MIG_FRM_LVCM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_FRM_PGUT_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_FRM_PGUT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_FRM_PPCL_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_FRM_PPCL_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPCOLUMN" ADD CONSTRAINT "WWV_MIG_FRM_RGC_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPS" ADD CONSTRAINT "WWV_MIG_FRM_RECGP_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPS" ADD CONSTRAINT "WWV_MIG_FRM_RECGRP_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_RECORDGROUPCOLUMN" ADD CONSTRAINT "WWV_MIG_FRM_RGC_RECGP_ID_FK" FOREIGN KEY ("RECORDGROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_RECORDGROUPS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_VISUALATTRIBUTES" ADD CONSTRAINT "WWV_MIG_FRM_VISAT_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_VISUALATTRIBUTES" ADD CONSTRAINT "WWV_MIG_FRM_VISAT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_WINDOWS" ADD CONSTRAINT "WWV_MIG_FRM_WNDOW_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_WINDOWS" ADD CONSTRAINT "WWV_MIG_FRM_WNDOW_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_APEX_APP" ADD CONSTRAINT "WWV_MIG_FRM_REV_APEX_APP_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_APEX_APP" ADD CONSTRAINT "WWV_MIG_FRM_REV_APXAPP_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_REV_FRMMDL_ID_FK" FOREIGN KEY ("FORMMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_FORMMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_FORMMODULES" ADD CONSTRAINT "WWV_MIG_FRM_REV_FMDL_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BLOCKS_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLOCKS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLOCKS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BLK_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BI_ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_BLK_ITEMS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_BLK_ITEMS" ADD CONSTRAINT "WWV_MIG_FRM_REV_BI_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOV" ADD CONSTRAINT "WWV_MIG_FRM_REV_LOV_ID_FK" FOREIGN KEY ("LOV_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_LOV" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOV" ADD CONSTRAINT "WWV_MIG_FRM_REV_LOV_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOVCOLMAPS" ADD CONSTRAINT "WWV_MIG_FRM_REV_LCM_ID_FK" FOREIGN KEY ("COLMAP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_LOVCOLUMNMAPPING" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_REV_LOVCOLMAPS" ADD CONSTRAINT "WWV_MIG_FRM_REV_LCM_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPTS" ADD CONSTRAINT "WWV_MIG_RPTS_PROJECT_ID_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPTS" ADD CONSTRAINT "WWV_MIG_RPTS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REPORT" ADD CONSTRAINT "WWV_MIG_REP_FILE_ID_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_REPORT" ADD CONSTRAINT "WWV_MIG_REP_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA" ADD CONSTRAINT "WWV_MIG_REPDATA_ID_FK" FOREIGN KEY ("REPORT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_REPORT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA" ADD CONSTRAINT "WWV_MIG_REPDATA_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC" ADD CONSTRAINT "WWV_MIG_REPSRC_ID_FK" FOREIGN KEY ("DATA_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATA" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC" ADD CONSTRAINT "WWV_MIG_REPSRC_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_SELECT" ADD CONSTRAINT "WWV_MIG_SELECT_ID_FK" FOREIGN KEY ("DATASRC_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_SELECT" ADD CONSTRAINT "WWV_MIG_SELECT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ADD CONSTRAINT "WWV_MIG_GRP_ID_FK" FOREIGN KEY ("DATASRC_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ADD CONSTRAINT "WWV_MIG_GRP_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRP_DATAITEM_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ADD CONSTRAINT "WWV_MIG_GRP_ITEM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_DESC" ADD CONSTRAINT "WWV_MIG_GRP_ITEMDESC_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_DESC" ADD CONSTRAINT "WWV_MIG_GRP_ITEMDESC_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_PRIV" ADD CONSTRAINT "WWV_MIG_GRP_ITEMPRIV_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_DATAITEM_PRIV" ADD CONSTRAINT "WWV_MIG_GRP_ITEMPRIV_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_SUMMARY" ADD CONSTRAINT "WWV_MIG_GRP_SUM_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_SUMMARY" ADD CONSTRAINT "WWV_MIG_GRP_SUM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_GRP_FORM_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FORMULA" ADD CONSTRAINT "WWV_MIG_GRP_FORM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_ROWDELIM" ADD CONSTRAINT "WWV_MIG_GRP_ROW_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_ROWDELIM" ADD CONSTRAINT "WWV_MIG_GRP_ROW_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FILTER" ADD CONSTRAINT "WWV_MIG_GRP_FLTR_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FILTER" ADD CONSTRAINT "WWV_MIG_GRP_FLTR_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_GRP_FLD_ID_FK" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATASRC_GRP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_GRP_FIELD" ADD CONSTRAINT "WWV_MIG_GRP_FLD_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA_SUMMARY" ADD CONSTRAINT "WWV_MIG_REPSUM_ID_FK" FOREIGN KEY ("DATA_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_RPT_DATA" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_DATA_SUMMARY" ADD CONSTRAINT "WWV_MIG_REPSUM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_REPORTPRIVATE" ADD CONSTRAINT "WWV_MIG_RPTPRIV_ID_FK" FOREIGN KEY ("REPORT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_REPORT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_RPT_REPORTPRIVATE" ADD CONSTRAINT "WWV_MIG_RPTPRIV_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS" ADD CONSTRAINT "WWV_MIG_MENUS_PROJECT_ID_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS" ADD CONSTRAINT "WWV_MIG_MENUS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MODULES" ADD CONSTRAINT "WWV_MIG_MNU_MODULES_FILE_ID_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MENUS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MODULES" ADD CONSTRAINT "WWV_MIG_MNU_MODULES_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MENUMODULES" ADD CONSTRAINT "WWV_MIG_MNU_MNUMDL_MDL_ID_FK" FOREIGN KEY ("MODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MENUS_MODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_MENUMODULES" ADD CONSTRAINT "WWV_MIG_MNU_MNUMDL_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUSMODULEROLES" ADD CONSTRAINT "WWV_MIG_MMODROLE_ID_FK" FOREIGN KEY ("MENUMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MENUS_MENUMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUSMODULEROLES" ADD CONSTRAINT "WWV_MIG_MMODROLE_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU" ADD CONSTRAINT "WWV_MIG_MNU_ID_FK" FOREIGN KEY ("MENUMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MENUS_MENUMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU" ADD CONSTRAINT "WWV_MIG_MNU_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_MNUITEM_ID_FK" FOREIGN KEY ("MENU_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MENU" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_MNUITEM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_MNUITEMROLE_ID_FK" FOREIGN KEY ("MENUITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MENU_MENUITEM" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUITEM_ROLE" ADD CONSTRAINT "WWV_MIG_MNUITEMROLE_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_MNU_PROGUNIT_ID_FK" FOREIGN KEY ("MENUMODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_MENUS_MENUMODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_MENUS_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_MNUPROGUNIT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_MENU_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_MNU_XMLTAGTABLEMAP_FK" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_MENU_XMLTAGTABLEMAP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_FRM_OLB_XMLTAGTABLEMAP" ADD CONSTRAINT "WWV_MIG_OLB_XMLTAGTABLEMAP_FK" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_FRM_OLB_XMLTAGTABLEMAP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB" ADD CONSTRAINT "WWV_MIG_OLB_PROJECT_ID_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB" ADD CONSTRAINT "WWV_MIG_OLB_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_MODULES" ADD CONSTRAINT "WWV_MIG_OLB_MODULES_FILE_ID_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_MODULES" ADD CONSTRAINT "WWV_MIG_OLB_MODULES_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ADD CONSTRAINT "WWV_MIG_OLB_OBJLIB_MDL_ID_FK" FOREIGN KEY ("MODULE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_MODULES" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ADD CONSTRAINT "WWV_MIG_OLB_OBJLIB_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ADD CONSTRAINT "WWV_MIG_OLB_OLT_OBJLIB_ID_FK" FOREIGN KEY ("OBJECTLIBRARY_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ADD CONSTRAINT "WWV_MIG_OLB_OLT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_BLOCK_OBJLIB_ID_FK" FOREIGN KEY ("OBJECTLIBRARY_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_BLOCK_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_CANVS_OBJLIB_ID_FK" FOREIGN KEY ("OBJECTLIBRARY_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_CANVAS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_OLB_PU_OBJLIB_ID_FK" FOREIGN KEY ("OBJECTLIBRARY_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROGRAMUNIT" ADD CONSTRAINT "WWV_MIG_OLB_PU_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_OLB_PC_OBJLIB_ID_FK" FOREIGN KEY ("OBJECTLIBRARY_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_PROPERTYCLASS" ADD CONSTRAINT "WWV_MIG_OLB_PC_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_VISUALATTRIBUTE" ADD CONSTRAINT "WWV_MIG_OLB_VA_OBJLIB_ID_FK" FOREIGN KEY ("OBJECTLIBRARY_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_VISUALATTRIBUTE" ADD CONSTRAINT "WWV_MIG_OLB_VA_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_WNDOW_OBJLIB_ID_FK" FOREIGN KEY ("OBJECTLIBRARY_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARY" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_WINDOW_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ALERT" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ALRT_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ALERT" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ALERT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_T_BLOCK_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLOCK" ADD CONSTRAINT "WWV_MIG_OLB_T_BLOCK_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_T_CANVAS_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CANVAS" ADD CONSTRAINT "WWV_MIG_OLB_T_CANVAS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_GRPHCS_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_GRAPHCS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ITEM_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_ITEM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MENU_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MENU_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_OLB_T_OBJGRP_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OBJECTGROUP" ADD CONSTRAINT "WWV_MIG_OLB_T_OBJGRP_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_REPORT" ADD CONSTRAINT "WWV_MIG_OLB_T_REPORT_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_REPORT" ADD CONSTRAINT "WWV_MIG_OLB_T_REPORT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPAGE" ADD CONSTRAINT "WWV_MIG_OLB_T_TABPAGE_OLTID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPAGE" ADD CONSTRAINT "WWV_MIG_OLB_T_TABPAGE_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_VISUALATTRBUTE" ADD CONSTRAINT "WWV_MIG_OLB_OLT_VA_OLT_ID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_VISUALATTRBUTE" ADD CONSTRAINT "WWV_MIG_OLB_OLT_VA_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_OLT_WNDOW_OLTID_FK" FOREIGN KEY ("OBJECTLIBRARYTAB_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OBJECTLIBRARYTAB" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_WINDOW" ADD CONSTRAINT "WWV_MIG_OLB_OLT_WNDOW_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_BLK_ITEM_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_BLOCK" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_BLK_ITEM_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_OLB_BIL_ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_BLK_ITEM" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_LIE" ADD CONSTRAINT "WWV_MIG_OLB_BIL_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BIT_ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_BLK_ITEM" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_ITEM_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BIT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_DATASOURCECOL" ADD CONSTRAINT "WWV_MIG_OLB_BLK_DSC_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_BLOCK" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_DATASOURCECOL" ADD CONSTRAINT "WWV_MIG_OLB_BLK_DSC_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BLK_TRGR_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_BLOCK" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_BLK_TRIGGER" ADD CONSTRAINT "WWV_MIG_OLB_BLK_TRGR_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_CG_CNVS_ID_FK" FOREIGN KEY ("CANVAS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_CANVAS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_CG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BI_BLK_ID_FK" FOREIGN KEY ("BLOCK_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OLT_BLOCK" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BI_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_CG_CNVS_ID_FK" FOREIGN KEY ("CANVAS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OLT_CANVAS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_CNVS_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_CG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MMI_MENU_ID_FK" FOREIGN KEY ("MENU_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OLT_MENU" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_MENU_MENUITEM" ADD CONSTRAINT "WWV_MIG_OLB_OLT_MMI_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OB_OBJGRPCHILD" ADD CONSTRAINT "WWV_MIG_OLB_OLT_OB_OGC_OBID_FK" FOREIGN KEY ("OBJECTGROUP_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OLT_OBJECTGROUP" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_OB_OBJGRPCHILD" ADD CONSTRAINT "WWV_MIG_OLB_OLT_OB_OGC_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_TPG_TP_ID_FK" FOREIGN KEY ("TABPAGE_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OLT_TABPAGE" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_TABPG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_OLT_TPG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_G_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_G_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OLT_TABPG_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_G_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_CT_G_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_G_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GG_CT_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGCTTS_CTID_FK" FOREIGN KEY ("COMPOUNDTEXT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CPDTXT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGCTTS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGG_G_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_G_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTP_GGG_CT_GID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GG_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTP_GGGCT_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGCTTS_CTID_FK" FOREIGN KEY ("COMPOUNDTEXT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CPDTXT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_CT_TXTSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGCTTS_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGGG_G_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GG_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_T_TP_GGGG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGCT_G_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGCT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CT_TXSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGCTS_CTID_FK" FOREIGN KEY ("COMPOUNDTEXT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CPDTXT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_CT_TXSGT" ADD CONSTRAINT "WWV_MIG_OLB_TTP4GCTTS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGG_G_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GGG_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_GRAPHICS" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGG_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGGCT_G_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GGGG_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CPDTXT" ADD CONSTRAINT "WWV_MIG_OLB_TTPGGGGGCT_SGID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CT_TXST" ADD CONSTRAINT "WWV_MIG_OLB_TTP5GCTS_CT_ID_FK" FOREIGN KEY ("COMPOUNDTEXT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CPDTXT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_T_TP_GGGGG_CT_TXST" ADD CONSTRAINT "WWV_MIG_OLB_TTP5GCTS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM_TRIGR" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BIT_ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_OLT_BLK_ITEM_TRIGR" ADD CONSTRAINT "WWV_MIG_OLB_OLT_BIT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_OLB_CG_CT_GRPHS_ID_FK" FOREIGN KEY ("GRAPHICS_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_CNVS_GRAPHICS" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_COMPOUNDTEXT" ADD CONSTRAINT "WWV_MIG_OLB_CG_CT_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_CT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_OLB_CG_CT_TS_CT_ID_FK" FOREIGN KEY ("COMPOUNDTEXT_ID")
	  REFERENCES "APEX_040200"."WWV_MIG_OLB_CG_COMPOUNDTEXT" ("ID") ON DELETE CASCADE ENABLE;

ALTER TABLE "APEX_040200"."WWV_MIG_OLB_CG_CT_TEXTSEGMENT" ADD CONSTRAINT "WWV_MIG_OLB_CG_CT_TS_SG_ID_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

