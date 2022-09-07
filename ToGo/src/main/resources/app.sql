CREATE DATABASE TOGO;


CREATE TABLE ToGo.ADMINS(ADMIN_ID VARCHAR(100) PRIMARY KEY, PROFILE_PICTURE BLOB, FIRST_NAME VARCHAR(100), LAST_NAME VARCHAR(100), EMAIL VARCHAR(200));
CREATE TABLE ToGo.STUDENTS(STUDENT_ID VARCHAR(100) PRIMARY KEY, PROFILE_PICTURE BLOB, FIRST_NAME VARCHAR(100), LAST_NAME VARCHAR(100), GENDER VARCHAR(25),EMAIL VARCHAR(200));
CREATE TABLE ToGo.FACULTYS(FACULTY_ID VARCHAR(100) PRIMARY KEY, PROFILE_PICTURE BLOB, FIRST_NAME VARCHAR(100), LAST_NAME VARCHAR(100), GENDER VARCHAR(25), EMAIL VARCHAR(200), DESIGNATION VARCHAR(200));

CREATE TABLE ToGo.CLASSROOMS(ROOM_NO INT AUTO_INCREMENT PRIMARY KEY, ROOM_ID VARCHAR(50), FACULTY_ID VARCHAR(100), COURSE_NAME VARCHAR(200), COURSE_SECTION VARCHAR(50), CREATE_TIME VARCHAR(200));
CREATE TABLE ToGo.STUDENT_REQUESTS(REQUEST_ID INT AUTO_INCREMENT PRIMARY KEY, STUDENT_ID VARCHAR(100), ROOM_ID VARCHAR(50), REQUEST_TIME VARCHAR(200));
CREATE TABLE ToGo.STUDENT_REGISTERS(REGISTRATION_ID INT AUTO_INCREMENT PRIMARY KEY, ROOM_ID VARCHAR(50), STUDENT_ID VARCHAR(100));
CREATE TABLE ToGo.TASKS(TASK_ID INT AUTO_INCREMENT PRIMARY KEY, ROOM_ID VARCHAR(50), TASK_TITLE VARCHAR(500), TASK_DETAILS VARCHAR(15000), START_TIME VARCHAR(200),END_TIME VARCHAR(200),POST_TIME VARCHAR(200),STATUS VARCHAR(50));
CREATE TABLE ToGo.SUBMIT_TASKS(SUBMIT_ID INT AUTO_INCREMENT PRIMARY KEY,TASK_ID VARCHAR(50), STUDENT_ID VARCHAR(100),STUDENT_NAME VARCHAR(200), TASK VARCHAR(15000), SUBMITTED_TIME VARCHAR(200));

create table togo.users(
                           username varchar(100) primary key,
                           email varchar(200),
                           password varchar(500),
                           post varchar(50),
                           enabled boolean
);
/*
create table togo.authorities (
                                  username varchar(50),
                                  authority varchar(50),
                                  constraint fk_authorities_users foreign key(username) references users(username)
);
create unique index ix_auth_username on authorities (username,authority);
*/











SELECT * FROM TOGO.ADMINS;
SELECT * FROM TOGO.STUDENTS;
SELECT * FROM TOGO.FACULTIES;
SELECT * FROM TOGO.ALL_USERS;
SELECT * FROM TOGO.CLASSROOMS;
SELECT * FROM TOGO.STUDENT_REQUESTS;
SELECT * FROM TOGO.STUDENT_REGISTERS;
SELECT * FROM ToGo.TASKS;
SELECT * FROM ToGo.SUBMIT_TASKS;


DROP TABLE TOGO.ADMINS;
DROP TABLE TOGO.STUDENTS;
DROP TABLE TOGO.FACULTIES;
DROP TABLE TOGO.ALL_USERS;
DROP TABLE TOGO.CLASSROOMS;
DROP TABLE TOGO.STUDENT_REQUESTS;
DROP TABLE TOGO.STUDENT_REGISTERS;
DROP TABLE ToGo.TASKS;
DROP TABLE ToGo.SUBMIT_TASKS;


TRUNCATE TABLE TOGO.ADMINS;
TRUNCATE TABLE TOGO.STUDENTS;
TRUNCATE TABLE TOGO.FACULTIES;
TRUNCATE TABLE TOGO.ALL_USERS;
TRUNCATE TABLE TOGO.CLASSROOMS;
TRUNCATE TABLE TOGO.STUDENT_REQUESTS;
TRUNCATE TABLE TOGO.STUDENT_REGISTERS;
TRUNCATE TABLE ToGo.TASKS;
TRUNCATE TABLE ToGo.SUBMIT_TASKS;



/*

CREATE TABLE ToGo.ALL_USERS(USER_ID VARCHAR(50) PRIMARY KEY, PASSWORD VARCHAR(20), POST VARCHAR(200));



INSERT INTO TOGO.ADMINS VALUES("TO-ADMIN-GO", NULL, "SYSTEM", "ADMINISTRATOR", "niloykantipaul.aiub@gmail.com");
INSERT INTO TOGO.ALL_USERS VALUES("TO-ADMIN-GO", "niloykantipaul.aiub@gmail.com", "ADad<2020>", "ADMIN");
*/



INSERT INTO TOGO.ADMINS VALUES("TO-ADMIN-GO", NULL, "SYSTEM", "ADMINISTRATOR", "niloykantipaul.aiub@gmail.com");
INSERT INTO TOGO.users VALUES("TO-ADMIN-GO","niloykantipaul.aiub@gmail.com", "ADad<2020>",  "ADMIN", 1);
INSERT INTO TOGO.authorities VALUES("TO-ADMIN-GO", "ADMIN");




