<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- /Navigation-->
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/claim/review">댓글 삭제 요청</a></h4></li>
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
							<div class="col"></div>
							<div class="col innerCol">
								<fieldset class="field ckeckboxField">
									<legend>처리상태</legend>
									<div class="checkboxSection">
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox"  name="allState" onclick="allCheck(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); allCheck(this);">전체</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="watingState" value="1" onclick="checkAllBtn(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">처리전</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="cancelState" value="0"onclick="checkAllBtn(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">취소</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input checkboxSet" type="checkbox" name="completeState" value="2" onclick="checkAllBtn(this);" checked="checked">
										  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">완료</label>
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
									<input type="radio" name="searchRow" value="100" class="selectedRadio">
									<label class="pointer-field" onclick="checkFunction(this);"><strong>100건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="300" checked="checked" class="selectedRadio">
									<label class="pointer-field" onclick="checkFunction(this);"><strong>300건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="500" class="selectedRadio">
									<label class="pointer-field" onclick="checkFunction(this);"><strong>500건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="1000" class="selectedRadio">
									<label class="pointer-field" onclick="checkFunction(this);"><strong>1000건 검색</strong></label>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</span>
								<span>
									<input type="radio" name="searchRow" value="9999" class="selectedRadio">
									<label class="pointer-field" onclick="checkFunction(this);"><strong>모든결과 검색</strong></label>
								</span>
							</div>
						</div>
						<div class="col-2" style="padding: 0px">
							<input type="button" class="btn-primary" style="width: 100%; height: 44px; margin-top:7px;" value="검색하기"  onclick="filtering(['applicantNo', 'suspectReviewNo']);">
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 테이블 영역 -->
		<div class="container-fluid" style="padding: 0px;">		
			<!-- DataTables Card-->
			<div id="amdinClaimTable" class="card mb-3">
				<!-- 카드 헤더 -->
				<div class="card-header">
					<i class="fa fa-table"></i> 신고 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<%-- 칼럼 --%>
							<thead class="center-head">
								<tr>
									<th><input type="checkbox" id="SelectedA" onclick="selectAll();"></th>
									<th>신고번호</th>
									<th>요청일</th>
									<th>요청자 번호</th>
									<th>작성자 번호</th>
									<th>댓글 내용</th>
									<th>호스팅번호</th>
									<th>처리상태</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody class="center-body">
								<c:forEach items="${reviewClaimTableList }" var="reviewClaimTable">
								<tr>
									<c:choose>
									<c:when test="${reviewClaimTable.claim.claimState eq 1}">
										<th><input type="checkbox" id="checkClaim${reviewClaimTable.claim.claimNo }" class="selectedE" onclick="selectEle()" value="${reviewClaimTable.claim.claimNo }"></th>
									</c:when>
									<c:when test="${reviewClaimTable.claim.claimState ne 1}">
										<th></th>
									</c:when>
									</c:choose>
									<th><fmt:formatNumber value="${reviewClaimTable.claim.claimNo }" pattern="00000" /></th>
									<th>${fn:substring(reviewClaimTable.claim.claimDate,0,10) }</th>
									<th><a class="pointer-field" onclick="openMemberDetailComponent('${reviewClaimTable.claim.claimApplicantNo }');"><fmt:formatNumber value="${reviewClaimTable.claim.claimApplicantNo }" pattern="00000"/> </a></th>
									<th><a class="pointer-field" onclick="openMemberDetailComponent('${reviewClaimTable.claim.claimSuspectNo }');"><fmt:formatNumber value="${reviewClaimTable.claim.claimSuspectNo }" pattern="00000"/></a></th>
									<c:if test="${fn:length(reviewClaimTable.review.reviewContent) lt 20}">
										<th>${reviewClaimTable.review.reviewContent }</th>
									</c:if>
									<c:if test="${fn:length(reviewClaimTable.review.reviewContent) ge 20}">
										<th title="${reviewClaimTable.review.reviewContent }">${fn:substring(reviewClaimTable.review.reviewContent,0,20) }...</th>
									</c:if>
									<th><fmt:formatNumber value="${reviewClaimTable.review.reviewHostingNo }" pattern="0000000" /> </th>
									<c:choose>
									<c:when test="${reviewClaimTable.claim.claimState eq 1 }" >
										<th>처리중</th>
									</c:when>
									<c:when test="${reviewClaimTable.claim.claimState eq 2 }" >
										<th>완료</th>
									</c:when>
									<c:when test="${reviewClaimTable.claim.claimState eq 0}" >
										<th>취소</th>
									</c:when>
									</c:choose>
									<c:choose>
									<c:when test="${reviewClaimTable.claim.claimState eq 1}">
									<th>
										<span><a class="pointer-field" onclick="showConfirm('확인 메시지', '${reviewClaimTable.claim.claimNo }'+'번 신고 내역을 처리하시겠습니까?', disposeOne, [event, ${reviewClaimTable.claim.claimNo }, 'complete'])">삭제</a></span>
										&nbsp;&nbsp;/&nbsp;&nbsp;
										<span><a class="pointer-field" onclick="showConfirm('확인 메시지', '${reviewClaimTable.claim.claimNo }'+'번 신고 내역을 취소하시겠습니까?', disposeOne, [event, ${reviewClaimTable.claim.claimNo }, 'cancel'])">취소</a></span>
									</th>
									</c:when>
									<c:when test="${reviewClaimTable.claim.claimState ne 1}">
										<th><a onclick="showConfirm('확인 메시지', '${reviewClaimTable.claim.claimNo }'+'번 내역에 대한 처리를 취소 하시겠습니까?', modifyClaimRieviewStatePost, ['${reviewClaimTable.claim.claimNo }', '${reviewClaimTable.claim.claimSuspectNo}'])">처리취소</a></th>
									</c:when>
									</c:choose>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="9">
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '정말 모든 내역을 처리하시겠습니까?', disposeAll, ['complete'])">모든 내역 처리</button>
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '정말 모든 내역을 취소하시겠습니까?', disposeAll, ['cancel'])">모든 내역 취소</button>
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '선택 내역을 모두 처리하시겠습니까?', disposeSelect, ['complete'])">선택 내역 처리</button>
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '선택 내역을 모두 처리하시겠습니까?', disposeSelect, ['cancel'])">선택 내역 취소</button>
									</th>
								</tr>
							</tfoot>
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
	//global setting
	// 범위검색과 키워드 검색 추가를 위해 format값을 저장하는 객체
	var rangeObj = {
				claimDate : "요청일"
			}
	
	var keywordObj = {
				// 리뷰 내용
				content: "신고 내용",
				applicantNo: "요청자 번호",
				suspectReviewNo: "작성자 번호",
			}
	
	
	var selectAll = function(){
		var selectA = document.getElementById("SelectedA");
		var selectEs = document.getElementsByClassName("selectedE");
		
		if(selectA.checked == true){
			for(let e of selectEs){
				e.checked = true;
			}
		}else if(selectA.checked == false){
			for(let e of selectEs){
				e.checked = false;
			}
		}
	}
	
	var selectEle = function(){
		var selectA = document.getElementById("SelectedA");
		var selectEs = document.getElementsByClassName("selectedE");
		var result = true;
		
		for(let e of selectEs){
			if(e.checked == false){
				result = false;
			}
		}
		
		selectA.checked = result;
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
		var checkBoxNameList = ['allState','watingState','cancelState','completeState'];
		setCheckboxFilter(searchForm, filter, checkBoxNameList);
		
		// 검색 form 설정
		setSearchRowFilter(searchForm, filter);
	}
