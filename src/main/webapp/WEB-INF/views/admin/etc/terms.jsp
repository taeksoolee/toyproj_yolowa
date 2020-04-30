<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- /Navigation-->
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/etc/terms">약관 관리</a></h4></li>
		</ol>
		
		<!-- 약관 수정 영역 -->
		<div class="card mb-3">
			<!-- 카드 헤더 -->
			<div class="card-header">
				<i class="fa fa-filter"></i> 약관 수정
			</div>
			<div class="card-body" >
				<form name="boardTermsForm" method="post">
				<input type="hidden" name="content"/>
					<div class="row selectBox_Btn">
						<div class="col-6 selectBox">
							<select class='form-control' id="boardCategory" name="boardCategory" onchange="updateBoardSetting();">
								<option value="0">약관을 선택하세요.</option>
								<option value="1">이용약관</option>
								<option value="2">개인정보 처리방침</option>
								<option value="3">위치기반서비스 이용약관</option>
							</select>
						</div>
						
						<div class="col-6">
							<div style="float:right;">
								<!-- <input type="button" class="btn-primary" style="width: 150px; height: 44px;" value="초기화" onclick="updateBoardSetting();"> -->
								<input type="button" class="btn-primary" style="width: 150px; height: 44px;" value="저장하기" onclick="save();">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
							<textarea class="editor" name="boardContent" id="boardContent" placeholder="내용을 입력하세요."></textarea>
							</div>
							<!--  -->
						</div>
					</div>
				</form>
			</div>
		</div>
		
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

<!-- WYSIWYG Editor -->
<script src="${pageContext.request.contextPath}/js/editor/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/editor/lang/summernote-ko-KR.js"></script>

<!-- custom -->
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>

 <script>
  $(document).ready(function() {
	  $('#boardContent').summernote({
		placeholder: '내용을 입력해주세요',
	    /* fontSizes: ['10', '14', '30'], */
	  	tabsize: 2,
	  	width : '100%',
	  	height: 500,
	  	maxHeight: 500,
	  	minHeight: 500,
	  	lang: 'ko-KR',
	    /* toolbar: [
	      // [groupName, [list of button]]
	      ['style', ['bold', 'italic', 'underline', 'clear']],
	      ['font', ['strikethrough']],
	      ['fontsize', ['fontsize']],
	      ['para', ['ul', 'ol', 'paragraph']]
	    ] */
      });
	  $(document.getElementsByClassName('note-placeholder')[0]).css('display','block');
  });
  /*승현이형 jquery
  $('.note-editable').html('<h1>hello world</h1>')*/
  
  </script>
  
  <script type="text/javascript">
  
	/*----------------------------------------------------------------------------*/
	/*이용약관, 개인정보 처리방침, 위치기반서비스 이용약관 내용 가져와서 불러오기 */
	/*----------------------------------------------------------------------------*/
	
	
  	var save = function(){
		if($("#boardCategory").val()==0){
			showAlert("오류 메시지", "약관을 선택해주세요.");
			return;
		}
		
		if($("#boardContent").val()==""){
			showAlert("오류 메시지", "내용을 입력해 주세요.");
			$("#boardContent").focus();
			return;
		}
		
		showConfirm('알림 메시지', '저장하시겠습니까?', ()=>{
			if(boardTermsForm.boardContent.value == ''){
				showAlert('에러메시지', '변경된 사항이 없습니다.');
				return;
			}
			
			var boardTitle
			switch (boardTermsForm.boardCategory.value) {
			case "1":
				boardTitle='이용약관';
				break;
			case "2":
				boardTitle='개인정보 처리방침';
				break;
			case "3":
				boardTitle='위치기반서비스 이용약관';
				break;
			}
			
			$.ajax({
				type: "post",
				url: "/yolowa/admin/etc/terms",
				headers: {"content-type":"application/json"},
				data: JSON.stringify({
					"boardTitle": boardTitle,
					"boardCategory": boardTermsForm.boardCategory.value,
					"boardContent": boardTermsForm.boardContent.value
				}),
				dateType: "json",
				success: function(res) {
					showAlert('알림 메시지', '변경이 완료되었습니다.');
				},
				error: function(error) {
					// ajax 실패할때 처리할 로직
				}
			});		
			//$(boardTermsForm).submit();
		});
	};
	
	//게시판 카테고리를 받아 작성입력폼을 업데이트하는 함수 정의
	var updateBoardSetting = function(){
		$.ajax({
			type: "post",
			url: "/yolowa/admin/etc/terms/match",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({
				// type 3 : 약관관리
				"boardType": 3, 
				"boardCategory": boardTermsForm.boardCategory.value
				
			}),
			dateType: "json",
			success: function(board) {
				if(board != ''){
					document.getElementsByClassName('note-editable')[0].innerHTML = board.boardContent;
					$('.note-placeholder').hide();
				}else{
					document.getElementsByClassName('note-editable')[0].innerHTML = '';
					$('.note-placeholder').show();
				}
			},
			error: function(error) {
				// ajax 실패할때 처리할 로직
			}
		});
	} 
	//현재 섹션 선택하는 함수
	selectSection(4, 0);
  </script>
