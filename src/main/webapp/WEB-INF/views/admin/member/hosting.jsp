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
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/member/hosting">호스팅 정보</a></h4></li>
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
						<div class="col-3 innerCol">
							<div class="col innerCol">
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
										  <input class="form-check-input checkboxSet" type="checkbox" name="pause" onclick="checkAllBtn(this);" value="2" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">정지</label>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						<div class="col-9 innerCol">
							<fieldset class="field ckeckboxField" style="margin:0px">
								<legend>기타 설정</legend>
								<div class="etcSection">
									<div class="row">
										<div class="col" style="text-align: right;">
											<label class="center-span">예약진행</label>
											<input type="text" name="reservationCountStart" class="form-control" style="display:inline; width: 65px; height:40px" min="0" max="9999" value="0">
											<span>명</span>
											<span class="center-span">~</span>
											<input type="text" name="reservationCountEnd" class="form-control" style="display:inline; width: 65px; height:40px" min="0" max="9999" value="9999">
											<span>명</span>
										</div>
										<div class="col" style="text-align: left;">
											<label class="center-span">다녀간게스트</label>
											<input type="text" name="usedCountStart" class="form-control" style="display:inline; width: 65px; height:40px" min="0" max="9999" value="0">
											<span>명</span>
											<span class="center-span">~</span>
											<input type="text" name="usedCountEnd" class="form-control" style="display:inline; width: 65px; height:40px" min="0" max="9999" value="9999">
											<span>명</span>
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
									<label class="pointer-field" onclick="checkFunction(this)"><strong>100건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="300" checked="true">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>300건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="500">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>500건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="1000">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>1000건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="9999">
									<label class="pointer-field" onclick="checkFunction(this)"><strong>모든호스팅 검색</strong></label>
								</span>
							</div>
						</div>
						<div class="col-2" style="padding: 0px">
							<input type="button" class="btn-primary" style="width: 100%; height: 44px; margin-top:7px;" value="검색하기" onclick="filtering(['hostingNo', 'hostNo']);">
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
									<th>호스팅번호</th>
									<th>등록일자</th>
									<th style="width: 800px;">호스팅 제목</th>
									<th>호스트번호</th>
									<th>다녀간게스트</th>
									<th>예약 중</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody class="center-body">
							<c:forEach items="${hostingTableList }" var="hostingTable">
								<tr>
									<th><a class="pointer-field" onclick="openHostingDetailComponent('h', '${hostingTable.hosting.hostingNo }');"><fmt:formatNumber value="${hostingTable.hosting.hostingNo }" pattern="0000000"/></a></th>
									<th>${fn:substring(hostingTable.hosting.hostingDate,0,10) }</th>
									<th>${hostingTable.hosting.hostingName }</th>
									<th><a class="pointer-field" onclick="openMemberDetailComponent('${hostingTable.hosting.hostingMemberNo }');"><fmt:formatNumber value="${hostingTable.hosting.hostingMemberNo }" pattern="00000"/></a></th>
									<c:choose>
										<c:when test="${not empty hostingTable.usedCount }">
											<th>${hostingTable.usedCount }건</th>
										</c:when>
										<c:when test="${empty hostingTable.usedCount }">
											<th></th>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${not empty hostingTable.reservationCount }">
											<th>${hostingTable.reservationCount }건</th>
										</c:when>
										<c:when test="${empty hostingTable.reservationCount }">
											<th></th>
										</c:when>
									</c:choose>
									<!-- 게시(grant/blue) 게시중지(stop/red) -->
									<c:choose>
									<c:when test="${hostingTable.hosting.hostingState eq 1 }">
										<th class="grant">게시중</th>
									</c:when>
									<c:when test="${hostingTable.hosting.hostingState eq 2 }">
										<th class="stop">게시중지</th>
									</c:when>
									<c:otherwise>
										<th></th>
									</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<%--   --%>
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
				resiteredDate : "등록일자"
			}
	
	var keywordObj = {
				hostingNo : "호스팅 번호",
				title : "제목",
				hostNo : "호스트 번호"
			}
</script>
<script src="${pageContext.request.contextPath}/js/admin/filter.js"></script>
<script>
	//필터 view setting
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
		var checkBoxNameList = ['allStatus','active','pause'];
		setCheckboxFilter(searchForm, filter, checkBoxNameList);
		
		// number setting
		// number setting을 위한 변수
		var numberNameList = ['reservationCountStart','reservationCountEnd',
								'usedCountStart','usedCountEnd'];
		setNumberFilter(searchForm, filter, numberNameList);
		
		// 검색 form 설정
		setSearchRowFilter(searchForm, filter);
	}
	
	//현재 섹션 선택하는 함수
	selectSection(2, 1);
</script>

