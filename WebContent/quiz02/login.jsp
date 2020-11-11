<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="check.jsp" method="post">
		<input type="text" placeholder="아이디 입력" name="id"><br>
		<input type="text" placeholder="비밀번호 입력" name="pwd"><br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='register/register.jsp'">
	</form>
</body>
</html>