<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="main.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var message = "<%= request.getAttribute("message") %>";
if(message && message.trim() !== "" && message !== "null") {
    alert(message);
}
</script>
 <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
    <script>
      $(function(){
        $('.menu > li').mouseenter(function(){
          $(this).find('.sub').stop().fadeIn();
        }).mouseleave(function(){
          $('.sub').stop().hide();
        }) ;
      });
    </script>
</head>
<body>
<header>
<form action="logout.do">
	<table border="1">
		<tr>
			<td class="center-text"; align="center"><p id="greeting" align="center"
			><b>${loginUser.name}</b>님</p>환영합니다.</td>
		</tr>
		 <tr class="button-container">
			<td colspan="2">
				<input type="submit" value="로그아웃">&nbsp;&nbsp;&nbsp;
				<input type="button" value="회원정보수정" 
				onclick="location.href='memberUpdate.do?userid=${loginUser.userid}'">
				</tr>
		 <tr class="button-container">
		 	<td colspan="2">
				<input type="button" value="작성게시글"
				onclick="location.href='board.do?userid=${loginUser.userid}'">
				<input type="submit" value="회원탈퇴">
				</td>
				</tr>
		 <tr class="button-container">
		 	<td colspan="2">
				<input type="button" value="찜목록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글쓰기"
				onclick="location.href='board.do?userid=${loginUser.userid}'">
				</td>
				</tr>
		 <tr class="button-container">
		 	<td colspan="2">
				<input type="submit" value="문의하기">&nbsp;&nbsp;&nbsp;
				</td>
				</tr>
	</table>
</form>
<script>
const pEl = document.querySelector("#greeting"); // 노드 선택
// 1초마다 toggle 메서드 반복 실행
setInterval(function(){
  pEl.classList.toggle("red-color"); 
},  1000);
</script>
</header>
    <nav>
      <ul class="menu">
        <li><a href="#">BOARD</a>
        <ul class="sub">
          <li><a href="#">???</a></li>
          <li><a href="#">???</a></li>
          <li><a href="#">???</a></li>
          </ul>
        </li>
        <li><a href="#">WATCH</a>
          <ul class="sub">
            <li><a href="#">??</a></li>
            <li><a href="#">??</a></li>
            <li><a href="#">??</a></li>
          </ul>
        </li>
        <li><a href="#">찜목록</a>
          <ul class="sub">
            <li><a href="#">??</a></li>
            <li><a href="#">??</a></li>
            <li><a href="#">??</a></li>
          </ul>
        </li>
      </ul>
    </nav>
</body>
</html>