CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LBAC_LABEL"
AS OPAQUE VARYING(3889)
USING LIBRARY LBACSYS.lbac$label_libt
(
   STATIC FUNCTION new_lbac_label(num IN PLS_INTEGER)
   RETURN lbac_label,
   PRAGMA RESTRICT_REFERENCES(new_lbac_label, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION to_tag(SELF IN lbac_label)
   RETURN PLS_INTEGER DETERMINISTIC,
   PRAGMA RESTRICT_REFERENCES(to_tag, RNDS, WNDS, RNPS, WNPS),
   MAP MEMBER FUNCTION lbac_label_map
   RETURN PLS_INTEGER DETERMINISTIC,
   MEMBER FUNCTION eq_sql(SELF IN lbac_label,
                          comp_label IN lbac_label)
   RETURN PLS_INTEGER,
   PRAGMA RESTRICT_REFERENCES(eq_sql, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION eq(SELF IN lbac_label,
                      comp_label IN lbac_label)
   RETURN BOOLEAN,
   PRAGMA RESTRICT_REFERENCES(eq, RNDS, WNDS, RNPS, WNPS)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LBAC_BIN_LABEL"
AS OPAQUE VARYING(*)
USING LIBRARY LBACSYS.lbac$type_libt
(
  STATIC FUNCTION new_lbac_bin_label(policy_id IN PLS_INTEGER,
                                     bin_size IN PLS_INTEGER)
  RETURN LBAC_BIN_LABEL,
  PRAGMA RESTRICT_REFERENCES(new_lbac_bin_label, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION eq_sql(SELF IN lbac_bin_label,
                         comp_label IN lbac_bin_label)
  RETURN PLS_INTEGER DETERMINISTIC,
  PRAGMA RESTRICT_REFERENCES(eq_sql, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION eq(SELF IN lbac_bin_label,
                     comp_label IN lbac_bin_label)
  RETURN BOOLEAN DETERMINISTIC,
  PRAGMA RESTRICT_REFERENCES(eq, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION bin_size(SELF IN lbac_bin_label)
  RETURN PLS_INTEGER,
  PRAGMA RESTRICT_REFERENCES(bin_size, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION set_raw(SELF      IN OUT NOCOPY lbac_bin_label,
                          position  IN PLS_INTEGER,
                          byte_len  IN PLS_INTEGER,
                          raw_label IN RAW)
  RETURN PLS_INTEGER,
  PRAGMA RESTRICT_REFERENCES(set_raw, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION set_int(SELF IN OUT NOCOPY lbac_bin_label,
                          position  IN PLS_INTEGER,
                          byte_len  IN PLS_INTEGER,
                          int_label IN PLS_INTEGER)
  RETURN PLS_INTEGER,
  PRAGMA RESTRICT_REFERENCES(set_int, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION to_raw(SELF     IN lbac_bin_label,
                         position IN PLS_INTEGER,
                         byte_len IN PLS_INTEGER)
  RETURN RAW,
  PRAGMA RESTRICT_REFERENCES(to_raw, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION to_int(SELF     IN lbac_bin_label,
                         position IN PLS_INTEGER,
                         byte_len IN PLS_INTEGER)
  RETURN PLS_INTEGER,
  PRAGMA RESTRICT_REFERENCES(to_int, RNDS, WNDS, RNPS, WNPS),
  MEMBER FUNCTION policy_id (SELF   IN lbac_bin_label)
  RETURN PLS_INTEGER,
  PRAGMA RESTRICT_REFERENCES(policy_id, RNDS, WNDS, RNPS, WNPS)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LBAC_PRIVS"
AS OPAQUE FIXED(9)
USING LIBRARY LBACSYS.lbac$privs_libt
(
   STATIC FUNCTION new_lbac_privs(policy_id IN PLS_INTEGER)
   RETURN lbac_privs,
   PRAGMA RESTRICT_REFERENCES(new_lbac_privs, RNDS, WNDS, RNPS, WNPS),
   MEMBER PROCEDURE set_priv(SELF IN OUT NOCOPY lbac_privs,
                             priv_number IN PLS_INTEGER),
   PRAGMA RESTRICT_REFERENCES(set_priv, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION test_priv(SELF IN lbac_privs,
                             priv_number IN PLS_INTEGER)
   RETURN BOOLEAN,
   PRAGMA RESTRICT_REFERENCES(test_priv, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION policy_id(SELF IN lbac_privs)
   RETURN PLS_INTEGER,
   PRAGMA RESTRICT_REFERENCES(policy_id, RNDS, WNDS, RNPS, WNPS),
   MEMBER PROCEDURE clear_priv(SELF IN OUT NOCOPY lbac_privs,
                               priv_number IN PLS_INTEGER),
   PRAGMA RESTRICT_REFERENCES(clear_priv, RNDS, WNDS, RNPS, WNPS),
   MEMBER PROCEDURE union_privs(SELF IN OUT NOCOPY lbac_privs,
                                other_privs IN lbac_privs),
   PRAGMA RESTRICT_REFERENCES(union_privs, RNDS, WNDS, RNPS, WNPS),
   MEMBER PROCEDURE diff_privs(SELF IN OUT NOCOPY lbac_privs,
                                other_privs IN lbac_privs),
   PRAGMA RESTRICT_REFERENCES(diff_privs, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION none(SELF IN lbac_privs)
   RETURN BOOLEAN,
   PRAGMA RESTRICT_REFERENCES(none, RNDS, WNDS, RNPS, WNPS)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LBAC_NAME_LIST"
IS VARRAY(32) OF VARCHAR2(30);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LDAP_ATTR" wrapped
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
d
103 c2
M1zw2o5g8B598zpAC0ajSw4L4qYwg5n0dLhcpVJSdOO/dL29Cbh0K6W/m8Ayy8xQacqmU90U
Wuo0T4xk1VlXR3+FMWp/hVpqhXdZXluhzHWMrk3VRWa2HR0djlzcWpduz+SQfFnj/lKBHZ4w
kgJTRZg5qAwHqTThRHzejheSkpjb+FsOFo8loMmmptU43/o=
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LDAP_EVENT_STATUS" wrapped
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
d
f3 c6
McTvElpmFDp0TLSM+zN36HFYz8gwg3n/f8sVfHREacnc7i2NBMpLf1jbnmBcdjFIbOhotW90
42/yAD8AcyCqK6yoOHkhzAjJSiKrDjdoHI6kRQBH/htup5Hm8L93UJCEqs7xUVKFhkBxhAmU
eczTENPR3FjSLFjVnDSDAKRqAYx8LVx/n6ebTgsosVWZbFUhog==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LBAC_LABEL_LIST"

AS OPAQUE FIXED(39)
USING LIBRARY LBACSYS.lbac$lablt_libt
(
   STATIC FUNCTION new_lbac_label_list(policy_id IN PLS_INTEGER)
   RETURN lbac_label_list,
   PRAGMA RESTRICT_REFERENCES(new_lbac_label_list, RNDS, WNDS, RNPS, WNPS),
   MEMBER PROCEDURE put(SELF IN OUT lbac_label_list,
                             label IN lbac_label, pos IN PLS_INTEGER),
   PRAGMA RESTRICT_REFERENCES(put, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION get(SELF IN lbac_label_list, pos IN PLS_INTEGER)
   RETURN lbac_label,
   PRAGMA RESTRICT_REFERENCES(get, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION count(SELF IN lbac_label_list)
   RETURN PLS_INTEGER,
   PRAGMA RESTRICT_REFERENCES(count, RNDS, WNDS, RNPS, WNPS),
   MEMBER FUNCTION policy_id(SELF IN lbac_label_list)
   RETURN PLS_INTEGER,
   PRAGMA RESTRICT_REFERENCES(policy_id, RNDS, WNDS, RNPS, WNPS)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LDAP_ATTR_LIST" AS TABLE OF LBACSYS.LDAP_ATTR;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "LBACSYS"."LDAP_EVENT" wrapped
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
d
1b9 e7
GzZd8FOrhcixE0wm8NuUpXLxX1swgwL3r8sVynRAAPiOAEj0fxgZejKpGDVg8sSRSRm1YpER
ZbakuJK2vPlzBZtdKlQCIvzM2jl0UL8oYoirTTTNZsd5XTGZYBRCgNPXoaCYLNRNk5xYZ5sT
rRzbOiiVi5N9Mxxme1lQResHl6/V3MSo6WR8l5THEvxk1Pw01jKeWD6jtlfeBWt0XrTBHWIs
YnHfliAoTIQ=
/

