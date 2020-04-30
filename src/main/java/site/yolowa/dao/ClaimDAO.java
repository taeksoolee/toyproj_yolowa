package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminCard;
import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminClaimReview;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Range;

public interface ClaimDAO {
	List<Claim> selectAdminClaimUserTable(Map<String, Object> map);
	int updateClaimState(Claim claim);
	List<AdminClaimReview> selectAdminClaimReviewTable(Map<String, Object> map);
	List<AdminChart> selectAdminClaimChart(Range range);
	List<AdminCard> selectAdminToGuestClaimCard();
	List<AdminCard> selectAdminToHostClaimCard();
	List<AdminCard> selectAdminReivewClaimCard();
	
	//main 디테일 페이지 신고를 위한 메소드
	int insertClaimDetail(Claim claim);
	
	//mypage 신고를 위한 메소드
	int insertClaimGuest(Claim claim);
	
	
	//게시판 클레임 등록
	int insertClaimComment(Claim claim);
	Claim selectClaimReviewNo(int reviewNo);
}