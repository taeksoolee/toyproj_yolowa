package site.yolowa.exception;

//로그인 할 때 회원 인증 실패시 발생되는 예외클래스
public class LoginAuthFailException extends Exception{
	private static final long serialVersionUID = 1L;
	
	private String memberEmail;
	
	public LoginAuthFailException() {
		// TODO Auto-generated constructor stub
	}

	public LoginAuthFailException(String memberEmail, String message) {
		super(message);
		this.memberEmail = memberEmail;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	
	
}
