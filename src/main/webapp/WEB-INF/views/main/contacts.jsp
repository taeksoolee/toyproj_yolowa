<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<div id="page">
	
	<main>
		<section class="hero_in contacts">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>Contact Us</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

		<div class="contact_info">
			<div class="container">
				<ul class="clearfix">
					<li>
						<i class="pe-7s-map-marker"></i>
						<h4>주소</h4>
						<span>서울시 강남구 테헤란로 Itwill 빌딩 15층 4Class</span>
					</li>
					<li>
						<i class="pe-7s-mail-open-file"></i>
						<h4>이메일 주소</h4>
						<span>yolowa2020@gmail.com</span>

					</li>
					<li>
						<i class="pe-7s-phone"></i>
						<h4>문의전화</h4>
						<span> + 82 010 7765 4757</span>
					</li>
				</ul>
			</div>
		</div>
		<!--/contact_info-->

		<div class="bg_color_1">
			<div class="container margin_80_55">
				<div class="row justify-content-between">
					<div class="col-lg-5">
						<div class="map_contact">
					</div>
						<!-- /map -->
					</div>
					<div class="col-lg-6">
						<h4>메세지 보내기</h4>
						<p>문의사항이 있으신 고객께서는 정보 사항과 메세지를 남겨주세요. 신속히 답변 드리겠습니다.</p>
						<div id="message-contact"></div>
						<form name="contactsForm" method="post" id="contactsForm">
						
							<!-- row 이름 -->
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>이름</label>
										<input class="form-control" type="text" id="senderName" name="senderName">
									</div>
								</div>
							</div>
							<!-- row 이름 -->
								
							<!-- row -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>이메일</label>
										<input class="form-control" type="email" id="senderEmail" name="senderEmail">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group" style="margin-bottom:0px">
										<label>휴대전화</label>
									</div>
									<div>
										<input class="form-control" maxlength="3" type="text" id="senderPhone1" name="senderPhone1" style="height:42px; width:60px; float:left;" >
										<label style="margin: 10px 5px; float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</label>
										<input class="form-control" maxlength="4" type="text" id="senderPhone2" name="senderPhone2" style="height:42px; width:60px; float:left;" >
										<label style="margin: 10px 5px; float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</label>
										<input class="form-control" maxlength="4" type="text" id="senderPhone3" name="senderPhone3" style="height:42px; width:60px; float:left;">
									</div>
								</div>
							</div>
							<!-- row -->

							<!-- row 문의 제목 -->
							<div class="row">
								<div class="col-md">
									<div class="form-group">
										<label>문의 제목</label>
										<textarea class="form-control" id="title" name="title" style="height:43px;"></textarea>
									</div>
								</div>
							</div>
							<!-- row 문의 제목 -->
							
							
							<div class="form-group">
								<label>메세지</label>
								<textarea class="form-control" id="mailContent" name="content" style="height:184px;"></textarea>
							</div>
							
							<button type="button" id="sendContacts" class="btn btn-primary"style="width:150px; margin-top:30px;">제출 하기</button>
						</form>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->
	
	</div>
	<!-- page -->
	
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
		<img src="${pageContext.request.contextPath }/img/admin-loading.gif">
	</div>
	</div>
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<jsp:include page="login-popup.jsp"></jsp:include>
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/assets/validate.js"></script>
	
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyALAJJ1tqK93WbNKjWpe6bVmbCmSJfjmK8"></script>
	<script src="${pageContext.request.contextPath }/js/mapmarker.jquery.js"></script>
	<script src="${pageContext.request.contextPath }/js/mapmarker_func.jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/admin/custom.js"></script>
	
<c:if test="${not empty messageTitle and not empty messageContent }">
<script type="text/javascript">
	console.log('hello world');
	window.onload = function(){
		showAlert("${messageTitle }", "${messageContent }");
	}
	//showAlert("오류 메시지", "이름을 입력해 주세요.");
</script>
</c:if>

<script type="text/javascript">
$("#sendContacts").click(function() {
		//이름 유효성 검사
		if($("#senderName").val()=="") {
			showAlert("오류 메시지", "이름을 입력해 주세요.");
			return;
		}
		
		var nameReg = /^[가-힣]{2,5}$/;
		
		if(!nameReg.test($("#senderName").val())){
			showAlert("오류 메시지", "이름이 올바른지 확인 해주세요.");			
			return;
		}		
		
		//이메일 유효성 검사
		if($("#senderEmail").val()=="") {
			showAlert("오류 메시지", "이메일을 입력해 주세요.");
			return;
		}
		
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!emailReg.test($("#senderEmail").val())){
			showAlert("오류 메시지", "이메일을 형식에 맞게 입력해 주세요. ex) aaa@gmail.com ");
			return;				
		}
		
		//전화번호 유효성 검사
		
		if ($("#senderPhone1").val() == "" || $("#senderPhone2").val() == "" || $("#senderPhone3").val() == "") {
			showAlert("오류 메시지", "전화번호를 입력해 주세요.");
		     return;
		}
		
		var regExp1 = /^01([016789])$/;
		var regExp2 = /^\d{3,4}$/;
	 	var regExp3 = /^\d{4}$/;

		if ( !regExp1.test($("#senderPhone1").val())) {
		      showAlert("오류 메시지", "잘못된 전화번호 입니다. ex) 01x - 1234 - 1234");
		      return;
		}
		
		if ( !regExp2.test($("#senderPhone2").val())) {
		      showAlert("오류 메시지", "잘못된 전화번호 입니다. 가운데 번호는 3~4자리로 입력해주세요.");
		      return;
		}
		
		if ( !regExp3.test($("#senderPhone3").val())) {
		      showAlert("오류 메시지", "잘못된 전화번호 입니다. 마지막 번호는 4자리로 입력해주세요.");
		      return;
		}
		

		if (isNaN($("#senderPhone1").val()) || isNaN($("#senderPhone2").val()) || isNaN($("#senderPhone3").val())) {
			showAlert("오류 메시지", "전화번호를 숫자로 입력해 주세요.");
		     return;
		}
	
		//제목 유효성 검사
		if($("#title").val()=="") {
			showAlert("오류 메시지", "제목을 입력해 주세요.");
			return;
		} 
	
		//내용 유효성 검사
		if($("#mailContent").val()==""){
			showAlert("오류 메시지", "내용을 입력해 주세요.");
			return;
		}
		
		showConfirm('알림 메시지', '제출하시겠습니까?', ()=>{
			$('#loading').show();
			$(contactsForm).submit();
		});
		
	});
	
	
</script>
<script type="text/javascript">
      //set up markers 
      var myMarkers = {"markers": [
            {"latitude": "37.4995802", "longitude":"127.0312881", "icon": "img/map-marker.png"}
         ]
      };
      
      //set up map options
      $(".map_contact").mapmarker({
         zoom   : 14,
         center  : '서울특별시 강남구 역삼동 아이티윌',
         markers   : myMarkers
      });
</script>

	
