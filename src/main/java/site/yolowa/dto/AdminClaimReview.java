package site.yolowa.dto;

public class AdminClaimReview {
	private Claim claim;
	private Review review;
	
	public Claim getClaim() {
		return claim;
	}
	public void setClaim(Claim claim) {
		this.claim = claim;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	@Override
	public String toString() {
		return "AdminClaimReview [claim=" + claim + ", review=" + review + "]";
	}
}
	
	

