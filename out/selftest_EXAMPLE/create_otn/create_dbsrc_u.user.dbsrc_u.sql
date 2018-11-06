-- [dbsrc POST-PROCESSED]:
-- (6) Change all user default tablepaces to the USERS tablespace.
-- (7) Default all user passwords to username.
CREATE USER "DBSRC_U"
      DEFAULT TABLESPACE "USERS" QUOTA UNLIMITED ON USERS
      IDENTIFIED BY "DBSRC_U" TEMPORARY TABLESPACE "TEMP";

