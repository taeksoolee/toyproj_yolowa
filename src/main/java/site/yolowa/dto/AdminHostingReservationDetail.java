package site.yolowa.dto;

import java.util.List;

public class AdminHostingReservationDetail {
	private int hostingNo;
	private Hosting hosting;
	private List<Reservation> reservationList;
	
	public int getHostingNo() {
		return hostingNo;
	}
	public void setHostingNo(int hostingNo) {
		this.hostingNo = hostingNo;
	}
	public Hosting getHosting() {
		return hosting;
	}
	public void setHosting(Hosting hosting) {
		this.hosting = hosting;
	}
	public List<Reservation> getReservationList() {
		return reservationList;
	}
	public void setReservationList(List<Reservation> reservationList) {
		this.reservationList = reservationList;
	}
	
	@Override
	public String toString() {
		return "AdminHostingReservationDetail [hostingNo=" + hostingNo + ", hosting=" + hosting + ", reservationList="
				+ reservationList + "]";
	}
}
