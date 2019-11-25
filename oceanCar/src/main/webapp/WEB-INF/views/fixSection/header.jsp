<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	console.log("${sessionScope.employee}");
</script>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Topbar -->
		<nav
			class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

			<!-- Sidebar Toggle (Topbar) -->
			<button id="sidebarToggleTop"
				class="btn btn-link d-md-none rounded-circle mr-3">
				<i class="fa fa-bars"></i>
			</button>

			<!-- Topbar Navbar -->
			<!-- 로그인 처리 -->
			<ul class="navbar-nav ml-auto">
				<!-- 로그인 정보 -->
				<!-- Nav Item - User Information -->

				<c:if test="${empty sessionScope.employee }">
					<a href="/common/login">로그인 해주세요</a>
				</c:if>

				<!-- 로그인 처리 부분 -->
				<c:if test="${not empty sessionScope.employee }">

					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span style="color: brown;">${sessionScope.employee.e_id }</span>님
							환영 합니다. </a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 실적보기
							</a>

							<div class="dropdown-divider"></div>

							<a class="dropdown-item" href="#"> <i
								class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 회원 등록
							</a>

							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/employee/logout"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								로그아웃
							</a>


						</div></li>

				</c:if>
				<!-- 사용자 로그인 정보 끝 -->

			</ul>

		</nav>
		<!-- End of Topbar -->