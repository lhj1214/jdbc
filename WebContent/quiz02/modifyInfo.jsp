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
	response.setCharacterEncoding("utf-8"); 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp", pwd = "1234";
	Connection con = DriverManager.getConnection(url, id, pwd);
	id = (String)session.getAttribute("id");
	String sql = "update member set (id, pwd, name, addr, tel) = (?,?,?,?,?)";
	try{
	PreparedStatement ps = con.prepareStatement(sql);
	out.print(request.getAttribute("id"));
	ps.setString(1,(String)request.getAttribute("id"));	
	ps.setString(2,(String)request.getAttribute("pwd"));
	ps.setString(3,(String)request.getAttribute("name"));	
	ps.setString(4,(String)request.getAttribute("addr"));
	ps.setString(5,(String)request.getAttribute("tel"));
	ps.executeUpdate();
	response.sendRedirect("main.jsp");
	}catch(Exception e){%>
		<script type="text/javascript">alert("Aaa")</script>
		<%
	}
	%>
	
</body>
</html>