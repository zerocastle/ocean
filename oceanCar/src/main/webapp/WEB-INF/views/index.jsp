<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ocean car</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="./fixSection/menuLayout.jsp" />
		<jsp:include page="./fixSection/header.jsp" />
		
		<!-- 메인 컨텐츠  -->
		<jsp:include page="./floatSection/allFluid.jsp" />
		
		<jsp:include page="./fixSection/footer.jsp" />
	</div>
</body>

</html>
