package site.yolowa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.resource.HttpResource;

import site.yolowa.dao.BoardDAO;
import site.yolowa.dto.Board;
import site.yolowa.dto.BoardCommentReview;
import site.yolowa.dto.Claim;
import site.yolowa.dto.MainMessage;
import site.yolowa.dto.MainMessageCount;
import site.yolowa.dto.Member;
import site.yolowa.dto.Review;
import site.yolowa.exception.AjaxException;
import site.yolowa.exception.MemberInfoNotFoundException;
import site.yolowa.service.MainCommentService;
import site.yolowa.service.MainHelpBoardService;
import site.yolowa.service.MainMessageService;
import site.yolowa.utils.Pager;

@Controller
public class MainCommentController {
	
	@Autowired
	private MainCommentService mainCommentService;
	
	@Autowired
	private MainHelpBoardService mainHelpBoardService;
	
	@Autowired
	private MainMessageService mainMessageService;
	
	@RequestMapping(value="/blog", method = RequestMethod.GET)
	public String board(@RequestParam Map<String, Object> map, Model model, HttpServletRequest request) {
		int pageNum = map.get("pageNum")==null?1:Integer.parseInt((String)map.get("pageNum"));
		
		String keyword = (String)map.get("keyword");
		if(keyword == null || keyword.equals("")) {
			keyword = "";
		}
		
		int category = (map.get("category")==null || map.get("category")=="")?-1:Integer.parseInt((String)map.get("category"));
		
		Map<String, Object> filter = new HashMap<String, Object>();
		filter.put("keyword", keyword);
		if(category != -1) {
			filter.put("inputValue", category);
		}
		
		int totalBoard=mainCommentService.getSelectCommentCount(filter);
		
		int pageSize = 4;//페이지에 출력될 게시글의 갯수 저장
		int blockSize = 5;//페이지 블럭에 출력될 페이지의 갯수 저장
		
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		model.addAttribute("pager", pager);
		// commentList : List<BoardComment> : 사이즈 : 4
		
		filter.put("pageNum", pager.getPageNum());
		model.addAttribute("commentList", mainCommentService.getSearchCommentList(filter));
		
		model.addAttribute("map", map);
		model.addAttribute("categoryCount", mainCommentService.getCommentCategoryCount(keyword));
		
		
		//쿠키 처리
		Cookie[] cookies = request.getCookies();
		Cookie commentCookie = null;
		String commentCookieValue = "0-0-0";
		List<String> cookieValueList = new ArrayList<String>();
		
		if (cookies != null) {
			 for (Cookie cookie : cookies) {
	            if(cookie.getName().equals("comment")) {
	            	commentCookie = cookie;
	            }
			 }
	     }
		
		if(commentCookie != null) {
			commentCookieValue = commentCookie.getValue(); 
		 }
		
		for(String ccv : commentCookieValue.split("-")) {
			cookieValueList.add(ccv);
		 }
		
		 model.addAttribute("cookieBoardList", mainCommentService.getCookieBoard(cookieValueList));
		return "main/blog";
	}
	
