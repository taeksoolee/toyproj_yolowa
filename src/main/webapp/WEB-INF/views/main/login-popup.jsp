<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Sign In Popup -->
<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
	<div class="small-dialog-header">
		<h3>로그인</h3>
	</div>
	<form action="${pageContext.request.contextPath }/login" method="post" name="loginForm" id="loginForm">
		<div class="sign-in-wrapper">
			<div class="form-group">
				<label>이메일</label>
				<c:choose>
					<c:when test="${cookie.rememberYolowa.name != null }">
						<input type="email" class="form-control" name="email" id="email"
							value="${cookie.rememberYolowa.value }">
						<i class="icon_mail_alt"></i>
					</c:when>
					<c:when test="${cookie.rememberYolowa.name == null }">
						<input type="email" class="form-control" name="email" id="email">
						<i class="icon_mail_alt"></i>
					</c:when>
				</c:choose>
			</div>
			<div class="form-group">
				<label>패스워드</label> <input type="password" class="form-control"
					name="password" id="password"> <span id="errorMsg"
					name="errorMsg" style="color: red;"></span> <i
					class="icon_lock_alt"></i>
			</div>
			<div class="text-center">
				<input type="button" value="로그인" class="btn_1 full-width"
					id="loginBtn" name="loginBtn">
			</div>
			<div class="clearfix add_bottom_15">
				<div class="checkboxes float-left">
					<label class="container_check">이메일 기억하기 <c:choose>
							<c:when test="${cookie.rememberYolowa.name != null }">
								<input type="checkbox" name="rememberYolowa" id="rememberYolowa"
									value="rememberYolowa" checked="checked">
							</c:when>
							<c:when test="${cookie.rememberYolowa.name == null }">
								<input type="checkbox" name="rememberYolowa" id="rememberYolowa"
									value="rememberYolowa">
							</c:when>
						</c:choose> <span class="checkmark"></span>
					</label>
				</div>
				<div class="float-right mt-1">
					<a id="forgot" href="javascript:void(0);">비밀번호를 잊으셨나요?</a>
				</div>
			</div>
			<div class="text-center">
				아직 가입하지 않으셨나요? <a href="${pageContext.request.contextPath }/register">가입하기</a>
			</div>
			<div id="forgot_pw">
				<div class="form-group">
					<label>하단의 이메일이 맞는지 확인해주세요.</label> <input type="email"
						class="form-control" name="forgotEmail" id="forgotEmail">
					<i class="icon_mail_alt"></i> <span id="emailMsg"
						style="color: red;"></span>
				</div>
				<p>회원님의 이메일로 새로운 패스워드가 발급됩니다. 이메일을 확인해주세요.</p>
				<div class="text-center">
					<input type="button" id="rePassword" name="rePassword"
						value="비밀번호 재발급" class="btn_1">
				</div>
			</div>
		</div>
	</form>
	<!--form -->
</div>
<!-- /Sign In Popup -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$("#rePassword").click(function() {
		var memberEmail = $("#forgotEmail").val();
		$("#emailMsg").text("전송중...");

		$.ajax({
			type : "POST",
			url : "rePassword",
			headers : {
				"content-type" : "application/json"
			},
			data : JSON.stringify({
				"memberEmail" : memberEmail
			}),
			dataType : "text",
			success : function(text) {
				if (text == "success") {
					alert("새로운 비밀번호가 발송되었습니다.");
					window.location.replace("/yolowa");
					return;
				}
				if (text == "false") {
					$("#emailMsg").text("등록되지 않은 이메일입니다.");
					return;
				}
			},
			error : function() {
				alert("알 수 없는 오류");
			}

		})

	})

	$("#errorMsg").text("");

	$("#loginBtn").click(function() {

		var memberEmail = $("#email").val();
		var memberPassword = $("#password").val();

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath }/loginSubmit",
			headers : {
				"content-type" : "application/json"
			},
			data : JSON.stringify({
				"memberEmail" : memberEmail,
				"memberPassword" : memberPassword
			}),
			success : function(text) {
				if (text == "success") {
					$("#loginForm").submit();
				} else if (text == "noContent") {
					$("#errorMsg").text("이메일과 비밀번호를 모두 입력해주세요.");
				} else if (text == "noMatch") {
					$("#errorMsg").text("이메일 혹은 비밀번호가 맞지 않습니다.");
				} else if (text == "disabled") {
					$("#errorMsg").text("현재 정지된 계정입니다.");
				}
			},
			error : function() {
				$("#errorMsg").text("알 수 없는 오류");
			}

		})
	});
</script>
