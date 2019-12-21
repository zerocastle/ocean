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

		if (data[0].m_order == '') {
			$('#hu').css("display", "none");
		} else if (data[0].m_order == '출고') {
			$('#hu').css("display", "none");
		} else {
			$('#CAR_CDATE').removeAttr("readonly");
			$('#CAR_CDATE').attr("type", "date");
			$('#ha').css("display", "none");
		}

		$('input[name=MEM_ID]').val(data[0].m_num);
		$('input[name=NAME]').val(data[0].m_name);
		$('input[name=EMP]').val(data[0].e_id);
		$('.phone').text(data[0].phone);
		$('select[name=MEM_STATUS]').val(data[0].m_state);
		$('select[name=PAY_TYPE]').val(data[0].m_order);
		$('.regDate').text(getFormatDate(new Date(data[0].reg_date.time)));
		//var seoul = moment(data[0].update_date.time).tz('Asia/Seoul');
		if (data[0].update_date != null) {
			$('.updateDate').text(
					getFormatDate(new Date(data[0].update_date.time)));
		}

		$('input[name=CAR_NAME]').val(data[0].car_type);
		$('input[name=CAR_MONTH]').val(data[0].month_num);
		$('input[name=CAR_CREDIT]').val(data[0].credit_worth);
		$('input[name=CAR_OPTION]').val(data[0].c_option);
		$('input[name=CAR_PRICE]').val(data[0].price);
		$('input[name=FEE_PER]').val(data[0].fee_per);
		$('input[name=CAR_SUPPORT]').val(data[0].add_price);
		if (data[0].order_date != null) {
			$('input[name=CAR_BDATE]').val(
					getFormatDate(new Date(data[0].order_date.time)));
		}
		if (data[0].released != null) {
			$('input[name=CAR_CDATE]').val(
					getFormatDate(new Date(data[0].order_date.time)));
		}

		$('select[name=CAR_CAPITAL]').val(data[0].capital);

		$('input[name=CAR_FTMPAY]').val(data[0].first_payment);
	});

	function getFormatDate(date) {
		var year = date.getFullYear(); //yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		return year + '-' + month + '-' + day;
	}

	//발주처리
	function bal() {

		var data = JSON.stringify({
			"car_type" : $('input[name=CAR_NAME]').val(),
			"month_num" : $('input[name=CAR_MONTH]').val(),
			"credit_worth" : $('input[name=CAR_CREDIT]').val(),
			"c_option" : $('input[name=CAR_OPTION]').val(),
			"price" : $('input[name=CAR_PRICE]').val(),
			"fee_per" : $('input[name=FEE_PER]').val(),
			"capital" : $('select[name=CAR_CAPITAL]').val(),
			"first_payment" : $('input[name=CAR_FTMPAY]').val(),
			"m_num" : $('input[name=MEM_ID]').val(),
			"e_id" : $('input[name=EMP]').val()
		});

		console.log(data);

		$.ajax({
			type : "post",
			url : "/member/insertBal",
			data : data,
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : function(data) {
				console.log(data);
				if (data.signal >= 1) {
					window.opener.location.reload();
					window.location.reload();
					alert("등록완료");
				} else {
					alert("오류 발생");
				}
			}
		})
	}

	//메모 등록하기
	function memo() {
		
		var data = JSON.stringify({
			"memo" : $("#NEW_MEMO").val(),
			"m_num" : $('input[name=MEM_ID]').val(),
			"writer" : "${sessionScope.employee.e_id}"
		});
		console.log(data);
		$.ajax({
			type : "post",
			url : "/member/insertMemo",
			data : data,
			dataType : "json",
			contentType : "application/json;charset=UTF-8",
			success : function(data) {
				console.log(data);
				if (data.signal >= 1) {
					window.opener.location.reload();
					window.location.reload();
					alert("등록완료");
				} else {
					alert("오류 발생");
				}
			}
		})
	}

	//3자리 단위마다 콤마 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//모든 콤마 제거
	function removeCommas(x) {
		if (!x || x.length == 0)
			return "";
		else
			return x.split(",").join("");
	}
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

							<td width='33%' style='background-color: #000; cursor: pointer;'>
								회원 정보</td>
							<!-- <td width='33%'
								style='background-color: #6E6E6E; cursor: pointer; border-left: 1px solid #C9C9C9;'
								onclick="JAVASCRIP:location.href='/MEMBER/member_image.php?MEM_CODE=2804&MEM_ID=01041892729'">
								이미지 정보</td>
							<td width='33%'
								style='background-color: #6E6E6E; cursor: pointer; border-left: 1px solid #C9C9C9;'
								onclick="JAVASCRIP:location.href='/MEMBER/member_qna.php?MEM_CODE=2804&MEM_ID=01041892729'">
								회원 문의</td> -->

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
										<td width='15%' bgcolor='#E9E7E7'>아이디</td>
										<td width='29%' align='left' style='padding-left: 7px;'><input
											type='text' name='MEM_ID' readonly="readonly" value=''
											style='width: 120px; height: 20px;'></td>
										<td width='15%' bgcolor='#E9E7E7'>이름</td>
										<td align='left' style='padding-left: 7px;'><input
											type='text' name='NAME' value=''
											style='width: 120px; height: 20px;'></td>
									</tr>
									<tr align='center' bgcolor='#FFFFFF' height='35'>
										<td bgcolor='#E9E7E7'>담당자</td>
										<td align='left' style='padding-left: 7px;'><input
											type='text' name='EMP' value=''
											style='width: 120px; height: 20px;'></td>
										<td bgcolor='#E9E7E7'>연락처</td>
										<td align='left' class="phone" style='padding-left: 7px;'></td>
									</tr>



									<tr align='center' bgcolor='#FFFFFF' height='35'>
										<td bgcolor='#E9E7E7'>회원상태</td>
										<td align='left' style='padding-left: 7px;'><select
											name="MEM_STATUS"
											style="font-family: 돋움; font-size: 9pt; height: 25px; width: 65px;">
												<option value="상담중" selected>상담중</option>
												<option value="초">초</option>
												<option value="중">중</option>
												<option value="대">대</option>

										</select></td>
										<td bgcolor='#E9E7E7'>발주상태</td>
										<td align='left' style='padding-left: 7px;'><select
											name="PAY_TYPE"
											style="font-family: 돋움; font-size: 9pt; height: 25px">
												<option value="출고">출고</option>
												<option value="발주">발주</option>

										</select></td>
									</tr>

									<tr align='center' bgcolor='#FFFFFF' height='35'>
										<td bgcolor='#E9E7E7'>가입일</td>
										<td align='left' class="regDate" style='padding-left: 7px;'>
										<td bgcolor='#E9E7E7'></td>
										<td align='left' class="updateDate" style='padding-left: 7px;'></td>
									</tr>



								</table>
							</td>

							<td width='1%'></td>

							<td width='39%' style='vertical-align: top;'>
								<table width='100%' cellpadding='0' cellspacing='1' border='0'
									bgcolor='#ABA894' align='center' style='color: #636363'>
									<tr bgcolor='#FFF'>
										<td bgcolor='#FFF'><textarea id="NEW_MEMO"
												name="NEW_MEMO" style="width: 99%; height: 136px; border: 0"></textarea></td>
									</tr>
									<tr>
										<td height='35' colspan='6' align='center' bgcolor='#FFFFFF'
											style='font-weight: bold; color: #333575;'><a
											href="JAVASCRIPT:memo();"><input type="button"
												value='상담메모 등록' class="btn btn-primary"></a></td>
									</tr>
								</table>

							</td>

						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height='15' bgcolor='#FFFFFF'></td>
			</tr>

			<tr>
				<td height='45' colspan='4' align='center' bgcolor='#FFFFFF'
					style='font-weight: bold; color: #333575;'>
					<table width='98%' cellpadding='0' cellspacing='1' border='0'
						bgcolor='#ABA894' align='center' style='color: #636363'>


						<tr align='center' height='35' bgcolor='#FFFFFF'>
							<td width='10%' bgcolor='#FEECEB'>차종</td>
							<td width='30%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_NAME' value=''
								style='width: 95%; height: 20px;'></td>
							<td width='10%' bgcolor='#FEECEB'>개월수</td>
							<td width='20%' align='left' style='padding-left: 7px;'><input
								type="text" name="CAR_MONTH"
								style="font-family: 돋움; font-size: 9pt; height: 25px"
								onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" />
							<td width='10%' bgcolor='#FEECEB'>신용도</td>
							<td align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_CREDIT' value=''
								style='width: 95%; height: 20px;'
								onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" /></td>

						</tr>

						<tr align='center' height='35' bgcolor='#FFFFFF'>
							<td width='10%' bgcolor='#ECF2FD'>옵션</td>
							<td width='30%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_OPTION' value=''
								style='width: 95%; height: 20px;'></td>
							<td width='10%' bgcolor='#ECF2FD'>가격</td>
							<td width='20%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_PRICE' value=''
								style='width: 95%; height: 20px;'
								onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" /></td>
							<td width='10%' bgcolor='#ECF2FD'>수수료</td>
							<td align='left' style='padding-left: 7px;'><input
								type='text' name='FEE_PER' value=''
								style='width: 25%; height: 20px;'
								onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" />
								% &nbsp;</td>
						</tr>



						<tr align='center' height='35' bgcolor='#FFFFFF'>
							<td width='10%' bgcolor='#ECF2FD'>지원금</td>
							<td width='30%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_SUPPORT' value=''
								style='width: 95%; height: 20px;'
								onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" /></td>
							<td width='10%' bgcolor='#ECF2FD'>발주일</td>
							<td width='20%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_BDATE' id="CAR_BDATE" value=''
								style='width: 95%; height: 20px;' readonly="readonly"></td>
							<td width='10%' bgcolor='#ECF2FD'>출고일</td>
							<td align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_CDATE' id='CAR_CDATE' value=''
								style='width: 95%; height: 20px;' readonly="readonly"></td>
						</tr>
						<tr align='center' height='35' bgcolor='#FFFFFF'>
							<td width='10%' bgcolor='#ECF2FD'></td>
							<td width='30%' align='left' style='padding-left: 7px;'>
								<!-- <div class="filebox">
									거절&nbsp; &nbsp; &nbsp; <label for="EMAIL">이미지 등록</label> <input
										type="file" name="EMAIL" id="EMAIL">
								</div> -->
							</td>
							<td width='10%' bgcolor='#ECF2FD'>캐피탈사</td>
							<td width='20%' align='left' style='padding-left: 7px;'><select
								name="CAR_CAPITAL" id="CAR_CAPITAL"
								style="font-family: 돋움; font-size: 9pt; height: 25px">
									<option value="">캐피탈사</option>
									<option value="ajcapital">AJ캐피탈</option>
									<option value="ajucapital">아주캐피탈</option>
									<option value="hyosungcapital">효성캐피탈</option>
									<option value="nhcapital">NH농협캐피탈</option>
									<option value="wooricapital">우리캐피탈</option>
									<option value="meritzcapital">메리츠캐피탈</option>
									<option value="shinhancard">신한카드</option>
									<option value="kdbbank">KDB산업은행</option>
									<option value="kbcapital">KB캐피탈</option>
									<option value="wooricard">우리카드</option>
									<option value="hanacapital">하나캐피탈</option>
									<option value="samsungcard">삼성카드</option>
									<option value="lotteauto">롯데오토리스</option>
									<option value="bnkcapital">BNK캐피탈</option>
									<option value="lottocapital">롯데캐피탈</option>
									<option value="hyundaicapital">현대캐피탈</option>
									<option value="dgbcapital">DGB캐피탈</option>
									<option value="cnhcapital">CNH캐피탈</option>
									<option value="orixcapital">오릭스캐피탈</option>
							</select></td>
							<td width='10%' bgcolor='#ECF2FD'>선지급금</td>
							<td align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_FTMPAY' id='CAR_FTMPAY' value=''
								style='width: 95%; height: 20px;'
								onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" /></td>
						</tr>

					</table>
				</td>
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
								<!-- 발주에대한 변화 --> <a href="JAVASCRIPT:bal();" id="ha"><input
									type="button" value='발 주' class="btn btn-red"></a> <a
								href="javascript:MemModify('chulgo');" id="hu"><input
									type="button" value='출 고' class="btn btn-red"></a> &nbsp;
								&nbsp; &nbsp; <!-- <a
								href="JAVASCRIPT:MemModify('member');"><input type="button"
									value='수 정' class="btn btn-primary"></a> --> <a
								href="javascript:self.close();"><input type="button"
									value='닫 기' class="btn btn-primary"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height='5'></td>
			</tr>

			<tr>

				<td align='center'>

					<table width='98%' cellpadding='0' cellspacing='1' border='0'
						bgcolor='#ABA894' align='center'>


						<tr align='center' height='30' bgcolor='#E9E7E7'>
							<td width='140'>등록일</td>
							<td width='80'>작성자</td>
							<td>영업 상담</td>
						</tr>

						<c:forEach items="${memo}" var="item">
							<tr align='center' height='25' bgcolor='#FFFFFF'>

								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${item.cdata}" /></td>
								<td><c:out value="${item.writer}" /></td>

								<td align='left' style='padding-left: 7px;'><c:out
										value="${item.memo}" /></td>
							</tr>
						</c:forEach>


					</table>

				</td>
			</tr>


		</form>
	</table>

</body>
</html>