package site.yolowa.dto;

public class AdminHostingTable {
	private Hosting hosting;
	private int usedCount;
	private int reservationCount;
	
	public Hosting getHosting() {
		return hosting;
	}
	public void setHosting(Hosting hosting) {
		this.hosting = hosting;
	}
	public int getUsedCount() {
		return usedCount;
	}
	public void setUsedCount(int usedCount) {
		this.usedCount = usedCount;
	}
	public int getReservationCount() {
		return reservationCount;
	}
	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}
	
	@Override
	public String toString() {
		return "AdminHostingTable [hosting=" + hosting + ", usedCount=" + usedCount + ", reservationCount="
				+ reservationCount + "]";
	}
}
