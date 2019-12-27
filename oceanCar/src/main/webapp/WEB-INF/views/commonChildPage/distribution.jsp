<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<!-- <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet"> -->

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>

 <link rel="stylesheet"
	href="//cdn.datatables.net/select/1.2.7/css/select.dataTables.css">


</head>
<body>

	<table id="example" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>checkbox</th>
				<th>회원아이디</th>
				<th>이름</th>
				<th>번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${nonMember}" var="nonMember">
				<tr>
					<td></td>
					<td><c:out value="${nonMember.m_num}" /></td>
					<td><c:out value="${nonMember.m_name}" /></td>
					<td><c:out value="${nonMember.phone}" /></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div id="checked_result1"></div>

	<div id="checked_result2"></div>
	<button type="button" id="chk_ok_btn">분배하기</button>

	<div>
		해당 직원선택 : <select id="bindEmployee">
			<c:forEach items="${employee}" var="employee">
				<option value="${employee.e_id }">${employee.e_id }</option>
			</c:forEach>
		</select>
	</div>
	
	<script type="text/javascript">
		function chk_ok_show() {
			$('#checked_result2').empty()
			var tmp1 = ''
			var array = new Array();
			$('#example tbody tr').each(
					function(k, v) {
						var tcalss = $(this).attr('class');
						var tval = $(this).find("td").eq(1).html();
						var this_row = example_tbl.rows(this).data();

						tmp1 += (k + 1) + '열 '
						tmp1 += 'class:' + tcalss + ', second val:' + tval
								+ ', third val:' + this_row[0][2]
						tmp1 += '<br>'
						console.log(tcalss);
						if ($(this).hasClass('selected') === true) {
							array.push(tval);
						}

					});

			array.push($('#bindEmployee').val());
			console.log(array);
			var dataParams = {
					"params" : array
			};
			$.ajax({
						url : "/member/update/distribute",
						dataType : "json",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						type : "post",
						data : dataParams,
						success : function(retVal) {

							if (retVal.code == "OK") {
								alert(retVal.message);
							} else {
								alert(retVal.message);
							}

						},
						error : function(request, status, error) {
							console.log("AJAX_ERROR");
						}
					});

			$('#checked_result2').html(tmp1)

		}

		// select style 종류: `none`, `single`, `multi` or `os`
		var example_tbl = null
		$(function() {
			example_tbl = $('#example').DataTable({
				paging: false,
				columnDefs : [ {
					orderable : false,
					className : 'select-checkbox',
					targets : 0
				} ],
				dom : 't',
				select : {
					style : 'multi',
					selector : 'td:first-child'
				},
				order : [ [ 1, 'asc' ] ]
			});

			$('#example tbody tr').on('click', 'td:nth-child(1)', function() {
				var tmp1 = $(this).next().text()
				$('#checked_result1').html('last checked: ' + tmp1)
			})

			$('#chk_ok_btn').click(function() {
				chk_ok_show();
				alert("분배 되었습니다");
				window.location.reload();
				parent.location.reload();
			})
		});
	</script>
</body>
</html>