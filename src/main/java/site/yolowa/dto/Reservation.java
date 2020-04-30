package site.yolowa.dto;

public class Reservation {
	private int reservationNo;
	private int reservationHostingNo;
	private int reservationMemberNo;
	private int reservationState;
	private int reservationCanceler;
	private String reservationCheckIn;
	private String reservationCheckOut;
	private int reservationGuestNum;
	private int reservationCommission;
	private int reservationTotalPrice;
	private String reservationDate;
	private String reservationName;
	private String reservationEmail;
	private String reservationPhone;
	private String reservationCardNum;
	
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getReservationHostingNo() {
		return reservationHostingNo;
	}
	public void setReservationHostingNo(int reservationHostingNo) {
		this.reservationHostingNo = reservationHostingNo;
	}
	public int getReservationMemberNo() {
		return reservationMemberNo;
	}
	public void setReservationMemberNo(int reservationMemberNo) {
		this.reservationMemberNo = reservationMemberNo;
	}
	public int getReservationState() {
		return reservationState;
	}
	public void setReservationState(int reservationState) {
		this.reservationState = reservationState;
	}
	public int getReservationCanceler() {
		return reservationCanceler;
	}
	public void setReservationCanceler(int reservationCanceler) {
		this.reservationCanceler = reservationCanceler;
	}
	public String getReservationCheckIn() {
		return reservationCheckIn;
	}
	public void setReservationCheckIn(String reservationCheckIn) {
		this.reservationCheckIn = reservationCheckIn;
	}
	public String getReservationCheckOut() {
		return reservationCheckOut;
	}
	public void setReservationCheckOut(String reservationCheckOut) {
		this.reservationCheckOut = reservationCheckOut;
	}
	public int getReservationGuestNum() {
		return reservationGuestNum;
	}
	public void setReservationGuestNum(int reservationGuestNum) {
		this.reservationGuestNum = reservationGuestNum;
	}
	public int getReservationCommission() {
		return reservationCommission;
	}
	public void setReservationCommission(int reservationCommission) {
		this.reservationCommission = reservationCommission;
	}
	public int getReservationTotalPrice() {
		return reservationTotalPrice;
	}
	public void setReservationTotalPrice(int reservationTotalPrice) {
		this.reservationTotalPrice = reservationTotalPrice;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getReservationName() {
		return reservationName;
	}
	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}
	public String getReservationEmail() {
		return reservationEmail;
	}
	public void setReservationEmail(String reservationEmail) {
		this.reservationEmail = reservationEmail;
	}
	public String getReservationPhone() {
		return reservationPhone;
	}
	public void setReservationPhone(String reservationPhone) {
		this.reservationPhone = reservationPhone;
	}
	public String getReservationCardNum() {
		return reservationCardNum;
	}
	public void setReservationCardNum(String reservationCardNum) {
		this.reservationCardNum = reservationCardNum;
	}
	
	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", reservationHostingNo=" + reservationHostingNo
				+ ", reservationMemberNo=" + reservationMemberNo + ", reservationState=" + reservationState
				+ ", reservationCanceler=" + reservationCanceler + ", reservationCheckIn=" + reservationCheckIn
				+ ", reservationCheckOut=" + reservationCheckOut + ", reservationGuestNum=" + reservationGuestNum
				+ ", reservationCommission=" + reservationCommission + ", reservationTotalPrice="
				+ reservationTotalPrice + ", reservationDate=" + reservationDate + ", reservationName="
				+ reservationName + ", reservationEmail=" + reservationEmail + ", reservationPhone=" + reservationPhone
				+ ", reservationCardNum=" + reservationCardNum + "]";
	}
}
