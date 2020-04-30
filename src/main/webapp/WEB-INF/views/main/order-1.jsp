<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<div id="page" class="theia-exception">
	
	<main>
		<div class="hero_in cart_section">
			<div class="wrapper">
				<div class="container">
					<div class="bs-wizard clearfix">
						<div class="bs-wizard-step">
							<div class="text-center bs-wizard-stepnum">접수중</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step active">
							<div class="text-center bs-wizard-stepnum">결제</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step disabled">
							<div class="text-center bs-wizard-stepnum">완료!</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a class="bs-wizard-dot"></a>
						</div>
					</div>
					<!-- End bs-wizard -->
				</div>
			</div>
		</div>
		<!--/hero_in-->

		<div class="bg_color_1">
		<form id="order2" action="order2" method="post">
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
						<div class="box_cart">
						<div class="message">
							<p>체크인 3일 전에 예약을 취소하면 총 숙박 요금의 50% 및 서비스 수수료 전액이 환불됩니다. </p>
						</div>
						<div class="form_title">
							<h3><strong>1</strong>결제자 정보</h3>
							<p>
								미성년자는 법적으로 불이익을 받을 수 있습니다.
							</p>
						</div>
						<div class="step">
							<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>이름</label>
									<input type="text" class="form-control" id="firstname_booking" name="reservationName">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>휴대전화</label>
									<input type="tel" id="telephone_booking" name="reservationPhone" class="form-control">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>이메일</label>
									<input type="email" id="email_booking" class="form-control">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>이메일 확인</label>
									<input type="email" id="email_booking_2" name="reservationEmail" class="form-control">
								</div>
							</div>
						</div>

						</div>
						<hr>
						<!--End step -->

						<div class="form_title">
							<h3><strong>2</strong>결제 수단</h3>
							<p>
								결제정보가 틀리지 않게 꼼꼼히 확인해 주세요.
							</p>
						</div>
						<div class="step">
							<div class="form-group">
							<label>카드 이름</label>
							<input type="text" class="form-control" id="name_card_bookign" name="name_card_bookign">
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>카드 번호</label>
									<input type="number" id="card_number" name="card_number" class="form-control">
								</div>
							</div>
							<div class="col-md-6 col-sm-12">
								<img src="${pageContext.request.contextPath }/img/cards_all.svg" alt="Cards" class="cards-payment">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>카드 유효기간</label>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<input type="number" id="expire_month" name="expire_month" class="form-control" placeholder="MM">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input type="number" id="expire_year" name="expire_year" class="form-control" placeholder="Year">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>안전 번호</label>
									<div class="row">
										<div class="col-4">
											<div class="form-group">
												<input type="number" id="ccv" name="ccv" class="form-control" placeholder="CCV">
											</div>
										</div>
										<div class="col-8">
											<img src="${pageContext.request.contextPath }/img/icon_ccv.gif" width="50" height="29" alt="ccv"><small>Last 3 digits</small>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--End row -->

						</div>
						<hr>
						<!--End step -->

						<div class="form_title">
							<h3><strong>3</strong>주소지 정보</h3>
							<p>
								카드가 결제 될 주소지 정보를 입력해 주세요.
							</p>
						</div>
						<div class="step">
							
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>주소</label>
										<input type="text" id="address" name="street_1" class="form-control" onclick="daumPostcode();">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>상세 주소</label>
										<input type="text" id="detailAddress" name="street_2" class="form-control" onclick="daumPostcode();">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<div class="form-group">
										<label>참고 주소</label>
										<input type="text" id="extraAddress" name="city_booking" class="form-control" onclick="daumPostcode();">
									</div>
								</div>
								<div class="col-md-6 col-sm-12">
									<div class="form-group">
										<label>우편번호</label>
										<input type="text" id="postcode" name="postal_code" class="form-control" onclick="daumPostcode();">
									</div>
								</div>
							</div>
							<!--End row -->
						</div>
						<hr>
						<!--End step -->
						<div id="policy">
							<h5>약관</h5>
							<p class="nomargin">결제를 계속 진행하신다면 <a href="#0">숙소 이용규칙, 환불 정책, 및 게스트 환불 정책</a>에 동의하는 것입니다. 또한 숙박세 및 서비스 수수료를 포함하여 표시된 총 금액에 동의합니다. Yolowa는 정부가 부과한 숙박세를 징수하여 납부합니다.</p>
						</div>
						</div>
					</div>
					<!-- /col -->
					
					<aside class="col-lg-4" id="sidebar">
						<div class="box_detail">
							<div id="total_cart">
								합계 <span class="float-right">￦<fmt:formatNumber value="${reservation.reservationTotalPrice  }" type="number"/></span>
							</div>
							<ul class="cart_details">
								<li>체크인 <span>${reservation.reservationCheckIn }</span></li>
								<li>체크아웃 <span>${reservation.reservationCheckOut }</span></li>
								<li>숙박인원 <span>${reservation.reservationGuestNum }</span></li>
							</ul>
							
							<input type="hidden" name="reservationHostingNo" value="${reservation.reservationHostingNo }">
							<input type="hidden" name="reservationMemberNo" value="${loginMember.memberNo }">
							<input type="hidden" name="reservationCheckIn" value="${reservation.reservationCheckIn }">
							<input type="hidden" name="reservationCheckOut" value="${reservation.reservationCheckOut }">
							<input type="hidden" name="reservationGuestNum" value="${reservation.reservationGuestNum }">
							<input type="hidden" name="reservationCommission" value="${reservation.reservationCommission }">
							<input type="hidden" name="reservationTotalPrice" value="${reservation.reservationTotalPrice }">
							<input id="cardDetail" type="hidden" name="reservationCardNum" value="">
							
							<a id="order2Btn" class="btn_1 full-width purchase">결제</a>
							<div class="text-center"><small>다음 단계에서 결제가 처리됩니다.</small></div>
						</div>
					</aside>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</form>
		</div>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->
	
	</div>
	<!-- page -->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<jsp:include page="login-popup.jsp"></jsp:include>
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/assets/validate.js"></script>
  	<!-- 다음 우편번호(주소) 자동완성 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	$("#order2Btn").click(function() {
		$("#cardDetail").val($("#name_card_bookign").val() + "_" + $("#card_number").val() 
				+ "_" + $("#expire_month").val() + "_" + $("#expire_year").val() + "_" + $("#ccv").val());
		
		if ($("#cardDetail").val() == "" || $("#firstname_booking").val() == "" || 
				$("#telephone_booking").val() == "" || $("#email_booking_2").val() == "") {
			return false;
		}
		
		$("#order2").submit();
	});
	
	function daumPostcode() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	              var addr = ''; // 주소 변수
	              var extraAddr = ''; // 참고항목 변수
	
	              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                  addr = data.roadAddress;
	              } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                  addr = data.jibunAddress;
	              }
	
	              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	              if(data.userSelectedType === 'R'){
	                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                      extraAddr += data.bname;
	                  }
	                  // 건물명이 있고, 공동주택일 경우 추가한다.
	                  if(data.buildingName !== '' && data.apartment === 'Y'){
	                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                  }
	                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                  if(extraAddr !== ''){
	                      extraAddr = ' (' + extraAddr + ')';
	                  }
	                  // 조합된 참고항목을 해당 필드에 넣는다.
	                  document.getElementById("extraAddress").value = extraAddr;
	              
	              } else {
	                  document.getElementById("extraAddress").value = '';
	              }
	
	              // 우편번호와 주소 정보를 해당 필드에 넣는다.
	              document.getElementById('postcode').value = data.zonecode;
	              document.getElementById("address").value = addr;
	              // 커서를 상세주소 필드로 이동한다.
	              document.getElementById("detailAddress").focus();
	          }
	      }).open();
	  }
	</script>
  