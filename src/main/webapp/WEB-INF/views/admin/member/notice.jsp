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
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/member/notice">회원 공지 발송</a></h4></li>
		</ol>
		
		<!-- 발송처리 영역 -->
		<div class="card mb-3">
			<!-- 카드 헤더 -->
			<div class="card-header pointer-field" onclick="nextDivToggle(this);">
				<i class="fa fa-send"></i> 발송처리
			</div>
			<div class="card-body" style="display:none;">
				<form name="messageSendForm" action="${pageContext.request.contextPath }/admin/member/notice" method="post">
				<input type="hidden" name="queryString" value="">
					<div style="border:1px solid lightgray; border-radius: 5px; padding:20px 30px;">
						<div class="row fieldContent">
							<div class="col-2">
								<select name="selectForm" class="custom-select mr-sm-2 format" style="width: 100%;" onchange="parentNextInputToggle(this); messageSendForm.receiver.value='';">
									<option value="divEvery" selected>모든 회원</option>
									<option value="divSelect">선택 회원</option>
								</select>
							</div>
							<div class="col-10">
								<input name="receiver" type="text" class="form-control" placeholder="회원번호를 입력해주세요." style="width: 70%; height: 40px;  display:none;"/>
							</div>
						</div>
						
						<div class="row fieldContent" style="margin: 15px 0;">
							<div class="col" style="text-align: center; padding: 0px;">
								<input name="message" type="text" class="form-control" placeholder="발송 내용을 입력해주세요."/>
							</div>
						</div>
						<div class="row">
							<div class="col" style="padding: 0px; text-align: right;">
								<input type="button" onclick="sendAlarm();" class="btn-primary" style="width: 10%; height: 44px; margin-top:7px;" value="발송">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 필터처리 영역 -->
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
							<div class="col-6 innerCol">
								<fieldset class="field ckeckboxField">
									<legend>상태 선택</legend>
									<div class="checkboxSection">
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" onclick="allCheck(this);" name="statusAll" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); allCheck(this);">전체</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="statusSend" value="3" onclick="checkAllBtn(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">발송</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="statusCancel" value="4" onclick="checkAllBtn(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">취소</label>
										</div>
									</div>
								</fieldset>
							</div>
							<div class="col-1 innerCol"> </div>
							<div class="col-6 innerCol">
								<fieldset class="field ckeckboxField" style="margin-right: 0px;">
									<legend>구분 선택</legend>
									<div class="checkboxSection">
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" onclick="allCheck(this);" name="divAll" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); allCheck(this);">전체</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="divEvery" value="1" onclick="checkAllBtn(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">모든회원</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="divSelect" value="2" onclick="checkAllBtn(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">선택회원</label>
										</div>
									</div>
								</fieldset>
							</div>
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
									<input type="radio" name="searchRow" value="300" checked="checked">
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
									<label class="pointer-field" onclick="checkFunction(this)"><strong>모든내역 검색</strong></label>
								</span>
							</div>
						</div>
						<div class="col-2" style="padding: 0px">
							<input type="button" class="btn-primary" style="width: 100%; height: 44px; margin-top:7px;" value="검색하기" onclick="filtering(['memberNo', 'managerNo']);">
						</div>
					</div>
				</form>
			</div>
		</div>
		
		
		
		<!-- 출력 테이블 영역 영역 -->
		<div class="container-fluid" style="padding: 0px;">		
			<!-- DataTables Card-->
			<div class="card mb-3">
				<!-- 카드 헤더 -->
				<div class="card-header">
					<i class="fa fa-table"></i> 발송 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<%-- 칼럼 --%>
							<thead class="center-head">
								<tr>
									<th>번호</th>
									<th>알림날짜</th>
									<th style="width: 900px;">메시지</th>
									<th>발신자</th>
									<th>수신자</th>
									<th>상태</th>
									<th>발신취소</th>
								</tr>
							</thead>
							<tbody class="center-body">
								<c:forEach items="${messageTableList }" var="messageTable">
								<tr>
									<th><fmt:formatNumber value="${messageTable.messageNo }" pattern="00000" /></th>
									<th>${fn:substring(messageTable.messageDate,0,10) }</th>
									<th title="${messageTable.messageContent }">${fn:substring(messageTable.messageContent,0,30) }</th>
									<th><fmt:formatNumber value="${messageTable.messageSenderNo }" pattern="00000" /></th>
									<c:if test="${messageTable.messageReceiverNo ne 0}">
										<th><fmt:formatNumber value="${messageTable.messageReceiverNo }" pattern="00000" /></th>
									</c:if>
									<c:if test="${messageTable.messageReceiverNo eq 0 }">
										<th>모든회원</th>
									</c:if>
									<c:choose>
										<c:when test="${messageTable.messageState eq 3}">
											<th>발신완료</th>
										</c:when>
										<c:when test="${messageTable.messageState eq 4}">
											<th>발신취소</th>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${messageTable.messageState eq 3}">
											<th><a href="#" onclick="changeNoticeState(event, ${messageTable.messageNo });">취소하기</a></th>
										</c:when>
										<c:when test="${messageTable.messageState eq 4}">
											<th></th>
										</c:when>
									</c:choose>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">마지막 변경일 : ${changeDate }</div>
			</div>
			<!-- /tables-->
		</div>
	<!-- /container-fluid-->
	</div>
