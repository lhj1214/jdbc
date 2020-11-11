<%@page import="java.sql.*"%>
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
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp", pwd = "1234";
	Connection con = DriverManager.getConnection(url, id, pwd);
	id = (String)session.getAttribute("id");
	System.out.println(id);
	String sql = "select * from member where id='"+id+"'";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	%>
	<h1>회원 정보 수정 및 삭제</h1>
	<form action = "modifyInfo.jsp" method="post">
	<%while(rs.next()){ %>
	<span>아이디:</span><input type="text" name="id" value="<% out.print(rs.getString("id")); %>"><br>
	<span>비밀번호:</span><input type="text" name="pwd" value="<% out.print(rs.getString("pwd")); %>"><br>
	<span>이름:</span><input type="text" name="name" value="<% out.print(rs.getString("name")); %>"><br>
	<span>주소:</span><input type="text" name="addr" value="<% out.print(rs.getString("addr")); %>"><br>
	<span>전화번호:</span><input type="text" name="tel" value="<% out.print(rs.getString("tel")); %>"><br>
	<%} %>
	<input type="submit" value="수정">
	<input type="button" onclick="location.href='deleteInfo.jsp'" value="삭제">
	</form>
</body>
</html>