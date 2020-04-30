package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminClaimReview;
import site.yolowa.dto.Claim;

public interface AdminClaimService {
	List<Claim> getAdminClaimUserTable(Map<String, Object> map);
	List<AdminClaimReview> getAdminClaimReviewTable(Map<String, Object> map);
	int modifyClaimMemberState(Claim claim, int plus);
	int modifyClaimMemberState(List<Claim> claimList, int plus);
	int modifyClaimReviewState(Claim claim);
	int modifyClaimReviewState(List<Claim> claimList);

}