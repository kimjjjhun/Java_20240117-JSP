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
	String sql = "insert into item values(?,?,?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//한글로 인코딩 한글깨짐방지
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	String description = request.getParameter("description");
	
	try{                         //오류가 생길수있기에 try문을 사용
		//1.드라이브로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.데이터베이스연결
		con = DriverManager.getConnection(url,username,password);
		//3. sql문장 전송
		pstmt = con.prepareStatement(sql);
		//4.매핑
		pstmt.setString(1,name); // sql문자 전송으로 가져온 값들 중 pstmt에 name값 저장 
		pstmt.setInt(2, price);  // sql문자 전송으로 가져온 값들 중 pstmt에 price값 저장
		pstmt.setString(3,description); // sql문자 전송으로 가져온 값들 중 pstmt에 description값 저장
		//5.sql구문 실행
		int result = pstmt.executeUpdate(); // pstmt값을 db에 update 목록 추가
	}catch(Exception e){                    // 예외처리 catch문 사용
		e.printStackTrace();                // 예외처리시 무슨오류인지 확인
	}finally{                               
		try{
			if(pstmt != null)pstmt.close(); // 사용했던 pstmt 입출구를 닫음
			if(con != null)con.close();     // 사용했던 con 입출구를 닫음
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<h2>상품입력완료</h2>                          <!-- 위에 java실행이 끝나고 처리가 되면 아래 html실행 -->
<a href="itemWrite.jsp">전체상품보기</a>       <!-- itemWrite.jsp로 이동하는 버튼생성 -->
</body>
</html>