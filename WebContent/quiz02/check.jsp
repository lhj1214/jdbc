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
	//id가 문자형(한글, 영어 등)이므로 '' 꼭 넣어줘야 함, 숫자는 안 붙여도 됨
	System.out.println(id);
	System.out.println(pwd);
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();//성공적으로 들오면 rs에 값이 들어옴
	if(!rs.next()){//해당 아이디 없음
			System.out.println("fail");%>
		<script type="text/javascript">
			alert("일치하는 아이디가 없습니다.")
			location.href = "login.jsp";//jsp문법 response.sendRedirect를 사용하면 script보다 먼저 작용해서 alert 뜨지 않음
		</script>
	<%}else{//해당 아이디 있음	
		if( pwd.equals(rs.getString("pwd")) ){//DB를 통해 아이디 확인은 마쳤으므로 비밀번호만 확인하면 됨
			session.setAttribute("id", rs.getString("id"));
			session.setAttribute("name", rs.getString("name"));
			response.sendRedirect("main.jsp"); %>
			<% 
		}else{//입력한 비밀번호와 등록된 비밀번호 다른 경우
			System.out.println("fail");%>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.")
				location.href = "login.jsp";
			</script>			
		<%}
	}%>	
</body>
</html>