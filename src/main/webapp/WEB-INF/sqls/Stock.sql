--���
DROP TABLE STOCK;
DROP SEQUENCE STOCKSEQ;

CREATE SEQUENCE STOCKSEQ;
CREATE TABLE STOCK(
S_NO NUMBER PRIMARY KEY,
I_ID VARCHAR2(50) REFERENCES INFO(I_ID) NOT NULL,
G_NO NUMBER REFERENCES GOODS(G_NO) NOT NULL,
S_AMT NUMBER NOT NULL
)

INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',10,100)

INSERT INTO STOCK VALUES(123,'test',123,123)
select * from stock;
SELECT * FROM STOCK JOIN GOODS USING(G_NO) WHERE I_ID='admin';
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'admin',1,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'admin',2,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'admin',3,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'admin',4,0);
DELETE FROM STOCK WHERE I_ID='admin' AND G_NO=3;



SELECT * FROM STOCK JOIN GOODS USING(g_no) WHERE I_ID='test1';
UPDATE STOCK SET S_AMT=80 WHERE g_no=10
DELETE FROM STOCK WHERE S_NO=1;
SELECT * FROM STOCK JOIN GOODS USING(G_NO) WHERE I_ID='test1';

INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',1,1);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',2,2);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',3,7);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',4,9);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',5,6);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',6,5);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',7,3);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',8,7);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',9,8);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',10,6);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',11,5);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'user01',12,0);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',13,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',14,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',15,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',16,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',17,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',18,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',19,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',20,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',21,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',22,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',23,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',24,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',25,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',26,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',27,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',28,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',29,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',30,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',31,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',32,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',33,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',34,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',35,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',36,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',37,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',38,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',39,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',40,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',41,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',42,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',43,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',44,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',45,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',46,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',47,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',48,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',49,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',50,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',51,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',52,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',53,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',54,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',55,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',56,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',57,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',58,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',59,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',60,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',61,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',62,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',63,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',64,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',65,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',66,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',67,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',68,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',69,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',70,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',71,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',72,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',73,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',74,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',75,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',76,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',77,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',78,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',79,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',80,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',81,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',82,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',83,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',84,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',85,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',86,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',87,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',88,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',89,100);
INSERT INTO  STOCK VALUES(STOCKSEQ.NEXTVAL,'test1',90,100);