package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Board;

public interface MainHelpBoardMapper {
	List<Board> selectHelpBoardList();
	List<Board> selectHelpBoard(Board board);
	int updateHelpBoardView(Board board);
	List<Board> selectHelpBoardViewList();
}
