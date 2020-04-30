package site.yolowa.dto;

import java.util.List;

public class AdminMemberDetail {
	private Member member;
	private int hostingCount;
	private List<AdminReservationHosting> ReservationHostingList;
	
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
	public List<AdminReservationHosting> getReservationHostingList() {
		return ReservationHostingList;
	}
	public void setReservationHostingList(List<AdminReservationHosting> reservationHostingList) {
		ReservationHostingList = reservationHostingList;
	}
	
	@Override
	public String toString() {
		return "AdminMemberDetail [member=" + member + ", hostingCount=" + hostingCount + ", ReservationHostingList="
				+ ReservationHostingList + "]";
	}
	
}
