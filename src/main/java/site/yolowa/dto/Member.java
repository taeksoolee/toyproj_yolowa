package site.yolowa.dto;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberBirthday;
	private String memberPhone;
	private int memberMailing;
	private String memberLastLogin;
	private String memberJoinDate;
	private int memberState;
	private String memberImage;
	private String memberProfile;
	private String memberForbiddenDate;
	private int memberSex;
	private String memberAddress;
	private String memberMemo;
	private int memberHostState;
	
	private MultipartFile memberImageFile;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberBirthday() {
		return memberBirthday;
	}
	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public int getMemberMailing() {
		return memberMailing;
	}
	public void setMemberMailing(int memberMailing) {
		this.memberMailing = memberMailing;
	}
	public String getMemberLastLogin() {
		return memberLastLogin;
	}
	public void setMemberLastLogin(String memberLastLogin) {
		this.memberLastLogin = memberLastLogin;
	}
	public String getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public int getMemberState() {
		return memberState;
	}
	public void setMemberState(int memberState) {
		this.memberState = memberState;
	}
	public String getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getMemberForbiddenDate() {
		return memberForbiddenDate;
	}
	public void setMemberForbiddenDate(String memberForbiddenDate) {
		this.memberForbiddenDate = memberForbiddenDate;
	}
	public int getMemberSex() {
		return memberSex;
	}
	public void setMemberSex(int memberSex) {
		this.memberSex = memberSex;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberMemo() {
		return memberMemo;
	}
	public void setMemberMemo(String memberMemo) {
		this.memberMemo = memberMemo;
	}
	public int getMemberHostState() {
		return memberHostState;
	}
	public void setMemberHostState(int memberHostState) {
		this.memberHostState = memberHostState;
	}

	public MultipartFile getMemberImageFile() {
		return memberImageFile;
	}

	public void setMemberImageFile(MultipartFile memberImageFile) {
		this.memberImageFile = memberImageFile;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPassword=" + memberPassword
				+ ", memberName=" + memberName + ", memberBirthday=" + memberBirthday + ", memberPhone=" + memberPhone
				+ ", memberMailing=" + memberMailing + ", memberLastLogin=" + memberLastLogin + ", memberJoinDate="
				+ memberJoinDate + ", memberState=" + memberState + ", memberImage=" + memberImage + ", memberProfile="
				+ memberProfile + ", memberForbiddenDate=" + memberForbiddenDate + ", memberSex=" + memberSex
				+ ", memberAddress=" + memberAddress + ", memberMemo=" + memberMemo + ", memberHostState="
				+ memberHostState + "]";
	}
}