package site.yolowa.dto;


public class AdminDashBoardTable {
	String dateMonth;
	long reservationCommissionSum;
	long reservationTotalPriceSum;
	int reservationCount;
	int hostingCount;
	int memberCount;
	int claimCount;
	
	public String getDateMonth() {
		return dateMonth;
	}
	public void setDateMonth(String dateMonth) {
		this.dateMonth = dateMonth;
	}
	public long getReservationCommissionSum() {
		return reservationCommissionSum;
	}
	public void setReservationCommissionSum(long reservationCommissionSum) {
		this.reservationCommissionSum = reservationCommissionSum;
	}
	public long getReservationTotalPriceSum() {
		return reservationTotalPriceSum;
	}
	public void setReservationTotalPriceSum(long reservationTotalPriceSum) {
		this.reservationTotalPriceSum = reservationTotalPriceSum;
	}
	public int getReservationCount() {
		return reservationCount;
	}
	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}
	public int getHostingCount() {
		return hostingCount;
	}
	public void setHostingCount(int hostingCount) {
		this.hostingCount = hostingCount;
	}
	public int getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}
	public int getClaimCount() {
		return claimCount;
	}
	public void setClaimCount(int claimCount) {
		this.claimCount = claimCount;
	}
	
	@Override
	public String toString() {
		return "AdminDashBoardTable [dateMonth=" + dateMonth + ", reservationCommissionSum=" + reservationCommissionSum
				+ ", reservationTotalPriceSum=" + reservationTotalPriceSum + ", reservationCount=" + reservationCount
				+ ", hostingCount=" + hostingCount + ", memberCount=" + memberCount + ", claimCount=" + claimCount
				+ "]";
	}
	
}
