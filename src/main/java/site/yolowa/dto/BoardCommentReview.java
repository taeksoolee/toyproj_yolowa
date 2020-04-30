package site.yolowa.dto;

public class BoardCommentReview {
	private int reviewNo;
	private Review review;
	private String memberImage;
	private String memberName;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public String getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	@Override
	public String toString() {
		return "BoardCommentReview [reviewNo=" + reviewNo + ", review=" + review + ", memberImage=" + memberImage
				+ ", memberName=" + memberName + "]";
	}
}
