<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.do" method="post">
   <table align="center">
      <tr>
         <td colspan="2" align="center"> 로그인</td>
      </tr>
      <tr>
         <td align="center">아이디</td>
         <!-- test하기위해 벨류값 입력 작성 후 삭제-->
         <td><input type="text" name="id" value="admin"></td>
      </tr>
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="pwd" value="1111"></td>
      </tr>
      <tr>
         <td align="center">레벨</td>
         <td><select name="lev">
            <option value = "A">운영자</option>
            <option value = "B">일반회원</option>
         </select></td>
      </tr>
      <tr align="center">
         <td colspan="2">
            <input type="submit" value="로그인">
            <input type="reset" value="취소">
         </td>
      </tr>         
   </table>
	<div style="color:red; text-align: center;">${message}</div>
</form>
</body>
</html>