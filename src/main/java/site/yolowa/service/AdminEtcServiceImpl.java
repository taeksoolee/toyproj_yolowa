package site.yolowa.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import site.yolowa.dao.BoardDAO;
import site.yolowa.dao.MemberDAO;
import site.yolowa.dto.Board;
import site.yolowa.dto.Sns;


@Service
public class AdminEtcServiceImpl implements AdminEtcService, ApplicationContextAware{
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	@Qualifier("snsPath")
	private String snsPath;
	
	@Autowired
	@Qualifier("snsProp")
	private Properties snsProp;
	
	private WebApplicationContext context;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		context=(WebApplicationContext)applicationContext;
	}
	
	
	@Override
	public List<Board> getAllBoard(Map<String, Object> map) {
		return boardDAO.selectAllBoard(map);
	}

	@Transactional
	@Override
	public int addAdminBoardNotice(Board board) {
		Board realBoard = boardDAO.selectBoardCategoryTitleEqual(board);
		
		if(realBoard == null) {
			// 게시판이 없을 경우
			//if(board.getBoardContent() == null) throw ...
			return boardDAO.insertAdminBoardNotice(board);
		}else {
			if(board.getBoardContent() != "") {
				realBoard.setBoardContent(board.getBoardContent());
				// 기존 이미지가 있을 경우 삭제처리
				if(realBoard.getBoardImage().equals(board.getBoardImage())) {
					new File(context.getServletContext().getRealPath("resources/img/board/"+realBoard.getBoardImage())).delete();
				}
				
				if(board.getBoardImage() != null) {
					realBoard.setBoardImage(board.getBoardImage());
				}
				
				
				return boardDAO.updateAdminBoardNoticeContent(realBoard);
			}
			return 0;
		}
	}
	
	@Transactional
	@Override
	public int addAdminBoardHelp(Board board) {
		Board realBoardHelp= boardDAO.selectBoardCategoryTitleEqual(board);
		if(realBoardHelp == null) {
			System.out.println(board.toString());
			// 게시판이 없을 경우
			//if(board.getBoardContent() == null) throw ...
			return boardDAO.insertAdminBoardHelp(board);
		}else {
			if(board.getBoardContent() != "") {
				System.out.println(board.toString());
				realBoardHelp.setBoardContent(board.getBoardContent());
				return boardDAO.updateAdminBoardHelpContent(realBoardHelp);
			}
			return 0;
		}
	}

	
	@Override
	public List<Board> getAdminEtcNotice(Map<String, Object> map) {
		return boardDAO.selectAdminEtcNotice(map);
	}
	
	@Override
	public List<Board> getAdminEtcHelp(Map<String, Object> map) {
		return boardDAO.selectAdminEtcHelp(map);
	}

	/*
	 * @Transactional
	 * 
	 * @Override public void modifyAdminBoardNoticeState(Board board) {
	 * boardDAO.updateAdminBoardNoticeState(board);
	 * 
	 * }
	 * 
	 * @Transactional
	 * 
	 * @Override public void modifyAdminBoardHelpState(Board board) {
	 * boardDAO.updateAdminBoardHelpState(board); }
	 */
	
//--------------------------------------------------------------
	@Override
	public Sns getAdminSns(HttpServletRequest request) throws IOException {
		Sns sns = new Sns();
		//맵 세팅
		snsProp.load(new FileInputStream(new File(request.getServletContext().getRealPath(snsPath))));
		sns.setBlog(snsProp.getProperty("blog"));
		sns.setTwitter(snsProp.getProperty("twitter"));
		sns.setFacebook(snsProp.getProperty("facebook"));
		sns.setInstagram(snsProp.getProperty("instagram"));
		//
			
		return sns;
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public boolean modifySns(Sns sns, HttpServletRequest request) throws IOException {
		//snsProp.load(snsResource.getInputStream());
		snsProp.load(new FileInputStream(new File(request.getServletContext().getRealPath(snsPath))));
		if(sns.getBlog() != null) {
			snsProp.setProperty("blog", sns.getBlog());
		}
		if(sns.getTwitter() != null) {
			snsProp.setProperty("twitter", sns.getTwitter());
		}
		if(sns.getFacebook() != null) {
			snsProp.setProperty("facebook", sns.getFacebook());
		}
		if(sns.getInstagram() != null) {
			snsProp.setProperty("instagram", sns.getInstagram());
		}
		
		try {
			snsProp.save(new FileOutputStream(new File(request.getServletContext().getRealPath("/WEB-INF/spring/sns.properties"))), "");
		}catch (IOException e) {
			return false; 
		}
		return true;
	}
	
	@Override
	public Board getBoardNo(int boardNo) {
		return boardDAO.selectBoardNo(boardNo);
	}

	@Override
	public Board getBoardCategoryTitleEqual(Board board) {
		return boardDAO.selectBoardCategoryTitleEqual(board);
	}
	
	@Override
	public List<Board> getBoardCategoryTitleLike(Board board) {
		if(!board.getBoardTitle().equals("")) {
			return boardDAO.selectBoardCategoryTitleLike(board);
		}else {
			return null;
		}
	}
	
	@Transactional
	@Override
	public int addAdminBoardTerms(Board board) {
		Board realBoardTerms= boardDAO.selectBoardTermsCategoryEqual(board);
		System.out.println("service ?? board >> " + realBoardTerms);
		if(realBoardTerms == null) {
			System.out.println(board.toString());
			return boardDAO.insertAdminBoardTerms(board);
		}else {
			if(board.getBoardContent() != "") {
				System.out.println(board.toString());
				realBoardTerms.setBoardContent(board.getBoardContent());
				return boardDAO.updateAdminBoardTermsContent(realBoardTerms);
			}
			return 0;
		}
	}

	@Override
	public Board getBoardTermsCategoryEqual(Board board) {
		return boardDAO.selectBoardTermsCategoryEqual(board);
	}

	@Override
	public Board getBoardHelpCategoryTitleEqual(Board board) {
		return boardDAO.selectBoardHelpCategoryTitleEqual(board);
	}

	@Override
	public List<Board> getBoardHelpCategoryTitleLike(Board board) {
		return boardDAO.selectBoardHelpCategoryTitleLike(board);
	}

	@Override
	@Transactional
	public int modifyAdminBoardState(Board board) {
		// if()... 
		return boardDAO.updateAdminBoardState(board);
	}

	@Override
	public List<String> getMemberMailing() {
		return memberDAO.selectMemberMailing();
	}


	@Override
	public int modifyAdminBoardState(List<Board> boardlist) {
		int rows = 0;
		for(Board board : boardlist) {
		rows += boardDAO.updateAdminBoardState(board);
		}
		return rows;
	}
}