</div>
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery.selectbox-0.2.js"></script>
<script src="${pageContext.request.contextPath}/vendor/retina-replace.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<!-- Custom scripts for this page-->
<script src="${pageContext.request.contextPath}/js/admin-datatables.js"></script>
<!-- custom -->
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>
	
<!-- yolowa Custom script -->
<script>
	
	
	var rangeObj = {
			 alramDate: "알림날짜"
		}
	var keywordObj = {
			message: "메시지",
			memberNo: "회원번호",
			managerNo: "관리자번호"
		}
</script>
<script src="${pageContext.request.contextPath}/js/admin/filter.js"></script>

<script>
// 필터 view setting
	// 전달받은 필터를 저장
	var filter = ${filter };
	// filter가 전달 되었는지 확인
	if(filter.writeSuccess == null){
		if(JSON.stringify(filter) != '{}'){
			// searchForm 세팅
			setRangeFilter(searchForm, filter);
			
			// keywordForm 세팅
			setKeywordFilter(searchForm, filter);
			
			// checkbox setting
			// checkbox setting을 위한 변수
			var checkBoxNameList = ['statusAll','statusSend', 'statusCancel',
								'divAll','divEvery','divSelect'];
			setCheckboxFilter(searchForm, filter, checkBoxNameList);
			
			// 검색 form 설정
			setSearchRowFilter(searchForm, filter);
		}
	}
</script>
<script>
	// 발송에 관련된 자바스크립트
	// 쿼리 스트링 저장
	if(location.href.split('?')[1] != undefined){
		messageSendForm.queryString.value = location.href.split('?')[1];
	}
	
	// 0: 발송자 수 1: 발송 메시지
	if(filter.writeSuccess != undefined){
		var writeSuccesses = filter.writeSuccess.split(',');
		
		if(writeSuccesses.length != 0){
			showAlert('알림 메시지', '알림 발송을 완료하였습니다.');	
		}
	}
	var sendAlarm =function(){
		showConfirm('확인 메시지', '선택하신 회원에게 알림 하시겠습니까?', function(){
			if(messageSendForm.receiver.value != "" && isNaN(parseInt(messageSendForm.receiver.value))){
				showAlert('에러 메시지', '회원의 번호를 입력해주세요.')
				return;
			}
			
			if(messageSendForm.message.value == ""){
				showAlert('에러 메시지', '알림 내용이 입력되지 않았습니다.')
				return;
			}
			
			$(messageSendForm).submit();
		});
	}
	
</script>
<script>
	var changeNoticeState = function(event, messageNo){
		showConfirm('확인 메시지', '선택하신 알림의 상태를 변경하시겠습니까?', function(){
			event.preventDefault();
			$.ajax({
				  url: "notice/update",
				  type: "post",
				  dataType: "json",
				  data: {"messageNo": messageNo},
				  success: function(data){
					  showAlert("메시지 발송을 취소하였습니다.");
					  // change view
					  $(event.target).html("")
					  $(event.target).parent().prev().html("발신취소");
				  },
				   error: function (request, status, error){
					   showAlert("메시지 상태 변경에 실패하였습니다.");
				  }
			});
		});
	}
	
	//현재 섹션 선택하는 함수
	selectSection(2, 2);
</script>