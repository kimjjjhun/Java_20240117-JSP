<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="800" border="1">
	<tr>
		<th>이름</th><th>아이디</th><th>암호</th>
		<th>이메일</th><th>전화번호</th><th>권한(1:관리자, 0:일반회원)</th>
	</tr>
	<%
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		Connection con= null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from member";
		try{
			//1. 드라이브 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. 데이터베이스 연결
			con = DriverManager.getConnection(url, "ezen", "1234");
			//3. sql구문 전송및 실행 결과를 rs가 참조
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			//4. 데이터베이스 값 출력	
			 while(rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString("name")+"</td>");
				out.println("<td>"+rs.getString("userid")+"</td>");
				out.println("<td>"+rs.getString("pwd")+"</td>");
				out.println("<td>"+rs.getString("email")+"</td>");
				out.println("<td>"+rs.getString("phone")+"</td>");
				out.println("<td>"+rs.getInt("admin")+"</td>");
				out.println("</tr>");
			}
			/* 	while(rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getInt(6)+"</td>");
				out.println("</tr>");
			} */
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			//데이터베이스 사용하고나선 닫아주기
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