	@RequestMapping(value="/blog/detail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam Map<String, Object> map, Model model, HttpServletResponse response, HttpServletRequest request) {
		
		// view count 추가
		Board board = new Board();
		int boardNo = Integer.parseInt((String)map.get("boardNo"));
		board.setBoardNo(boardNo);
		mainHelpBoardService.modifyHelpBoardView(board);
		
		String keyword = (String)map.get("keyword");
		if(keyword == null || keyword.equals("")) {
			keyword = "";
		}
		
		int category = (map.get("category")==null || map.get("category")=="")?0:Integer.parseInt((String)map.get("category"));
		
		model.addAttribute("categoryCount", mainCommentService.getCommentCategoryCount(keyword));
		model.addAttribute("map", map);
		model.addAttribute("boardComment", mainCommentService.getDetailComment(Integer.parseInt((String)map.get("boardNo"))));
		
		
		//
		// cookie 형식 : boardNo1-boardNo2-boardNo1
	Cookie commentCookie = null;
	String commentCookieValue = "0-0-0";
	// 쿠키에 실제로 저장될 문자열
	List<String> cookieValueList = new ArrayList<String>();
	
	response.setContentType("text/plain;charset=UTF-8");
	Cookie[] cookies = request.getCookies();
	
	 if (cookies != null) {
		 for (Cookie cookie : cookies) {
            if(cookie.getName().equals("comment")) {
            	commentCookie = cookie;
            }
		 }
     }
	 
	 if(commentCookie != null) {
		commentCookieValue = commentCookie.getValue(); 
	 }
	 
	 cookieValueList.add(boardNo+"");
	 int cookieCount = 0;
	 for(String ccv : commentCookieValue.split("-")) {
		 if(!ccv.equals(boardNo+"")) {
			 cookieValueList.add(ccv);
		 }else {
			 cookieCount++;
		 }
	 }
	 for(int i=0; i<cookieCount; i++) {
		 cookieValueList.add(0+"");
	 }
	 
	 commentCookieValue = "";
	 for(int i = 0; i<cookieValueList.size(); i++) {
		 commentCookieValue += cookieValueList.get(i);
		 if(i>=2) break;
		 commentCookieValue += "-";
	 }
	 
	 commentCookie = new Cookie("comment", commentCookieValue);
	 response.addCookie(commentCookie);
	 //여기까지 쿠키 저장완료
	 
	 // 여기서부터 쿠키 출력
	 cookieValueList.clear();
	 for(String ccv : commentCookieValue.split("-")) {
		 cookieValueList.add(ccv); 
	 }
	 
	 model.addAttribute("cookieBoardList", mainCommentService.getCookieBoard(cookieValueList));
		return "main/blog-post";
	}
	
	
	@RequestMapping(value="/rest/comment/review", method = RequestMethod.POST)
	@ResponseBody
	public int boardDetail(@RequestBody Review review, HttpServletRequest request) throws AjaxException {
		if(review.getReviewContent().equals("")) {
			return 0; 
		}
		HttpSession s = request.getSession();
		Member loginMember = ((Member)s.getAttribute("loginMember"));
		if(loginMember == null) throw new AjaxException(1, "로그인 후 이용바랍니다.");
		review.setReviewWriterNo(loginMember.getMemberNo());
		
		return mainCommentService.addCommentReivew(review); 
	}
	
	@RequestMapping(value="/rest/comment/review/{boardNo}", method = RequestMethod.GET)
	@ResponseBody
	public List<BoardCommentReview> boardDetail(@PathVariable("boardNo") int boardNo) {
		return mainCommentService.getDetailCommentReview(boardNo); 
	}
	
	@RequestMapping(value="/rest/comment/claim", method = RequestMethod.POST)
	@ResponseBody
	public int boardClaim(@RequestBody Claim claim, HttpServletRequest request) throws AjaxException {
		HttpSession s = request.getSession();
		Member loginMember = ((Member)s.getAttribute("loginMember"));
		if(loginMember == null) throw new AjaxException(1, "로그인 후 이용바랍니다.");
		claim.setClaimApplicantNo(loginMember.getMemberNo());
		
		return mainCommentService.addClaimComment(claim); 
	}
	
	
	/*
	public Map<String, Object> boardList(@RequestParam(defaultValue = "1")int pageNum) {
		//Board 테이블에 저장된 게시글의 갯수를 반환받아 저장
		//int totalBoard=mainCommentService.getSelectCommentCount();
		
		int pageSize=4;
		int blockSize=5;
		
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//Service 클래스의 메소드를 호출하기 위해 매개변수에 전달될 Map 객체 생성
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		
		//요청처리 메소드의 반환값으로 사용될 Map 객체 생성
		//=> 응답결과를 Map 객체의 엔트리(Entry)로 저장하여 반환
		Map<String, Object> returnMap=new HashMap<String, Object>();
		//returnMap.put("commentList", mainCommentService.selectCommentList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	*/
	
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
}