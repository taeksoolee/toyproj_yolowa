package site.yolowa.dto;

public class AdminHostingDetail {
	Hosting hosting;
    int reservationPriceSum; 
    int reviewStarAvg;
    
	public Hosting getHosting() {
		return hosting;
	}
	public void setHosting(Hosting hosting) {
		this.hosting = hosting;
	}
	public int getReservationPriceSum() {
		return reservationPriceSum;
	}
	public void setReservationPriceSum(int reservationPriceSum) {
		this.reservationPriceSum = reservationPriceSum;
	}
	public int getReviewStarAvg() {
		return reviewStarAvg;
	}
	public void setReviewStarAvg(int reviewStarAvg) {
		this.reviewStarAvg = reviewStarAvg;
	}
	
	@Override
	public String toString() {
		return "AdminHostingDetail [hosting=" + hosting + ", reservationPriceSum=" + reservationPriceSum
				+ ", reviewStarAvg=" + reviewStarAvg + "]";
	}
}
