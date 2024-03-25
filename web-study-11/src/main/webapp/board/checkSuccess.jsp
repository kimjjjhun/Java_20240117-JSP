<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
if(window.name == 'update'){
	window.opener.parent.location.href="BoardServlet?command=board_update_form&num=${param.num}";
}else if(window.name == 'delete'){
	window.opener.parent.location.href="BoardServlet?command=board_delete_form&num=${param.num}";
	alert("삭제되었습니다.");
}
	window.close();
</script>

</body>
</html>