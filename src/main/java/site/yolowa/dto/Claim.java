package site.yolowa.dto;

public class Claim {
	private int claimNo;
	private int claimType;
	private int claimApplicantNo;
	private int claimSuspectNo;
	private int claimSuspectHostingNo;
	private int claimSuspectReviewNo;
	private String claimDate;
	private String claimReason;
	private int claimState;
	
	public int getClaimNo() {
		return claimNo;
	}
	public void setClaimNo(int claimNo) {
		this.claimNo = claimNo;
	}
	public int getClaimType() {
		return claimType;
	}
	public void setClaimType(int claimType) {
		this.claimType = claimType;
	}
	public int getClaimApplicantNo() {
		return claimApplicantNo;
	}
	public void setClaimApplicantNo(int claimApplicantNo) {
		this.claimApplicantNo = claimApplicantNo;
	}
	public int getClaimSuspectNo() {
		return claimSuspectNo;
	}
	public void setClaimSuspectNo(int claimSuspectNo) {
		this.claimSuspectNo = claimSuspectNo;
	}
	public int getClaimSuspectHostingNo() {
		return claimSuspectHostingNo;
	}
	public void setClaimSuspectHostingNo(int claimSuspectHostingNo) {
		this.claimSuspectHostingNo = claimSuspectHostingNo;
	}
	public int getClaimSuspectReviewNo() {
		return claimSuspectReviewNo;
	}
	public void setClaimSuspectReviewNo(int claimSuspectReviewNo) {
		this.claimSuspectReviewNo = claimSuspectReviewNo;
	}
	public String getClaimDate() {
		return claimDate;
	}
	public void setClaimDate(String claimDate) {
		this.claimDate = claimDate;
	}
	public String getClaimReason() {
		return claimReason;
	}
	public void setClaimReason(String claimReason) {
		this.claimReason = claimReason;
	}
	public int getClaimState() {
		return claimState;
	}
	public void setClaimState(int claimState) {
		this.claimState = claimState;
	}

	@Override
	public String toString() {
		return "Claim [claimNo=" + claimNo + ", claimType=" + claimType + ", claimApplicantNo=" + claimApplicantNo
				+ ", claimSuspectNo=" + claimSuspectNo + ", claimSuspectHostingNo=" + claimSuspectHostingNo
				+ ", claimSuspectReviewNo=" + claimSuspectReviewNo + ", claimDate=" + claimDate + ", claimReason="
				+ claimReason + ", claimState=" + claimState + "]";
	}
}
