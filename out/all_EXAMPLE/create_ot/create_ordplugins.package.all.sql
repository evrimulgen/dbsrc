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

