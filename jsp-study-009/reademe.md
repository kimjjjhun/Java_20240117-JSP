
CREATE TABLE EMPLOYEES(
  id VARCHAR2(10) NOT NULL,
  pass VARCHAR2(10) NOT NULL,
  NAME VARCHAR2(24),
  lev char(1) DEFAULT 'A',
  enter DATE,
  gender CHAR(1) DEFAULT '1',
  phone  VARCHAR2(30),
  PRIMARY KEY(id)
);
INSERT INTO EMPLOYEES
VALUES('admin','1111','정운영','A',TO_DATE('2014/04/17','yy/mm/dd'), '1', '010-1111-1111');
INSERT INTO EMPLOYEES
VALUES('subin','2222','전수빈','B',TO_DATE('2014/04/17','yy/mm/dd'), '2', '010-2222-2222');
INSERT INTO EMPLOYEES
VALUES('pinksung','3333','성윤정','A',TO_DATE('2014/04/17','yy/mm/dd'), '2', '010-2222-2222');


commit;