<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- /Navigation-->
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/reservation/reservation">예약 관리</a></h4></li>
		</ol>
		<!-- 데이터를 filter -->
		<div class="card mb-3">
			<!-- 카드 헤더 -->
			<div class="card-header">
				<i class="fa fa-filter"></i> 필터
			</div>
			<div class="card-body">
				<form name="searchForm">
				<input type="hidden" name="rangeCount"/>
				<input type="hidden" name="keywordCount"/>
					<fieldset class="field dateField">
						<legend>날짜 검색</legend>
					</fieldset>
					<fieldset class="field keywordField">
						<legend>단어 검색</legend>
					</fieldset>
					
					<div class="row fieldCollection">
						<div class="col innerCol">
							<fieldset class="field ckeckboxField" style="margin:0px;">
								<legend>상세 선택</legend>
								<div class="checkboxSection">
									<div class="form-check form-check-inline" style="margin: 0 15px;">
									  <input class="form-check-input checkboxSet" type="checkbox" onclick="allCheck(this);" name="stateAll" checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); allCheck(this);">전체</label>
									</div>
									<div class="form-check form-check-inline" style="margin: 0 15px;">
									  <input class="form-check-input checkboxSet" type="checkbox" name="stateWating" value="1" onclick="checkAllBtn(this);"checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">대기</label>
									</div>
									<div class="form-check form-check-inline" style="margin: 0 15px;">
									  <input class="form-check-input checkboxSet" type="checkbox" name="stateAccess" value="2"  onclick="checkAllBtn(this);" checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">승인(이용전)</label>
									</div>
									<div class="form-check form-check-inline" style="margin: 0 15px;">
									  <input class="form-check-input checkboxSet" type="checkbox" name="stateComplete" value="3" onclick="checkAllBtn(this);" checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">이용완료</label>
									</div>
									<div class="form-check form-check-inline" style="margin: 0 15px;">
									  <input class="form-check-input checkboxSet" type="checkbox" name="stateCancel" value="0" onclick="checkAllBtn(this);" checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">취소</label>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
					<div class="row fieldCollection">
						<div class="col-10" style="float:left">
							<div style="margin-top: 18px;">
								<span>
									<input type="radio" name="searchRow" value="100">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>100명 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="300" checked="checked">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>300명 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="500">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>500명 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="1000">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>1000명 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="9999">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>모든회원 검색</strong></label>
								</span>
							</div>
						</div>
						<div class="col-2" style="padding: 0px">
							<input type="button" class="btn-primary" style="width: 100%; height: 44px; margin-top:7px;" value="검색하기" onclick="filtering(['reservationNo', 'memberNo', 'hostingNo']);">
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 테이블 영역 -->
		<div class="container-fluid" style="padding: 0px;">		
			<!-- DataTables Card-->
			<div class="card mb-3">
				<!-- 카드 헤더 -->
				<div class="card-header">
					<i class="fa fa-table"></i> 회원 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<%-- 칼럼 --%>
							<thead class="center-head">
								<tr>
									<th colspan="4">예약 기본정보</th>
									<th colspan="4">예약정보 상세</th>
									<th colspan="2">상 태</th>
								</tr>
								<tr>
									<th>예약번호</th>
									<th>호스팅 번호</th>
									<th>게스트 번호</th>
									<th>신청일</th>
									<th>예약시간</th>
									<th>고객수</th>
									<th>결제자</th>
									<th>총가격</th>
									<th>취소신청자</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody class="center-body">
								<c:forEach items="${reservationTableList }" var="reservationTable" >
								<tr>
									<th><fmt:formatNumber value="${reservationTable.reservationNo }" pattern="0000000"/></th>
									<th><a class="pointer-field" onclick="openHostingDetailComponent('h', '${reservationTable.reservationHostingNo }');"><fmt:formatNumber value="${reservationTable.reservationHostingNo }" pattern="00000" /></a></th>
									<th><a class="pointer-field" onclick="openMemberDetailComponent('${reservationTable.reservationMemberNo }');"><fmt:formatNumber value="${reservationTable.reservationMemberNo }" pattern="00000" /></a></th>
									<th>${fn:substring(reservationTable.reservationDate,0,10) }</th>
									<th>
										${fn:substring(reservationTable.reservationCheckIn,0,10) }
										&nbsp;~&nbsp; 
										${fn:substring(reservationTable.reservationCheckOut,0,10) }
										<fmt:parseDate value="${reservationTable.reservationCheckIn }" var="checkInDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${checkInDate.time / (1000*60*60*24)}" integerOnly="true" var="checkIn" />
										<fmt:parseDate value="${reservationTable.reservationCheckOut }" var="checkOutDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${checkOutDate.time / (1000*60*60*24)}" integerOnly="true" var="checkOut" />
										&nbsp;(${checkOut - checkIn } 일)
									</th>
									<th>${reservationTable.reservationGuestNum }명</th>
									<th>${reservationTable.reservationName }</th>
									<th><fmt:formatNumber value="${reservationTable.reservationTotalPrice }" type="currency"/></th>
									<th></th>
									<!-- 취소(stop/red) 대기중(wait/orange) 승인(입실전)(grant/blue) 이용완료(complete/green) -->
									<c:choose>
									<c:when test="${reservationTable.reservationState eq 0}">
										<th class="stop">취소</th>
									</c:when>
									<c:when test="${reservationTable.reservationState eq 1}">
										<th class="wait">대기</th>
									</c:when>
									<c:when test="${reservationTable.reservationState eq 2}">
										<th class="grant">승인(입실전)</th>
									</c:when>
									<c:when test="${reservationTable.reservationState eq 3}">
										<th class="complete">이용완료</th>
									</c:when>
									</c:choose>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<%-- 함수를 반환값을 주입 --%>
				<div class="card-footer small text-muted">마지막 변경일 : ${changeDate }</div>
			</div>
			<!-- /tables-->
		</div>
	<!-- /container-fluid-->
	</div>
</div>
<%-- javascript --%>
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath }/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath }/vendor/jquery.selectbox-0.2.js"></script>
<script src="${pageContext.request.contextPath }/vendor/retina-replace.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/admin.js"></script>
<!-- Custom scripts for this page-->
<script src="${pageContext.request.contextPath }/js/admin-datatables.js"></script>
<!-- custom -->
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>

<!-- yolowa Custom script -->
<script>
	//global setting
	// 범위검색과 키워드 검색 추가를 위해 format값을 저장하는 객체
	var rangeObj = {
				checkIn : "체크인",
				checkOut : "체크아웃"
			}
	
	var keywordObj = {
				reservationNo: "예약 번호",
				memberNo: "게스트 번호",
				hostingNo: "호스팅 번호",
				payer: "결제자"
			}
</script>
<script src="${pageContext.request.contextPath }/js/admin/filter.js"></script>

<script>
// 필터 view setting
	// 전달받은 필터를 저장
	var filter = ${filter };
	// filter가 전달 되었는지 확인
	if(JSON.stringify(filter) != '{}'){
		// searchForm 세팅
		setRangeFilter(searchForm, filter);
		
		// keywordForm 세팅
		setKeywordFilter(searchForm, filter);
		
		// checkbox setting
		// checkbox setting을 위한 변수
		var checkBoxNameList = ['stateAll','stateWating','stateAccess','stateCancel'];
		setCheckboxFilter(searchForm, filter, checkBoxNameList);
		
		// 검색 form 설정
		setSearchRowFilter(searchForm, filter);
	}
	
	//현재 섹션 선택하는 함수
	selectSection(1, 0);
</script>
