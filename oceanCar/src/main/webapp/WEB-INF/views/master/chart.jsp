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
		new Morris.Line({
			//↓---필수 값(무조건 있어야 함)----↓
			element : 'lineChart', //div id값이 lineChart인 곳에 차트를 그린다.
			data : [ {
				"total" : 70000,
				"mth1" : "18-09-09"
			}, {
				"total" : 130000,
				"mth1" : "18-10-09"
			}, {
				"total" : 100000,
				"mth1" : "18-11-09"
			}, {
				"total" : 230025,
				"mth1" : "18-12-09"
			}, {
				"total" : 18937,
				"mth1" : "18-12-10"
			}, {
				"total" : 51039,
				"mth1" : "18-12-11"
			}, {
				"total" : 37950,
				"mth1" : "18-12-12"
			}, {
				"total" : 16255,
				"mth1" : "18-12-13"
			},{
				"total" : 70000000,
				"mth1" : "20-11-18"
			} ],
			xkey : 'mth1',
			ykeys : [ 'total' ],
			labels : [ '총 매출' ],
			//↑---필수 값(무조건 있어야 함)----↑
			lineColors : [ '#5F735E' ],
			pointSize : 10
		});
	})
</script>
</html>