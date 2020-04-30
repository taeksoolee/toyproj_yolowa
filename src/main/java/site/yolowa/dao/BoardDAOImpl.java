package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.yolowa.dto.Board;
import site.yolowa.dto.BoardComment;
import site.yolowa.mapper.AdminMapper;
import site.yolowa.mapper.MainCommentMapper;
import site.yolowa.mapper.MainHelpBoardMapper;
import site.yolowa.mapper.MainServiceMapper;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<Board> selectAllBoard(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAllBoard(map);
	}

	@Override
	public int insertAdminBoardNotice(Board board) {
		return sqlSession.getMapper(AdminMapper.class).insertAdminBoardNotice(board);
	}


	@Override
	public List<Board> selectAdminEtcNotice(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminEtcNotice(map);
	}

	@Override
	public List<Board> selectAdminEtcHelp(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminEtcHelp(map);
	}

	@Override
	public int insertAdminBoardHelp(Board board) {
		return sqlSession.getMapper(AdminMapper.class).insertAdminBoardHelp(board);
	}


	@Override
	public List<Board> selectHelpBoardList() {
		return sqlSession.getMapper(MainHelpBoardMapper.class).selectHelpBoardList();
	}

	@Override
	public List<Board> selectHelpBoard(Board board) {
		return sqlSession.getMapper(MainHelpBoardMapper.class).selectHelpBoard(board);
	}

	/*
	 * @Override public int updateAdminBoardNoticeState(Board board) { return
	 * sqlSession.getMapper(AdminMapper.class).updateAdminBoardNoticeState(board); }
	 * 
	 * @Override public int updateAdminBoardHelpState(Board board) { return
	 * sqlSession.getMapper(AdminMapper.class).updateAdminBoardHelpState(board); }
	 */

	@Override
	public Board selectBoardNo(int boardNo) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardNo(boardNo);
	}

	@Override
	public Board selectBoardCategoryTitleEqual(Board board) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardCategoryTitleEqual(board);
	}

	@Override
	public List<Board> selectBoardCategoryTitleLike(Board board) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardCategoryTitleLike(board);
	}

	@Override
	public int updateAdminBoardNoticeContent(Board board) {
		return sqlSession.getMapper(AdminMapper.class).updateAdminBoardNoticeContent(board);
	}
	
	@Override
	public int updateAdminBoardHelpContent(Board board) {
		return sqlSession.getMapper(AdminMapper.class).updateAdminBoardHelpContent(board);
	}
	
	@Override
	public int insertAdminBoardTerms(Board board) {
		return sqlSession.getMapper(AdminMapper.class).insertAdminBoardTerms(board);
	}

	@Override
	public Board selectBoardTermsCategoryEqual(Board board) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardTermsCategoryEqual(board);
	}

	@Override
	public int updateAdminBoardTermsContent(Board board) {
		return sqlSession.getMapper(AdminMapper.class).updateAdminBoardTermsContent(board);
	}

	@Override
	public Board selectBoardHelpCategoryTitleEqual(Board board) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardHelpCategoryTitleEqual(board);
	}

	@Override
	public List<Board> selectBoardHelpCategoryTitleLike(Board board) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardHelpCategoryTitleLike(board);
	}

	@Override
	public int updateAdminBoardState(Board board) {
		return sqlSession.getMapper(AdminMapper.class).updateAdminBoardState(board);
	}


	@Override
	public List<BoardComment> selectSearchCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(MainCommentMapper.class).selectSearchCommentList(map);
	}

	@Override
	public List<BoardComment> selectCategoryCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(MainCommentMapper.class).selectCategoryCommentList(map);
	}

	@Override
	public List<BoardComment> selectCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(MainCommentMapper.class).selectCommentList(map);
	}

	@Override
	public int selectCommentCount(Map<String, Object> map) {
		return sqlSession.getMapper(MainCommentMapper.class).selectCommentCount(map);
	}

	@Override
	public List<Board> selectComment() {
		return sqlSession.getMapper(MainCommentMapper.class).selectComment();
	}

	@Override
	public int updateHelpBoardView(Board board) {
		return sqlSession.getMapper(MainHelpBoardMapper.class).updateHelpBoardView(board);
	}

	@Override
	public int selectCommentCategoryCount(Map<String, Object> map) {
		return sqlSession.getMapper(MainCommentMapper.class).selectCommentCategoryCount(map);
	}

	@Override
	public BoardComment selectDetailComment(int boardNo) {
		return sqlSession.getMapper(MainCommentMapper.class).selectDetailComment(boardNo);
	}

	@Override
	public List<Board> selectHelpBoardViewList() {
		return sqlSession.getMapper(MainHelpBoardMapper.class).selectHelpBoardViewList();
	}

	@Override
	public Board selectMainServiceTerms(Board board) {
		return sqlSession.getMapper(MainServiceMapper.class).selectMainServiceTerms(board);
	}

	@Override
	public List<Board> selectCommentOrderDate4() {
		return sqlSession.getMapper(MainCommentMapper.class).selectCommentOrderDate4();
	}

}
