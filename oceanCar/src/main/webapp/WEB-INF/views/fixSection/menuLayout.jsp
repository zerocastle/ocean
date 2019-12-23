<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">제이와이 렌트카</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">메뉴</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<!--서비스 -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span style="font-size : large">서비스</span>
	</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h4 class="collapse-header">직원메뉴</h4>
				<!-- <a class="collapse-item" href="forgot-password.html">내 실적 보기</a> --> <a
					class="collapse-item" href="/move/employee/managerMember?e_id=${sessionScope.employee.e_id }">내 회원 관리</a>
				<div class="collapse-divider"></div>
	<c:if test="${sessionScope.employee.e_type eq '1' }">
				<h4 class="collapse-header">마스터메뉴</h4>
				<!-- <a class="collapse-item" href="404.html">매출액</a> --> <a
					class="collapse-item" href="/move/master/memberManager">회원리스트
					관리</a> <a class="collapse-item" href="/move/master/employeeManager">직원관리</a>
					<!-- <a class="collapse-item" href="/move/master/employeeManager">발주처리관리 </a> -->
					
			</div>
		</div></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link"
		href="/move/master/monthChart"> <i class="fas fa-fw fa-chart-area"></i>
			<span style="font-size : large">매출액</span>
	</a></li>
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
	
	
	</c:if>

	<!-- Nav Item - Tables -->
	<!-- <li class="nav-item"><a class="nav-link" href="tables.html"> <i
			class="fas fa-fw fa-table"></i> <span style="font-size : large">게시판</span>
	</a></li> -->

	

</ul>
<!-- End of Sidebar -->




<jsp:include page="../common/commonLib.jsp" />
