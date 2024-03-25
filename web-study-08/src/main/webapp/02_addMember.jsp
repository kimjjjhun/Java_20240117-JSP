<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String username = "ezen";
	String password = "1234";
	String sql = "insert into member values(?,?,?,?,?,?)";
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String admin = request.getParameter("admin");
	
	try{
		//1.드라이브 로드
		Class.forName("oracle.jdbc.driver.oracleDriver");
		//2.데이터베이스 연결
		con = DriverManager.getConnection(url,username,password);
		//3. sql문장 전송
		pstmt = con.prepareStatement(sql);
		//4. 매핑
		pstmt.setString(1,name);
		pstmt.setString(2,userid);
		pstmt.setString(3,pwd);
		pstmt.setString(4,email);
		pstmt.setString(5,phone);
		pstmt.setInt(6,Integer.parseInt(admin));
		//5.sql구문 실행
		int result = pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
		//6.경로닫기
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

%>
<h3>회원 가입 성공</h3>
<a href="01_allMember.jsp">전체 회원 목록 보기</a>
</body>
</html>