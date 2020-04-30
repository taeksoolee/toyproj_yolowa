<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form id="addHostingForm" method="post" enctype="multipart/form-data">
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">호스팅</a>
        </li>
        <li class="breadcrumb-item active">숙소 추가</li>
      </ol>
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-file"></i>기본 정보</h2>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>숙소 이름</label>
						<input type="text" class="form-control" placeholder="숙소 이름" name="hostingName" value="${hosting.hostingName }">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>숙소 종류</label>
						<div class="styled-select">
						<select name="hostingCategory"> 
							<option value="1" <c:if test="${hosting.hostingCategory == 1}">selected="selected"</c:if>>아파트</option>
							<option value="2" <c:if test="${hosting.hostingCategory == 2}">selected="selected"</c:if>>주택(펜션)</option>
							<option value="3" <c:if test="${hosting.hostingCategory == 3}">selected="selected"</c:if>>전문 숙소</option>
							<option value="4" <c:if test="${hosting.hostingCategory == 4}">selected="selected"</c:if>>독특한 숙소</option>
						</select>
						</div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>숙소 설명</label>
						<textarea class="editor" name="hostingDesc">${hosting.hostingDesc}</textarea>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>공동생활 여부</label>
						<div class="styled-select">
						<select name="hostingPrivate">
							<option value="1" <c:if test="${hosting.hostingPrivate == 1}">selected="selected"</c:if>>단독사용</option>
							<option value="2" <c:if test="${hosting.hostingPrivate == 2}">selected="selected"</c:if>>룸쉐어</option>
						</select>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>방 갯수</label>
						<input type="text" class="form-control" name="hostingRoom" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${hosting.hostingRoom}">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>최대 인원</label>
						<input type="text" class="form-control" name="hostingPerson" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${hosting.hostingPerson}">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>욕실 갯수</label>
						<input type="text" class="form-control" name="hostingBathroom" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${hosting.hostingBathroom}">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>침대 갯수</label>
						<input type="text" class="form-control" name="hostingBed" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${hosting.hostingBed}">
					</div>
				</div>

			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-eye"></i>이미지</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h6>Item</h6>
					<table id="pricing-list-container" style="width:100%;">
						<tr class="pricing-list-item">
							<td>
								<div class="row">
								<!-- 
									<div class="col-md-2">
										<div class="form-group">
											<input type="text" class="form-control"  placeholder="미리보기">
										</div>
									</div>
								 -->
									<div class="col-md-10">
										<div class="form-group">
											<input name="file" type="file" class="form-control" placeholder="이미지." multiple="multiple">
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<a href="#0" class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>Add Item</a>
					</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		<c:set var="address" value="${fn:split(hosting.hostingAddress,'|')}" />
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-map-marker"></i>위치</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>주소</label>
						<input id="address" type="text" class="form-control" onclick="daumPostcode();" value="${address[0]}">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>상세주소</label>
						<input id="detailAddress" type="text" class="form-control" value="${address[1]}">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>참고주소</label>
						<input id="extraAddress" type="text" class="form-control" disabled="disabled" value="${address[3]}">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>우편번호</label>
						<input id="postcode" type="text" class="form-control" disabled="disabled" value="${address[2]}">
					</div>
				</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		
		<c:set var="a1" value="${fn:substring(hosting.hostingAmenities,0,1)}"/>
		<c:set var="a2" value="${fn:substring(hosting.hostingAmenities,1,2)}"/>
		<c:set var="a3" value="${fn:substring(hosting.hostingAmenities,2,3)}"/>
		<c:set var="a4" value="${fn:substring(hosting.hostingAmenities,3,4)}"/>
		<c:set var="a5" value="${fn:substring(hosting.hostingAmenities,4,5)}"/>
		<c:set var="a6" value="${fn:substring(hosting.hostingAmenities,5,6)}"/>
		<c:set var="a7" value="${fn:substring(hosting.hostingAmenities,6,7)}"/>
		<c:set var="a8" value="${fn:substring(hosting.hostingAmenities,7,8)}"/>
		<c:set var="a9" value="${fn:substring(hosting.hostingAmenities,8,9)}"/>
		<c:set var="a10" value="${fn:substring(hosting.hostingAmenities,9,10)}"/>
		<c:set var="a11" value="${fn:substring(hosting.hostingAmenities,10,11)}"/>
		<c:set var="a12" value="${fn:substring(hosting.hostingAmenities,11,12)}"/>
		<!-- 편의시설 체크박스 -->
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-clock-o"></i>편의시설</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities1" value="100000000000" <c:if test="${a1 == 1}">checked="checked"</c:if>/>
				            <label for="amenities1">필수품목(수건, 비누, 화장지, 베개)</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities2" value="10000000000" <c:if test="${a2 == 1}">checked="checked"</c:if>/>
				            <label for="amenities2">무선인터넷</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities3" value="1000000000" <c:if test="${a3 == 1}">checked="checked"</c:if>/>
				            <label for="amenities3">TV</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities4" value="100000000" <c:if test="${a4 == 1}">checked="checked"</c:if>/>
				            <label for="amenities4">난방</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities5" value="10000000" <c:if test="${a5 == 1}">checked="checked"</c:if>/>
				            <label for="amenities5">에어컨</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities6" value="1000000" <c:if test="${a6 == 1}">checked="checked"</c:if>/>
				            <label for="amenities6">다리미</label>
				        </div>
				    </div>
				</div>
				
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities7" value="100000" <c:if test="${a7 == 1}">checked="checked"</c:if>/>
				            <label for="amenities7">샴푸</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities8" value="10000" <c:if test="${a8 == 1}">checked="checked"</c:if>/>
				            <label for="amenities8">헤어드라이어</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities9" value="1000" <c:if test="${a9 == 1}">checked="checked"</c:if>/>
				            <label for="amenities9">조식제공</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities10" value="100" <c:if test="${a10 == 1}">checked="checked"</c:if>/>
				            <label for="amenities10">책상(작업공간)</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities11" value="10" <c:if test="${a11 == 1}">checked="checked"</c:if>/>
				            <label for="amenities11">벽난로</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="amenities12" value="1" <c:if test="${a12 == 1}">checked="checked"</c:if>/>
				            <label for="amenities12">옷장(서랍장)</label>
				        </div>
				    </div>
				</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		
		<c:set var="f1" value="${fn:substring(hosting.hostingFacilities,0,1)}"/>
		<c:set var="f2" value="${fn:substring(hosting.hostingFacilities,1,2)}"/>
		<c:set var="f3" value="${fn:substring(hosting.hostingFacilities,2,3)}"/>
		<c:set var="f4" value="${fn:substring(hosting.hostingFacilities,3,4)}"/>
		<c:set var="f5" value="${fn:substring(hosting.hostingFacilities,4,5)}"/>
		<c:set var="f6" value="${fn:substring(hosting.hostingFacilities,5,6)}"/>
		<c:set var="f7" value="${fn:substring(hosting.hostingFacilities,6,7)}"/>
		<c:set var="f8" value="${fn:substring(hosting.hostingFacilities,7,8)}"/>
		<!-- 설비 체크박스 -->
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-clock-o"></i>설비</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities1" value="10000000" <c:if test="${f1 == 1}">checked="checked"</c:if>/>
				            <label for="facilities1">단독 사용 거실</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities2" value="1000000" <c:if test="${f2 == 1}">checked="checked"</c:if>/>
				            <label for="facilities2">주방</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities3" value="100000" <c:if test="${f3 == 1}">checked="checked"</c:if>/>
				            <label for="facilities3">세탁기</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities4" value="10000" <c:if test="${f4 == 1}">checked="checked"</c:if>/>
				            <label for="facilities4">건조기</label>
				        </div>
				    </div>
				</div>
				
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities5" value="1000" <c:if test="${f5 == 1}">checked="checked"</c:if>/>
				            <label for="facilities5">주차장</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities6" value="100" <c:if test="${f6 == 1}">checked="checked"</c:if>/>
				            <label for="facilities6">헬스장</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities7" value="10" <c:if test="${f7 == 1}">checked="checked"</c:if>/>
				            <label for="facilities7">수영장</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="facilities8" value="1" <c:if test="${f8 == 1}">checked="checked"</c:if>/>
				            <label for="facilities8">엘리베이터</label>
				        </div>
				    </div>
				</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		
		<c:set var="s1" value="${fn:substring(hosting.hostingSafety,0,1)}"/>
		<c:set var="s2" value="${fn:substring(hosting.hostingSafety,1,2)}"/>
		<c:set var="s3" value="${fn:substring(hosting.hostingSafety,2,3)}"/>
		<c:set var="s4" value="${fn:substring(hosting.hostingSafety,3,4)}"/>
		<!-- 설비 체크박스 -->
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-clock-o"></i>안전설비</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="safety1" value="1000" <c:if test="${s1 == 1}">checked="checked"</c:if>/>
				            <label for="safety1">연기 감지기</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="safety2" value="100" <c:if test="${s2 == 1}">checked="checked"</c:if>/>
				            <label for="safety2">일산화탄소 감지기</label>
				        </div>
				    </div>
				</div>
				
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="safety3" value="10" <c:if test="${s3 == 1}">checked="checked"</c:if>/>
				            <label for="safety3">구급상자</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="safety4" value="1" <c:if test="${s4 == 1}">checked="checked"</c:if>/>
				            <label for="safety4">소화기</label>
				        </div>
				    </div>
				</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		
		<c:set var="r1" value="${fn:substring(hosting.hostingRule,0,1)}"/>
		<c:set var="r2" value="${fn:substring(hosting.hostingRule,1,2)}"/>
		<c:set var="r3" value="${fn:substring(hosting.hostingRule,2,3)}"/>
		<c:set var="r4" value="${fn:substring(hosting.hostingRule,3,4)}"/>
		<!-- 규칙 및 세부사항 -->
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-clock-o"></i>규칙 및 세부사항</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>세부사항</label>
						<input type="text" class="form-control" placeholder="추가 규칙 및 세부사항" name="hostingRuleDetail" value="${hosting.hostingRuleDetail }">
					</div>
				</div>
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="rule1" value="1000" <c:if test="${r1 == 1}">checked="checked"</c:if>/>
				            <label for="rule1">어린이(0~12세) 숙박 적합</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="rule2" value="100" <c:if test="${r2 == 1}">checked="checked"</c:if>/>
				            <label for="rule2">반려동물 허용</label>
				        </div>
				    </div>
				</div>
				
				<div class="col-md-6">
				    <div class="funkyradio">
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="rule3" value="10" <c:if test="${r3 == 1}">checked="checked"</c:if>/>
				            <label for="rule3">흡연 가능</label>
				        </div>
				        <div class="funkyradio-default">
				            <input type="checkbox" name="checkbox" id="rule4" value="1" <c:if test="${r4 == 1}">checked="checked"</c:if>/>
				            <label for="rule4">행사나 파티 허용</label>
				        </div>
				    </div>
				</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		<c:set var="card" value="${fn:split(hosting.hostingAddress,'|')}" />
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-dollar"></i>거래</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h6>요금설정 및 은행계좌 등록</h6>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="1박 요금" name="hostingPrice" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${hosting.hostingPrice }">
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<div class="styled-select">
									<select id="card1">
										<option value="국민" <c:if test="${card[0] == '국민'}">selected="selected"</c:if>>국민</option>
										<option value="우리" <c:if test="${card[0] == '우리'}">selected="selected"</c:if>>우리</option>
										<option value="농협" <c:if test="${card[0] == '농협'}">selected="selected"</c:if>>농협</option>
										<option value="기업" <c:if test="${card[0] == '기업'}">selected="selected"</c:if>>기업</option>
									</select>
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<input id="card2" type="text" class="form-control"  placeholder="계좌 이름. 예:홍길동" value="${card[1]}">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<input id="card3" type="text" class="form-control" placeholder="통장 계좌 번호" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${card[2]}">
								</div>
							</div>
						</div>
					</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		
		<p><!-- <a href="#0" class="btn_1 medium">저장</a> -->
		<input type="hidden" name="hostingMemberNo" value="${loginMember.memberNo }">
		<input id="hostingAddress" type="hidden" name="hostingAddress">
		<input id="hostingAmenities" type="hidden" name="hostingAmenities">
		<input id="hostingSafety" type="hidden" name="hostingSafety">
		<input id="hostingFacilities" type="hidden" name="hostingFacilities">
		<input id="hostingRule" type="hidden" name="hostingRule">
		<input type="hidden" name="hostingLatitude" value="${hosting.hostingLatitude }">
		<input type="hidden" name="hostingLongitude" value="${hosting.hostingLongitude }">
		<input id="hostingCardNum" type="hidden" name="hostingCardNum">
		<button type="button" id="hostSubmit" class="btn_1 medium">저장</button>
		</p>
	  </div>
	  <!-- /.container-fluid-->
   	</div>
    <!-- /.container-wrapper-->
