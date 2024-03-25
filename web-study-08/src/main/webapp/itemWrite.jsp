<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 테이블표 크기 800 생성 -->
<table width="800" border="1">
<tr>
<th>상품명</th><th>가격</th><th>상품설명</th>
</tr>
<%
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "select * from item";
	try{
		//1. 드라이브로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.데이터베이스 연결
		con = DriverManager.getConnection(url,"ezen","1234");
		//3.sql구문 전송및 실행결과rs가 참조
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		//4.데이터베이스값출력	
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString("name")+"</td>");
			out.println("<td>"+rs.getInt("price")+"</td>");
			out.println("<td>"+rs.getString("description")+"</td>");
			out.println("</tr>");			
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			//데이터베이스 경로닫기
			if(rs != null)rs.close();
			if(stmt != null)stmt.close();
			if(con != null)con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

%>
</table>

</body>
</html>