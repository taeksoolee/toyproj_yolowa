package site.yolowa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.BoardDAO;
import site.yolowa.dto.Board;

@Service
public class MainHelpBoardServiceImpl implements MainHelpBoardService{

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<Board> getHelpBoardList() {
		return boardDAO.selectHelpBoardList();
	}

	@Override
	public List<Board> getHelpBoard(Board board) {
		return boardDAO.selectHelpBoard(board);
	}

	@Override
	public int modifyHelpBoardView(Board board) {
		return boardDAO.updateHelpBoardView(board);
	}

	@Override
	public List<Board> getHelpBoardViewList() {
		return boardDAO.selectHelpBoardViewList();
	}

	
	
}
