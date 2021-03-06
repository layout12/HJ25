DROP TABLE ORDERS;
DROP SEQUENCE ORDERSSEQ;

CREATE SEQUENCE ORDERSSEQ;
CREATE TABLE ORDERS(
O_NO NUMBER PRIMARY KEY,
I_ID VARCHAR2(50) REFERENCES INFO(I_ID) NOT NULL,
G_NO NUMBER REFERENCES GOODS(G_NO) NOT NULL,
O_AMT NUMBER NOT NULL,
O_DATE DATE NOT NULL
)

INSERT INTO ORDERS VALUES(ORDERSSEQ.NEXTVAL,'admin',10,100,sysdate)

SELECT * FROM ORDERS JOIN GOODS USING(G_NO) WHERE CT_NO=10
SELECT * FROM ORDERS JOIN GOODS USING(G_NO) WHERE I_ID='admin'
SELECT * FROM ORDERS JOIN GOODS USING(G_NO) WHERE G_NAME='케이준치킨샌드'
SELECT * FROM ORDERS JOIN GOODS USING(G_NO) WHERE O_DATE LIKE '18/01/23'||'%'
SELECT * FROM ORDERS JOIN GOODS USING(G_NO) WHERE O_DATE LIKE '18/01/23' || '%'

UPDATE ORDERS SET G_NO=10, O_AMT=90
SELECT * FROM ORDERS
SELECT *FROM GOODS
INSERT INTO ORDERS VALUES(ORDERSSEQ.NEXTVAL,'admin',20,100,SYSDATE)
delete from orders where o_date LIKE TO_CHAR(SYSDATE,'YY/MM/DD')||'%';

drop table asd;
create table asd(
asd varchar2(50)
)
select *from asd
insert into asd values(TO_CHAR(SYSDATE,'YY/MM/DD'));
SELECT * FROM(SELECT ROWNUM AS RN,A.B_NO,A.U_ID,A.B_TITLE,A.B_CONTENT,A.B_DATE,A.B_HITS FROM
(SELECT ROWNUM,B_NO,U_ID,B_TITLE,B_CONTENT,B_DATE,B_HITS FROM BOARD ORDER BY B_NO DESC)A
WHERE ROWNUM <=1*10)
WHERE 1*10-9 <=RN









