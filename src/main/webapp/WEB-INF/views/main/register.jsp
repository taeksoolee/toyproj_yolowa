<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</head>

<body id="register_bg">
	
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="/yolowa"><img src="${pageContext.request.contextPath }/img/logo_black.png" width="155" height="36" data-retina="true" alt="" class="logo_sticky"></a>
			</figure>
			<form autocomplete="off" action="register" method="post" id="registerForm" name="registerForm">
				<div class="form-group">
					<label>이름</label>
					<input class="form-control" type="text" name="name" id="name">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>생일</label>
					<input class="form-control" type="date" name="birthday" id="birthday">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>이메일</label>
					<input class="form-control" type="email" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input class="form-control" type="password" id="password1" name="password">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input class="form-control" type="password" id="password2" name="password2">
					<i class="icon_lock_alt"></i>
				</div>
				
				
				<%--test --%>
				
				<div id="previewTerms" name="previewTerms">			
				${previewTerms }			
				</div>
				
				<div id="terms" name="terms">			
				${terms }			
				</div>			
				
				
				<div id="termRead" align="center">
					<button type="button" class="btn_1 rounded full-width add_top_30" id="termReadBtn" name="termReadBtn">
					약관 보기
					</button>			
				</div>
				
							
				<div style="margin-bottom: 30px;" align="center">									
					<label class="container_check">								
						  <input type="checkbox" name="readContent" id="readContent" >			
					  <span class="checkmark" align="center" style="display: inline; margin-left: 35px;">
					  </span>
					  	약관에 동의하고 가입합니다. (필수)
					</label>									
				</div>
				<div style="margin-bottom: 30px;" align="center">									
					<label class="container_check">								
						  <input type="checkbox" name="mailingConfirm" id="mailingConfirm" >			
					  <span class="checkmark" align="center" style="display: inline; margin-left: 15px;">
					  </span>
					  	Yolowa의 메일 수신에 동의합니다. (선택)
					</label>									
				</div>
						
				
				<%--/test --%>
				
				
				<div id="pass-info" class="clearfix"></div>
				<button type="button" class="btn_1 rounded full-width add_top_30" id="registerBtn" name="registerBtn" >지금 등록!</button>
				<div class="text-center add_top_10">이미 가입하셨나요? <strong><a href="loginPage">로그인</a></strong></div>
			</form>
			<div class="copy">© 2020 Yolowa</div>
		</aside>
	</div>
	<!-- /login -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/assets/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="${pageContext.request.contextPath }/js/pw_strenght.js"></script>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">	
		
		
		$("#terms").hide();
		var termsToggle=false;	
	
		$("#termReadBtn").click(function(){
			
			if(!termsToggle){
				$("#terms").show();
				$("#previewTerms").hide();
				termsToggle=true;
			} else {
				$("#terms").hide();
				$("#previewTerms").show();
				termsToggle=false;
			}
			
		})
		
	
	
	
		$("#registerBtn").click(function(){
					
			
			var checkResult=0;
			var memberEmail=$("#email").val();
			var memberBirthday=$("#birthday").val();	 
			
			
			if($("#name").val()==""){			
				$('#pass-info').removeClass().addClass('weakpass').html("이름을 입력해주세요.");							
				return;
			}			
			
			
			
			var nameReg = /^[가-힣]{2,5}$/;
					
			if(!nameReg.test($("#name").val())){
				$('#pass-info').removeClass().addClass('weakpass').html("이름은 2-5글자의 한글만 등록 가능합니다.");			
				return;
			}		
			
			
			if($("#birthday").val()==""){
				$('#pass-info').removeClass().addClass('weakpass').html("생일을 입력해주세요.");		
				return;
			} 
				
			
			
			$.ajax({
				type: "POST",
				url: "birthdayCheck",
				headers: {"content-type":"application/json"},
				data: JSON.stringify({"memberBirthday":memberBirthday }),
				async: false,
				dataType:"text",
				success: function(text){
						
						if(text=="false"){
							$('#pass-info').removeClass().addClass('weakpass').html("생일이 올바른지 확인해주세요.");
							checkResult=1;
							return;
						} 							
				},
				
				error: function() {
					alert("알 수 없는 오류");
					return;
				}
				
			})
			
			
			
			
			
			if($("#email").val()==""){
				$('#pass-info').removeClass().addClass('weakpass').html("이메일을 입력해주세요.");			
				return;
			}  			
		
			
			var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(!emailReg.test($("#email").val())){
				$('#pass-info').removeClass().addClass('weakpass').html("이메일이 올바른지 확인해주세요.");
				
				return;				
			}
				
			
			$.ajax({
				type: "POST",
				url: "existCheck",
				headers: {"content-type":"application/json"},
				data: JSON.stringify({"memberEmail":memberEmail }),
				async: false,
				dataType:"text",
				success: function(text){
						
						if(text=="false"){
							$('#pass-info').removeClass().addClass('weakpass').html("이미 등록된 이메일입니다.");
							checkResult=1;
							return;							
						} 							
				},
				
				error: function() {
					alert("알 수 없는 오류");
					return;
				}
				
			})			
				
			
			
			var passRegexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/;  
			
			if($("#password1").val()==""){
				$('#pass-info').removeClass().addClass('weakpass').html("암호를 입력해주세요.");				
				return;
			}
			
			if(!passRegexp.test($("#password1").val())){
				$('#pass-info').removeClass().addClass('weakpass').html("암호는 6~20자에 영어,숫자,특수문자를<br> 하나씩 포함해야합니다.");
				return;
			}
			
			if($("#password2").val()!=$("#password1").val()){
				$('#pass-info').removeClass().addClass('weakpass').html("비밀번호와 비밀번호확인은 일치해야합니다.");				
				return;
			} 					
			
			if(!$("input:checkbox[name='readContent']").is(":checked")){
				$('#pass-info').removeClass().addClass('weakpass').html("약관 내용을 읽고 동의해주세요.");
				return;
			}
			
			if(checkResult==1){
				return;
			}
			
			$("#registerForm").submit();		
						
		
	});		
		
	</script>
	
  
</body>
</html>