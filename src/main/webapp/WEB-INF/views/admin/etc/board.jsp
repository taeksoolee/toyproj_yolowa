<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
#boarImageBtn{
	height: 40px;
    width: 100px;
}

#boardImageName{
	margin: auto 20px;
    font-size: 15px;
}

#previewBoardImageButton{
	height: 40px;
	    float: right;
		width: 185px;
}

#previewBoardImage{
height: 400px;
    background: white;
    border: 1px solid lightgray;
    border-radius: 10px;
    position: relative;
    top: -450px;
    margin: 0px 0px -400px;
    padding: 0px;
    display: none;
    left: 20%;
    width: 80%;
    text-align: center;
}

#previewBoardImage img{
	border-radius: 10px;
    	width: 100%;
    	height: 100%;
}
</style>


<!-- /Navigation-->
<div class="content-wrapper" onclick="$('#boardSuggestBox').hide();">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/etc/board">게시물 관리</a></h4></li>
		</ol>
		
		<!-- 발송처리 영역 -->
		<div class="card mb-3">
			<!-- 카드 헤더 -->
			<div class="card-header pointer-field" onclick="nextDivToggle(this);">
				<i class="fa fa-send"></i> 게시물 등록&nbsp;/&nbsp;수정
			</div>
			<div class="card-body" style="display:none;">
				<form name="boardNoticeForm" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-6" style="margin-bottom:20px;">
							<select class="form-control" id="boardCategory" name="boardCategory" onchange="updateBoardSetting();">
								<option value="0">게시판 항목을 선택하세요.</option>
								<option value="1">공지</option>
								<option value="2">이벤트</option>
								<option value="3">칼럼</option>
							</select>
						</div>
						<div class="col-6">
							<div style="float:right;">
								<input type="button" class="btn-primary" style="width: 150px; height: 44px;" value="초기화" onclick="updateBoardSetting();">
								<input type="button" class="btn-primary" style="width: 150px; height: 44px;" value="저장하기" onclick="save();">
							</div>
						</div>
					</div>
					<div class="row" style="margin-bottom:20px;">
						<div class="col">
							<input type="text" id="boardTitle" name="boardTitle" class="form-control" placeholder="제목을 입력하세요." onclick="updateBoardSuggest();" onkeyup="updateBoardSetting(); updateBoardSuggest();" autocomplete="off">
							<!-- suggest 기능 : option -->
							<div id="boardSuggestBox" class="suggestBox">
								<div v-for="board in boardList" class="suggestOption" onclick="choiceBoardSuggest(this)" v-bind:id="'boardSuggestValue_' + board.boardNo">{{board.boardTitle}}</div>
							</div>
						</div>
					</div>
					<!-- editor -->						
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								 <textarea class="editor" name="boardContent" id="boardContent" placeholder="내용을 입력하세요."></textarea>
							</div>
						</div>
					</div>
					<!-- image -->
					<div class="row">
						<div class="col">
							<input type="file" name="boardImageProxy" style="display: none;"/>
							<input type="file" name="boardImageFile" style="display:none;"/>
							<button type="button" id="boarImageBtn" class="btn-info">업로드</button>
							<span id="boardImageName"></span>
						</div>
						<div class="col">
							<button type="button" id="previewBoardImageButton" class="btn-info">
								이미지 미리보기
							</button>
						</div>
					</div>
					<div id="previewBoardImage">
    					<img src="/yolowa/img/board/admin-no-board.png" />
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
					<fieldset class="field">
						<legend>게시물 선택</legend>
						<div class="row">
							<div class="col-1"></div>
							<div class="col-9" style="margin: 0 25px; margin-bottom: 7px;">
								<select class='form-control' name='category' onchange='SetSelectBox();'>
										<option value="0">전체</option>
										<option value="1">공지</option>
										<option value="2">이벤트</option>
										<option value="3">칼럼</option>
								</select>
								
							</div>
						</div>
					</fieldset>
					<fieldset class="field keywordField">
						<legend>단어 검색</legend>
					</fieldset>
					
					<div class="row fieldCollection">
						<div class="col innerCol">
							<fieldset class="field ckeckboxField" style="width: 100%;">
								<legend>게시상태</legend>
								<div class="checkboxSection">
									<div class="form-check form-check-inline" style="margin-left: 40px;">
									  <input class="form-check-input checkboxSet" type="checkbox"  name="stateAll" onclick="allCheck(this);" checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); allCheck(this);">전체</label>
									</div>
									<div class="form-check form-check-inline" style="margin-left: 40px;">
									  <input class="form-check-input checkboxSet" type="checkbox" name="statePost" onclick="checkAllBtn(this);" value="1"  checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">게시중</label>
									</div>
									<div class="form-check form-check-inline" style="margin-left: 40px;">
									  <input class="form-check-input checkboxSet" type="checkbox" name="stateStop"  onclick="checkAllBtn(this);" value="0" checked="checked">
									  <label class="form-check-label pointer-field" onclick="checkFunction(this); checkAllBtn(this);">게시중지</label>
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
							<input type="submit" class="btn-primary" style="width: 100%; height: 44px; margin-top:7px;" value="검색하기">
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 출력 테이블 영역 영역 -->
		<div class="container-fluid" style="padding: 0px;">		
			<!-- DataTables Card-->
			<div id="adminBoardTable" class="card mb-3">
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
									<th><input type="checkbox" id="ckeckBoardAll" onclick="selectAll(event);"></th>
									<th>번호</th>
									<th>구분</th>
									<th>제목</th>
									<th>등록자</th>
									<th>등록일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody class="center-body">
								<c:forEach items="${boardTableList}" var="boardTable">
								<tr>
									<c:choose>
									<c:when test="${boardTable.boardState eq 1}">
										<th><input type="checkbox" id="checkBoard${boardTable.boardNo }" class="selectedE" onclick="selectEle()" value="${boardTable.boardNo }"></th>
									</c:when>
									<c:when test="${boardTable.boardState eq 0}">
										<th><input type="checkbox" id="checkBoard${boardTable.boardNo }" class="selectedE" onclick="selectEle()" value="${boardTable.boardNo }"></th>
									</c:when>
									</c:choose>
									<th><a href="#" onclick="updateBoardEditor('${boardTable.boardNo }')"><fmt:formatNumber value="${boardTable.boardNo }" pattern="0000000"/></a></th>
									<c:choose>
									<c:when test="${boardTable.boardCategory eq 1}">
										<th>공지</th>
									</c:when>
									<c:when test="${boardTable.boardCategory eq 2}">
										<th>이벤트</th>
									</c:when>
									<c:when test="${boardTable.boardCategory eq 3}">
										<th>칼럼</th>
									</c:when>
									</c:choose>
									<th>${boardTable.boardTitle }</th>
									<th><fmt:formatNumber value="${boardTable.boardWriterNo }" pattern="00000"/></th>
									<th>${fn:substring(boardTable.boardDate,0,10)}</th>
									<!-- 게시(grant/blue) 게시중지(stop/red) -->
									<c:choose>
									<c:when test="${boardTable.boardState eq 0}">
										<th class="stop">게시중지&nbsp;&nbsp;
											<!-- <button type="button" onclick="updateState('${boardTable.boardNo }', 1)">변경</button> -->
										</th>
									</c:when>
									<c:when test="${boardTable.boardState eq 1}">
										<th class="grant">게시중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<!-- <button type="button" onclick="updateState('${boardTable.boardNo }', 0)">변경</button>  -->										
										</th>
									</c:when>
									</c:choose>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="7">
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '정말 모든 게시물을 게시 하시겠습니까?', disposeAll, ['complete'])">모든 게시물 게시</button>
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '정말 모든 게시물을 게시중지 하시겠습니까?', disposeAll, ['cancel'])">모든 게시물 게시중지</button>
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '선택 게시물을 게시 하시겠습니까?', disposeSelect, ['complete'])">선택 게시물 게시</button>
										<button type="button" class="btn-info claimTableBtn" onclick="showConfirm('확인 메시지', '선택 게시물을 게시중지 하시겠습니까?', disposeSelect, ['cancel'])">선택 게시물 게시중지</button>
									</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				<%-- 함수를 반환값을 주입  --%>
				<div class="card-footer small text-muted">마지막 변경일 : ${changeDate }</div>
			</div>
			<!-- /tables-->
		</div>
	<!-- /container-fluid-->
	</div>
