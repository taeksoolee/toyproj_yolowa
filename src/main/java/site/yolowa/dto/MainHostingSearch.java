package site.yolowa.dto;

public class MainHostingSearch {
	private Hosting hosting;
	private Review review;
	private int reviewStarAvg;
	private int reviewNoCount;
	private int rownum;
	private int memberHostState;
	
	public int getMemberHostState() {
		return memberHostState;
	}

	public void setMemberHostState(int memberHostState) {
		this.memberHostState = memberHostState;
	}

	public MainHostingSearch() {
		// TODO Auto-generated constructor stub
	}

	public Hosting getHosting() {
		return hosting;
	}

	public void setHosting(Hosting hosting) {
		this.hosting = hosting;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public int getReviewStarAvg() {
		return reviewStarAvg;
	}

	public void setReviewStarAvg(int reviewStarAvg) {
		this.reviewStarAvg = reviewStarAvg;
	}

	public int getReviewNoCount() {
		return reviewNoCount;
	}

	public void setReviewNoCount(int reviewNoCount) {
		this.reviewNoCount = reviewNoCount;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

}
