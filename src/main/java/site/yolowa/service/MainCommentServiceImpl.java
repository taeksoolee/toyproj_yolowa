package site.yolowa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.yolowa.dao.BoardDAO;
import site.yolowa.dao.ClaimDAO;
import site.yolowa.dao.ReviewDAO;
import site.yolowa.dto.Board;
import site.yolowa.dto.BoardComment;
import site.yolowa.dto.BoardCommentReview;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Review;
import site.yolowa.exception.AjaxException;

@Service
public class MainCommentServiceImpl implements MainCommentService{

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ClaimDAO claimDAO;
	
	@Override
	public List<BoardComment> getCommentList(Map<String, Object> map) {
		return boardDAO.selectCommentList(map);
	}
	
	@Override
	public List<BoardComment> getSearchCommentList(Map<String, Object> map) {
		return boardDAO.selectSearchCommentList(map);
	}

	@Override
	public List<BoardComment> getCategoryCommentList(Map<String, Object> map) {
		return boardDAO.selectCategoryCommentList(map);
	}
	
	@Override
	public int getSelectCommentCount(Map<String, Object> map) {
		return boardDAO.selectCommentCount(map);
	}
	
	public List<Board> getComment() {
		return boardDAO.selectComment();
	}
	
	@Override
	@Transactional
	public Map<String, Integer> getCommentCategoryCount(String keyword){
		Map<String, Object> filter = new HashMap<String, Object>();
		filter.put("keyword", keyword);
		
		Map map = new HashMap<String, Integer>();
		filter.put("category", 1);
		map.put("count1", boardDAO.selectCommentCategoryCount(filter));
		filter.put("category", 2);
		map.put("count2", boardDAO.selectCommentCategoryCount(filter));
		filter.put("category", 3);
		map.put("count3", boardDAO.selectCommentCategoryCount(filter));
		return map;
	}

	@Override
	public BoardComment getDetailComment(int boardNo) {
		return boardDAO.selectDetailComment(boardNo);
	}

	@Override
	@Transactional
	public List<Board> getCookieBoard(List<String> boardNoList) {
		List<Board> boardList = new ArrayList<Board>();
		for(String boardNo : boardNoList) {
			boardList.add(boardDAO.selectBoardNo(Integer.parseInt(boardNo)));
		}
		return boardList;
	}

	@Override
	public int addCommentReivew(Review review){
		return reviewDAO.insertCommentReview(review);
	}

	@Override
	public List<BoardCommentReview> getDetailCommentReview(int boardNo){
		return reviewDAO.selectDetailCommentReview(boardNo);
	}

	@Override
	@Transactional
	public int addClaimComment(Claim claim) {
		if(claimDAO.selectClaimReviewNo(claim.getClaimSuspectReviewNo())!=null) {
			return 0;
		}
		return claimDAO.insertClaimComment(claim);
	}

	@Override
	public List<Board> getCommentOrderDate4() {
		return boardDAO.selectCommentOrderDate4();
	}
}
