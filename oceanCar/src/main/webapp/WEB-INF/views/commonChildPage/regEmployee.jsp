<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	아이디 : <input type="text" id="id">
	비밀번호 : <input type="password" id="password">
	회원이름 : <input type="text" id="name">
	연락처 :	<input type="text" id="phone" >
	
	<button id="hellow">등록하기</button>
	
	<script>
		$(function(){
			$('#hellow').click(function(){
				var data = JSON.stringify({
					e_id : $('#id').val(),
					pw : $('#password').val(),
					name : $('#name').val(),
					phone : $('#phone').val()
				});
				console.log(data);
				
				$.ajax({
					type : "post",
					url : "/master/insertEmployee",
					data : data,
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					success : function(data){
						console.log(data);
						if(data.signal >= 1){
							alert("등록완료");
							window.opener.location.reload();
							window.location.reload();
							
							
						}else{
							alert("오류 발생");
						}
					}
					
				})
			});
		})
	</script>
</body>
</html>