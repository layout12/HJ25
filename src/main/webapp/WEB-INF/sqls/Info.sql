DROP TABLE INFO;
DROP SEQUENCE INFOSEQ;

CREATE SEQUENCE INFOSEQ;
CREATE TABLE INFO(
I_ID VARCHAR2(50) PRIMARY KEY,
I_NAME VARCHAR2(50) NOT NULL,
I_ADDR VARCHAR2(255) NOT NULL,
I_DETAILADDR VARCHAR2(255) NOT NULL,
I_POSTNO VARCHAR2(50) NOT NULL
)

INSERT INTO INFO VALUES('123','test','test','test','123456')

INSERT INTO INFO VALUES('admin','admin','admin','admin','01012345678');
INSERT INTO INFO VALUES('test1','����Ϸ������Ե�����','����Ư���� �������� ����4�� 51-1','����Ϸ������Ե�����','07208');
INSERT INTO INFO VALUES('test2','GS25�þ������','����Ư���� �������� ����4�� 70','GS25�þ������','07208');
INSERT INTO INFO VALUES('test3','�����Ϸ��������','����Ư���� �������� ����4�� 197-1','�����Ϸ��������','07206');

delete from info where i_id='abc';
delete from info where i_id='abcd';
delete from info where i_id='qwe';
delete from info where i_id='zxc';
delete from info where i_id='��ǻ';
delete from info where i_id='test';
delete from info where i_id='test1';
delete from info where i_id='������';
delete from info where i_id='���';
delete from info where i_id='��������';


SELECT * FROM INFO

SELECT * FROM ORDERS JOIN GOODS USING(G_NO) WHERE O_DATE LIKE '18/01/23' || '%'