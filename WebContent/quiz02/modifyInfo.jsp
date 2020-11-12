<%@page import="java.util.Enumeration"%>
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
	if(session.getAttribute("name")!=null){
		response.setCharacterEncoding("utf-8"); 	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url, id, pwd);
		id = (String)session.getAttribute("id");
	try{
		/*String sql = "delete from member where id='"+id+"'";// 처음에는 기존 정보 삭제하고 다시 넣었음
		PreparedStatement ps = con.prepareStatement(sql);
		ps.executeUpdate();
		sql = "insert into member(id, pwd, name, addr, tel) values(?,?,?,?,?)"; //새로 집어넣음*/
		String sql = "update member set pwd=?, name=?, addr=?, tel=? where id=?"; //=> 수정용..
		PreparedStatement ps = con.prepareStatement(sql);
		ps = con.prepareStatement(sql);
		ps.setString(1,request.getParameter("pwd"));	ps.setString(2,request.getParameter("name"));
		ps.setString(3,request.getParameter("addr"));	ps.setString(4,request.getParameter("tel"));
		ps.setString(5,request.getParameter("id"));
		ps.executeUpdate();
		session.setAttribute("id", request.getParameter("id"));//name관련 세션도 변경해주기..
		session.setAttribute("name", request.getParameter("name"));
		response.sendRedirect("main.jsp");
	}catch(Exception e){%>
		<script type="text/javascript">alert("error!!")</script>
		<%}
	}else{%>
		<script type="text/javascript">
		alert("로그인 먼저 진행하셔야 합니다")
		location.href="login.jsp"
		</script>
	<%}%>
	
</body>
</html>