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
			<h1>부서별근무일수집계</h1>
			<table border=1>
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>부서명</td>
					<td>근무일수</td>
				</tr>
				<%
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection
								("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						
						String sql = " select ke.empno , ke.empname,"+
									 " case ke.deptcode "+
									 " when '10' then '영업팀'" +
									 " when '20' then '총무팀'" +
									 " when '30' then '구매팀'" +
									 " end as ang , " +
									 " ke.position " +
									 " from kw_emp_2023 ke " +
									 " group by ke.empno,ke.empname,ke.deptcode,ke.position " +
									 " order by ke.deptcode ASC";
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							out.print("<tr><td>"+rs.getString("empno"));
							out.print("</td><td>"+rs.getString("empname"));
							out.print("</td><td>"+rs.getString("ang"));
							out.print("</td><td>"+rs.getString("position")+"</td></tr>");
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				
				%>
			</table>
		</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>