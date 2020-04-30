package site.yolowa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import site.yolowa.dto.Board;
import site.yolowa.dto.Claim;
import site.yolowa.dto.MainMessage;
import site.yolowa.dto.MainMessageCount;
import site.yolowa.dto.MainReview;
import site.yolowa.dto.MainReviewStarCount;
import site.yolowa.dto.Member;
import site.yolowa.dto.Message;
import site.yolowa.dto.Reservation;
import site.yolowa.dto.Review;
import site.yolowa.dto.Wishlist;
import site.yolowa.exception.MemberAdminNotFoundException;
import site.yolowa.exception.MemberInfoNotFoundException;
import site.yolowa.service.MainCommentService;
import site.yolowa.service.MainHostingService;
import site.yolowa.service.MainMessageService;
import site.yolowa.service.MainServiceTermsService;
import site.yolowa.service.WishlistService;
import site.yolowa.utils.AdminUtil;

//호스팅과 관련된 검색, 상세, 리뷰 컨트롤러
@Controller
public class MainServiceController {
	@Autowired
	AdminUtil adminUtil;
	

	@Autowired
	private MainHostingService mainHostingService;
	
	@Autowired
	private MainMessageService mainMessageService;
	
	@Autowired
	private MainServiceTermsService mainServiceTermsService;
	
	@Autowired
	private MainCommentService mainCommentService;
		
	
	@Autowired
	private WishlistService wishlistService;
	/*
	 * 메인페이지
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request) {
		model.addAttribute("searchIndexSuperhost", mainHostingService.HostingSearchSuperhost());
		model.addAttribute("searchIndexLately", mainHostingService.HostingSearchIndexLately());
		model.addAttribute("searchIndexFamous", mainHostingService.HostingSearchFamous());
		model.addAttribute("searchCounting", mainHostingService.HostingSearchCounting());
		model.addAttribute("commentList4", mainCommentService.getCommentOrderDate4());
		
		return "main";
	}
	
	/*
	 * 이용 약관 페이지
	 */
	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	public String terms(Board board, Model model) {
		board.setBoardCategory(1);

		model.addAttribute("terms", mainServiceTermsService.getMainServiceTerms(board));
		return "main/terms";
	}
	
	/*
	 * 개인정보 처리방침 페이지
	 */
	@RequestMapping(value = "/personal", method = RequestMethod.GET)
	public String personal(Board board, Model model) {
		board.setBoardCategory(2);
		
		model.addAttribute("personal", mainServiceTermsService.getMainServiceTerms(board));
		return "main/personal";
	}
	
