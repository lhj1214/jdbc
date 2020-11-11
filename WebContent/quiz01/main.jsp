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
	String name = request.getParameter("name");
	String sql = "select * from STUDENT where 이름='"+name+"'";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String num = rs.getString("학번"),korean = rs.getString("국어"), english = rs.getString("영어"),
		math = rs.getString("수학");%>
		<h1>인적 사항</h1>
		<h3>학번 : <%= num %></h3>
		<h3>이름 : <%= name %></h3>
		<h3>국,영,수 : <%= korean %>,<%= english %>,<%= math %></h3>
	<%}
	%>
	<script>
		function back(){
			location.href = "score.jsp"
		}
	</script>
	<button type="button" onclick="back()">뒤로</button>
</body>
</html>