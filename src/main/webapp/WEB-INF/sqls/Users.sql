DROP TABLE USERS;
DROP SEQUENCE USERSSEQ;

CREATE SEQUENCE USERSSEQ;
CREATE TABLE USERS(
U_ID VARCHAR2(50) UNIQUE NOT NULL,
U_NO NUMBER PRIMARY KEY,
I_ID VARCHAR2(50) REFERENCES INFO(I_ID),
U_NAME VARCHAR2(30) NOT NULL,
U_PW VARCHAR2(50) NOT NULL,
U_ADDR VARCHAR2(255) NOT NULL,
U_PHONE VARCHAR2(100) UNIQUE NOT NULL,
U_GRADE VARCHAR2(30) NOT NULL,
U_ENABLED VARCHAR2(3) NOT NULL,
U_EMAIL VARCHAR2(50) UNIQUE NOT NULL,
CONSTRAINT USERS_ENABLED CHECK(U_ENABLED IN ('Y','N'))
);

INSERT INTO USERS VALUES('123',USERSSEQ.NEXTVAL,'admin','admin','admin','test','test','ADMIN','Y','test@test.com');

select * from users;

delete from users where u_no=9;
delete from users where u_no=13;
delete from users where u_no=7;
delete from users where u_no=8;
delete from users where u_no=15;
delete from users where u_no=6;
delete from users where u_no=5;
delete from users where u_no=11;
delete from users where u_no=10;
SELECT *FROM USERS