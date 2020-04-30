<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>YOLOWA | 여행중이세요? YOLOWA와 함께 숙소 예약 또는 호스팅을 시작해보세요.</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath }/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath }/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath }/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath }/css/custom.css" rel="stylesheet">
	
<body id="login_bg">
	
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="index.html"><img src="${pageContext.request.contextPath }/img/logo_black.png" width="155" height="36" data-retina="true" alt="" class="logo_sticky" style="margin-top: 10px; margin-right: 40px;"></a>
			</figure>
			  <form action="login" method="post" name="loginForm" id="loginForm">
				<div class="form-group" style="margin-top: 13em;">
					<label>이메일</label>
					<c:choose>
					<c:when test="${cookie.rememberYolowa.name != null }">
					<input type="email" class="form-control" name="email" id="email" value="${cookie.rememberYolowa.value }">					
					<i class="icon_mail_alt"></i>					
					</c:when>					
					<c:when test="${cookie.rememberYolowa.name == null }">
					<input type="email" class="form-control" name="email" id="email">					
					<i class="icon_mail_alt"></i>				
					</c:when>
					</c:choose>					
				</div>
				<div class="form-group">
					<label>패스워드</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<span id="errorMsg" name="errorMsg" style="color: red;" ></span>				
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_30">
					<div class="checkboxes float-left">
						<label class="container_check">이메일 기억하기
							<c:choose>
							<c:when test="${cookie.rememberYolowa.name != null }">
							  <input type="checkbox" name="rememberYolowa" id="rememberYolowa" value="rememberYolowa" checked="checked">						
							</c:when>
							<c:when test="${cookie.rememberYolowa.name == null }">
							  <input type="checkbox" name="rememberYolowa" id="rememberYolowa" value="rememberYolowa">					
							</c:when>
							</c:choose>	
						  <span class="checkmark"></span>
						</label>
					</div>					
				</div>
				<button type="button" id="loginBtn" name="loginBtn" class="btn_1 rounded full-width">로그인</button>
				<div class="text-center add_top_10">아직 가입하지 않으셨나요? <strong><a href="register">가입하기</a></strong></div>
			</form>	
					<div class="copy">© 2020 Yolowa</div>
		</aside>
	</div>
	<!-- /login -->
		
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/assets/validate.js"></script>	
  
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

	$("#loginBtn").click(function(){		
		
		var memberEmail=$("#email").val();
		var memberPassword=$("#password").val();
		
		
		$.ajax({
				type: "POST",
				url: "loginSubmit",
				headers: {"content-type":"application/json"},
				data: JSON.stringify({"memberEmail":memberEmail, "memberPassword":memberPassword}),
				success: function(text){					
						
						if(text=="success"){
							$("#loginForm").submit();
						} else if(text=="noContent") {
							$("#errorMsg").text("이메일과 비밀번호를 모두 입력해주세요.");							
						} else if(text=="noMatch") {
							$("#errorMsg").text("이메일 혹은 비밀번호가 맞지 않습니다.");						
						} else if(text=="disabled"){
							$("#errorMsg").text("현재 정지된 계정입니다.");						
						}
					},
				error: function() {
					$("#errorMsg").text("알 수 없는 오류");				
				}
				
			})		
	});
	

</script>






</html>