</script>

<%-- 리뷰클래임 업데이트 관련 자바스크립트 --%>
<script>
	var claimCancelList = [];
	var claimCompleteList = [];
	var $amdinClaimTable = $("#amdinClaimTable");
	// 생성된 회원 번호를 담는 배열 객체
	var claimNos = [];
	var resultClaims = [];
</script>
<c:forEach items="${reviewClaimTableList }" var="reviewClaimTable">
<script>
	claimNos.push('${reviewClaimTable.claim.claimNo }');
	claimCancelList.push({
		claimNo: '${reviewClaimTable.claim.claimNo}',
		claimSuspectReviewNo: '${reviewClaimTable.claim.claimSuspectReviewNo}',
		claimState: 0
	})
	claimCompleteList.push({
		claimNo: '${reviewClaimTable.claim.claimNo}',
		claimSuspectReviewNo: '${reviewClaimTable.claim.claimSuspectReviewNo}',
		claimState: 2
	})
</script>
</c:forEach>
<script>
	// 선택내역 처리하는 함수
	var disposeSelect = function(type){
		switch (type) {
		case "complete":
			for(index in claimNos){
				if($amdinClaimTable.find('#checkClaim'+claimNos[index]).prop('checked') == true){
					resultClaims.push(claimCompleteList[index]);
				}
			}
			break;
		case "cancel":
			for(index in claimNos){
				if($amdinClaimTable.find('#checkClaim'+claimNos[index]).prop('checked') == true){
					resultClaims.push(claimCancelList[index]);
				}
			}
			break;
		}
		// 7일 정지
		modifyClaimRieviewStateServicePromise(resultClaims).then((resolve)=>{
			// 결과 값을 가져옴
			showAlert('완료메시지', resolve + '개의 신고 처리 완료하였습니다.', ()=>{
				location.reload();
			});
		})
	}
	// 전체내역 처리하는 함수
	var disposeAll = function(type){
		switch (type) {
		case "complete":
			for(index in claimNos){
				console.log(index)
				if(document.getElementById('checkClaim'+claimNos[index]) != null){
					console.log(claimCancelList[index])
					resultClaims.push(claimCompleteList[index]);
				}
			}
			break;
		case "cancel":
			for(index in claimNos){
				if(document.getElementById('checkClaim'+claimNos[index]) != null){
					resultClaims.push(claimCancelList[index]);
				}
			}
			break;
		}
		
		console.log(resultClaims);
		//ajax
		modifyClaimRieviewStateServicePromise(resultClaims).then((resolve)=>{
			// 결과 값을 가져옴, alter 및 추가 요소 설정
			showAlert('완료메시지', resolve + '개의 신고 처리 완료하였습니다.', ()=>{
				location.reload();
			});
		})
	}
	// 한개내역을 처리하는 함수
	var disposeOne = function(event, claimNo, type){
		event.preventDefault();
		var claim = {};
		switch (type) {
		case "complete":
			for(index in claimNos){
				if(claimNo == claimNos[index]){
					claim = claimCompleteList[index];
				}
			}
			break;
		case "cancel":
			for(index in claimNos){
				if(claimNo == claimNos[index]){
					claim = claimCancelList[index];
				}
			}
			break;
		}
		//ajax
		modifyClaimRieviewStateServicePromise(claim).then((resolve)=>{
			// 결과 값을 가져옴
			showAlert('완료메시지', resolve + '개의 신고 처리 완료하였습니다.', ()=>{
				location.reload();
			});
		})
	}
