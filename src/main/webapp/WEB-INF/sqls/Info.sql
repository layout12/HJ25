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
INSERT INTO INFO VALUES('test1','쎄븐일레븐양평롯데길점','서울특별시 영등포구 양평동4가 51-1','쎄븐일레븐양평롯데길점','07208');
INSERT INTO INFO VALUES('test2','GS25시양평로점','서울특별시 영등포구 양평동4가 70','GS25시양평로점','07208');
INSERT INTO INFO VALUES('test3','세븐일레븐양평점','서울특별시 영등포구 양평동4가 197-1','세븐일레븐양평점','07206');

delete from info where i_id='abc';
delete from info where i_id='abcd';
delete from info where i_id='qwe';
delete from info where i_id='zxc';
delete from info where i_id='ㅊ퓨';
delete from info where i_id='test';
delete from info where i_id='test1';
delete from info where i_id='ㅁㄴㅇ';
delete from info where i_id='쇼ㅕ';
delete from info where i_id='ㅂㄱㅈㄷ';


SELECT * FROM INFO

SELECT * FROM ORDERS JOIN GOODS USING(G_NO) WHERE O_DATE LIKE '18/01/23' || '%'