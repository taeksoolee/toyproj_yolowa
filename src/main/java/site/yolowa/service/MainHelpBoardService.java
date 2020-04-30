package site.yolowa.service;

import java.util.List;

import site.yolowa.dto.Board;

public interface MainHelpBoardService {
	List<Board> getHelpBoardList();
	List<Board> getHelpBoard(Board board);
	int modifyHelpBoardView(Board board);
	List<Board> getHelpBoardViewList();
}
