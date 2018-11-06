CREATE USER "ORDPLUGINS" IDENTIFIED BY VALUES 'S:81D66E1BF8077D9F638007121A2C1444FE8ECE145CD4015804581028A259;H:DAC1D3EB79A327F87C59B9E0CB349969;T:CEFD2D41636FCE0970ECD68AE25F8CDAD80BB17BF6C5B298F79D03AC7DF54139320CBC2C19D9E242C77C15F771294BD66D71503243D1963D227372D1A7367D9551AD76F548AE1F07DC14BDE73EA4489A;88A2B2C183431F00'
      DEFAULT TABLESPACE "SYSAUX"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

ALTER USER "ORDPLUGINS" DEFAULT ROLE ALL;
CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORDPLUGINS"."ORDX_HTTP_SOURCE"
authid current_user
AS

  -- functions/procedures
  FUNCTION processCommand(
                    obj  IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx  IN OUT RAW,
                    cmd  IN VARCHAR2,
                    arglist IN VARCHAR2,
                    result  OUT RAW)
           RETURN RAW;

  PROCEDURE import( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx      IN OUT RAW,
                    mimetype OUT VARCHAR2,
                    format   OUT VARCHAR2);

  PROCEDURE import( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx      IN OUT RAW,
                    dlob     IN OUT NOCOPY BLOB,
                    mimetype OUT VARCHAR2,
                    format   OUT VARCHAR2);

  PROCEDURE importFrom( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                        ctx      IN OUT RAW,
                        mimetype OUT VARCHAR2,
                        format   OUT VARCHAR2,
                        loc      IN VARCHAR2,
                        name     IN VARCHAR2);

  PROCEDURE importFrom( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                        ctx      IN OUT RAW,
                        dlob     IN OUT NOCOPY BLOB,
                        mimetype OUT VARCHAR2,
                        format   OUT VARCHAR2,
                        loc      IN VARCHAR2,
                        name     IN VARCHAR2);

  PROCEDURE export( obj  IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx  IN OUT RAW,
                    dlob IN OUT NOCOPY BLOB,
                    loc  IN VARCHAR2,
                    name IN VARCHAR2);

  FUNCTION  getContentLength(obj  IN ORDSYS.ORDSource,
                             ctx  IN OUT RAW)
            RETURN INTEGER;
  -- TRUST added to enable use of new UTL_HTTP API
  PRAGMA RESTRICT_REFERENCES(getContentLength, WNDS, WNPS, RNDS, RNPS, TRUST);

  FUNCTION  getSourceAddress(obj  IN ORDSYS.ORDSource,
                             ctx  IN OUT RAW,
                             userData IN VARCHAR2)
            RETURN VARCHAR2;
  PRAGMA RESTRICT_REFERENCES(getSourceAddress, WNDS, WNPS, RNDS, RNPS);

  FUNCTION open(obj IN OUT NOCOPY ORDSYS.ORDSource,
                userArg IN RAW,
                ctx OUT RAW) RETURN INTEGER;
  FUNCTION close(obj IN OUT NOCOPY ORDSYS.ORDSource,
                 ctx IN OUT RAW) RETURN INTEGER;
  FUNCTION trim(obj    IN OUT NOCOPY ORDSYS.ORDSource,
                       ctx IN OUT RAW,
                       newlen IN INTEGER) RETURN INTEGER;

  PROCEDURE read(obj      IN OUT NOCOPY ORDSYS.ORDSource,
                 ctx      IN OUT RAW,
                 startPos IN INTEGER,
                 numBytes IN OUT INTEGER,
                 buffer   OUT RAW);

  PROCEDURE write(obj      IN OUT NOCOPY ORDSYS.ORDSource,
                  ctx      IN OUT RAW,
                  startPos IN INTEGER,
                  numBytes IN OUT INTEGER,
                  buffer   IN RAW);

