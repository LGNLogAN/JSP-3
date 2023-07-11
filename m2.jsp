<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>(과정평가형 정보처리산업기사) 자율좌석예약프로그램 Ver 2023</title>
<script type="text/javascript">
	function ccc(){
		if(document.frm2.resvno1.value.length == 0){
			alert("좌석예약번호를 입력해주세요 !")
			frm2.resvno1.focus();
			return false
		}
		success();
		return true;
	}
	function success(){
		alert("좌석예약번호가 입력되었습니다 !");
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<section>
			<h1>좌석예약조회</h1>
			<form name = "frm2" action="action2.jsp">
			<table border=1>
				<tr>
					<td>사원번호를 입력 하시오</td>
					<td><input type="text" name="resvno1"></td>
				</tr>
				<tr>
					<td colspan=2 style="text-align:center;">
						<input type="submit" value="좌석예약조회" onclick="return ccc();">
						<input type="submit" value="홈으로" onclick="window.location.href='index.jsp'; return false;">
					</td>
				</tr>
			</table>
			</form>
		</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>