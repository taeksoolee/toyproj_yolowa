package site.yolowa.dto;

public class Review {
	private int reviewNo;
	private int reviewRef;
	private int reviewHostingNo;
	private int reviewMemberNo;
	private int reviewBoardNo;
	private int reviewWriterNo;
	private String reviewContent;
	private int reviewStar;
	private String reviewDate;
	private int reviewState;
	private int reviewCategory;
	

	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getReviewRef() {
		return reviewRef;
	}
	public void setReviewRef(int reviewRef) {
		this.reviewRef = reviewRef;
	}
	public int getReviewHostingNo() {
		return reviewHostingNo;
	}
	public void setReviewHostingNo(int reviewHostingNo) {
		this.reviewHostingNo = reviewHostingNo;
	}
	public int getReviewMemberNo() {
		return reviewMemberNo;
	}
	public void setReviewMemberNo(int reviewMemberNo) {
		this.reviewMemberNo = reviewMemberNo;
	}
	public int getReviewBoardNo() {
		return reviewBoardNo;
	}
	public void setReviewBoardNo(int reviewBoardNo) {
		this.reviewBoardNo = reviewBoardNo;
	}
	public int getReviewWriterNo() {
		return reviewWriterNo;
	}
	public void setReviewWriterNo(int reviewWriterNo) {
		this.reviewWriterNo = reviewWriterNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewState() {
		return reviewState;
	}
	public void setReviewState(int reviewState) {
		this.reviewState = reviewState;
	}
	public int getReviewCategory() {
		return reviewCategory;
	}
	public void setReviewCategory(int reviewCategory) {
		this.reviewCategory = reviewCategory;
	}
	
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewRef=" + reviewRef + ", reviewHostingNo=" + reviewHostingNo
				+ ", reviewMemberNo=" + reviewMemberNo + ", reviewBoardNo=" + reviewBoardNo + ", reviewWriterNo="
				+ reviewWriterNo + ", reviewContent=" + reviewContent + ", reviewStar=" + reviewStar + ", reviewDate="
				+ reviewDate + ", reviewState=" + reviewState + ", reviewCategory=" + reviewCategory + "]";
	}
}
