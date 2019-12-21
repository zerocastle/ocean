<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/calendar/a.js"></script>
<link href="/resources/calendar/b.css" rel="stylesheet">
<script>
	$(document).ready(
			// 켈린더 영역
			function() {
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();

				var caVo = ${calendar};
				console.log(caVo);
				for (var i = 0; i < caVo.length; i++) {
					caVo[i].start = new Date(caVo[i].start.time);
				}
				console.log(caVo);
				/*  className colors
				
				className: default(transparent), important(red), chill(pink), success(green), info(blue)
				
				 */

				/* initialize the external events
				-----------------------------------------------------------------*/

				$('#external-events div.external-event').each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});

				/* initialize the calendar
				-----------------------------------------------------------------*/

				var calendar = $('#calendar').fullCalendar(
						{
							header : {
								left : 'title',
								center : 'agendaDay,agendaWeek,month',
								right : 'prev,next today'
							},
							editable : true,
							firstDay : 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
							selectable : true,
							defaultView : 'month',

							axisFormat : 'h:mm',
							columnFormat : {
								month : 'ddd', // Mon
								week : 'ddd d', // Mon 7
								day : 'dddd M/d', // Monday 9/7
								agendaDay : 'dddd d'
							},
							titleFormat : {
								month : 'MMMM yyyy', // September 2009
								week : "MMMM yyyy", // September 2009
								day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
							},
							allDaySlot : false,
							selectHelper : true,
							locale : "ko",
							select : function(start, end, allDay) {
								var title = prompt('Event Title:');
								if (title) {
									var mo = calendar.fullCalendar(
											'renderEvent', {
												title : title,
												start : start,
												end : end,
												allDay : allDay
											}, true // make the event "stick"
									);
									console.log(title + '' + start + '' + end
											+ '' + allDay);
									console.log(mo);
									//momo
									var insertData = {
										"start" : start,
										"title" : title
									};
									promise_function(insertData).then(
											getListFunction);

								}
								calendar.fullCalendar('unselect');
							},
							droppable : true, // this allows things to be dropped onto the calendar !!!
							drop : function(date, allDay) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = $(this).data(
										'eventObject');

								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = allDay;

								// render the event on the calendar
								// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
								$('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);

								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}

							},

							events : caVo
						});

			});

	//프로미스 인서트
	function promise_function(insertData) {
		return new Promise(function(resolve, reject) {
			$.ajax({
				type : "post",
				url : "/calendar/insert",
				data : JSON.stringify(insertData),
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				success : function(data) {
					console.log(data);
					//resolve(data);
				}
			});
		});
	}
	// 프로미스 값가져오기
	function getListFunction() {
		return new Promise(function(resolve, reject) {
			$.ajax({
				type : "GET",
				url : "/calendar/getList",
				data : JSON.stringify(insertData),
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				success : function(data) {
					console.log(data);
					//resolve(data);
				}
			});
		});
	}
</script>

<script>
	$(function() {
		var param = getParams();
		console.log(param);

		if (param.authority == "no") {
			window.alert("로그인후 이용가능 관리자에게 문의 하세요");
		}

		function getParams() {
			// 파라미터가 담길 배열
			var param = new Array();

			// 현재 페이지의 url
			var url = decodeURIComponent(location.href);
			// url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
			url = decodeURIComponent(url);

			var params;
			// url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
			params = url.substring(url.indexOf('?') + 1, url.length);
			// 파라미터 구분자("&") 로 분리
			params = params.split("&");

			// params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
			var size = params.length;
			var key, value;
			for (var i = 0; i < size; i++) {
				key = params[i].split("=")[0];
				value = params[i].split("=")[1];

				param[key] = value;
			}

			return param;
		}

	})
</script>

<style>
style>body {
	margin-bottom: 40px;
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	background:
		url(http://www.digiphotohub.com/wp-content/uploads/2015/09/bigstock-Abstract-Blurred-Background-Of-92820527.jpg);
}

#wrap {
	width: 1100px;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
	margin: 10px 0;
	padding: 2px 4px;
	background: #3366CC;
	color: #fff;
	font-size: .85em;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	/* 		float: right; */
	margin: 0 auto;
	width: 900px;
	background-color: #FFFFFF;
	border-radius: 6px;
	box-shadow: 0 1px 2px #C3C3C3;
	-webkit-box-shadow: 0px 0px 21px 2px rgba(0, 0, 0, 0.18);
	-moz-box-shadow: 0px 0px 21px 2px rgba(0, 0, 0, 0.18);
	box-shadow: 0px 0px 21px 2px rgba(0, 0, 0, 0.18);
}
</style>



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

