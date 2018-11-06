CREATE USER "SPATIAL_WFS_ADMIN_USR" IDENTIFIED BY VALUES 'S:610DAE42B9BA7A13C4C4517B88C8C58A619F31CBE8812702193EE316F5FC;H:35A6816F9420BA2AD46A75E1B10592CD;T:577078282C09441092DB77EA084436DD406A0DC3B3C16C58DCD53B08D56197CD09011827CA6526D66EE706F356B733424FC9DDD8CD50724EAC78C4F06CE0157EF64B7104C8E10FD4469D84D159EAC1C4;7117215D6BEE6E82'
      DEFAULT TABLESPACE "USERS"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

ALTER USER "SPATIAL_WFS_ADMIN_USR" DEFAULT ROLE ALL;
