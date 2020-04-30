<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © 2020 Yolowa</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
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
            <a class="btn btn-primary" href="../logout">로그아웃</a>
          </div>
        </div>
      </div>
    </div>
	
	<!-- 자작 리뷰 Modal -->
	<div class="modal fade" id="sendGuestReview" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header ">
	        <h5 class="modal-title" id="exampleModalLongTitle">리뷰 쓰기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		    <form method="post">
	        <div class="form-group">
	            <textarea class="form-control" id="reviewContent"></textarea>
          	</div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button id="submitReview" type="button" class="btn btn-primary" data-dismiss="modal">보내기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 자작 댓글리뷰 Modal -->
	<div class="modal fade" id="reSendGuestReview" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header ">
	        <h5 class="modal-title" id="exampleModalLongTitle">리뷰 쓰기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		    <form method="post">
	        <div class="form-group">
	            <textarea class="form-control" id="replyContent"></textarea>
          	</div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button id="reSubmitReview" type="button" class="btn btn-primary" data-dismiss="modal">보내기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 메세지 Modal -->
	<div class="modal fade" id="sendHostMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header ">
	        <h5 class="modal-title" id="exampleModalLongTitle">메세지 보내기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		    <form method="post">
	        <div class="form-group">
	        	<input type="hidden" id="messageSenderNo" value="${loginMember.memberNo }">
	        	<!-- <input type="hidden" id="messageReceiverNo" value=""> -->
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
	        <h5 class="modal-title" id="exampleModalLongTitle">게스트 신고하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		    <form method="post">
	        <div class="form-group">
	        	<input type="hidden" id="claimApplicantNo" value="${loginMember.memberNo }">
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
	
	<script type="text/javascript">
	var messageReceiverNo;
	//메세지 보내기 버튼 클릭
	function messageSend(No) {
		messageReceiverNo = No;
		//console.log(reviewMemberNo);
	}
	
	//메세지 보내기 (게스트, 호스트 서로)
	$("#sendHostMessageBtn").click(function() {
		var messageSenderNo = $("#messageSenderNo").val();
		var messageContent = $("#messageContent").val();
		
		if (messageSenderNo == "") {
			alert("로그인 해주세요");
			return;
		}
		
		if (messageContent == "") {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		//console.log(messageReceiverNo);
		
		$.ajax({
			type: "POST",
			url: "../sendHostMessage",
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
	
	//게스트 신고
	$("#sendHostClaimBtn").click(function() {
		var claimApplicantNo = $("#claimApplicantNo").val();
		var claimSuspectNo = $("#claimSuspectNo").val();
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
			url: "../sendGuestClaim",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"claimApplicantNo":claimApplicantNo, 
				"claimSuspectNo":claimSuspectNo, "claimReason":claimReason}),
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
	
	//리뷰 대상 멤버 번호를 받기 위한 변수
	var reviewMemberNo;
	var reviewRef;
	
	//리뷰 쓰기 버튼 클릭
	function reviewSend(No) {
		reviewMemberNo = No;
		//console.log(reviewMemberNo);
	}
	
	//리뷰 입력
	$("#submitReview").click(function() { 
		reviewWriterNo = ${loginMember.memberNo}
		reviewContent = $("#reviewContent").val();
		
		//console.log(reviewContent);
		
		if (reviewWriterNo == "") {
			alert("로그인 해주세요");
			return;
		}
		
		if (reviewContent == "") {
			//console.log(reviewContent);
			alert("내용을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "../writeGuestReview",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"reviewMemberNo":reviewMemberNo, 
				"reviewWriterNo":reviewWriterNo, "reviewContent":reviewContent}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					console.log(text);
					$("#reviewContent").val("");
				}
				
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	});
	
	//댓글리뷰 입력
	$("#reSubmitReview").click(function() { 
		reviewWriterNo = ${loginMember.memberNo}
		reviewContent = $("#replyContent").val();
		console.log(reviewContent);
		console.log(reviewMemberNo);
		console.log(reviewRef);
		
		if (reviewWriterNo == "") {
			alert("로그인 해주세요");
			return;
		}
		
		if (reviewContent == "") {
			//console.log(reviewContent);
			alert("내용을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "../reWriteGuestReview",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"reviewRef":reviewRef, "reviewMemberNo":reviewMemberNo, 
				"reviewWriterNo":reviewWriterNo, "reviewContent":reviewContent}),
			dataType: "text",
			success: function(text) {
				if (text == "success") {
					//console.log(text);
					$("#reviewContent").val("");
					reviewDisplay(page);
				}
				
			},
			error: function(xhr) {
				alert("응답 에러코드 = " + xhr.status)
			}
		});
	});
	</script>