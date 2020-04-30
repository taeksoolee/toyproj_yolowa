package site.yolowa.dto;

public class AdminMemberTable{
	private int memberNo;
	private Member member;
	private int hostingCount;
	private int reservationTotalPrice;
	private int reservationCount;
	
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
	public int getHostingCount() {
		return hostingCount;
	}
	public void setHostingCount(int hostingCount) {
		this.hostingCount = hostingCount;
	}
	public int getReservationTotalPrice() {
		return reservationTotalPrice;
	}
	public void setReservationTotalPrice(int reservationTotalPrice) {
		this.reservationTotalPrice = reservationTotalPrice;
	}
	public int getReservationCount() {
		return reservationCount;
	}
	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}
	
	@Override
	public String toString() {
		return "AdminMemberTable [member=" + member + ", hostingCount=" + hostingCount + ", reservationTotalPrice="
				+ reservationTotalPrice + ", reservationCount=" + reservationCount + "]";
	}
}