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
	<%//삭제 시 계정 삭제...DB에서도...
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp", pwd = "1234";
	Connection con = DriverManager.getConnection(url, id, pwd);
	String sql = "delete from member where id = '"+session.getAttribute("id")+"'";
	//로그인된 아이디 정보 DB에서 삭제
	PreparedStatement ps = con.prepareStatement(sql);
	try{
		ps.executeUpdate();
		session.invalidate();
		%>
		<script type="text/javascript">
		alert("계정이 삭제되었습니다")
		location.href = "login.jsp"
		</script>
	<%}catch(Exception e){
		System.out.println("db삭제 실패");
	}	
	%>
</body>
</html>