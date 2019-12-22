<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인 페이지</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->


							<img alt="" src="/resources/img/logPage/log.jpg" width="450" height="450" style="float:left;">

							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">환영 합니다.</h1>
									</div>
									<form class="user">
										<div class="form-group">
											<input type="email" id="eId"
												class="form-control form-control-user"
												aria-describedby="emailHelp" placeholder="ID 입력...">
										</div>
										<div class="form-group">
											<input type="password" id="pw"
												class="form-control form-control-user"
												placeholder="Password 입려...">
										</div>

										<!-- 로그인 처리 -->
										<a href="#" id="login"
											class="btn btn-primary btn-user btn-block"> Login </a>
										<hr>

									</form>
									<hr>
									<div>
										<a href="/">돌아가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<!-- 로그인 처리 -->
	<script>
		$(function() {

			$('#login').click(function(e) {
				e.preventDefault();

				var id = $('#eId').val();
				var pw = $('#pw').val();
				console.log(eId + ',' + pw);

				if ($('#eId').val().length <= 0 || $('#pw').val().length <= 0) {
					window.alert("아이디 또는 비밀번호를 입력 해주세요");
					return false;
				}

				$('#login').focus();

				var data = JSON.stringify({
					e_id : id,
					pw : pw
				});

				console.log(data);
				$.ajax({
					type : "POST",
					url : "/employee/login",
					data : data,
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					success : function(data) {
						console.log(data);
						if (data.signal == "success") {
							window.alert("로그인에 성공했습니다.");
							window.location.href = "/";
							console.log(sessionSuccess);

						} else
							window.alert("로그인에 실패 했습니다.");
					}
				})
			})

		})
	</script>

</body>

</html>
