<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">마이페이지</a>
        </li>
        <li class="breadcrumb-item active">프로필 수정</li>        
      </ol>         
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-user"></i>프로필 상세 </h2>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group" align: center;>					
						<form method="post" action="profilePhoto" enctype="multipart/form-data" id="imageForm">
														
							<c:choose>
							<c:when test="${imagePath !=null}">
							<img src="${pageContext.request.contextPath }/img/member/${imagePath }" id="profilePhoto" name="profilePhoto" width="300"
								style="padding-bottom: 30px">
								
							</c:when>												
							
							
							
							<c:when test="${imagePath ==null}">
							<img src="${pageContext.request.contextPath }/img/member/admin-no-profile.png" id="noPhoto" name="noPhoto" width="300"
								style="padding-bottom: 30px">						
							</c:when>												
							</c:choose>
							
							<p><input type="file" name="imageFile" style="align: center;"></p>
							<p><span style="color: red;">${photoMsg } </span></p>					
							<button type="submit" class="btn_1 medium" style="margin-top: 30px;" id="imageSave">이미지 저장</button>												
						</form>
						
						<form action="profilePhotoRemove" method="post">
							<button type="submit" class="btn_1 medium" style="margin-top: 30px;" id="imageRemove">이미지 삭제</button>
						</form>				
						
				    </div>
				</div>
				<div class="col-md-8 add_top_30">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">							
							<form action="user-profile" method="post" id="modifyForm">
								<label>이름</label>								
								<input type="text" class="form-control" placeholder="이름 입력" value=${name } name="name" id="name">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>생년월일</label>
								<input class="form-control" type="date" value=${birthday } id="example-date-input" name="birthday">
							</div>
						</div>
						
					</div>
					<!-- /row-->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>연락처</label>
								<input type="text" class="form-control" placeholder="휴대폰 번호" value="${phone }" name="phone" id="phone">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>이메일</label>
								<input type="email" class="form-control" placeholder="이메일" value=${email } name="oldEmail" disabled="disabled">
							</div>
						</div>
					</div>
					<!-- /row-->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>성별</label>
								<div class="styled-select">
								<select name="sex" id="sex">
									<c:choose>									
										<c:when test="${sex==0}">
											<option selected value=0 >미지정</option>
											<option value=1 >남자</option>
											<option value=2 >여자</option>
											<option value=3 >기타</option>
										</c:when>
										<c:when test="${sex==1 }">
											<option value=0 >미지정</option>
											<option selected value=1 >남자</option>
											<option value=2 >여자</option>
											<option value=3 >기타</option>
										</c:when>
										<c:when test="${sex==2 }">
											<option value=0 >미지정</option>
											<option value=1 >남자</option>
											<option selected value=2 >여자</option>
											<option value=3 >기타</option>
										</c:when>
										<c:when test="${sex==3 }">
											<option value=0 >미지정</option>
											<option value=1 >남자</option>
											<option value=2 >여자</option>
											<option selected value=3 >기타</option>
										</c:when>
									</c:choose>
								</select>
								
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>이메일 수신여부</label>
								<div class="styled-select">
								<select name="mailing" id="mailing">
									<c:choose>
										<c:when test="${mailing==0 }">
										<option selected="selected" value=0 >거부</option>
										<option value=1 >허용</option>
										</c:when>
										<c:when test="${mailing==1 }">
										<option value=0 >거부</option>
										<option selected="selected" value=1 >허용</option>
										</c:when>
									</c:choose>
								</select>
								</div>
							</div>
						</div>
					</div>
					<!-- /row-->
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>소개</label>
								<textarea style="height:100px;" class="form-control" placeholder="자기소개" name="profile" id="profile" maxlength="4000">${profile }</textarea>
							</div>
						</div>
					</div>
					<!-- /row-->
				</div>
			</div>
		</div>
		<!-- /box_general-->
		
				<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-map-marker"></i>주소 등록</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>주소</label>
						<div class="styled-select">
						<input id="address" type="text" class="form-control" onclick="daumPostcode();" name="address">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>상세주소</label>
						<input id="detailAddress" maxlength="30" type="text" class="form-control" name="detailAddress">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>참고주소</label>
						<input id="extraAddress" type="text" class="form-control" disabled="disabled" name="extraAddress">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>우편번호</label>
						<input id="postcode" type="text" class="form-control" disabled="disabled" name="postcode">
					</div>
				</div>
			</div>
			<!-- /row-->
		</div>
		<!-- /box_general-->
		
		<div class="row">
			<div class="col-md-6">
				<div class="box_general padding_bottom">
					<div class="header_box version_2">
						<h2><i class="fa fa-lock"></i>비밀번호 변경</h2>
					</div>
					<div class="form-group">
						<label>이전 비밀번호</label>
						<input class="form-control" type="password" name="old_password" id="old_password">
					</div>
					<div class="form-group">
						<label>새로운 비밀번호</label>
						<input class="form-control" type="password" name="new_password" id="new_password">
					</div>
					<div class="form-group">
						<label>새로운 비밀번호 확인</label>
						<input class="form-control" type="password" name="confirm_password" id="confirm_password">
						<br>
						<span id="passwdMsg" style="color: red;"></span>						
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box_general padding_bottom">
					<div class="header_box version_2">
						<h2><i class="fa fa-envelope"></i>이메일 변경</h2>
					</div>
					<div class="form-group">
						<label>이전 이메일</label>
						<input class="form-control" name="old_email" id="old_email" type="email" value="${email }" disabled="disabled">
					</div>
					<div class="form-group">
						<label>새로운 이메일</label>
						<input class="form-control" name="new_email" id="new_email" type="email">
					</div>
					<div class="form-group">
						<label>새로운 이메일 확인</label>
						<input class="form-control" name="confirm_new_email" id="confirm_new_email" type="email">
						<br>
						<span id="emailMsg" style="color: red;"></span>
					</div>
				</div>
			</div>
		</div>
		<!-- /row-->
		</form>	
		<p><button type="button" id="submitBtn" class="btn_1 medium" style="display: inline;">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;		
		<button type="button" id="quitBtn" class="btn_1 medium">회원탈퇴</button>
		</p>				
	  </div>
	  <!-- /.container-fluid-->
   	</div>
    <!-- /.container-wrapper-->

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.selectbox-0.2.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/retina-replace.min.js"></script>
	<script src="${pageContext.request.contextPath }/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/js/admin.js"></script>
	<!-- Custom scripts for this page-->
	<script src="${pageContext.request.contextPath }/vendor/dropzone.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<!-- 다음 우편번호(주소) 자동완성 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
	
	//^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$
	//6~20자 사이, 영어+숫자+특수문자를 각각 하나씩 포함할 것을 요구하는 정규표현식	
				
	$("#submitBtn").click(function(){
		
		$('#emailMsg').text("");
		$('#passwdMsg').text("");
		
		var memberEmail = $("#new_email").val();
		var oldEmail = $("#old_email").val();
		var memberBirthday = $("#example-date-input").val();
		var memberPassword = $("#old_password").val();	
		var checkResult=0;		
		
		
		$.ajax({
			type: "POST",
			url: "../existCheck",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"memberEmail":memberEmail }),
			async: false,
			dataType:"text",
			success: function(text){
					
					if(text=="false"){
						$('#emailMsg').text("이미 등록된 이메일입니다.");
						checkResult=1;
					} 							
			},			
			error: function() {
				alert("알 수 없는 오류");
				return;
			}			
		})
		
		
		$.ajax({
				type: "POST",
				url: "../birthdayCheck",
				headers: {"content-type":"application/json"},
				data: JSON.stringify({"memberBirthday":memberBirthday }),
				async: false,
				dataType:"text",
				success: function(text){
						
						if(text=="false"){
							$('#passwdMsg').text("생일이 올바르지 않습니다.");
							checkResult=1;
							return;
						} 							
				},
				
				error: function() {
					alert("알 수 없는 오류");
					return;
				}
				
			})
			
			$.ajax({
			type: "POST",
			url: "../passwordCheck",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"memberEmail":oldEmail,"memberPassword":memberPassword }),
			async: false,
			dataType:"text",
			success: function(text){
					
					if(text=="false"){
						$('#passwdMsg').text("현재 비밀번호와 입력한 비밀번호가 일치하지 않습니다.");
						checkResult=1;
						return;
					}					
					
			},			
			error: function() {
				alert("알 수 없는 오류");
				return;
			}			
		})
			
			
			
			if($("#name").val()==""){			
				$('#passwdMsg').text("이름을 입력해주세요.");							
				return;
			}
			
			var regExp = /^\d{3}-\d{3,4}-\d{4}$/; 
			
			
			if($("#phone").val()!=""){				
				if(!regExp.test($("#phone").val())){
					$('#passwdMsg').text("연락처를 000-0000-0000 형식으로 입력해 주세요.");
					return;
				}
			}
			
			var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			
			if($("#new_email").val() != ""){				
				if(!emailReg.test($("#new_email").val())){
					$('#emailMsg').text("이메일이 올바르지 않습니다.");					
					return;
				}
				
				if($("#new_email").val()!=$("#confirm_new_email").val()){
					$('#emailMsg').text("새 이메일과 이메일확인이 같아야합니다.");					
					return;
				}			
				
			}
			
			
			if($("#new_email").val() == "" && $("#confirm_new_email").val()!=""){
				$('#emailMsg').text("변경할 이메일도 함께 입력해주세요.");
				return;
			}
			
									
			var passRegexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/;  
			
			
			
			if($("#new_password").val()!="" && !passRegexp.test($("#new_password").val())){
				$('#passwdMsg').text("암호는 6~20자에 영어,숫자,특수문자를 하나씩 포함해야합니다.");
				return;
			}
			
			if($("#confirm_password").val()!=$("#new_password").val()){
				$("#passwdMsg").text("새 비밀번호와 비밀번호확인이 같아야합니다.");
				return;
			}
			
			if($("#old_password").val()!="" && $("#new_password").val()=="" ){
				$("#passwdMsg").text("새 비밀번호를 입력해 주세요.");
				return;	
			}
			
			
			
			if(checkResult==1){
				return;
			}
			
		
			alert("회원정보가 변경되었습니다.");			
		$("#modifyForm").submit();		
		
		
	});	
	
	
	
	$("#quitBtn").click(function(){
		
		if(confirm("정말로 탈퇴하시겠습니까?")){
						
			$.ajax({
				type: "GET",
				url: "quit",				
				dataType:"text",
				success: function(){					
					alert("회원탈퇴처리가 완료되었습니다. \n메인페이지로 이동합니다.");
					location.href="${pageContext.request.contextPath }";
					},
				error: function() {
					alert("알 수 없는 오류");				
				}
				
			})		
			
		}		
	});
	
	</script>
	
	<script>
	  function daumPostcode() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	              var addr = ''; // 주소 변수
	              var extraAddr = ''; // 참고항목 변수
	
	              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                  addr = data.roadAddress;
	              } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                  addr = data.jibunAddress;
	              }
	
	              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	              if(data.userSelectedType === 'R'){
	                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                      extraAddr += data.bname;
	                  }
	                  // 건물명이 있고, 공동주택일 경우 추가한다.
	                  if(data.buildingName !== '' && data.apartment === 'Y'){
	                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                  }
	                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                  if(extraAddr !== ''){
	                      extraAddr = ' (' + extraAddr + ')';
	                  }
	                  // 조합된 참고항목을 해당 필드에 넣는다.
	                  document.getElementById("extraAddress").value = extraAddr;
	              
	              } else {
	                  document.getElementById("extraAddress").value = '';
	              }
	
	              // 우편번호와 주소 정보를 해당 필드에 넣는다.
	              document.getElementById('postcode').value = data.zonecode;
	              document.getElementById("address").value = addr;
	              // 커서를 상세주소 필드로 이동한다.
	              document.getElementById("detailAddress").focus();
	          }
	      }).open();
	  }	    
	  
	</script>
	
		
	
	
	