	/*
	 * 위치기반서비스 이용약관 페이지
	 */
	@RequestMapping(value = "/locationTerms", method = RequestMethod.GET)
	public String locationTerms(Board board, Model model) {
		board.setBoardCategory(3);
	
		model.addAttribute("locationTerms", mainServiceTermsService.getMainServiceTerms(board));
		return "main/locationTerms";
	}
	
	
	/*
	//그리드 서치
	@RequestMapping(value = "/gridsearch", method = RequestMethod.GET)
	public String gridSearch(@RequestParam(required = false) int qtyInput, Model model) {
		model.addAttribute("qtyInput", qtyInput);
		return "main/hosting-grid-search";
	}
	
	//그리드 서치 디스플레이
	@RequestMapping(value = "/gridsearchDisplay", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> hostingList(@RequestParam(defaultValue = "6") Integer endRow, 
			@RequestParam Integer hostingPriceMin, @RequestParam Integer hostingPriceMax, @RequestParam String starAvgFive, @RequestParam String starAvgFour,
			@RequestParam String starAvgThree, @RequestParam String categoryFour, @RequestParam String categoryThree, @RequestParam String categoryTwo, @RequestParam String categoryOne,
			@RequestParam Integer hostingPerson, @RequestParam String hostingAddress, @RequestParam String hostingName, @RequestParam Integer hostingPrivate, @RequestParam Integer hostingBed,
			@RequestParam Integer hostingRoom, @RequestParam Integer hostingBathroom, @RequestParam String hostingRule, @RequestParam String hostingAmenities, @RequestParam String hostingFacilities,
			@RequestParam String hostingSafety) {
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", 1);
		pagerMap.put("endRow", endRow);
		pagerMap.put("hostingPriceMin", hostingPriceMin);
		pagerMap.put("hostingPriceMax", hostingPriceMax);
		pagerMap.put("starAvgFive", starAvgFive);
		pagerMap.put("starAvgFour", starAvgFour);
		pagerMap.put("starAvgThree", starAvgThree);
		pagerMap.put("categoryFour", categoryFour);
		pagerMap.put("categoryThree", categoryThree);
		pagerMap.put("categoryTwo", categoryTwo);
		pagerMap.put("categoryOne", categoryOne);
		pagerMap.put("hostingPerson", hostingPerson);
		pagerMap.put("hostingAddress", hostingAddress);
		pagerMap.put("hostingName", hostingName);
		pagerMap.put("hostingPrivate", hostingPrivate);
		pagerMap.put("hostingBed", hostingBed);
		pagerMap.put("hostingRoom", hostingRoom);
		pagerMap.put("hostingBathroom", hostingBathroom);
		pagerMap.put("hostingRule", hostingRule);
		pagerMap.put("hostingAmenities", hostingAmenities);
		pagerMap.put("hostingFacilities", hostingFacilities);
		pagerMap.put("hostingSafety", hostingSafety);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("hostingList", mainHostingService.getMainHostingList(pagerMap));
		
		return returnMap;
	}
	*/
	//리스트 서치
	@RequestMapping(value = "/listsearch", method = RequestMethod.GET)
	public String listSearch(@RequestParam(required = false) Integer qtyInput, @RequestParam(required = false) String hostAddress, 
			@RequestParam(required = false) String dates, Model model) {
		model.addAttribute("qtyInput", qtyInput);
		model.addAttribute("hostAddress", hostAddress);
		model.addAttribute("dates", dates);
		return "main/hosting-list-search";
	}
	
	//그리드 서치 디스플레이
	@RequestMapping(value = "/listsearchDisplay", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> hostingList(@RequestParam(defaultValue = "6") Integer endRow, 
			@RequestParam(required = false) String hostAddress) {
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", 1);
		pagerMap.put("endRow", endRow);
		pagerMap.put("hostAddress", hostAddress);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("hostingList", mainHostingService.getMainHostingList(pagerMap));
		
		return returnMap;
	}
	
	
	
	/*
	 * 회사 소개 페이지
	 */
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "main/about";
	}
	
	
	
	/*
	 * 숙소 예약 1단계
	 */
	@RequestMapping(value = "/order1", method = RequestMethod.POST)
	public String order1(@ModelAttribute Reservation reservation) {
		return "main/order-1";
	}
	
	//숙소 예약 2단계
	@Transactional
	@RequestMapping(value = "/order2", method = RequestMethod.POST)
	public String order2(@ModelAttribute Reservation reservation) {
		mainHostingService.addReservation(reservation);
		return "main/order-2";
	}
	
	/*
	 * 체험 페이지 (디자인 - 준비중인 페이지로 보낼 예정)
	 */
	@RequestMapping(value = "/adventure", method = RequestMethod.GET)
	public String adventure() {
		
		return "main/commingSoon";
	}
	
	
	/*
	 * 푸터 contacts 
	 */
	@RequestMapping(value = "/contacts", method = RequestMethod.GET)
	public String contacts(@RequestParam Map<String, String> input) {
		return "main/contacts";
	}
	
