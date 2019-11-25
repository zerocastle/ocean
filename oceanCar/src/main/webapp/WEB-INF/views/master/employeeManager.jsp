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
<title>직원들관리</title>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="../fixSection/menuLayout.jsp" />
		<jsp:include page="../fixSection/header.jsp" />
		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">직원들관리</h1>
			<p class="mb-4">
				DataTables is a third party plugin that is used to generate the demo
				table below. For more information about DataTables, please visit the
				<a target="_blank" href="https://datatables.net">official
					DataTables documentation</a>.
			</p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">직원 리스트</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Start date</th>
									<th>Salary</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->


		<!-- 메인 끝나는 부분 -->
		<jsp:include page="../fixSection/footer.jsp" />

	</div>

	<script>
		$(function() {
			$("#dataTable").DataTable({
				destroy : true,
				columns : [

				{
					"id" : 1,
					"name" : "서울"
				},

				{
					"id" : 2,
					"name" : "경기도"
				},

				{
					"id" : 3,
					"name" : "충청남도"
				},

				{
					"id" : 4,
					"name" : "충청북도"
				},

				{
					"id" : 5,
					"name" : "전라남도"
				},

				{
					"id" : 6,
					"name" : "전라북도"
				},

				{
					"id" : 7,
					"name" : "경상남도"
				},

				{
					"id" : 8,
					"name" : "경상북도"
				},

				{
					"id" : 9,
					"name" : "강원도"
				},

				{
					"id" : 10,
					"name" : "제주도"
				},

				{
					"id" : 99,
					"name" : "해외"
				}

				]
			})
		})
	</script>

</body>
</html>