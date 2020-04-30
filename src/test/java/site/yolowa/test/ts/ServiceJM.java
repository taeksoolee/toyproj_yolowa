package site.yolowa.test.ts;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import site.yolowa.service.MainHelpBoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ServiceJM {
	private static final Logger logger=LoggerFactory.getLogger(ServiceJM.class);
	
	@Autowired
	MainHelpBoardService mainHelpBoardService;
	
	/*
	@Test
	public void service() {
		
	}
	*/
	
	/*
	@Test
	public void service(){
		Board board = new Board();
		board.setBoardNo(34);
		board.setBoardWriterNo(1);
		board.setBoardTitle("게시판 테스트12");
		board.setBoardContent("이클립스 연동 게시판 테스트 입니다.12 - 새소식");
		board.setBoardImage("이미지경로");
		board.setBoardState(1);
		board.setBoardCategory(1);
		board.setBoardDate("20/04/16");
		board.setBoardViewCount(0);
		board.setBoardType(1);
		logger.info("게시판 번호 = "+board.getBoardNo()+", 작성자 = "+board.getBoardWriterNo()+", 제목 = "+board.getBoardTitle()+
					", 내용 = "+board.getBoardContent()+", 이미지 = "+board.getBoardImage()+", 게시 상태 = "+board.getBoardState()+
					", 게시글 구분 = "+board.getBoardCategory()+",게시글 날짜 = "+board.getBoardDate()+", 카운트 = "+board.getBoardViewCount()+
					", 게시글 타입 = "+board.getBoardType());
		logger.info("게시판 추가 관련 기능 구현 성공");
	}
	*/
	
	
	
}
