package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Board;
import site.yolowa.dto.BoardComment;
import site.yolowa.dto.BoardCommentReview;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Review;

public interface MainCommentMapper {
	List<BoardComment> selectCommentList(Map<String, Object>map);
	List<BoardComment> selectSearchCommentList(Map<String, Object>map);
	List<BoardComment> selectCategoryCommentList(Map<String, Object>map);
	int selectCommentCount(Map<String, Object> map);
	List<Board> selectComment();
	int selectCommentCategoryCount(Map<String, Object> map);
	BoardComment selectDetailComment(int boardNo);
	int insertCommentReview(Review review);
	List<BoardCommentReview> selectDetailCommentReview(int boardNo);
	int insertClaimComment(Claim claim);
	Claim selectClaimReviewNo(int claimReviewNo);
	List<Board> selectCommentOrderDate4();
}
