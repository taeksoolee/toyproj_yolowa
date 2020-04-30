package site.yolowa.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import site.yolowa.dto.Claim;
import site.yolowa.dto.Hosting;
import site.yolowa.dto.Member;
import site.yolowa.dto.MypageHeaderCount;
import site.yolowa.dto.Reservation;
import site.yolowa.dto.Review;
import site.yolowa.service.MainMemberService;
import site.yolowa.service.MainMessageService;
import site.yolowa.service.MypageHostingService;
import site.yolowa.utils.Pager;

//마이페이지 호스팅 관련 서비스 컨트롤러

@Controller
public class MypageServiceController implements ApplicationContextAware {
	@Autowired
	private MypageHostingService mainHostingMypageService;
	
	@Autowired
	private MainMessageService MainMessageService;
	
	@Autowired
	private MainMemberService mainMemberService;
	
	//WebApplicationContext : SpringMVC의 Front Controller에서 사용하기 위한 Spring Bean를 관리하는 Spring Container 관련 인스턴스
	private WebApplicationContext context;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		//ApplicationContext 인스턴스는 WebApplicationContext 인스턴스의 부모 인스턴스이므로 객체 형변환을 해야만 필드에 저장 가능
		context = (WebApplicationContext)applicationContext;
	}
	
	/*
	//호스팅 등록 get 접근
	*/
	@RequestMapping(value = "/mypage/addlisting", method = RequestMethod.GET)
	public String addListing(HttpSession session) {
		//로그인 인증 처리
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		
		return "mypage/add-listing";
	}
	
	//호스팅 등록
	@Transactional
	@RequestMapping(value = "/mypage/addlisting", method = RequestMethod.POST)
	public String addListing(@ModelAttribute Hosting hosting, HttpSession session) throws IOException {
		//로그인 인증 처리
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		Member member = (Member)session.getAttribute("loginMember");
		//경로 설정
		String uploadDirPath = context.getServletContext().getRealPath("/resources/img/hosting");
		//이미지 이름 설정
		String dbImageName = "";
		
		//업로드 처리 및 이미지 추가
		if (!hosting.getFile().isEmpty()) {
			for (MultipartFile file : hosting.getFile()) {
				String upload = System.currentTimeMillis()+"";
				file.transferTo(new File(uploadDirPath, upload));
				
				dbImageName += upload+"|";
			}
			hosting.setHostingImage(dbImageName);
		}
		
		mainHostingMypageService.addHosting(hosting);
		mainMemberService.updateMemberHostState(member.getMemberNo());
		
		return "redirect:/mypage/listings?hostingState=1";
	}
	
	//호스팅 업데이트 겟 접근
	@RequestMapping(value = "/mypage/modifylisting", method = RequestMethod.GET)
	public String modifyListing(HttpSession session, @RequestParam int hostingNo, Model model) {
		//로그인 인증 처리
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		Member member = (Member)session.getAttribute("loginMember");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("hostingMemberNo", member.getMemberNo());
		searchMap.put("hostingNo", hostingNo);
		
		model.addAttribute("hosting", mainHostingMypageService.getMypageHosting(searchMap));
		
		return "mypage/add-listing";
	}
	
	//호스팅 업데이트
	@Transactional
	@RequestMapping(value = "/mypage/modifylisting", method = RequestMethod.POST)
	public String modifyListing(@ModelAttribute Hosting hosting, HttpSession session) throws IOException {
		//로그인 인증 처리
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		
		//경로 설정
		String uploadDirPath = context.getServletContext().getRealPath("/resources/img/hosting");
		//이미지 이름 설정
		String dbImageName = "";
		
		//업로드 처리 및 이미지 추가
		if (!hosting.getFile().isEmpty()) {
			for (MultipartFile file : hosting.getFile()) {
				String upload = System.currentTimeMillis()+"";
				file.transferTo(new File(uploadDirPath, upload));
				
				dbImageName += upload+"|";
			}
			hosting.setHostingImage(dbImageName);
		}
		
		mainHostingMypageService.modifyMypageHostingList(hosting);
		
		return "redirect:/mypage/dashboard";
	}
	
	
	
	/*
	//예약관리
	*/
	@RequestMapping(value = "/mypage/bookings", method = RequestMethod.GET)
	public String bookings(HttpSession session) {
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		
		return "mypage/bookings";
	}
	
	//예약을 디스플레이 하기 위한 메소드
	@RequestMapping(value = "mypage/bookingList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> bookingList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, @RequestParam int reservationState) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("reservationState", reservationState);
		countMap.put("hostingMemberNo", member.getMemberNo());
		
		int totalbooking = mainHostingMypageService.getBookingCount(countMap);
		
		int pageSize = 5; 
		int blockSize = 5; 
		
		Pager pager = new Pager(pageNum, totalbooking, pageSize, blockSize);
		
		//System.out.println(pager.getEndRow());
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("reservationState", reservationState);
		pagerMap.put("LoginMemberNo", member.getMemberNo());
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("bookingList", mainHostingMypageService.getBookingList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	//마이페이지 예약에서 리뷰 작성
	@Transactional
	@RequestMapping(value = "/writeGuestReview", method = RequestMethod.POST)
	@ResponseBody
	public String writeGuestReview(@RequestBody Review review) {
		MainMessageService.addReviewGuest(review);
		return "success";
	}
	
	
	
	/*
	//호스팅 대쉬보드
	 */
	@RequestMapping(value = "/mypage/dashboard", method = RequestMethod.GET)
	public String dashBoard(HttpSession session, Model model) {
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		Member member = (Member)session.getAttribute("loginMember");
		model.addAttribute("dashboardCount", mainHostingMypageService.getMypageHeaderCount(member.getMemberNo()));
		return "mypage/dashboard";
	}
	
	//네비 메세지 카운트
	@ModelAttribute("newMessage")
	public MypageHeaderCount newMessage(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		return mainHostingMypageService.getMypageHeaderCount(member.getMemberNo());
	}

	
	
	/*
	//숙소관리
	 */
	@RequestMapping(value = "/mypage/listings", method = RequestMethod.GET)
	public String listings(@RequestParam int hostingState, Model model, HttpSession session) {
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		model.addAttribute("hostingState", hostingState);
		return "mypage/listings";
	}
	
	//숙소관리를 위한 디스플레이
	@RequestMapping(value = "mypage/hostingList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> hostingList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, @RequestParam String orderby, @RequestParam int hostingState) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("hostingState", hostingState);
		countMap.put("hostingMemberNo", member.getMemberNo());
		
		int totalhosting = mainHostingMypageService.getMypageHostingCount(countMap);
		
		int pageSize = 5; 
		int blockSize = 5; 
		
		Pager pager = new Pager(pageNum, totalhosting, pageSize, blockSize);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("hostingState", hostingState);
		pagerMap.put("hostingMemberNo", member.getMemberNo());
		pagerMap.put("order", orderby);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("hostingList", mainHostingMypageService.getMypageHostingList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	//호스팅 상태값 변경
	@Transactional
	@RequestMapping(value = "mypage/modifyHosting", method = {RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String modifyHosting(@RequestBody Hosting hosting) {
		mainHostingMypageService.modifyMypageHosting(hosting);
		return "success";
	}
	
	
	
	/*
	//북마크
	 */
	@RequestMapping(value = "/mypage/bookmarks", method = RequestMethod.GET)
	public String bookmarks(HttpSession session) {
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		/* 테스트
		Member member = (Member)session.getAttribute("loginMember");
		System.out.println(mainHostingMypageService.getBookmarkCount(member.getMemberNo()));
		 */
		return "mypage/bookmarks";
	}
	
	//북마크를 디스플레이 하기 위한 메소드
	@RequestMapping(value = "mypage/bookmarkList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> bookmarkList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, String orderby) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		int totalBookmark = mainHostingMypageService.getBookmarkCount(member.getMemberNo());
		
		int pageSize = 5; 
		int blockSize = 5; 
		
		Pager pager = new Pager(pageNum, totalBookmark, pageSize, blockSize);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("orderby", orderby);
		pagerMap.put("LoginMemberNo", member.getMemberNo());
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("bookmarkList", mainHostingMypageService.getBookmarkList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	//리저베이션 상태값 변경
	@Transactional
	@RequestMapping(value = "mypage/modifyReservationState", method = {RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String cansel(@RequestBody Reservation reservation) {
		mainHostingMypageService.modifyReservationState(reservation);
		return "success";
	}
	
	@RequestMapping(value = "/invoice", method = RequestMethod.GET)
	public String invoice(@RequestParam int reservationNo, Model model, HttpSession session) {
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		model.addAttribute("invoice", mainHostingMypageService.getInvoice(reservationNo));
		return "invoice";
	}
	
	
	
	/*
	//마이페이지 메세지 페이지
	 */
	@RequestMapping(value = "/mypage/messages", method = RequestMethod.GET)
	public String messages(HttpSession session) {
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		return "mypage/messages";
	}
	
	//마이페이지 메세지 디스플레이
	@RequestMapping(value = "mypage/messageList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> messageList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, @RequestParam int orderby) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("messageReceiverNo", member.getMemberNo());
		countMap.put("messageState", orderby);
		
		int totalMessage = MainMessageService.getMessageMypageCount(countMap);
		int pageSize = 5; 
		int blockSize = 5; 
		
		Pager pager = new Pager(pageNum, totalMessage, pageSize, blockSize);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("messageState", orderby);
		pagerMap.put("messageReceiverNo", member.getMemberNo());
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("messageList", MainMessageService.getMessageMypageList(pagerMap));
		returnMap.put("pager", pager);
		
		MainMessageService.updateMessageList(member.getMemberNo());
		MainMessageService.updateNoticeList(member.getMemberNo());
		
		return returnMap;
	}
	
	
	
	/*
	//게스트 리뷰 페이지
	 */
	@RequestMapping(value = "/mypage/reviews", method = RequestMethod.GET)
	public String ReviewProfile(HttpSession session, Model model, @RequestParam int memberNo) {
		if (session.getAttribute("loginMember") == null) {
			return "main/loginPage";
		}
		
		model.addAttribute("member", mainHostingMypageService.getMypageMember(memberNo));
	
		return "mypage/reviews";
	}
	
	//마이페이지 게스트 신고 전송
	@Transactional
	@RequestMapping(value = "/sendGuestClaim", method = RequestMethod.POST)
	@ResponseBody
	public String sendGuestClaim(@RequestBody Claim claim) {
		MainMessageService.addClaimGuest(claim);
		return "success";
	}
	
	
	//게스트 리뷰를 디스플레이 하기 위한 메소드
	@RequestMapping(value = "mypage/guestReviewList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> guestReviewList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, @RequestParam int memberNo) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		int totalGuestReview = mainHostingMypageService.getReviewGuestCount(memberNo);
		
		int pageSize = 5; 
		int blockSize = 5; 
		
		Pager pager = new Pager(pageNum, totalGuestReview, pageSize, blockSize);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("reviewMemberNo", memberNo);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reviewList", mainHostingMypageService.getReviewGuestList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	//마이페이지 게스트 리뷰에서 댓글리뷰 작성
	@Transactional
	@RequestMapping(value = "/reWriteGuestReview", method = RequestMethod.POST)
	@ResponseBody
	public String reWriteGuestReview(@RequestBody Review review) {
		MainMessageService.addReviewReGuest(review);
		return "success";
	}
}
