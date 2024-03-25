#커넥션 풀
<Resource name="jdbc/myoracle" auth="Container"
type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
username="ezen" password="1234" maxTotal="20" maxIdle="10"
maxWaitMillis="-1"/>

#DB
create table board( 
num NUMBER(5) primary key, 
pass VARCHAR2(30) not null,
name VARCHAR2(30) not null, 
email VARCHAR2(30), 
title VARCHAR2(50), 
content VARCHAR2(1000), 
readcount NUMBER(4) DEFAULT 0, 
writedate date default sysdate 
);

create SEQUENCE board_seq start with 1 increment by 1;

insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '성윤정', 'pink@name.com', '1234', '첫방문', '반갑습니다');

insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '전수빈', 'spring@name.com', '1234', '맛있어요', '반갑습니다');

insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '전원지', 'react@name.com', '1234', '일식', '반갑습니다');

insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '조조', 'java@name.com', '1234', '삼국지', '반갑습니다');

insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '관우', 'javascript@name.com', '1234', '적토마', '반갑습니다');

select * from board;
commit;

#DB연결구문
Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();