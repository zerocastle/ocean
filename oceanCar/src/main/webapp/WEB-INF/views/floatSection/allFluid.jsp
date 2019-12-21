<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Begin Page Content -->

<!-- <link href='/resources/fullcalendar-4.3.1/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-4.3.1/packages/daygrid/main.css'
	rel='stylesheet' />
<script src='/resources/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.3.1/packages/daygrid/main.js'></script> -->


<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.2.0/main.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.2.0/main.js"></script>

<!-- interaction plugin must be included after core -->
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@4.2.0/main.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.2.0/main.min.css"
	rel="stylesheet" />
	
	
<script src="/resources/calendar/a.js"></script>

<script>
	$(function() {
		// page is now ready, initialize the calendar...

		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale : "ko",
			plugins : [ 'interaction', 'dayGrid' ],
			header : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			navLinks : false, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			selectHelper : true,
			selectable : true,
			dateClick : function(start, end, allDay) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			events : [ {
				title : 'Event1',
				start : '2019-12-24'
			}, {
				title : 'Event2',
				start : '2019-12-25'
			} ],
			color : 'yellow', // an option!
			textColor : 'black' // an option!
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
		<c:forEach items="${employee}" var="employee">
			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-success text-uppercase mb-1">${employee.e_id }</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">${employee.payment }</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>

	<!-- 실적 리스트 -->

	<!-- Content Row -->
	<div class="row">
		<div id='calendar'></div>
	</div>

</div>
<!-- /.container-fluid -->