</div>
<%-- javascript --%>
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery.selectbox-0.2.js"></script>
<script src="${pageContext.request.contextPath}/vendor/retina-replace.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery.magnific-popup.min.js"></script>

<!-- Custom scripts for admin pages-->
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<!-- datatables-->
<script src="${pageContext.request.contextPath}/js/admin-datatables.js"></script>
<!-- custom -->
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>

<!-- yolowa Custom script -->
<script>
	//setting
	var keywordObj = {
			title: "게시글 제목",
			writer: "등록자",
		}
	
	var boardSuggestBox = new Vue({
		el: '#boardSuggestBox',
		data: {
			boardList: [
				
			]			
		}
	})
	
	var selectAll = function(event){
		event.stopPropagation();
		var ckeckBoardAll = document.getElementById("ckeckBoardAll");
		var selectEs = document.getElementsByClassName("selectedE");
		
		if(ckeckBoardAll.checked == true){
			for(let e of selectEs){
				e.checked = true;
			}
		}else if(ckeckBoardAll.checked == false){
			for(let e of selectEs){
				e.checked = false;
			}
		}
	}
	
	var selectEle = function(){
		var ckeckBoardAll = document.getElementById("ckeckBoardAll");
		var selectEs = document.getElementsByClassName("selectedE");
		var result = true;
		for(let e of selectEs){
			if(e.checked == false){
				result = false;
			}
		}
		ckeckBoardAll.checked = result;
	}
	