</script>
<script>
	// claim 테이블 및 member 또는 review를 업데이트하는 ajax기능을 callback하는 promise 반환
	// data : 전달할 데이터 (claim 형식의 배열을 전달해야함)
	// plus : 정지할 일자
	var modifyClaimRieviewStateServicePromise = function(data){
		if(data[0] == undefined){
			//전달받은 값이 배열이 아니라면
			return new Promise((resolve, reject)=>{
				$.ajax({
					url: '/yolowa/rest/admin/claim/review/state',
					headers: {"content-type":"application/json","X-HTTP-Method-override":"POST"},
					dataType:'text',
					type:'post',
					data: JSON.stringify(data),
					success:function(result){
						resolve(result);			
						data = [];		
					}
				})
			})
		}else{
			// 배열이라면
			return new Promise((resolve, reject)=>{
				$.ajax({
					url: '/yolowa/rest/admin/claim/review/state/all',
					headers: {"content-type":"application/json","X-HTTP-Method-override":"POST"},
					dataType:'text',	
					type:'post',
					data: JSON.stringify(data),
					success:function(result){
						resolve(result);			
						data = [];		
					}
				})
			})
		}
	}
	
	var modifyClaimRieviewStatePost = function(claimNo, claimSuspectReviewNo){
		$.ajax({
			url: '/yolowa/rest/admin/claim/review/state/post',
			headers: {"content-type":"application/json","X-HTTP-Method-override":"POST"},
			dataType:'text',	
			type:'post',
			data: JSON.stringify({
						claimNo: claimNo,
						claimSuspectReviewNo: claimSuspectReviewNo,
						claimState: 1
					}),
			success:function(result){
				showAlert('완료메시지', result + '개의 신고 처리를 취소하였습니다.', ()=>{
					location.reload();
				});
			}
		})
	};
	
	//현재 섹션 선택하는 함수
	selectSection(3, 1);
</script>