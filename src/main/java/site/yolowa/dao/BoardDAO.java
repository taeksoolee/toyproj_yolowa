package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Board;
import site.yolowa.dto.BoardComment;

public interface BoardDAO{
	List<Board> selectAllBoard (Map<String, Object> map);
	
	//게시판(공지사항)
	List<BoardComment> selectCommentList(Map<String, Object>map);
	List<BoardComment> selectSearchCommentList(Map<String, Object>map);
	List<BoardComment> selectCategoryCommentList(Map<String, Object>map);
	int selectCommentCount(Map<String, Object> map);
	List<Board> selectComment();
	int selectCommentCategoryCount(Map<String, Object> map);
	BoardComment selectDetailComment(int boardNo);
	List<Board> selectCommentOrderDate4();
	
	//게시판
	int insertAdminBoardNotice(Board board);
	List<Board> selectAdminEtcNotice(Map<String, Object> map);
	//int updateAdminBoardNoticeState(Board board);
	int updateAdminBoardNoticeContent(Board board);
	
	Board selectBoardCategoryTitleEqual(Board board);
	List<Board> selectBoardCategoryTitleLike(Board board);
	
	//도움말
	int insertAdminBoardHelp(Board board);
	List<Board> selectAdminEtcHelp(Map<String, Object> map);
	//int updateAdminBoardHelpState(Board board);
	int updateAdminBoardHelpContent(Board board);
	
	Board selectBoardHelpCategoryTitleEqual(Board board);
	List<Board> selectBoardHelpCategoryTitleLike(Board board);
	
	//약관
	int insertAdminBoardTerms(Board board);
	int updateAdminBoardTermsContent(Board board);
	Board selectBoardTermsCategoryEqual(Board board);
	
	//게시판, 도움말 공통
	Board selectBoardNo(int boardNo);
	int updateAdminBoardState(Board board);
	
	//메인 도움말 페이지
	List<Board> selectHelpBoardList();
	List<Board> selectHelpBoard(Board board);
	int updateHelpBoardView(Board board);
	List<Board> selectHelpBoardViewList();
	
	//메인 페이지 약관
	Board selectMainServiceTerms(Board board);
	
}
