<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	span{ display:inline-block; width:80px; text-align:right; }
</style>
</head>
<body>
	<%
	if(session.getAttribute("name")!=null){//로그인 상태
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url, id, pwd);
		String userid = (String)session.getAttribute("id");
		String sql = "select * from member where id='"+userid+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		//여기에 if(rs.next())문으로 해당 아이디가 있는지 확인
	%>
	<h1>회원 정보 수정 및 삭제</h1>
	<form action = "modifyInfo.jsp" method="post">
	<%while(rs.next()){ %>
	<span>아이디 : </span><input type="text" name="id" value="<% out.print(rs.getString("id")); %>"><br>
	<span>비밀번호 : </span><input type="text" name="pwd" value="<%= rs.getString("pwd") %>"><br>
	<span>이름 : </span><input type="text" name="name" value="<%= rs.getString("name") %>"><br>
	<span>주소 : </span><input type="text" name="addr" value="<%= rs.getString("addr") %>"><br>
	<span>전화번호 : </span><input type="text" name="tel" value="<%= rs.getString("tel") %>"><br>
	<%}%>		
	<input type="submit" value="수정">
	<input type="button" onclick="location.href='deleteInfo.jsp'" value="삭제">
	</form>
	<%}else{//로그인 안된 상태%>
		<script>
		alert("로그인 먼저 진행하셔야 합니다")
		location.href="login.jsp"
		</script>
	<%}%>
</body>
</html>