package site.yolowa.exception;

//상태가 관리자(state == 9)가 아닐 경우 발생되는 예외 클래스
public class MemberAdminNotFoundException extends Exception{
	private static final long serialVersionUID = 1L;
	
	private int memberState;
	
	public MemberAdminNotFoundException() {
		// TODO Auto-generated constructor stub
	}

	public MemberAdminNotFoundException(int memberState, String message) {
		super(message);
		this.memberState = memberState;
	}


	public int getMemberState() {
		return memberState;
	}

	public void setMemberState(int memberState) {
		this.memberState = memberState;
	}
	
	
	
	
}
