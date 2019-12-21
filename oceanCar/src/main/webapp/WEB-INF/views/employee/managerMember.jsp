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

<title>마스터 회원 관리</title>

<!-- Styles -->
<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
	am4core
			.ready(function() {

				// Themes begin
				am4core.useTheme(am4themes_animated);
				// Themes end

				// Create chart instance
				var chart = am4core.create("chartdiv", am4charts.XYChart);

				// Add data
				chart.data = [
						{
							"name" : "John",
							"points" : 35654,
							"color" : chart.colors.next(),
						},{
							"name" : "james",
							"points" : 35654,
							"color" : chart.colors.next(),
						},{
							"name" : "alisa",
							"points" : 35654,
							"color" : chart.colors.next(),
						}
						
				];

				// Create axes
				var categoryAxis = chart.xAxes
						.push(new am4charts.CategoryAxis());
				categoryAxis.dataFields.category = "name";
				categoryAxis.renderer.grid.template.disabled = true;
				categoryAxis.renderer.minGridDistance = 30;
				categoryAxis.renderer.inside = true;
				categoryAxis.renderer.labels.template.fill = am4core
						.color("#fff");
				categoryAxis.renderer.labels.template.fontSize = 20;

				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
				valueAxis.renderer.grid.template.strokeDasharray = "4,4";
				valueAxis.renderer.labels.template.disabled = true;
				valueAxis.min = 0;

				// Do not crop bullets
				chart.maskBullets = false;

				// Remove padding
				chart.paddingBottom = 0;

				// Create series
				var series = chart.series.push(new am4charts.ColumnSeries());
				series.dataFields.valueY = "points";
				series.dataFields.categoryX = "name";
				series.columns.template.propertyFields.fill = "color";
				series.columns.template.propertyFields.stroke = "color";
				series.columns.template.column.cornerRadiusTopLeft = 15;
				series.columns.template.column.cornerRadiusTopRight = 15;
				series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/b]";

				// Add bullets
				var bullet = series.bullets.push(new am4charts.Bullet());
				var image = bullet.createChild(am4core.Image);
				image.horizontalCenter = "middle";
				image.verticalCenter = "bottom";
				image.dy = 20;
				image.y = am4core.percent(100);
				image.propertyFields.href = "bullet";
				image.tooltipText = series.columns.template.tooltipText;
				image.propertyFields.fill = "color";
				image.filters.push(new am4core.DropShadowFilter());

			}); // end am4core.ready()
</script>



</head>

<body id="page-top">

	<div id="wrapper">
		<jsp:include page="../fixSection/menuLayout.jsp" />
		<jsp:include page="../fixSection/header.jsp" />
		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- HTML -->
			
			<!-- class="mb-4" style="width:150px; height:150px; display:inline-block;" -->
			<div  id="chartdiv"></div>
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
			<p class="mb-4">
				DataTables is a third party plugin that is used to generate the demo
				table below. For more information about DataTables, please visit the
				<a target="_blank" href="https://datatables.net">official
					DataTables documentation</a>.
			</p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">회원 리스트</h6>
					<!-- 오프 set 이동시켜준다 -->
					<!-- <div class="row" style="margin-top: 10px;">
						<div class=".col-auto">
							<a class="btn btn-info btn-icon-split"> <span class="text"
								style="color: white;" id="reg">회원등록</span></a> <a
								style="margin-left: 5px; margin-right: 5px;"
								class="btn btn-success btn-icon-split"> <span id="dis"
								class="text" style="color: white;">분배하기</span></a> <a
								class="btn btn-danger btn-icon-split"> <span class="text"
								style="color: white;">삭제하기</span></a>

							<div style="display: inline-block; margin-left: 100px;">
								총회원수 : <span id="TOTAL"></span> 배치된수 : <span id="MM"></span>
								배정되지 않은수: <span id="NULLT"></span>
							</div>
						</div>
					</div> -->
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover display"
							id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>회원 아이디</th>
									<th>회원이름</th>
									<th>폰번호</th>
									<th>가입일</th>
									<!-- <th>수정일</th> -->
									<th>진행상태</th>
									<th>발주유무</th>
									<th>메모</th>
									<th>담당직원</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memberList}" var="member">
									<tr class="row_table">
										<td><c:out value="${member.m_num}" /></td>
										<td><c:out value="${member.m_name}" /></td>
										<td><c:out value="${member.phone}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${member.reg_date}" /></td>
										<%-- <td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${member.update_date}" /></td> --%>
										<td><c:out value="${member.m_state}" /></td>
										<td><c:out value="${member.m_order}" /></td>
										<td><c:out value="${member.memo}" /></td>
										<td><c:out value="${member.e_id}" /></td>
									</tr>
								</c:forEach>
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

			// 상세보기 , table init
			var table = $("#dataTable").DataTable({
				"fnRowCallback" : function(row, data, dataIndex) {
					console.log(row);
					if (data[8] == '') {
						$(row).css("color", "#9F81F7");
					}
				},
				"bDestroy" : true
			});

			// 회원 정보 상세보기
			$('#dataTable tbody').on(
					'click',
					'tr',
					function() {

						console.log($(this));

						var data = table.row(this).data();

						$(this).css("color", "#F78181");

						console.table(data);
						var mData = data[0];

						window.open("/common/memberChild?mData=" + mData,
								"memberFind", "width=1000,height=800");

					});
		})
	</script>
</body>
</html>