<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>

<link rel="stylesheet" href="//cdn.datatables.net/select/1.2.7/css/select.dataTables.css">
</head>
<body>
<table id="example" class="display" style="width:100%">
	<thead>
		<tr>
			<th>checkbox</th>
			<th>이름</th>
			<th>직위</th>
			<th>사무실</th>
			<th>나이</th>
			<th>급여</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td></td>
			<td>홍길동</td>
			<td>부장</td>
			<td>서울</td>
			<td>51</td>
			<td>6000만원</td>
		</tr>
		<tr>
			<td></td>
			<td>김도몽</td>
			<td>과장</td>
			<td>인천</td>
			<td>42</td>
			<td>5000만원</td>
		</tr>
		<tr>
			<td></td>
			<td>김길자</td>
			<td>대리</td>
			<td>부산</td>
			<td>36</td>
			<td>4000만원</td>
		</tr>
	</tbody>
</table>

<div id="checked_result1">
</div>

<div id="checked_result2">
</div>
<button type="button" id="chk_ok_btn">체크 확인</button>

<script type="text/javascript">
	function chk_ok_show(){
		$('#checked_result2').empty()
		var tmp1 = ''
		$('#example tbody tr').each(function(k,v){
			var tcalss = $(this).attr('class')
			var tval = $(this).find("td").eq(1).html();
			var this_row = example_tbl.rows(this).data();

			tmp1 += (k+1)+'열 '
			tmp1 += 'class:'+tcalss+', second val:'+tval+', third val:'+this_row[0][2]
			tmp1 += '<br>'
		});

		$('#checked_result2').html(tmp1)

	}

	// select style 종류: `none`, `single`, `multi` or `os`
	var example_tbl = null
	$(function() {
		example_tbl = $('#example').DataTable( {
			columnDefs: [ {
				orderable: false,
				className: 'select-checkbox',
				targets:   0
			}],
			dom: 't',
			select: {
				style: 'multi',
				selector: 'td:first-child'
			},
			order: [[ 1, 'asc' ]]
		});

		$('#example tbody tr').on('click', 'td:nth-child(1)',function(){
			var tmp1 = $(this).next().text()
			$('#checked_result1').html('last checked: '+tmp1)
		})

		$('#chk_ok_btn').click(function(){
			chk_ok_show()
		})
	});

</script>
</body>
</html>