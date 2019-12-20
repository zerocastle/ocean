<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="euc-kr">
<title>오션카 관리자</title>

<link rel="stylesheet" type="text/css"
	href="http://crm.oceancar.co.kr/css/button.css?ver=4">
<link rel="stylesheet" type="text/css"
	href="http://crm.oceancar.co.kr/css/common.css">
<link rel="stylesheet" type="text/css"
	href="http://crm.oceancar.co.kr/css/honesty.css">
<style>
a {
	cursor: pointer;
	text-decoration: none;
	color: #FFFFFF;
}

a:hover {
	text-decoration: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 스크립트 정의 -->

<script>
	$(function() {
		var data = ${key};
		console.log(data);
		console.table(data);
		
		if(data[0].e_id == ''){
			$('#hu').css("display", "none");
			$('#ha').css("display", "none");
		}

		$('input[name=E_ID]').val(data[0].e_id);
		$('input[name=NAME]').val(data[0].name);
		$('input[name=PHONE]').val(data[0].phone);
		$('input[name=PASSWORD]').val(data[0].pw);
		
		$(".btn-update").click(function(){
			var data = JSON.stringify({
					e_id : $("#e_id").val(),
					name : $("#name").val(),
					phone : $("#phone").val(),
					pw : $("#password").val()
			});
			
			$.ajax({
				type : "post",
				url : "/employee/dataUpdate",
				data : data,
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				success : function(data) {
					alert("업데이트 성공");
					window.opener.location.reload();
					window.location.reload();
					window.close();
				}
			});
		});
		
		$(".btn-delete").click(function(){
			var data = JSON.stringify({
					e_id : $("#e_id").val()
			});
			
			$.ajax({
				type : "post",
				url : "/employee/dataDelete",
				data : data,
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				success : function(data) {
					alert("삭제 성공");
					
					window.opener.location.reload();
					window.location.reload();
					window.close();
				}
			});
		});
		
	});
		
</script>



<!-- Unessential CSS - Just here to make this sample page prettier -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700|Roboto:400,700'
	rel='stylesheet' type='text/css'>

<!-- Load modernizr or html5shiv -->
<script src="//cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
<!--<script src="../lib/html5shiv/html5shiv.js"></script>-->
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">


	<table width='100%' cellpadding='0' cellspacing='0' border='0'
		bgcolor='#FFFFFF' align='center'>

		<form name='pmmod' id='pmmod' method='POST' action=""
			enctype="multipart/form-data">
			<input type="hidden" name="ckmode" id='ckmode'> <input
				type="hidden" name="MEM_CODE" value='2804'> <input
				type="hidden" name="ckmid" value='01041892729'> <input
				type="hidden" name="chkPay" value='C'>



			<tr>

				<td width='100%'>

					<table width='100%' cellpadding='0' cellspacing='1' border='0'
						bgcolor='#6E6E6E' align='center'>
						<tr align='center' height='30'
							style='COLOR: #FFFFFF; font-weight: bold;' bgcolor='#6E6E6E'>

							<td width='33%' style='background-color: #000; cursor: pointer;'
								onclick="JAVASCRIP:location.href='/MEMBER/member_info.php?MEM_CODE=2804&MEM_ID=01041892729'">
								직원 정보</td>
							<td width='33%'
								style='background-color: #6E6E6E; cursor: pointer; border-left: 1px solid #C9C9C9;'
								onclick="JAVASCRIP:location.href='/MEMBER/member_image.php?MEM_CODE=2804&MEM_ID=01041892729'">
								이미지 정보</td>
							<td width='33%'
								style='background-color: #6E6E6E; cursor: pointer; border-left: 1px solid #C9C9C9;'
								onclick="JAVASCRIP:location.href='/MEMBER/member_qna.php?MEM_CODE=2804&MEM_ID=01041892729'">
								회원 문의</td>

						</tr>
					</table>

				</td>
			</tr>


			<tr>
				<td height='8' bgcolor='#FFFFFF'></td>
			</tr>

			<tr>
				<td>
					<table width='99%' cellpadding='0' cellspacing='0' border='0'>
						<tr>
							<td width='1%'></td>
							<td align='center' width='59%' style='vertical-align: top'>

								<table width='100%' cellpadding='0' cellspacing='1' border='0'
									bgcolor='#ABA894' align='center' style='color: #636363'>


									<tr align='center' height='35' bgcolor='#FFFFFF'>
										<td width='15%' bgcolor='#E9E7E7'>이름</td>
										<td align='left' style='padding-left: 7px;'>
											<input type='text' id="name" name='NAME' value='' style='width: 120px; height: 20px;'>
										</td>
										
										<td bgcolor='#E9E7E7'>연락처</td>
										<td align='left' style='padding-left: 7px;'>
											<input type='text' id="phone" name='PHONE' value='' style='width: 120px; height: 20px;'>
										</td>
									</tr>
									
									<tr align='center' height='35' bgcolor='#FFFFFF'>
										<td bgcolor='#E9E7E7'>패스워드</td>
										<td align='left' style='padding-left: 7px;'>
											<input type='password' id="password" name='PASSWORD' value='' style='width: 120px; height: 20px;'>
										</td>
										
										<td width='15%' bgcolor='#E9E7E7'>아이디</td>
										<td width='29%' align='left' style='padding-left: 7px;'>
											<input type='text' id="e_id" name='E_ID' readonly="readonly" value='' style='width: 120px; height: 20px;'>
										</td>
									</tr>

								</table>
							</td>

							<td width='1%'></td>


						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height='15' bgcolor='#FFFFFF'></td>
			</tr>

			<tr>
				<td height='5' bgcolor='#FFFFFF'></td>
			</tr>

			<tr>
				<td height='35' colspan='4' align='center' bgcolor='#FFFFFF'
					style='font-weight: bold; color: #333575;'>
					<table width='100%'>
						<tr>
							<td height='35' align='center' bgcolor='#FFFFFF'
								style='font-weight: bold; color: #333575;'>

							<input type="button" value='수정' class="btn-update">
							&nbsp; &nbsp; &nbsp;
							<input type="button" value='삭제' class="btn-delete">

							</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>

</body>
</html>