package site.yolowa.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import site.yolowa.dto.Board;
import site.yolowa.dto.Sns;

@Service
public interface AdminEtcService {
	
	List<Board> getAllBoard(Map<String, Object> map);
	
	//게시판
	int addAdminBoardNotice(Board board);
	List<Board> getAdminEtcNotice(Map<String, Object> map);
	//void modifyAdminBoardNoticeState(Board board);
	
	Board getBoardCategoryTitleEqual(Board board);
	List<Board> getBoardCategoryTitleLike(Board board);
	
	//도움말
	int addAdminBoardHelp(Board board);
	List<Board> getAdminEtcHelp(Map<String, Object> map);
	//void modifyAdminBoardHelpState(Board board); 
	
	Board getBoardHelpCategoryTitleEqual(Board board);
	List<Board> getBoardHelpCategoryTitleLike(Board board);
	
	//약관
	int addAdminBoardTerms(Board board);
	Board getBoardTermsCategoryEqual(Board board);
	
	//SNS
	Sns getAdminSns(HttpServletRequest request) throws IOException;
	boolean modifySns(Sns sns, HttpServletRequest request) throws IOException;
	
	//게시판, 도움말 공통
	Board getBoardNo(int boardNo);
	int modifyAdminBoardState(Board board);
	int modifyAdminBoardState(List<Board> boardlist);
	
	//메일발송
	List<String> getMemberMailing();
	
}
