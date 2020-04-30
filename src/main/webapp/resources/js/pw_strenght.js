$(document).ready(function() {
	var password1 		= $('#password1'); //id of first password field
	var password2		= $('#password2'); //id of second password field
	var passwordsInfo 	= $('#pass-info'); //id of indicator element
	var name=$("#name");
	var birthday=$("#birthday");
	var email=$("#email");
	
	passwordStrengthCheck(password1,password2,passwordsInfo); //call password check function
	nameCheck(name);
	
});



function passwordStrengthCheck(password1, password2, passwordsInfo)
{	
	
	//^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$
	//6~20자 사이, 영어+숫자+특수문자를 각각 하나씩 포함할 것을 요구하는 정규표현식	
	
	var passRegexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/; 
	var regOk = false;
	
	
	
	$(password1).on('keyup', function(e) {
		if(passRegexp.test(password1.val()))	{
			passwordsInfo.removeClass().addClass('vrystrongpass').html("사용할 수 있는 암호입니다.");
			regOk = true;
			
		}
		else if(password1.val()=="") {
			passwordsInfo.removeClass();
			passwordsInfo.text("");
			regOk = false;
			
		}		
		else {
			passwordsInfo.removeClass().addClass('weakpass').html("암호는 6~20자에 영어,숫자,특수문자를<br> 하나씩 포함해야합니다.");
			regOk = false;
			
		} 
	});
	
	$(password2).on('keyup', function(e) {
		
		if(password1.val() !== password2.val() && regOk==true)
		{
			passwordsInfo.removeClass().addClass('weakpass').html("비밀번호와 비밀번호확인은 일치해야합니다.");
			
		}else if (password1.val() == password2.val() && regOk==true){
			passwordsInfo.removeClass();
			passwordsInfo.text("");			
		}
			
	});
}