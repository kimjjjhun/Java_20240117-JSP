<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	//문자열을 정수로 변환
	int age = Integer.parseInt(request.getParameter("age"));
%>	
<%	
	if(age<=19){
%>	
     <!-- 자바스크립트,css가 있는경우 중간에 닫고 입력 -->
        <script type="text/javascript">
		alert("19세 미만은 입장 불가능");
		history.go(-1);
		</script>
<% 	
	}else{
		request.setAttribute("name","홍길동");
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("05_forwardResult.jsp");
		dispatcher.forward(request, response);
	}
	
%>
	
	int bs = Integer.parseInt(request.getParameter("bs"));

	
	if(bs<90){
%>	
		<script type="text/javascript">
		alert("90년생 미만은 입장 불가능");
		history.back?();
		</script>

	}else{
		request.setAttribute("bs","김정훈");
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("05_forwardResult.jsp");
		dispatcher.forward(request, response);
 
</body>
</html>