 package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Board;
import site.yolowa.dto.BoardComment;
import site.yolowa.dto.BoardCommentReview;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Review;
import site.yolowa.exception.AjaxException;

public interface MainCommentService {
	List<BoardComment> getCommentList(Map<String, Object>map);
	List<BoardComment> getSearchCommentList(Map<String, Object>map);
	List<BoardComment> getCategoryCommentList(Map<String, Object>map);
	int getSelectCommentCount(Map<String, Object> map);
	List<Board> getComment();
	Map<String, Integer> getCommentCategoryCount(String keyword);
	BoardComment getDetailComment(int boardNo);
	List<Board> getCookieBoard(List<String> boardNoList);
	int addCommentReivew(Review review);
	List<BoardCommentReview> getDetailCommentReview(int boardNo);
	int addClaimComment(Claim claim) throws AjaxException;
	List<Board> getCommentOrderDate4();
}
