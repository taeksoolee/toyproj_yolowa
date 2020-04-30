package site.yolowa.dto;

import java.util.List;

public class AdminHostingMemberDetail {
	private int memberNo;
	private Member member;
	private List<AdminHostingDetail> hostingDetailList;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public List<AdminHostingDetail> getHostingDetailList() {
		return hostingDetailList;
	}
	public void setHostingDetailList(List<AdminHostingDetail> hostingDetailList) {
		this.hostingDetailList = hostingDetailList;
	}
	
	@Override
	public String toString() {
		return "AdminHostingMemberDetail [memberNo=" + memberNo + ", member=" + member + ", hostingDetailList="
				+ hostingDetailList + "]";
	}
}