</script>



<script src="${pageContext.request.contextPath}/js/admin/filter.js"></script>
<script>
//필터 view setting
// 전달받은 필터를 저장
var filter = ${filter };
// filter가 전달 되었는지 확인
if(filter.writeSuccess == null){
	if(JSON.stringify(filter) != '{}'){
		//select 세팅
		searchForm.category.value = filter.category;
		
		// keywordForm 세팅
		setKeywordFilter(searchForm, filter);
		
		// checkbox setting
		// checkbox setting을 위한 변수
		var checkBoxNameList = ['stateAll','statePost', 'stateStop'];
		setCheckboxFilter(searchForm, filter, checkBoxNameList);
		
		// 검색 form 설정
		setSearchRowFilter(searchForm, filter);
	}
}
</script>

<%-- board 업데이트 관련 자바스크립트 --%>
<script>
	var boardCancelList = [];
	var boardCompleteList = [];
	var $adminBoardTable = $("#adminBoardTable");
	// 생성된 게시글 번호를 담는 배열 객체
	var boardNos = [];
	var resultBoards = [];
</script>
<c:forEach items="${boardTableList }" var="boardTable">
<script>
	boardNos.push('${boardTable.boardNo }');
	boardCancelList.push({
		boardNo: '${boardTable.boardNo}',
		boardState: 0
	})
	boardCompleteList.push({
		boardNo: '${boardTable.boardNo}',
		boardState: 1
	})
</script>
</c:forEach>
<script>
	// 선택내역 처리하는 함수
	var disposeSelect = function(type){
		switch (type) {
		case "complete":
			for(index in boardNos){
				if($adminBoardTable.find('#checkBoard'+boardNos[index]).prop('checked') == false){
					showAlert('오류메시지', '게시할 게시물을 선택해주세요.', ()=>{
						return false;
					});
				}
				
				if($adminBoardTable.find('#checkBoard'+boardNos[index]).prop('checked') == true){
					resultBoards.push(boardCompleteList[index]);
				}
			}
			break;
		case "cancel":
			for(index in boardNos){
				if($adminBoardTable.find('#checkBoard'+boardNos[index]).prop('checked') == false){
					showAlert('오류메시지', '게시중지할 게시물을 선택해주세요.', ()=>{
						return false;
					});
				}
				
				if($adminBoardTable.find('#checkBoard'+boardNos[index]).prop('checked') == true){
					resultBoards.push(boardCancelList[index]);
				}
			}
			break;
		}
		// 선택 상태 변경
		modifyAdminBoardStateServicePromise(resultBoards).then((resolve)=>{
			// 결과 값을 가져옴
			showAlert('완료메시지', resolve + '개의 상태를 변경 완료하였습니다.', ()=>{
				location.reload();
			});
		})
	}
	// 전체내역 처리하는 함수
	var disposeAll = function(type){
		switch (type) {
		case "complete":
			for(index in boardNos){
				console.log(index)
				if(document.getElementById('checkBoard'+boardNos[index]) != null){
					console.log(boardCancelList[index])
					resultBoards.push(boardCompleteList[index]);
				}
			}
			break;
		case "cancel":
			for(index in boardNos){
				if(document.getElementById('checkBoard'+boardNos[index]) != null){
					resultBoards.push(boardCancelList[index]);
				}
			}
			break;
		}
		
		console.log(resultBoards);
		//ajax
		modifyAdminBoardStateServicePromise(resultBoards).then((resolve)=>{
			// 결과 값을 가져옴, alter 및 추가 요소 설정
			showAlert('완료메시지', resolve + '개의 상태를 변경 완료하였습니다.', ()=>{
				location.reload();
			});
		})
	}
	
