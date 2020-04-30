<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/etc/advertise">광고 메일</a></h4></li>
		</ol>
		
		<!-- 약관 수정 영역 -->
		<div class="card mb-3">
			<!-- 카드 헤더 -->
			<div class="card-header">
				<i class="fa fa-send"></i> 광고 메일 발송
			</div>
			<div class="card-body" >
				<form class="resize-form" name="selectForm" method="post">
					<div class="row">
						<div class="col-9 form-inline form-group">
						    <label for="inputPassword6">제&emsp;&emsp;&emsp;&emsp;&nbsp;목</label>
						    <input type="text" id="boardTitle" name="title" class="form-control mx-sm-3" style="width: 80%;">
						    
						</div>
						<div class="col-3">
							<input type="button" id="sendEmail" class="btn-primary" style="width: 150px; height: 44px; float:right;" value="보내기">
						</div>
					</div>
					<!-- editor -->						
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								 <textarea class="editor" name="content" id="boardContent" placeholder="내용을 입력하세요."></textarea>
							</div>
						</div>
					</div>			
				</form>
			</div>
		</div>
	</div>
</div>

<div style=" position: fixed;
    top: 0;
    left: 0;
    z-index: 10041005;
    margin: 0 auto;
    width: 100%;
    height: 100%;
    line-height: 60;
    text-align: center;
    display: none;" id="loading">
    <div>
		<img src="${pageContext.request.contextPath }/img/etc/admin-loading.gif">
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
	/*----------------------------------------------------------------------------*/
	/*이용약관, 개인정보 처리방침, 위치기반서비스 이용약관 내용 가져와서 불러오기 */
	/*----------------------------------------------------------------------------*/
	
  	var html = "";
  	var ph = "내용을 입력해주세요";
  	
  	var plusEditor = function(h){
    var $editor = $('.editor').summernote({
        placeholder: ph,
        tabsize: 2,
        width : "100%",
       	/* 한 화면안에 들어오는 크기 */
        
       	height: 650,
        maxHeight: 650,
        minHeight: 650,
       	/*
        height: 700,
        maxHeight: 700,
        minHeight: 700,
        */
        lang: 'ko-KR'
    });
      
    $editor.next().find('.note-editable').html(h);
   	}
  
 	plusEditor(html);
 	
 	//현재 섹션 선택하는 함수
	selectSection(4, 3);
</script>
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>

<script>
	
	$('#sendEmail').on('click', function(){
		if($("#boardTitle").val()=="") {
			showAlert("오류 메시지", "제목을 입력해 주세요.");
			return;
		}
		
		if($("#boardContent").val()==""){
			showAlert("오류 메시지", "내용을 입력해 주세요.");
			return;
		}
		
		showConfirm('알림 메시지', '저장하시겠습니까?', ()=>{
			$('#loading').show();
			$(selectForm).submit();
		});
		
	});
</script>

<c:if test="${not empty messageTitle and not empty messageContent }">
<script type="text/javascript">
	console.log('hello world');
	showAlert("${messageTitle }", "${messageContent }");
</script>
</c:if>