	//문의하기 메일 보내기
	@Transactional
	@RequestMapping(value = "/contacts", method = RequestMethod.POST)
	public String contactsSendEmail(@RequestParam Map<String, String> input, Model model) throws MessagingException {
		String tomail = "yolowa2020@gmail.com";
		String senderName = input.get("senderName");
		String senderEmail = input.get("senderEmail");
		String senderPhone1 = input.get("senderPhone1");
		String senderPhone2 = input.get("senderPhone2");
		String senderPhone3 = input.get("senderPhone3");
		String title = input.get("title");
		String content = input.get("content");
		
		
		System.out.println("to>>"+ tomail);
		System.out.println("title>>"+ "[문의] "+title+" (이름 : "+senderName+", 이메일 : "+senderEmail+", 전화번호 : "+senderPhone1+" - "+senderPhone2+" - "+senderPhone3+")");
		System.out.println("content>>"+ content);
		adminUtil.sendEmail(tomail, "[문의] "+title+" (이름 : "+senderName+", 이메일 : "+senderEmail+", 전화번호 : "+senderPhone1+" - "+senderPhone2+" - "+senderPhone3+")", content);
		
		model.addAttribute("messageTitle", "알림 메시지");
		model.addAttribute("messageContent", "메일 발송을 성공적으로 완료했습니다.");
		
		return "main/contacts"; 
	}

	
	/*
	 * 메인 페이지의 헤더 공지사항 결과를 반환하기 위한 메소드
	 */
	@ModelAttribute("headerNotice")
	public List<MainMessage> getNoticeHeaderList(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		return mainMessageService.getMessageNoticeList(member.getMemberNo());
	}
	
	//메인 페이지의 헤더 메세지 결과를 반환하기 위한 메소드
	@ModelAttribute("headerMessage")
	public List<MainMessage> getMessageHeaderList(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		return mainMessageService.getMessageHeaderList(member.getMemberNo());
	}
	
	//메인 페이지의 새로 도착한 메세지 카운팅
	@ModelAttribute("headerMessageCount")
	public MainMessageCount getMessageHeaderCount(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return null;
		}
		Member member = (Member)session.getAttribute("loginMember");
		return mainMessageService.getCountingMessageHeader(member.getMemberNo());
	}
	
	
	
	/*
	 * 호스팅 디테일
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam String hostingNo, @RequestParam(defaultValue = "") String dates, 
			@RequestParam(defaultValue = "1") int qtyInput, Model model, HttpSession session) {
		
		model.addAttribute("qtyInput", qtyInput);
		model.addAttribute("dates", dates);
		model.addAttribute("hostingDetail", mainHostingService.selectMainHostingDetail(Integer.parseInt(hostingNo)));
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			Wishlist wish = new Wishlist(); 
			wish.setWishlistHostingNo(Integer.parseInt(hostingNo));
			wish.setWishlistMemberNo(loginMember.getMemberNo());
			
			Wishlist wishlist = wishlistService.getMainWishlistSave(wish); 
			
			if(wishlist != null) {
				model.addAttribute("wishlist", wishlist);
			}
		}
		return "main/hosting-detail";
	}
	
	//호스팅 디테일 유저 -> 호스트에게 문의 메세지
	@Transactional
	@RequestMapping(value = "/sendHostMessage", method = RequestMethod.POST)
	@ResponseBody
	public String sendHostMessage(@RequestBody Message message) {
		mainMessageService.addMessage(message);
		return "success";
	}
	
	//메인 디테일에서 신고 전송
	@Transactional
	@RequestMapping(value = "/sendClaimMessage", method = RequestMethod.POST)
	@ResponseBody
	public String sendClaimMessage(@RequestBody Claim claim) {
		mainMessageService.addClaim(claim);
		return "success";
	}
	
	//메인 디테일 페이지에서 리뷰 작성
	@Transactional
	@RequestMapping(value = "/writeHostReview", method = RequestMethod.POST)
	@ResponseBody
	public String writeHostReview(@RequestBody Review review) {
		mainMessageService.addReviewDetail(review);
		return "success";
	}
	
	//메인 디테일 페이지 리뷰 디스플레이
	@RequestMapping(value = "/detailReviewDisplay", method = RequestMethod.GET)
	@ResponseBody
	public List<MainReview> detailReviewDisplay(@RequestParam int hostingNo, @RequestParam(defaultValue = "2") int endRow) {
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("hostingNo", hostingNo);
		pagerMap.put("startRow", 1);
		pagerMap.put("endRow", endRow);
		
		return mainMessageService.getReviewDetailList(pagerMap);
	}
	
	//메인 디테일 페이지 스타 카운팅
	@RequestMapping(value = "/detailStarCount", method = RequestMethod.GET)
	@ResponseBody
	public MainReviewStarCount detailStarCount(@RequestParam int hostingNo) {
		return mainMessageService.getReviewStarCount(hostingNo);
	}
	
	
}
