<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/member/member">회원정보</a></h4></li>
		</ol>
		<!-- 데이터를 filter -->
		<div class="card mb-3">
			<!-- 카드 헤더 -->
			<div class="card-header">
				<i class="fa fa-filter"></i> 필터
			</div>
			<div class="card-body">
				<form name="searchForm" action="${pageContext.request.contextPath }/admin/member/member" method="get">
				<input type="hidden" name="rangeCount"/>
				<input type="hidden" name="keywordCount"/>
				
					<fieldset class="field dateField">
						<legend>날짜 검색</legend>
					</fieldset>
					<fieldset class="field keywordField">
						<legend>단어 검색</legend>
					</fieldset>
					
					<div class="row fieldCollection">
						<div class="col-6 innerCol">
							<div class="col-6 innerCol">
								<fieldset class="field ckeckboxField">
									<legend>호스트 구분</legend>
									<div class="checkboxSection">
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" onclick="allCheck(this);" name="allhost" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); allCheck(this);">전체</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="host" onclick="checkAllBtn(this);" value="1" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">호스트</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="superHost"  onclick="checkAllBtn(this);" value="2" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">슈퍼호스트</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="guest" onclick="checkAllBtn(this);" value="0" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">게스트</label>
										</div>
									</div>
								</fieldset>
							</div>
							<div class="col-6 innerCol">
								<fieldset class="field etcField">
									<legend>상태 선택</legend>
									<div class="checkboxSection">
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" onclick="allCheck(this);" name="allStatus" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); allCheck(this);">전체</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="active" onclick="checkAllBtn(this);" value="1" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">정상</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="inactive" onclick="checkAllBtn(this);" value="3" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">휴면</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="pause" onclick="checkAllBtn(this);" value="2" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">정지</label>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						<div class="col-6 innerCol">
							<fieldset class="field ckeckboxField" style="margin:0px">
								<legend>기타 설정</legend>
								<div class="etcSection">
									<div class="row">
										<div class="col">
											<label class="center-span" style="margin-bottom: 11.3px;">총매출</label>
											<input type="number" class="form-control" name="totalPriceStart" style="display:inline; width: 130px; height:40px" min="0" max="999999999" value="0">
											<span class="center-span">~</span>
											<input type="number" class="form-control" name="totalPriceEnd" style="display:inline; width: 130px; height:40px" min="0" max="999999999" value="999999999">
											<span>원</span>
										</div>
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
							<input type="button" class="btn-primary" style="width: 100%; height: 44px; margin-top:7px;" value="검색하기" onclick="filtering(['no']);">
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
									<th colspan="8">회원 기본정보</th>
									<th colspan="2">회원 상세정보</th>
									<th>이용 정보</th>
								</tr>
								<tr>
									<th>회원번호</th>
									<th>이메일</th>
									<th>이름</th>
									<th>생년월일</th>
									<th>전화번호</th>
									<th>주소</th>
									<th>성별</th>
									<th>회원가입일</th>
									<th>호스팅</th>
									<th>회원 상태</th>
									<th>이용금액</th>
								</tr>
							</thead>
							<tbody class="center-body">
								<c:forEach items="${memberTableList }" var="memberTable">
									<tr>
										<th><a class="pointer-field" onclick="openMemberDetailComponent('${memberTable.member.memberNo}');"><fmt:formatNumber value="${memberTable.member.memberNo }" pattern="00000" /></a></th>
										<th>${memberTable.member.memberEmail }</th>
										<th>${memberTable.member.memberName }</th>
										<th>${fn:substring(memberTable.member.memberBirthday,0,10) }</th>
										<th>${memberTable.member.memberPhone }</th>
										<c:if test="${not empty memberTable.member.memberAddress }">
											<c:if test="${fn:length(memberTable.member.memberAddress) lt 10}">
												<th>${memberTable.member.memberAddress }</th>
											</c:if>
											<c:if test="${fn:length(memberTable.member.memberAddress) ge 10}">
												<th title="${memberTable.member.memberAddress }">${fn:substring(memberTable.member.memberAddress,0,10) }...</th>
											</c:if>
										</c:if>
										<c:if test="${empty memberTable.member.memberAddress }">
											<th></th>
										</c:if>
										<c:choose>
											<c:when test="${memberTable.member.memberSex eq 1}">
												<th>남자</th>
											</c:when>
											<c:when test="${memberTable.member.memberSex eq 2}">
												<th>여자</th>
											</c:when>
											<c:when test="${memberTable.member.memberSex eq 3}">
												<th>기타</th>
											</c:when>
											<c:otherwise>
												<th></th>
											</c:otherwise>
										</c:choose>
										<th>${fn:substring(memberTable.member.memberJoinDate,0,10) }</th>
										<c:if test="${memberTable.hostingCount ne 0 }">
											<th><a class="pointer-field" onclick="openHostingDetailComponent('m', '${memberTable.member.memberNo }');">${memberTable.hostingCount }건</a></th>
										</c:if>
										<c:if test="${memberTable.hostingCount eq 0 }">
											<th></th>
										</c:if>
										<c:choose>
											<c:when test="${memberTable.member.memberState eq 1}">
												<th id="state${memberTable.member.memberNo }">정상</th>
											</c:when>
											<c:when test="${memberTable.member.memberState eq 2}">
												<th id="state${memberTable.member.memberNo }">정지</th>
											</c:when>
											<c:when test="${memberTable.member.memberState eq 3}">
												<th id="state${memberTable.member.memberNo }">휴면</th>
											</c:when>
											<c:when test="${memberTable.member.memberState eq 9}">
												<th id="state${memberTable.member.memberNo }">관리자</th>
											</c:when>
											<c:otherwise>
												<th></th>
											</c:otherwise>
										</c:choose>
										<c:if test="${memberTable.reservationTotalPrice ne 0 }">
											<th><fmt:formatNumber value="${memberTable.reservationTotalPrice }" type="currency" currencySymbol="￦  " />&nbsp;&nbsp;(${memberTable.reservationCount }건)</th>
										</c:if>
										<c:if test="${memberTable.reservationTotalPrice eq 0 }">
											<th>￦ 0 (0건)</th>
										</c:if>
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
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.js"></script>
<script src="${pageContext.request.contextPath }/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath }/vendor/jquery.selectbox-0.2.js"></script>
<script src="${pageContext.request.contextPath }/vendor/retina-replace.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/admin.js"></script>
<!-- Custom scripts for this page-->
<script src="${pageContext.request.contextPath}/js/admin-datatables.js"></script>
<!-- custom -->
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>
	
<!-- yolowa Custom script -->
<script>
	//global setting
	// 범위검색과 키워드 검색 추가를 위해 format값을 저장하는 객체
	var rangeObj = {
				joinDate : "회원가입일",
				birthDay : "생년월일",
				//lastLogin: "마지막로그인"
			}
	
	var keywordObj = {
				no: "회원번호",
				email: "이메일",
				name: "이름",
				phone: "전화번호",
				address: "주소"
			}
	
	
</script>
<script src="${pageContext.request.contextPath}/js/admin/filter.js"></script>

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
		var checkBoxNameList = ['allhost','host','superHost','superHost','guest',
							'allStatus','active','inactive','pause'];
		setCheckboxFilter(searchForm, filter, checkBoxNameList);
		
		// number setting
		// number setting을 위한 변수
		var numberNameList = ['totalPriceStart','totalPriceEnd'];
		setNumberFilter(searchForm, filter, numberNameList);
		
		// 검색 form 설정
		setSearchRowFilter(searchForm, filter);
	}
	
	//현재 섹션 선택하는 함수
	selectSection(2, 0);
</script>