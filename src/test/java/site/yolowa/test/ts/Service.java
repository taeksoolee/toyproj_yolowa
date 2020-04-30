package site.yolowa.test.ts;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import site.yolowa.dao.BoardDAO;
import site.yolowa.dao.MemberDAO;
import site.yolowa.dao.ReservationDAO;
import site.yolowa.dto.Board;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Reservation;
import site.yolowa.dto.Sns;
import site.yolowa.service.AdminClaimService;
import site.yolowa.service.AdminComponentService;
import site.yolowa.service.AdminEtcService;
import site.yolowa.service.AdminMemberService;
import site.yolowa.service.MainCommentService;
import site.yolowa.service.MainCommentServiceImpl;
import site.yolowa.utils.AdminUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class Service {
	private static final Logger logger=LoggerFactory.getLogger(Service.class);
	
	@Autowired
	MainCommentService mainCommentService;
	
	@Autowired
	AdminUtil adminUtil;
	
	@Autowired
	AdminMemberService adminMemberService;
	@Autowired
	AdminEtcService adminEtcService;
	@Autowired
	AdminComponentService adminComponentService;
	
	@Autowired
	BoardDAO boardDao;
	
	@Autowired
	@Qualifier("visitedsiteProp")
	Properties visitedsiteProp;
	
	@Autowired
	@Qualifier("slashYearMonthFormat")
	SimpleDateFormat slashYearMonthFormat;
	
	@Autowired
	ReservationDAO reservationDAO;
	
	/*
	@Test
	public void service() {
		
	}
	*/
	
	@Test
	public void service() throws IOException, MessagingException {
		System.out.println(mainCommentService.getDetailCommentReview(3));
		
		
		//System.out.println(System.currentTimeMillis());
		
		//System.out.println("test " + mainCommentService.getSelectCommentCount());	
		//System.out.println("test " + mainCommentService.getComment());
		
		/*
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("inputValue", 2);
		map.put("pageSize", 1);
				
		System.out.println(mainCommentService.getCategoryCommentList(map));
		*/
		
		/*
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageSize", 1);
				
		System.out.println(mainCommentService.getCommentList(map));
		*/
		/*
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageSize", 1);
		map.put("keyword", "홍길동");
		//where b.board_content like '#{keyword}' or b.board_title like '#{keyword}' or m.member_name like '#{keyword}'
		System.out.println(mainCommentService.getSearchCommentList(map));
		*/
		//reservationDAO.selectBookmarkCount(1);
		
		/*
		List<String> mailList = adminEtcService.getMemberMailing();
		System.out.println(mailList);
		*/
		
		/*
		List<String> mailList = new ArrayList<String>();
		mailList.add("yolowa2020@gmail.com");
		mailList.add("o2ng_v@naver.com");
		
		for(String mail : mailList) {
			adminUtil.sendEmail(mail, title, content);
		}
		*/
		
		//adminUtil.sendEmail(senderEmail, title, content);
		
		//adminUtil.sendEmail("yolowa2020@gmail.com", "테스트 메일", "<h1 style='color:red;'>hello world</h1>");
		
		/*
		Board board = new Board();
		board.setBoardType(1);
		board.setBoardWriterNo(1);
		board.setBoardCategory(1);
		board.setBoardTitle("도움말 테스트111111");
		board.setBoardContent("안녕하세요!! 하이...!");
		System.out.println(adminEtcService.addAdminBoardNotice(board));
		*/
		
		/*
		Board board = new Board();
		board.setBoardType(2);
		board.setBoardCategory(1);
		board.setBoardTitle("도움말");
		System.out.println(adminEtcService.getBoardCategoryTitleLike(board));
		*/
		
		
 		//System.out.println(adminEtcService.getBoardNo(1));
		
		//System.out.println(slashYearMonthFormat.format(new Date("19/02/11")));
		
		
		/*
		Claim claim = new Claim();
		claim.setClaimNo(81);
		claim.setClaimSuspectReviewNo(41);
		claim.setClaimState(2);
		
		adminClaimService.modifyClaimReviewState(claim);
		*/
		/*
		Claim claim = new Claim();
		claim.setClaimNo(48);
		claim.setClaimSuspectNo(4);
		claim.setClaimState(2);
		adminClaimService.modifyClaimMemberState(claim,11);
		
		claim = new Claim();
		claim.setClaimNo(48);
		claim.setClaimSuspectNo(4);
		claim.setClaimState(2);
		*/
		
		/*
		Sns sns = new Sns();
		System.out.println(sns.getBlog());
		System.out.println(sns.getFacebook());
		System.out.println(sns.getInstagram());
		System.out.println(sns.getTwitter());
		
		sns.setFacebook("my facebook");
		System.out.println(adminEtcService.getAdminSns());
		System.out.println(adminEtcService.modifySns(sns));
		*/
		/*
		visitedsiteProp.load(visitedsiteResource.getInputStream());
		System.out.println(visitedsiteResource.getFile());
		int count = 0;
		String now = slashYearMonthFormat.format(System.currentTimeMillis());
		
		if(visitedsiteProp.getProperty(now) == null) {
			count = 1;
		}else {
			count = Integer.parseInt(visitedsiteProp.getProperty(now));
			count++;
		}
		
		visitedsiteProp.setProperty(now, count+"");
		visitedsiteProp.save(new FileOutputStream(visitedsiteResource.getFile()), "date : " + now);
		*/
	}
	
	
	
}
