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

<Resource auth="Container"
                  driverClassName="oracle.jdbc.OracleDriver" maxIdle="10"
                  maxTotal="20" maxWaitMillis="-1" name="jdbc/myoracle"
                  password="test" type="javax.sql.DataSource"
                  url="jdbc:oracle:thin:@192.168.0.22:1521:xe" username="test" />