<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/shopping.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div id="wrap" align="center">
<h1>정보 등록</h1>
<form enctype="multipart/form-data" method="post" name="frm"> 
   <table>
      <tr>
         <th> 제  목 </th>
         <td><input type="text" name="title" size="60"></td>
      </tr> 
      <tr>
        <th> 가  격  </th>
        <td><input type="text" name="price"  size="60"> 원</td>
      </tr>
      <tr>
        <th> 감  독  </th>
        <td><input type="text" name="director" size="60"></td>
      </tr>
      <tr>
        <th> 배  우  </th>
        <td><input type="text" name="actor" size="60"></td>
      </tr>
      <tr>
         <th> 설  명 </th> 
         <td><textarea cols="70" rows="10" name="synopsis"></textarea></td>
      </tr>
      <tr>
         <th> 사 진</th>
         <td>
            <input type="file" name="poster" ><br>
        </td>
      </tr>  
   </table>
   <br>
   <input type="submit" value="확인"  onclick="return productCheck()">
   <input type="reset" value="취소">
   <input type="button" value="목록" onclick="location.href='movieList.do'" >
</form>
</div>
</body>
</html>