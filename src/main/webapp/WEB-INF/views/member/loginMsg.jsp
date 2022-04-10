<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/msg.jsp</title>
</head>
<body>
<script type="text/javascript">
	alert("'${sessionScope.nickname}'님 반갑습니다.");
	location.href='${pageContext.request.contextPath }/main';
</script>
</body>
</html>