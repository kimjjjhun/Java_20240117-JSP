<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>정보 입력 폼</h2>
<form action="itemWriteResult.jsp">
<table>
	<tr>
	<td>상품명</td>
			<td><input type="text"name="name" size="20"></td>
	</tr>
	<tr>
	<td>가격</td>
			<td><input type="text"name="price" size="20"></td>
	</tr>
	<tr>
	<td>상품설명</td>
			<td><input type="text"name="description" size="20"></td>
	<tr>
            <td><input type="submit" value="전송"></td>
	</tr>
</table>
</form>
</body>
</html>