</script>

<script>
	// board 테이블 및 member 또는 review를 업데이트하는 ajax기능을 callback하는 promise 반환
	// data : 전달할 데이터 (board 형식의 배열을 전달해야함)
	var modifyAdminBoardStateServicePromise = function(data){
		if(data[0] == undefined){
			//전달받은 값이 배열이 아니라면
			return new Promise((resolve, reject)=>{
				$.ajax({
					url: '/yolowa/rest/admin/etc/board/state',
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
					url: '/yolowa/rest/admin/etc/board/state/all',
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
	
	</script>

	
<!-- WYSIWYG Editor -->
<script src="${pageContext.request.contextPath}/js/editor/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/editor/lang/summernote-ko-KR.js"></script>
<script>
	  $('#boardContent').summernote({
		placeholder: '내용을 입력해주세요',
	    fontSizes: ['10', '14', '30'],
	  	tabsize: 2,
	  	width : '100%',
	  	height: 500,
	  	maxHeight: 500,
	  	minHeight: 500,
	  	lang: 'ko-KR',
	    toolbar: [
	      // [groupName, [list of button]]
	      ['style', ['bold', 'italic', 'underline', 'clear']],
	      ['font', ['strikethrough']],
	      ['fontsize', ['fontsize']],
	      ['para', ['ul', 'ol', 'paragraph']]
	    ]
      });
	 $(document.getElementsByClassName('note-placeholder')[0]).css('display','block');
  
</script>
 
 
 <script type="text/javascript">
		var save = function(){
			if($("#boardCategory").val()==0){
				showAlert("오류 메시지", "게시판 항목을 선택해주세요.");
				return;
			}
			if($("#boardTitle").val()=="") {
				showAlert("오류 메시지", "제목을 입력해 주세요.");
				$("#boardTitle").focus();
				return;
			}
			
			if($("#boardContent").val()==""){
				showAlert("오류 메시지", "내용을 입력해 주세요.");
				$("#boardContent").focus();
				return;
			}
			showConfirm('알림 메시지', '저장하시겠습니까?', ()=>{
				$(boardNoticeForm).submit();
			});
		};
	
	//게시판 번호를 받아서 작성입력폼을 업데이트 하는 함수 정의 
	var updateBoardEditor = function(boardNo){
		$.ajax({
			type: "post",
			url: "/yolowa/admin/etc/board/"+boardNo,
			dateType: "json",
			success: function(board) {
				boardNoticeForm.boardCategory.value = board.boardCategory;
				boardNoticeForm.boardTitle.value = board.boardTitle;
				document.getElementsByClassName('note-editable')[0].innerHTML = board.boardContent;
				$('.note-placeholder').hide();
				$(boardNoticeForm).parent().slideDown(500);
				$('#boardSuggestBox').hide();
				
				if(board.boardImage != null){
					defulatBoardImage = '/yolowa/img/board/'+board.boardImage;
					defualtBoardImageName = '기존 이미지';
					$('#previewBoardImage').children().attr('src', defulatBoardImage);
					$('#boardImageName').text(defualtBoardImageName);
				}else{
					defulatBoardImage='/yolowa/img/board/'+'admin-no-board.png';
					defualtBoardImageName = '선택없음';
					$('#previewBoardImage').children().attr('src', defulatBoardImage);
					$('#boardImageName').text(defualtBoardImageName);
				}
				
				$("#boardContent").val(document.getElementsByClassName('note-editable')[0].innerHTML);
			},
			error: function(error) {
				// ajax 실패할때 처리할 로직
			}
		});
	} 
	
	//게시판 카테고리와 게시판 제목을 받아 작성입력폼을 업테이트하는 함수 정의
	var updateBoardSetting = function(){
		$.ajax({
			type: "post",
			url: "/yolowa/admin/etc/board/match",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({
				// type 1 : 게시판
				"boardType": 1,
				"boardCategory": boardNoticeForm.boardCategory.value,
				"boardTitle": boardNoticeForm.boardTitle.value
			}),
			dateType: "json",
			success: function(board) {
				if(board != ''){
					document.getElementsByClassName('note-editable')[0].innerHTML = board.boardContent;
					$('.note-placeholder').hide();
					$('#boardSuggestBox').hide();
					if(board.boardImage != null){
						defulatBoardImage = '/yolowa/img/board/'+board.boardImage;
						defualtBoardImageName = '기존 이미지';
						$('#previewBoardImage').children().attr('src', defulatBoardImage);
						$('#boardImageName').text(defualtBoardImageName);
						
					}else{
						defulatBoardImage='/yolowa/img/board/'+'admin-no-board.png';
						defualtBoardImageName = '선택없음';
						$('#previewBoardImage').children().attr('src', defulatBoardImage);
						$('#boardImageName').text(defualtBoardImageName);
					}
					
					$("#boardContent").val(document.getElementsByClassName('note-editable')[0].innerHTML);
				}else{
					document.getElementsByClassName('note-editable')[0].innerHTML = '';
					defulatBoardImage='/yolowa/img/board/'+'admin-no-board.png';
					defualtBoardImageName = '선택없음';
					$('#previewBoardImage').children().attr('src', defulatBoardImage);
					$('#boardImageName').text(defualtBoardImageName);
					$('.note-placeholder').show();
					
				}
			},
			error: function(error) {
				// ajax 실패할때 처리할 로직
			}
		});
	} 
	
	var updateBoardSuggest = function(){
		$.ajax({
			type: "post",
			url: "/yolowa/admin/etc/board/match/like",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({
				// type 1 : 게시판
				"boardType": 1,
				"boardCategory": boardNoticeForm.boardCategory.value,
				"boardTitle": boardNoticeForm.boardTitle.value
			}),
			dateType: "json",
			success: function(boardList) {
				boardSuggestBox.boardList = boardList;
				if(boardList.length != 0){
					$('#boardSuggestBox').show();
				}else{
					$('#boardSuggestBox').hide();
				}
			},
			error: function(error) {
				// ajax 실패할때 처리할 로직
			}
		});
	}
	
	var choiceBoardSuggest = function(target){
		updateBoardEditor(target.id.split('_')[1]);
	}
	
	</script>
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>

<script>

	// 이미지 미리보기 기능 제공
	$('#previewBoardImageButton').hover(function(){
		$('#previewBoardImage').show();
	}, function(){
		$('#previewBoardImage').hide();
	})
	
	$('#previewBoardImage').hover(function(){
		$('#previewBoardImage').show();
	}, function(){
		$('#previewBoardImage').hide();
	})
	
	
	var defulatBoardImage='/yolowa/img/board/'+'admin-no-board.png';
	var defualtBoardImageName = '선택없음';
	var readURL = function(input) {
		if (input.files && input.files[0] && input.files[0].type.split('/')[0] == 'image') {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#previewBoardImage').children().attr('src', e.target.result);
				defulatBoardImage = e.target.result;
				
			}
			reader.readAsDataURL(input.files[0]);
			$('#boardImageName').text(input.files[0].name);
			defualtBoardImageName = input.files[0].name;
			boardNoticeForm.boardImageFile.files = input.files;
		}else{
			showAlert('에러 메시지', '이미지 파일이 선택되지 않았습니다.');
			$('#previewBoardImage').children().attr('src', defulatBoardImage);
			$('#boardImageName').text(defualtBoardImageName);
		}
	}
	  
	$(boardNoticeForm.boardImageProxy).change(function(){
	   readURL(this);
	});
	
	$('#boarImageBtn').click(function(){
		$(boardNoticeForm.boardImageProxy).click();
	});
	
	
	// 상태를 변경하는 ajax 메소드
	/*
	var updateState = function(boardNo, boardState){
		showConfirm('확인 메시지', '변경 하시겠습니까?', ()=>{
			$.ajax({
				type: "post",
				url: "/yolowa/admin/etc/board/state",
				headers: {"content-type":"application/json"},
				data: JSON.stringify({
					// state / 1: 게시 , 0: 게시중지
					"boardNo": boardNo,
					"boardState": boardState
				}),
				dateType: "json",
				success: function(res) {
					showAlert('알림 메시지', '변경이 완료되었습니다.', ()=>{
						location.reload();
					});
				},
				error: function(error) {
					// ajax 실패할때 처리할 로직
				}
			});			
		});
	};
	*/
	
	//현재 섹션 선택하는 함수
	selectSection(4, 2);
</script>
