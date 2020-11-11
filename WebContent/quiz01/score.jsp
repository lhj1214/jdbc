<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	String sql = "select * from STUDENT";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	%>
	<table border="1">
		<tr>
			<th>학번</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th>
		</tr>
		<%		
		while(rs.next()){
			String num = rs.getString("학번"), name = rs.getString("이름"),
			korean = rs.getString("국어"), english = rs.getString("영어"),
			math = rs.getString("수학");
			//session.setAttribute(name, value);
			%>
			<tr>
				<td><% out.print(num); %></td>
				<td><a href="main.jsp?name=<%=name %>"><% out.print(name); %></a></td>
				<td><% out.print(korean); %></td>
				<td><% out.print(english); %></td>
				<td><% out.print(math); %></td>
			</tr>
		<% }
		%>
	</table>
</body>
</html>