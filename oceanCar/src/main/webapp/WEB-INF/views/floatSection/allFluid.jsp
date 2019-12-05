<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Begin Page Content -->

<link href='/resources/fullcalendar-4.3.1/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-4.3.1/packages/daygrid/main.css'
	rel='stylesheet' />
<script src='/resources/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.3.1/packages/daygrid/main.js'></script>



<script>
	$(function() {
		// page is now ready, initialize the calendar...

		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid' ],
			header : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			defaultDate : '2019-08-12',
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [ {} ]
		});

		calendar.render();
	});
</script>


<div class="container-fluid">

	<!-- Page Heading -->
	<!-- 랭킹 시스템 -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">실적 왕</h1>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">Earnings
								(Annual)</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 실적 리스트 -->

	<!-- Content Row -->
	<div class="row">
		<div id='calendar'></div>
	</div>

</div>
<!-- /.container-fluid -->

