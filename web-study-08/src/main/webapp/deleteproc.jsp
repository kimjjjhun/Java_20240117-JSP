<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!	
Connection con = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
String username = "ezen";
String password = "1234";
String sql = "delete from member where userid = ?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		//1.드라이브 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.데이터베이스 연결
		con = DriverManager.getConnection(url,username,password);
		//3.sql전송
		pstmt = con.prepareStatement(sql);
		//4.매핑
		pstmt.setString(1,request.getParameter("id"));
		
		//5.sql 구문 실행
		pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			//경로닫기
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<h3>회원 삭제 성공</h3>
<a href="01_allMember.jsp">전체 회원 목록 보기</a>

</body>
</html>