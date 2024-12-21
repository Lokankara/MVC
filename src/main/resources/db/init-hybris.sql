SELECT name FROM v$pdbs;
ALTER SESSION SET CONTAINER = XEPDB1;

alter pluggable database XEPDB1 open;
alter database mount;
alter database open;

CREATE USER hybris IDENTIFIED BY password;
GRANT CONNECT TO hybris;
GRANT CONNECT, RESOURCE, DBA TO hybris;
GRANT CREATE SESSION, GRANT ANY PRIVILEGE TO hybris;
GRANT UNLIMITED TABLESPACE TO hybris;
ALTER DATABASE DATAFILE '/opt/oracle/oradata/XE/XEPDB1/system01.dbf' AUTOEXTEND
ON NEXT 128M MAXSIZE 16G;
CREATE USER HYBRISINTEGRATION IDENTIFIED BY hybItegration;
GRANT create session TO HYBRISINTEGRATION;
GRANT create table TO HYBRISINTEGRATION;
GRANT create view TO HYBRISINTEGRATION;
GRANT create any INDEX TO HYBRISINTEGRATION;
GRANT create any procedure TO HYBRISINTEGRATION;
GRANT EXECUTE ANY PROCEDURE TO HYBRISINTEGRATION;
ALTER USER "HYBRISINTEGRATION" QUOTA UNLIMITED ON "SYSTEM";
CREATE TABLE HYBRISINTEGRATION.price_feed_view
( "ACCOUNTUID" VARCHAR2(24 BYTE),
"PRODUCTCODE" VARCHAR2(28 BYTE),
"STARTDATE" VARCHAR2(32 BYTE),
"ENDDATE" VARCHAR2(32 BYTE),
"SPECIALPRICECD" VARCHAR2(4 BYTE),
"CONTRACTLEADID" VARCHAR2(32 BYTE),
"CONTRACTPROPERPRICE" VARCHAR2(36 BYTE),
"CONTRACTBIDPRICE" VARCHAR2(36 BYTE),
"RETAILGROSSPCT" VARCHAR2(24 BYTE),
"RETAILPRICE" VARCHAR2(32 BYTE),
"RETAILPRICETYPECD" VARCHAR2(4 BYTE),
"CONTRACTMINORDERQTY" VARCHAR2(8 BYTE),
"REGULARPRICE" VARCHAR2(28 BYTE),
"PROMOPRICE" VARCHAR2(36 BYTE),
"PROMOEXPDATE" VARCHAR2(32 BYTE),
"CONTRACTLEADNAME" VARCHAR2(72 BYTE),
"CONTRACTTYPECD" VARCHAR2(8 BYTE),
"CONTRACTPRIORITYNBR" VARCHAR2(8 BYTE)
) ;
GRANT SELECT ON HYBRISINTEGRATION.PRICE_FEED_VIEW TO hybris;


select version from v$instance;
SELECT * FROM v$version;
-- show SESSIONS parameters
show parameter SESSIONS;
-- show PROCESSES parameters
show parameter PROCESSES;
-- active and inactive sessions
select status, count(1) as connectionCount from V$SESSION group by status;
-- show tablespace status
select * from dba_data_files;