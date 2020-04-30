<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- /Navigation-->
<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><h4><a href="${pageContext.request.contextPath}/admin/etc/sns">SNS 관리</a></h4></li>
		</ol>
		<!-- 데이터를 filter -->
		<div class="card mb-3">

			<!-- 카드 헤더 -->
			<div class="card-header">
				<i class="fa fa-gear"></i> URL 수정
			</div>
			<form name="" class="resize-form" id="app">
				<div class="snsEdit">
					<div class="row snsKinds">
						<div class="col">
							<fieldset class="field keywordField" style="margin-bottom: 25px;" >
									<legend class="title">블로그(Blog)</legend>
									<div class="col-12 size-form" style="padding-left: 0px;">
										<input type="text" id="blog" class="form-control snsEdit" style="width:100%; margin:15px 7px;" placeholder="url을 입력해주세요." v-model="sns.blog">
									</div>
							</fieldset>
						
							<fieldset class="field keywordField" style="margin-bottom: 25px;">
									<legend class="title">트위터(Twitter)</legend>
									<div class="col-12 size-form" style="padding-left: 0px;">
										<input type="text" id="twitter" class="form-control snsEdit" style="width:100%; margin:15px 7px;" placeholder="url을 입력해주세요." v-model="sns.twitter">
									</div>
							</fieldset>
							
						
							<fieldset class="field keywordField" style="margin-bottom: 25px;">
									<legend class="title">페이스북(Facebook)</legend>
									<div class="col-12 size-form" style="padding-left: 0px;">
										<input type="text" id="facebook" class="form-control snsEdit" style="width:100%; margin:15px 7px;" placeholder="url을 입력해주세요." v-model="sns.facebook">
									</div>
							</fieldset>
						
							<fieldset class="field keywordField" style="margin-bottom: 25px;">
									<legend class="title">인스타그램(Instagram)</legend>
									<div class="col-12 size-form" style="padding-left: 0px;">
										<input type="text" id="instagram" class="form-control snsEdit" style="width:100%; margin:15px 7px;" placeholder="url을 입력해주세요." v-model="sns.instagram">
									</div>
							</fieldset>
						</div>
					</div>
					
					<div class="row btnKinds">
						<div class="col-6 init">
							<div class="initBtn">
								<button type="button" class="init btn-primary" id="resetBtn" onclick="loadSns()">초기화</button>
							</div>
						</div>
						<div class="col-6 save">
							<div class="saveBtn">
								<button type="button" class="btn-primary" data-toggle="modal" data-target="#confirmModal" onclick="showConfirm('확인 메시지', '정말 저장하시겠습니까?', saveSns)" >
										저장하기
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
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
	/*----------------------------------------------------------------------------*/
	/*이용약관, 개인정보 처리방침, 위치기반서비스 이용약관 내용 가져와서 불러오기 */
	/*----------------------------------------------------------------------------*/
	
  	var html = "";
  	var ph = "내용을 입력해주세요";
  	
  	var plusEditor = function(h){
    var $editor = $('.editor').summernote({
        placeholder: ph,
        tabsize: 2,
        width : 1000,
        height: 500,
        maxHeight: 500,
        minHeight: 500,
        lang: 'ko-KR'
    });
      
    $editor.next().find('.note-editable').html(h);
   	}
  
 	plusEditor(html);
</script>
<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>

	
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- alertModal src -->
<script type="text/javascript">
	var alertModal = new Vue({
		el : '#alertModal',
		data: {
			title: "",
			content: ""
		}
	})
	
	var setAlert = function(t, c){
		alertModal.title = t;
		alertModal.content = c;
	}
</script>
	
<!-- promptModal src -->
<script type="text/javascript">
	var promptModal = new Vue({
		el : '#promptModal',
		data: {
			title: "",
			content: "",
			check: false
		}
	})
	
	var setPrompt = function(t, c){
		promptModal.title = t;
		promptModal.content = c;
		promptModal.check = false;
	}
</script>

<script type="text/javascript">
	var sns = new Vue({
		  el: '#app',
		  data: {
			  sns: {
			    blog: "",
			    twitter: "",
			    facebook: "",
			    instagram: ""
			  }
		  }
		})
	// 프로퍼티 파일에서 기존 객체를 가져오는 함수
	var loadSns = function(){
		axios.get('/yolowa/admin/etc/sns/data', {
		    params: {}
		  })
		  .then(function (response) {
		     sns.$data.sns = response.data;
		    
		  })
	}
	loadSns();
	
	var saveSns = function(){
		setPrompt("확인", "입력하신 정보로 저장하겠습니까?");
		axios.post('/yolowa/admin/etc/sns/data', sns.$data.sns).then((res)=>{
			if(res.data == true){
				showAlert('성공 메시지', "저장에 성공하였습니다.");	
			}else{
				showAlert('성공 메시지', "저장에 실패하였습니다.");
			}
				
		});
	};
	
	//현재 섹션 선택하는 함수
	selectSection(4, 4);
</script>