package site.yolowa.dto;

public class AdminReservationHosting {
	private Reservation reservation;
	private Hosting hosting;
	
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public Hosting getHosting() {
		return hosting;
	}
	public void setHosting(Hosting hosting) {
		this.hosting = hosting;
	}
	
	@Override
	public String toString() {
		return "ReservationHosting [reservation=" + reservation + ", hosting=" + hosting + "]";
	}
}
