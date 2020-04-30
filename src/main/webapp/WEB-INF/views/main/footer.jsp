<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<footer>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-5 col-md-12 p-r-5">
					<p><img src="${pageContext.request.contextPath }/img/logo_white(2).png" width="150" height="36" alt=""></p>
					<p>사업자등록번호 512-02-51985<br>욜로와·대표 오창중<br>통신판매업 신고번호 제2020-창중IT-0014호<br>서울시 강남구 테헤란로 Itwill 빌딩 15층 4Class<br>E. 5chang中@itwill.com</p>
				
					<div class="follow_us">
						<ul>
							<li></li>
							<li><a onclick="window.open('${sns.facebook }');"><img src="${pageContext.request.contextPath }/img/logo/facebook.png" width="30px" /></a></li>
							<li><a onclick="window.open('${sns.twitter }');"><img src="${pageContext.request.contextPath }/img/logo/twitter.png" width="30px" /></a></li>
							<li><a onclick="window.open('${sns.blog }');"><img src="${pageContext.request.contextPath }/img/logo/blog.png" width="30px" /></a></li>
							<li><a onclick="window.open('${sns.instagram }');"><img src="${pageContext.request.contextPath }/img/logo/instagram.png" width="30px" /></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 ml-lg-auto">
					<h5>유용한 링크</h5>
					<ul class="links">
						<li><a href="${pageContext.request.contextPath }/about">회사소개</a></li>
						<li><a href="${pageContext.request.contextPath }/register">회원가입</a></li>
						<li><a href="${pageContext.request.contextPath }/blog">뉴스 &amp; 이벤트</a></li>
						<li><a href="${pageContext.request.contextPath }/contacts">문의하기</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>문의사항</h5>
					<ul class="contacts">
						<li><a href="tel://000-0000-0000"><i class="ti-mobile"></i> + 82 010 7765 4757</a></li>
						<li><a href="mailto:yolowa2020@gmail.com"><i class="ti-email"></i> yolowa2020@gmail.com</a></li>
					</ul>

				</div>
			</div>
			<!--/row-->
			<hr>
			<div class="row">
				<div class="col-lg-12">
					<ul id="additional_links">
						<li><a href="${pageContext.request.contextPath }/terms">이용 약관</a></li>
						<li><a href="${pageContext.request.contextPath }/personal">개인정보 처리방침</a></li>						
						<li><a href="${pageContext.request.contextPath }/locationTerms">위치기반서비스 이용약관</a></li>
						<li><span>Copyright © 2020 Yolowa</span></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->	
	
	<!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
          </div>
          <div class="modal-body">정말 로그아웃 하시겠습니까?</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            <a class="btn btn-primary" href="${pageContext.request.contextPath }/logout">로그아웃</a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 메세지 Modal -->
	<div class="modal fade" id="sendHostMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header ">
	        <h5 class="modal-title" id="exampleModalLongTitle">호스트에게 메세지 보내기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		    <form method="post">
	        <div class="form-group">
	        	<input type="hidden" id="messageSenderNo" value="${loginMember.memberNo }">
	        	<input type="hidden" id="messageReceiverNo" value="${hostingDetail.hosting.hostingMemberNo}">
	            <textarea class="form-control" id="messageContent"></textarea>
          	</div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button id="sendHostMessageBtn" type="button" class="btn btn-primary">보내기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 호스트 신고 Modal -->
	<div class="modal fade" id="sendHostClaim" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header ">
	        <h5 class="modal-title" id="exampleModalLongTitle">호스트 신고하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		    <form method="post">
	        <div class="form-group">
	        	<input type="hidden" id="claimApplicantNo" value="${loginMember.memberNo }">
	        	<input type="hidden" id="claimSuspectNo" value="${hostingDetail.hosting.hostingMemberNo}">
	        	<input type="hidden" id="claimSuspectHostingNo" value="${hostingDetail.hosting.hostingNo}">
	            <textarea class="form-control" id="claimReason"></textarea>
          	</div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button id="sendHostClaimBtn" type="button" class="btn btn-primary">보내기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 문의하기 성공 Modal -->
	<!-- <div class="modal fade" id="sendContacts" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">알림 메세지</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       메일을 성공적으로 발송하였습니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div> -->
	
	
	
	
	<script type="text/javascript">
	$("#sendHostMessageBtn").click(function() {
		var messageSenderNo = $("#messageSenderNo").val();
		var messageReceiverNo = $("#messageReceiverNo").val();
		var messageContent = $("#messageContent").val();
		
		if (messageSenderNo == "") {
			alert("로그인 해주세요");
			return;
		}
		
		if (messageContent == "") {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "sendHostMessage",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"messageSenderNo":messageSenderNo, "messageReceiverNo":messageReceiverNo, "messageContent":messageContent}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					$('#sendHostMessage').modal('hide')
				}
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	});
	
	
	$("#sendHostClaimBtn").click(function() {
		var claimApplicantNo = $("#claimApplicantNo").val();
		var claimSuspectNo = $("#claimSuspectNo").val();
		var claimSuspectHostingNo = $("#claimSuspectHostingNo").val();
		var claimReason = $("#claimReason").val();
		
		if (claimApplicantNo == "") {
			alert("로그인 해주세요");
			return;
		}
		
		if (claimReason == "") {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "sendClaimMessage",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"claimApplicantNo":claimApplicantNo, 
				"claimSuspectNo":claimSuspectNo, "claimSuspectHostingNo":claimSuspectHostingNo, "claimReason":claimReason}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					$('#sendHostClaim').modal('hide')
				}
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	});
	</script>
	
		
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
	
</script>

