<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	response.setCharacterEncoding("utf-8");
		Enumeration paraEnum = request.getParameterNames();
		String userId = null, userPw=null, name=null, 
				addr=null, tel=null;
		while(paraEnum.hasMoreElements()){
			String n = (String)paraEnum.nextElement();
			userId = request.getParameter("id");
			userPw = request.getParameter("pwd");
			System.out.print("pwd"+userPw);
			name = request.getParameter("name");
			addr = request.getParameter("addr");
			tel = request.getParameter("tel"); 
		}
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url, id, pwd);
		String sql = "insert into member(id, pwd, name, addr, tel) values(?,?,?,?,?)";
		try{
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,userId);	ps.setString(2,userPw);
		ps.setString(3,name);	ps.setString(4,addr);
		ps.setString(5,tel);
		ps.executeUpdate();
		%>
		<script type="text/javascript">
		alert("회원가입 성공!")
		location.href = "../login.jsp"
		</script>
		<%}catch(Exception e){%>
			<script type="text/javascript">
		alert("회원가입 실패!")
		location.href = "register.jsp"
		</script>
		<%}
		%>
</body>
</html>