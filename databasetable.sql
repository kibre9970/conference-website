create table empdetails(EMPID NUMBER,KEY VARCHAR2(10), AC_STATUS  VARCHAR2(1),
 DOJ VARCHAR2(10), USERID VARCHAR2(25))
/

create table addressbook(
NAME                                                           VARCHAR2(40),
 USERID                                                         VARCHAR2(20),
 DOB                                                            VARCHAR2(14),
 EMAIL                                                          VARCHAR2(40),
 PHONE                                                          VARCHAR2(16),
 CITY                                                           VARCHAR2(30),
 OUSERID                                                        VARCHAR2(25))
/
create table advices(
NAME                                                           VARCHAR2(50),
 PHONE                                                          VARCHAR2(14),
 EMPID                                                          VARCHAR2(6),
 ADDRESS                                                        VARCHAR2(40),
 MESSAGE                                                        VARCHAR2(500))
/

create table clientonline(
USERID                                                         VARCHAR2(25),
 ROOMNAME                                                       VARCHAR2(20),
 DATEOFLOG                                                      VARCHAR2(25),
 TIMEOFLOG                                                      VARCHAR2(25))
/
create table  mail(
USERID                                                         VARCHAR2(25),
 WHOSEND                                                        VARCHAR2(25),
 MESSAGE                                                        LONG,
 TIMING                                                         VARCHAR2(50),
 READ                                                           CHAR(1),
 SUBJECT                                                        VARCHAR2(25))
/


create table  password(
USERID                                                         VARCHAR2(25),
 PWD                                                            VARCHAR2(20),
 BAN                                                            VARCHAR2(1))
/


create table roomdetails(
ROOMNAME                                                       VARCHAR2(25),
 RIN                                                                       VARCHAR2(20),
 MODERATOR                                                    VARCHAR2(25))
/

create table userdetails(
USERID                                                         VARCHAR2(25),
 NAME                                                           VARCHAR2(60),
 ADDRESS                                                        VARCHAR2(120),
 ZIP                                                            VARCHAR2(6),
 PHONE                                                          VARCHAR2(12),
 EMAIL                                                          VARCHAR2(50),
 SEX                                                            VARCHAR2(1),
 EDUCATION                                                      VARCHAR2(30),
 COUNTRY                                                        VARCHAR2(25),
 CITY                                                           VARCHAR2(20),
 STATE                                                          VARCHAR2(25),
 DOB                                                            VARCHAR2(12))
/

create table security(
USERID                                                         VARCHAR2(25),
 QUES                                                           VARCHAR2(100),
 ANS                                                            VARCHAR2(50))
/