END ORDX_HTTP_SOURCE;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORDPLUGINS"."ORDX_FILE_SOURCE"
authid current_user
AS

  -- functions/procedures
  FUNCTION processCommand(
                    obj  IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx  IN OUT RAW,
                    cmd  IN VARCHAR2,
                    arglist IN VARCHAR2,
                    result  OUT RAW)
           RETURN RAW;

  PROCEDURE import( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx      IN OUT RAW,
                    mimetype OUT VARCHAR2,
                    format   OUT VARCHAR2);

  PROCEDURE import( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx      IN OUT RAW,
                    dlob     IN OUT NOCOPY BLOB,
                    mimetype OUT VARCHAR2,
                    format   OUT VARCHAR2);

  PROCEDURE importFrom( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                        ctx      IN OUT RAW,
                        mimetype OUT VARCHAR2,
                        format   OUT VARCHAR2,
                        loc      IN VARCHAR2,
                        name     IN VARCHAR2);

  PROCEDURE importFrom( obj      IN OUT NOCOPY ORDSYS.ORDSource,
                        ctx      IN OUT RAW,
                        dlob     IN OUT NOCOPY BLOB,
                        mimetype OUT VARCHAR2,
                        format   OUT VARCHAR2,
                        loc      IN VARCHAR2,
                        name     IN VARCHAR2);

  PROCEDURE export( obj  IN OUT NOCOPY ORDSYS.ORDSource,
                    ctx  IN OUT RAW,
                    slob IN OUT NOCOPY BLOB,
                    loc  IN VARCHAR2,
                    name IN VARCHAR2);

  FUNCTION  getContentLength(obj  IN ORDSYS.ORDSource,
                             ctx  IN OUT RAW)
            RETURN INTEGER;
  PRAGMA RESTRICT_REFERENCES(getContentLength, WNDS, WNPS, RNDS, RNPS);

  FUNCTION  getSourceAddress(obj  IN ORDSYS.ORDSource,
                             ctx  IN OUT RAW,
                             userData IN VARCHAR2)
            RETURN VARCHAR2;
  PRAGMA RESTRICT_REFERENCES(getSourceAddress, WNDS, WNPS, RNDS, RNPS);

  FUNCTION open(obj IN OUT NOCOPY ORDSYS.ORDSource,
                userArg IN RAW,
                ctx OUT RAW) RETURN INTEGER;
  FUNCTION close(obj IN OUT NOCOPY ORDSYS.ORDSource,
                 ctx IN OUT RAW) RETURN INTEGER;
  FUNCTION trim(obj    IN OUT NOCOPY ORDSYS.ORDSource,
                       ctx IN OUT RAW,
                       newlen IN INTEGER) RETURN INTEGER;

  PROCEDURE read(obj      IN OUT NOCOPY ORDSYS.ORDSource,
                 ctx      IN OUT RAW,
                 startPos IN INTEGER,
                 numBytes IN OUT INTEGER,
                 buffer   OUT RAW);

  PROCEDURE write(obj      IN OUT NOCOPY ORDSYS.ORDSource,
                  ctx      IN OUT RAW,
                  startPos IN INTEGER,
                  numBytes IN OUT INTEGER,
                  buffer   IN RAW);

END ORDX_FILE_SOURCE;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORDPLUGINS"."ORDX_DEFAULT_AUDIO"
authid current_user
AS

  --AUDIO ATTRIBUTES ACCESSORS
  PROCEDURE setProperties(ctx IN OUT RAW,
                          obj IN OUT NOCOPY ORDSYS.ORDAudio,
                          setComments IN NUMBER := 0);
  FUNCTION checkProperties(ctx IN OUT RAW, obj IN OUT NOCOPY ORDSYS.ORDAudio)
                   RETURN NUMBER;

  FUNCTION  getAttribute(ctx IN OUT RAW,
                         obj IN ORDSYS.ORDAudio,
                         name IN VARCHAR2) RETURN VARCHAR2;
  -- must return name=value; name=value; ...  pairs
  PROCEDURE getAllAttributes(ctx IN OUT RAW,
                             obj IN ORDSYS.ORDAudio,
                             attributes IN OUT NOCOPY CLOB);

  -- AUDIO PROCESSING METHODS
  FUNCTION  processCommand(
                                 ctx       IN OUT RAW,
                                 obj       IN OUT NOCOPY ORDSYS.ORDAudio,
                                 cmd       IN VARCHAR2,
                                 arguments IN VARCHAR2,
                                 result OUT RAW)
             RETURN RAW;

  PRAGMA RESTRICT_REFERENCES(getAttribute, WNDS, WNPS, RNDS, RNPS);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORDPLUGINS"."ORDX_DEFAULT_VIDEO"
authid current_user
AS


  --VIDEO ATTRIBUTES ACCESSORS
  FUNCTION  getAttribute(ctx IN OUT RAW,
                         obj IN ORDSYS.ORDVideo,
                         name IN VARCHAR2) RETURN VARCHAR2;

  PROCEDURE setProperties(ctx IN OUT RAW,
                          obj IN OUT NOCOPY ORDSYS.ORDVideo,
                          setComments IN NUMBER := 0);
  FUNCTION checkProperties(ctx IN OUT RAW,obj IN OUT NOCOPY ORDSYS.ORDVideo)
  RETURN NUMBER;

  -- must return name=value; name=value; ...  pairs
  PROCEDURE getAllAttributes(ctx IN OUT RAW,
                             obj IN ORDSYS.ORDVideo,
                             attributes IN OUT NOCOPY CLOB);

  -- VIDEO PROCESSING METHODS
  FUNCTION  processCommand(
                                 ctx       IN OUT RAW,
                                 obj       IN OUT NOCOPY ORDSYS.ORDVideo,
                                 cmd       IN VARCHAR2,
                                 arguments IN VARCHAR2,
				 result OUT RAW)
             RETURN RAW;
  PRAGMA RESTRICT_REFERENCES(getAttribute, WNDS, WNPS, RNDS, RNPS);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORDPLUGINS"."ORDX_DEFAULT_DOC"
authid current_user
AS

  PROCEDURE setProperties(ctx IN OUT RAW, obj IN OUT NOCOPY ORDSYS.ORDDoc,
			setComments IN NUMBER := 0);

END;
/

GRANT EXECUTE ON "ORDPLUGINS"."ORDX_HTTP_SOURCE" TO PUBLIC;
GRANT EXECUTE ON "ORDPLUGINS"."ORDX_DEFAULT_DOC" TO PUBLIC;
GRANT EXECUTE ON "ORDPLUGINS"."ORDX_DEFAULT_VIDEO" TO PUBLIC;
GRANT EXECUTE ON "ORDPLUGINS"."ORDX_DEFAULT_AUDIO" TO PUBLIC;
GRANT EXECUTE ON "ORDPLUGINS"."ORDX_FILE_SOURCE" TO PUBLIC;