</form>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.selectbox-0.2.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/retina-replace.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/js/admin.js"></script>
	<!-- Custom scripts for this page-->
	<script src="${pageContext.request.contextPath }/vendor/dropzone.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/bootstrap-datepicker.js"></script>
	<!-- 다음 우편번호(주소) 자동완성 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- WYSIWYG Editor -->
	<script src="${pageContext.request.contextPath }/js/editor/summernote-bs4.min.js"></script>
	<script>
	    $('.editor').summernote({
	  fontSizes: ['10', '14'],
	  toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough']],
	    ['fontsize', ['fontsize']],
	    ['para', ['ul', 'ol', 'paragraph']]
	    ],
	      placeholder: '이곳에 숙소 설명을 입력해주세요....',
	      tabsize: 2,
	      height: 200
	    });
	</script>
 
	<script>
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
	  
	//지오코딩을 실행하는 함수
	function geocoding(location) {
		
		$.ajax({
			type: "GET",
			url: "https://maps.googleapis.com/maps/api/geocode/json?address="+ location +"&key=AIzaSyALAJJ1tqK93WbNKjWpe6bVmbCmSJfjmK8",
			dataType: "json",
			success: function(json) {
				if (json.status == "OK") {
					console.log("지오코딩 성공");
					console.log(json);
					$("input[name=hostingLatitude]").val(json.results[0].geometry.location.lat);
					$("input[name=hostingLongitude]").val(json.results[0].geometry.location.lng);
				}
				
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	}
		
	$('#detailAddress').focusout(function() {
		//주소 지오코딩
		geocoding($("#address").val() + " " + $("#detailAddress").val());
		});
	
	//서브밋 하기 전 예외처리 및 벨류 정리
	$("#hostSubmit").click(function() {
		//hostingAddress 설정
		$("#hostingAddress").val($("#address").val() + "|" + $("#detailAddress").val() + "|" + $("#postcode").val() + "|" + $("#extraAddress").val());	
		
		//hostingCardNum 설정
		$("#hostingCardNum").val($("#card1").val() + "|" + $("#card2").val() + "|" + $("#card3").val());
		
		//시설 설정
		//비어 있는 숫자 앞에 채워넣을 0
		var filler = '0';
		var diff = amenitiesRefLength - String(calcAmenities).length;
		//Amenities 시설 설정
		var calcAmenities = 0;
		var amenitiesRefLength = 12;
		for (i = 0; i <= amenitiesRefLength; i++) {
			if ($("#amenities"+i+"").is(":checked")){
				calcAmenities += Number($("#amenities"+i+"").val());
			}			
		}
		for (var i = 0; i < diff; i++) {
			calcAmenities = filler + calcAmenities;
		   }
		$("#hostingAmenities").val(calcAmenities);
		
		//facilities 시설 설정
		var calcFacilities = 0;
		var facilitiesRefLength = 8;
		for (i = 0; i <= facilitiesRefLength; i++) {
			if ($("#facilities"+i+"").is(":checked")){
				calcFacilities += Number($("#facilities"+i+"").val());
			}			
		}
		diff = facilitiesRefLength - String(calcFacilities).length;
		for (var i = 0; i < diff; i++) {
			calcFacilities = filler + calcFacilities;
		   }
		$("#hostingFacilities").val(calcFacilities);
		
		//safety 시설 설정
		var calcSafety = 0;
		var safetyRefLength = 4;
		for (i = 0; i <= safetyRefLength; i++) {
			if ($("#safety"+i+"").is(":checked")){
				calcSafety += Number($("#safety"+i+"").val());
			}			
		}
		diff = safetyRefLength - String(calcSafety).length;
		for (var i = 0; i < diff; i++) {
			calcSafety = filler + calcSafety;
		   }
		$("#hostingSafety").val(calcSafety);
		
		//rule 시설 설정
		var calcRule = 0;
		var ruleRefLength = 4;
		for (i = 0; i <= ruleRefLength; i++) {
			if ($("#rule"+i+"").is(":checked")){
				calcRule += Number($("#rule"+i+"").val());
			}			
		}
		diff = ruleRefLength - String(calcRule).length;
		for (var i = 0; i < diff; i++) {
			calcRule = filler + calcRule;
		   }
		$("#hostingRule").val(calcRule);
		//alert(calcRule);
		
		//예외처리 시작
		if($("input[name=hostingName]").val() == ""){
			//showAlert('에러 메시지', '알림 내용이 입력되지 않았습니다.')
			 $('input[name=hostingName]').attr("style", "border: 1px solid #dc353594;");
			 $('input[name=hostingName]').focus();
			return;
		} else {
			$('input[name=hostingName]').removeAttr("style");
		}
		
		if($("textarea[name=hostingDesc]").val() == ""){
			showAlert('에러 메시지', '알림 내용이 입력되지 않았습니다.');
			$('input[name=hostingRoom]').focus();
			return;
		}
		
		if($("input[name=hostingRoom]").val() == ""){
			 $('input[name=hostingRoom]').attr("style", "border: 1px solid #dc353594;");
			 $('input[name=hostingRoom]').focus();
			return;
		} else {
			$('input[name=hostingRoom]').removeAttr("style");
		}
		
		if($("input[name=hostingPerson]").val() == ""){
			 $('input[name=hostingPerson]').attr("style", "border: 1px solid #dc353594;");
			 $('input[name=hostingPerson]').focus();
			return;
		} else {
			$('input[name=hostingPerson]').removeAttr("style");
		}
		
		if($("input[name=hostingBathroom]").val() == ""){
			 $('input[name=hostingBathroom]').attr("style", "border: 1px solid #dc353594;");
			 $('input[name=hostingBathroom]').focus();
			return;
		} else {
			$('input[name=hostingBathroom]').removeAttr("style");
		}
		
		if($("input[name=hostingBed]").val() == ""){
			 $('input[name=hostingBed]').attr("style", "border: 1px solid #dc353594;");
			 $('input[name=hostingBed]').focus();
			return;
		} else {
			$('input[name=hostingBed]').removeAttr("style");
		}
		
		if($("#detailAddress").val() == ""){
			 $('#address').attr("style", "border: 1px solid #dc353594;");
			 $('#detailAddress').attr("style", "border: 1px solid #dc353594;");
			 $('#address').focus();
			return;
		} else {
			$('#address').removeAttr("style");
			$('#detailAddress').removeAttr("style");
		}
		
		if($("input[name=hostingPrice]").val() == ""){
			 $('input[name=hostingPrice]').attr("style", "border: 1px solid #dc353594;");
			 $('input[name=hostingPrice]').focus();
			return;
		} else {
			$('input[name=hostingPrice]').removeAttr("style");
		}
		
		if($("#card2").val() == ""){
			 $('#card2').attr("style", "border: 1px solid #dc353594;");
			 $('#card2').focus();
			return;
		} else {
			$('#card2').removeAttr("style");
		}
		
		if($("#card3").val() == ""){
			 $('#card3').attr("style", "border: 1px solid #dc353594;");
			 $('#card3').focus();
			return;
		} else {
			$('#card3').removeAttr("style");
		}
		
		if($("input[name=hostingLatitude]").val() == "") {		
			showAlert('에러 메시지', '주소를 정확하게 다시 입력해주세요.');
		}
		
		//서브밋
		$("#addHostingForm").submit();
	});
	</script>