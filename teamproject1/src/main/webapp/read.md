# DB

create table member(
usernum number(10) NOT NULL PRIMARY KEY,
admin number(1) NOT NULL,
name varchar2(10) NOT NULL,
userid varchar2(20) NOT NULL UNIQUE,
pwd varchar2(30) NOT NULL,
email varchar2(30) NOT NULL,
phone varchar2(14) NOT NULL,
address varchar2(100) NOT NULL);


create SEQUENCE member_seq start with 1 increment by 1;

commit;


# 커넥션풀

<Resource name="jdbc/myoracle" auth="Container"
type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
username="test" password="test" maxTotal="20" maxIdle="10"
maxWaitMillis="-1"/>