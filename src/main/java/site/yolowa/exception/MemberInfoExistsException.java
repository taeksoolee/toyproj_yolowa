package site.yolowa.exception;

import site.yolowa.dto.Member;

//회원등록시 사용자가 입력한 아이디가 이미 존재할 경우 발생되는 예외클래스 
public class MemberInfoExistsException extends Exception {
	private static final long serialVersionUID = 1L;
	
	//예외처리 메소드(ExceptionHandler)에게 예외 관련 정보를 전달하기 위한 필드
	private Member member;
	
	public MemberInfoExistsException() {
		// TODO Auto-generated constructor stub
	}
	
	
	public MemberInfoExistsException(Member member, String message) {
		super(message);
		this.member = member;
	}


	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	
	
}
