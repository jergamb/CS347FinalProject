-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-04-16 21:38:11 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE NL_Admin CASCADE CONSTRAINTS ;

DROP TABLE NL_Document CASCADE CONSTRAINTS ;

DROP TABLE NL_Mem_List CASCADE CONSTRAINTS ;

DROP TABLE NL_Member CASCADE CONSTRAINTS ;

DROP TABLE NL_User CASCADE CONSTRAINTS ;

CREATE TABLE NL_Admin
  (
    NL_User_user_id     INTEGER ,
    NL_Member_member_id INTEGER
  ) ;

CREATE TABLE NL_Document
  (
    document_id   INTEGER NOT NULL ,
    filename      VARCHAR2 (4000) ,
    file_mimetype VARCHAR2 (512) ,
    file_charset  VARCHAR2 (512) ,
    file_data BLOB ,
    file_comments       VARCHAR2 (4000) ,
    tags                VARCHAR2 (4000) ,
    NL_Member_member_id INTEGER
  ) ;
ALTER TABLE NL_Document ADD CONSTRAINT NL_Document_PK PRIMARY KEY ( document_id ) ;

CREATE TABLE NL_Mem_List
  (
    NL_Member_member_id  INTEGER ,
    NL_Member_member_id1 INTEGER
  ) ;

CREATE TABLE NL_Member
  (
    member_id               INTEGER NOT NULL ,
    name                    VARCHAR2 (4000) ,
    NL_User_user_id         INTEGER ,
    description             VARCHAR2 (4000) ,
    ownership_division_code VARCHAR2 (4) ,
    external_view_name      VARCHAR2 (50) ,
    status_eff_date         DATE ,
    status                  VARCHAR2 (1) ,
    type                    VARCHAR2 (255)
  ) ;
CREATE UNIQUE INDEX NL_Member__IDX ON NL_Member
  (
    NL_User_user_id ASC
  )
  ;
  ALTER TABLE NL_Member ADD CONSTRAINT NL_Member_PK PRIMARY KEY ( member_id ) ;

CREATE TABLE NL_User
  (
    user_id             INTEGER NOT NULL ,
    NL_Member_member_id INTEGER ,
    name                VARCHAR2 (30) ,
    lab                 VARCHAR2 (4) ,
    division            VARCHAR2 (4) ,
    status              VARCHAR2 (1) ,
    status_eff_date     DATE ,
    type                VARCHAR2 (255)
  ) ;
CREATE UNIQUE INDEX NL_User__IDX ON NL_User
  (
    NL_Member_member_id ASC
  )
  ;
  ALTER TABLE NL_User ADD CONSTRAINT NL_User_PK PRIMARY KEY ( user_id ) ;

ALTER TABLE NL_Admin ADD CONSTRAINT NL_Admin_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_Admin ADD CONSTRAINT NL_Admin_NL_User_FK FOREIGN KEY ( NL_User_user_id ) REFERENCES NL_User ( user_id ) ;

ALTER TABLE NL_Document ADD CONSTRAINT NL_Document_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_Mem_List ADD CONSTRAINT NL_Mem_List_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_Mem_List ADD CONSTRAINT NL_Mem_List_NL_Member_FKv1 FOREIGN KEY ( NL_Member_member_id1 ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_Member ADD CONSTRAINT NL_Member_NL_User_FK FOREIGN KEY ( NL_User_user_id ) REFERENCES NL_User ( user_id ) ;

ALTER TABLE NL_User ADD CONSTRAINT NL_User_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             2
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
