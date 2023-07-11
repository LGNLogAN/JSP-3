<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action.jsp</title>
</head>
<body>
	<%
		String resvno = request.getParameter("resvno");
		String empno = request.getParameter("empno");
		String resvdate = request.getParameter("resvdate");
		String seatno = request.getParameter("seatno");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			String sql = "insert into kw_resv_2023 values('"+resvno+"','"+empno+"','"+resvdate+"','"+seatno+"')";
			
			stmt.executeUpdate(sql);
			response.sendRedirect("index.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>
</body>
</html>