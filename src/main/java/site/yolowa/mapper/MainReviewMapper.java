package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.MainReview;
import site.yolowa.dto.MainReviewStarCount;
import site.yolowa.dto.Member;
import site.yolowa.dto.Review;

public interface MainReviewMapper {
	int insertReviewDtail(Review review);
	List<MainReview> selectReviewDetailList(Map<String, Object> map);
	MainReviewStarCount selectReviewStarCount(int hostingNo);
	int insertReviewGuest(Review review);
	List<MainReview> selectReviewGuestList(Map<String, Object> map);
	Member selectMypageMember(int memberNo);
	int selectReviewGuestCount(int reviewMemberNo);
	int insertReviewReGuest(Review review);
}
