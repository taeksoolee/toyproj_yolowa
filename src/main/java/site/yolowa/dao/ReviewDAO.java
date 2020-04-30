package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.BoardCommentReview;
import site.yolowa.dto.MainReview;
import site.yolowa.dto.MainReviewStarCount;
import site.yolowa.dto.Member;
import site.yolowa.dto.Review;

public interface ReviewDAO {
	int updateReviewStateStop(Review review);
	int updateReviewStatePost(Review review);
	List<Review> selectReview();
	Review selectReviewNo(int reviewNo);
	
	int insertReviewDtail(Review review);
	List<MainReview> selectReviewDetailList(Map<String, Object> map);
	MainReviewStarCount selectReviewStarCount(int hostingNo);
	
	//마이페이지 호스트 -> 게스트 리뷰 작성
	int insertReviewGuest(Review review);
	int insertReviewReGuest(Review review);
	
	//마이페이지 게스트리뷰 출력
	List<MainReview> selectReviewGuestList(Map<String, Object> map);
	int selectReviewGuestCount(int reviewMemberNo);
	
	//마이페이지 게스트 정보 출력
	Member selectMypageMember(int memberNo);
	
	//게시판 리뷰 작성 메소드
	int insertCommentReview(Review review);
	List<BoardCommentReview> selectDetailCommentReview(int boardNo);
}