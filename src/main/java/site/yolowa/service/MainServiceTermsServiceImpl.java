package site.yolowa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.BoardDAO;
import site.yolowa.dto.Board;

@Service
public class MainServiceTermsServiceImpl implements MainServiceTermsService{
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public Board getMainServiceTerms(Board board) {
		return boardDAO.selectMainServiceTerms(board);
	}
}
