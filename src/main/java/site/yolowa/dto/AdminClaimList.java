package site.yolowa.dto;

import java.util.List;

public class AdminClaimList {
	List<Claim> claimList;

	public List<Claim> getClaimList() {
		return claimList;
	}

	public void setClaimList(List<Claim> claimList) {
		this.claimList = claimList;
	}

	@Override
	public String toString() {
		return "AdminClaimList [claimList=" + claimList + "]";
	} 
}
