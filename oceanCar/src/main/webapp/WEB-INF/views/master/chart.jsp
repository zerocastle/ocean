<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>월 매출액</title>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="../fixSection/menuLayout.jsp" />
		<jsp:include page="../fixSection/header.jsp" />

		<!-- Begin Page Content -->
		<div class="container-fluid">
			<h1>월별 매출</h1>
			<div id="lineChart"></div>
		</div>

		<!-- 메인 끝나는 부분 -->
		<jsp:include page="../fixSection/footer.jsp" />

	</div>
</body>
<script>
	$(function() {
		var labels = new Array();
		var data = new Array();
		
		var chart = ${chart};
		
		console.log(chart);
		
		new Morris.Line({
			//↓---필수 값(무조건 있어야 함)----↓
			element : 'lineChart', //div id값이 lineChart인 곳에 차트를 그린다.
			data : chart,
			xkey : 'MTH',
			ykeys : [ 'SUMP' ],
			labels : [ 'SUMP' ],
			//↑---필수 값(무조건 있어야 함)----↑
			lineColors : [ '#5F735E' ],
			pointSize : 10
		});
	})
</script>
</html>