DROP SM_OBJECT;
DROP SM_PERMISSION;
DROP SM_ROLE;
DROP SM_ROLE_PERMISSION;
DROP SM_USER;
DROP SM_USER_ROLE;
DROP SM_ISSUER;
DROP SM_ROLE_HIERARCHY;

CREATE TABLE AUTH.SM_OBJECT (
   OBJECT_ID VARCHAR(31 BYTE),
   OBJECT_NAME VARCHAR(31 BYTE),
   OBJECT_TYPE VARCHAR(150 BYTE),
   OBJECT_SYS_ID VARCHAR(150 BYTE)
);

CREATE TABLE AUTH.SM_PERMISSION (
   ID VARCHAR(31 BYTE),
   OBJECT_TYPE VARCHAR(1023 BYTE),
   OBJECT_ID VARCHAR(1023 BYTE),
   ACTION VARCHAR(31 BYTE),
   OBJECT_SYS_ID VARCHAR(150 BYTE),
   OBJECT_NAME VARCHAR(31 BYTE)
);

CREATE TABLE AUTH.SM_ROLE (
   ROLE_ID VARCHAR(31 BYTE),
   DESCRIPTION VARCHAR(1023 BYTE),
   ROLE_NAME VARCHAR(121 BYTE)
);

CREATE TABLE AUTH.SM_ROLE_PERMISSION (
   ROLE_ID VARCHAR(31 BYTE),
   PERMISSION_ID VARCHAR(330 BYTE)
);

CREATE TABLE AUTH.SM_USER (
   USER_ID VARCHAR(31 BYTE),
   PASSWD VARCHAR(31 BYTE)
);

CREATE TABLE AUTH.SM_USER_ROLE (
   USER_ID VARCHAR(31 BYTE),
   ROLE_ID VARCHAR(330 BYTE)
);

CREATE TABLE AUTH.SM_ISSUER (
	IS_NAME VARCHAR(31 BYTE),
	IS_TYPE VARCHAR(31 BYTE),
	IS_SECRET VARCHAR(31 BYTE)
);

CREATE TABLE AUTH.SM_ROLE_HIERARCHY (
	PARENT_ID VARCHAR(30 BYTE),
	CHILD_ID VARCHAR(30 BYTE)
);

COMMIT;
EXIT;
