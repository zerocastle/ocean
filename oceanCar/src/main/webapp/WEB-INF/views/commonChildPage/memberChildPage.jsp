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

		console.table(data);

		$('input[name=MEM_ID]').val(data[0].m_num);
		$('input[name=NAME]').val(data[0].m_name);
		$('input[name=EMP]').val(data[0].e_id);
		$('.phone').text(data[0].phone);
		$('select[name=MEM_STATUS]').val(data[0].m_state);
		$('select[name=PAY_TYPE]').val(data[0].m_order);
		$('.regDate').text(new Date(data[0].reg_date.time));
		//var seoul = moment(data[0].update_date.time).tz('Asia/Seoul');
		$('.updateDate').text(new Date(data[0].update_date.time));
		
		$('')
	})
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
								회원 정보</td>
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
										<td bgcolor='#E9E7E7'>담장자</td>
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
										<td bgcolor='#E9E7E7'>수정일</td>
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
											href="JAVASCRIPT:MemModify('memo');"><input type="button"
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
							<td width='20%' align='left' style='padding-left: 7px;'><select
								name="CAR_MONTH"
								style="font-family: 돋움; font-size: 9pt; height: 25px">
									<option value="">개월</option>
									<option value="36">36개월</option>
									<option value="48">48개월</option>
									<option value="60">60개월</option>
							</select>
							<td width='10%' bgcolor='#FEECEB'>신용도</td>
							<td align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_CREDIT' value=''
								style='width: 95%; height: 20px;'></td>

						</tr>

						<tr align='center' height='35' bgcolor='#FFFFFF'>
							<td width='10%' bgcolor='#ECF2FD'>옵션</td>
							<td width='30%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_OPTION' value=''
								style='width: 95%; height: 20px;'></td>
							<td width='10%' bgcolor='#ECF2FD'>가격</td>
							<td width='20%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_PRICE' value=''
								style='width: 95%; height: 20px;'></td>
							<td width='10%' bgcolor='#ECF2FD'>수수료</td>
							<td align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_PRICE' value=''
								style='width: 25%; height: 20px;'> % &nbsp; <input
								type='text' name='CarMargin' id='CarMargin'
								style='border: 0; width: 50%' value="0원"></td>
						</tr>



						<tr align='center' height='35' bgcolor='#FFFFFF'>
							<td width='10%' bgcolor='#ECF2FD'>지원금</td>
							<td width='30%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_SUPPORT' value=''
								style='width: 95%; height: 20px;'></td>
							<td width='10%' bgcolor='#ECF2FD'>발주일</td>
							<td width='20%' align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_BDATE' id="CAR_BDATE" value='2019-01-01'
								style='width: 95%; height: 20px;'></td>
							<td width='10%' bgcolor='#ECF2FD'>출고일</td>
							<td align='left' style='padding-left: 7px;'><input
								type='text' name='CAR_CDATE' id='CAR_CDATE' value='2019-01-01'
								style='width: 95%; height: 20px;'></td>
						</tr>
						<tr align='center' height='35' bgcolor='#FFFFFF'>
							<td width='10%' bgcolor='#ECF2FD'>상태</td>
							<td width='30%' align='left' style='padding-left: 7px;'>
								<div class="filebox">
									거절&nbsp; &nbsp; &nbsp; <label for="EMAIL">이미지 등록</label> <input
										type="file" name="EMAIL" id="EMAIL">
								</div>
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
								style='width: 95%; height: 20px;'></td>
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
								style='font-weight: bold; color: #333575;'><a
								href="JAVASCRIPT:MemModify('balju');"><input type="button"
									value='발 주' class="btn btn-red"></a> <a
								href="javascript:MemModify('chulgo');"><input type="button"
									value='출 고' class="btn btn-red"></a> &nbsp; &nbsp; &nbsp; <a
								href="JAVASCRIPT:MemModify('member');"><input type="button"
									value='수 정' class="btn btn-primary"></a> <a
								href="javascript:self.close();"><input type="button"
									value='닫 기' class="btn btn-primary"></a></td>
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
						<tr align='center' height='25' bgcolor='#FFFFFF'>
							<td></td>
							<td></td>
							<td align='left' style='padding-left: 7px;'></td>
						</tr>

					</table>

				</td>
			</tr>


		</form>
	</table>

</body>
</html>