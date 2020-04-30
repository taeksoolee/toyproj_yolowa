package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.yolowa.dto.BoardCommentReview;
import site.yolowa.dto.MainReview;
import site.yolowa.dto.MainReviewStarCount;
import site.yolowa.dto.Member;
import site.yolowa.dto.Review;
import site.yolowa.mapper.AdminMapper;
import site.yolowa.mapper.MainCommentMapper;
import site.yolowa.mapper.MainHostingMapper;
import site.yolowa.mapper.MainReviewMapper;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int updateReviewStateStop(Review review) {
		return sqlSession.getMapper(AdminMapper.class).updateReviewStateStop(review);
	}
	
	@Override
	public int updateReviewStatePost(Review review) {
		return sqlSession.getMapper(AdminMapper.class).updateReviewStatePost(review);
	}
	
	@Override
	public List<Review> selectReview() {
		return sqlSession.getMapper(MainHostingMapper.class).selectReview();
	}
	
	@Override
	public Review selectReviewNo(int reviewNo) {
		return sqlSession.getMapper(MainHostingMapper.class).selectReviewNo(reviewNo);
	}

	@Override
	public int insertReviewDtail(Review review) {
		return sqlSession.getMapper(MainReviewMapper.class).insertReviewDtail(review);
	}

	@Override
	public List<MainReview> selectReviewDetailList(Map<String, Object> map) {
		return sqlSession.getMapper(MainReviewMapper.class).selectReviewDetailList(map);
	}

	@Override
	public MainReviewStarCount selectReviewStarCount(int hostingNo) {
		return sqlSession.getMapper(MainReviewMapper.class).selectReviewStarCount(hostingNo);
	}

	@Override
	public int insertCommentReview(Review review) {
		return sqlSession.getMapper(MainCommentMapper.class).insertCommentReview(review);
	}

	@Override
	public List<BoardCommentReview> selectDetailCommentReview(int boardNo) {
		return sqlSession.getMapper(MainCommentMapper.class).selectDetailCommentReview(boardNo);
	}

	@Override
	public int insertReviewGuest(Review review) {
		return sqlSession.getMapper(MainReviewMapper.class).insertReviewGuest(review);
	}

	@Override
	public List<MainReview> selectReviewGuestList(Map<String, Object> map) {
		return sqlSession.getMapper(MainReviewMapper.class).selectReviewGuestList(map);
	}

	@Override
	public Member selectMypageMember(int memberNo) {
		return sqlSession.getMapper(MainReviewMapper.class).selectMypageMember(memberNo);
	}

	@Override
	public int selectReviewGuestCount(int reviewMemberNo) {
		return sqlSession.getMapper(MainReviewMapper.class).selectReviewGuestCount(reviewMemberNo);
	}

	@Override
	public int insertReviewReGuest(Review review) {
		return sqlSession.getMapper(MainReviewMapper.class).insertReviewReGuest(review);
	}
	
}
