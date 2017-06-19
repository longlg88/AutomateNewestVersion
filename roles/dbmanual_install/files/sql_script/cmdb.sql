///////////////////////////////////////////////////

CREATE TABLE CMDB_META (
	CI_TYPE VARCHAR(100 BYTE) Primary key,
	CI_PATH VARCHAR(200 BYTE) unique not null,
	CI_PROPERTY CLOB,
	CI_PROPERTY_TEMP VARCHAR(4000 BYTE),
	IS_PUBLISH VARCHAR(1 BYTE)
)


///////////////////////////////////////////////////

CREATE TABLE CMDB_BASE (
	CI_ID NUMBER not null,
	CI_TYPE VARCHAR(100 BYTE) not null,
	CI_PATH VARCHAR(1000 BYTE) not null
)


///////////////////////////////////////////////////

CREATE TABLE CMDB_RELATIONSHIP_TYPE (
	RELATIONSHIP_TYPE_ID VARCHAR2(100 BYTE) PRIMARY KEY NOT NULL,
	FROM_CI_TYPE VARCHAR(100 BYTE),
	TO_CI_TYPE VARCHAR(100 BYTE),
	MAPPING_CONDITION VARCHAR(1000 BYTE),
	R_NAME VARCHAR(100 BYTE),
	R_I_NAME VARCHAR(100 BYTE)
)

////////////////////////////////////////////////////


CREATE SEQUENCE R_SEQ_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 99999999
CYCLE 
CACHE 20
NOORDER ;

////////////////////////////////////////////////

CREATE SEQUENCE R_T_SEQ_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 99999999
CYCLE 
CACHE 20
NOORDER ;

///////////////////////////////////////////////////


CREATE SEQUENCE SEQ_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
CYCLE 
CACHE 20
NOORDER ;

/////////////////////////////////////////////////

commit;
exit;
