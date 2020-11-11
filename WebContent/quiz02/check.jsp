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

	id = request.getParameter("id");
	pwd = request.getParameter("pwd");
	String sql = "select id, pwd, name from member where id='"+id+"'";
	System.out.println(id);
	System.out.println(pwd);
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	if(!rs.next()){%>
		System.out.println("fail");
		<script type="text/javascript">
			alert("일치하는 아이디가 없습니다.")
			location.href = "login.jsp";
		</script>
	<%}else{
	
		System.out.println("rs");
		out.print(rs.getString("id"));
		if( id.equals(rs.getString("id")) && pwd.equals(rs.getString("pwd")) ){
			session.setAttribute("id", rs.getString("id"));
			session.setAttribute("name", rs.getString("name"));
			response.sendRedirect("main.jsp"); %>
			<% 
		}else{%>
			System.out.println("fail");
			<script type="text/javascript">
				alert("일치하는 아이디가 없습니다.")
				location.href = "login.jsp";
			</script>
			<%
		}

	}
	%>
	
</body>
</html>