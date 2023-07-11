<%@page import="java.text.BreakIterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>(과정평가형 정보처리산업기사) 자율좌석예약프로그램 Ver 2023</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<section>
	<%
				String resvno1 = request.getParameter("resvno1");
	
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection
							("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					String sql =" select ke.empno , ke.empname , substr(kr.resvdate,1,4)||'년'||substr(kr.resvdate,4,2)||'월'||substr(kr.resvdate,7,2)||'일' date1," +
								" ks.seatno , ks.office , ks.callno" +
								" from kw_resv_2023 kr , kw_seat_2023 ks , kw_emp_2023 ke" +
								" where kr.empno = '"+ resvno1+ "' and ke.empno = kr.empno and ks.seatno = kr.seatno";
						
					ResultSet rs = stmt.executeQuery(sql);
						
					if(rs.next()){
						%>
						<h1>사원번호 : <%= request.getParameter("resvno1") %> 의 좌석예약조회</h1>
						<table border=1>
							<tr>
								<td style="text-align:center;">사원번호</td>
								<td style="text-align:center;">이름</td>
								<td style="text-align:center;">근무일자</td>
								<td style="text-align:center;">좌석번호</td>
								<td style="text-align:center;">좌석위치</td>
								<td style="text-align:center;">내선번호</td>
							</tr>
							<%
						do{
							out.print("<tr><td style=\"text-align:center;\">"+ rs.getString("empno"));
							out.print("</td><td style=\"text-align:center;\">"+ rs.getString("empname"));
							out.print("</td><td style=\"text-align:center;\">"+ rs.getString("date1"));
							out.print("</td><td style=\"text-align:center;\">"+ rs.getString("seatno"));
							out.print("</td><td style=\"text-align:center;\">"+ rs.getString("office"));
							out.print("</td><td style=\"text-align:center;\">"+ rs.getString("callno")+"</tr></td>");
						}while(rs.next());
						%>
						</table><br>
						<%

					}else{
						%> <h1 style="font-size:35px; font-family: bold;">좌석예약정보가 존재하지않습니다.</h1> <%
					}
						%>
						<div style="text-align:center;">
							<button onclick="window.location.href='m2.jsp'">돌아가기</button>
						</div>
						<%
					}catch (Exception e){
						e.printStackTrace();
					}
			
			 %>
		</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>