package site.yolowa.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import site.yolowa.dto.Board;
import site.yolowa.dto.Member;
import site.yolowa.dto.Sns;
import site.yolowa.exception.AjaxException;
import site.yolowa.exception.MemberInfoNotFoundException;
import site.yolowa.service.AdminEtcService;
import site.yolowa.utils.AdminUtil;

@Controller
public class AdminEtcController implements ApplicationContextAware{
	
	private Logger logger=LoggerFactory.getLogger(AdminEtcController.class);
	private Integer adminTableDefaultRowCount = 300;
	
	@Autowired
	AdminUtil adminUtil;
	
	//yyyy년 MM월 dd일 hh:mm:ss
	@Autowired
	@Qualifier("AdminTableNowDateFormat")
	private SimpleDateFormat adminTableNowDateFormat;
	
	@Autowired
	@Qualifier("jacksonMapper")
	private ObjectMapper jacksonmapper;
	
	@Autowired
	private AdminEtcService adminEtcService;
	
	private WebApplicationContext context;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		context=(WebApplicationContext)applicationContext;
	}
	
	@RequestMapping(value = "/admin/etc/advertise", method = RequestMethod.GET)
	public String adminEtcAdvertise() throws Exception {
		//throw new Exception();
		return "admin/etc/advertise";
	}
	
	//게시판 등록 / 수정
	// 이미지 들어가야 함.
	@RequestMapping(value = "/admin/etc/board", method = RequestMethod.POST)
	public String addAdminEtcNotice(@ModelAttribute Board board, HttpSession session) throws IllegalStateException, IOException, MemberInfoNotFoundException {
		if(!board.getBoardImageFile().isEmpty()) {
			String uploadDirPath = context.getServletContext().getRealPath("/resources/img/board");
			if(!board.getBoardImageFile().getContentType().split("/")[0].equals("image")) {
				// 이미지 형식이 잘못들어왔을 경우 예외처리
			}
			// 이름설정
			String uploadFileName = System.currentTimeMillis()+"";
			
			board.getBoardImageFile().transferTo(new File(uploadDirPath, uploadFileName));
			board.setBoardImage(uploadFileName);
		}else {
			board.setBoardImage(null);
		}
		
		try {
			board.setBoardType(1);
			Member loginMember = ((Member)session.getAttribute("loginMember"));
			if(loginMember == null) throw new MemberInfoNotFoundException("로그인 후 이용 바랍니다.");
			board.setBoardWriterNo(loginMember.getMemberNo());
			//
			adminEtcService.addAdminBoardNotice(board);
			
		} catch (RuntimeException e) {
			return "admin/etc/board";
		}
		
		return "redirect:board";
	}
	
	
	//게시 상태 변경 (1: 게시중 / 0 : 게시중지)
	/*
	@RequestMapping(value = "/admin/etc/board_stateModify", method={RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String modifyAdminBoardNotice(@RequestBody Board board) {
		adminEtcService.modifyAdminBoardNoticeState(board);
		return "success";
	}
	*/
	
	
	//게시판 테이블 관련 Controller
	@RequestMapping(value = "/admin/etc/board", method = RequestMethod.GET)
	public String adminEtcBoard(@RequestParam Map<String, Object> filter, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 필터세팅
		// 받을 필터가 없을 경우를 확인. 필터내 객체가 없을 경우
		if(filter.entrySet().size() != 0) {
			// 필터를 위한 기본 세팅
			
			List<String> titles = new ArrayList<String>();
			List<String> writers = new ArrayList<String>();
			
			List<Integer> states = new ArrayList<Integer>();
			
			// 범위 검색을 위해 반환
			int keywordCount = (String)filter.get("keywordCount")==""?0:Integer.parseInt((String)filter.get("keywordCount"));
			
			// 키워드 검색
			for(int i=1; i<=keywordCount; i++) {
				String keywordFormat = (String)filter.get("keywordFormat"+i);
				// 선택된 필터정보를 리스트에 추가
				if(keywordFormat != null) {
					switch (keywordFormat) {
					case "title":
						titles.add((String)filter.get("keywordValue"+i));
						break;
					case "writer":
						writers.add((String)filter.get("keywordValue"+i));
						break;
					}
				}
			}
			
			// 게시판 게시 상태 필터 추가
			if((String)filter.get("statePost") != null){
				states.add(((String)filter.get("statePost")).equals("")?10:Integer.parseInt((String)filter.get("statePost")));
			}
			if((String)filter.get("stateStop") != null){
				states.add(((String)filter.get("stateStop")).equals("")?10:Integer.parseInt((String)filter.get("stateStop")));
			}
			
			// 필터에서 받은 검색정보를 맵에 저장
			map.put("category", filter.get("category"));
			
			map.put("titles", titles);
			map.put("writers", writers);
			
			map.put("states", states);
			
			map.put("count", Integer.parseInt((String)filter.get("searchRow")));
			
			// 맵을 이용하여 검색
			model.addAttribute("boardTableList", adminEtcService.getAdminEtcNotice(map));
		}else {
			// filter가 적용되지 않을 경우
			map.put("filter", "off");
			map.put("count", adminTableDefaultRowCount);
			model.addAttribute("boardTableList", adminEtcService.getAdminEtcNotice(map));
		}
		
		
		// 업데이트 시간을 반환
		model.addAttribute("changeDate", adminTableNowDateFormat.format(new Date()));
		// 요청 필터정보를 반환
		try {
			model.addAttribute("filter", jacksonmapper.writeValueAsString(filter));
		} catch (JsonProcessingException e) {
			// pasting error
			logger.info("!!! jacksonParsing Exception !!!");
		}
		//
		
		return "admin/etc/board";
	}
	
	@RequestMapping(value = "/admin/etc/board/{boardNo}", method = RequestMethod.POST)
	@ResponseBody
	public Board adminEtcBoard(@PathVariable("boardNo") int boardNo) {
		return adminEtcService.getBoardNo(boardNo);
	}
	
	@RequestMapping(value = "/admin/etc/board/match", method = RequestMethod.POST)
	@ResponseBody
	public Board adminEtcBoardEqual(@RequestBody Board board) {
		return adminEtcService.getBoardCategoryTitleEqual(board);
	}
	
	@RequestMapping(value = "/admin/etc/board/match/like", method = RequestMethod.POST)
	@ResponseBody
	public List<Board> adminEtcBoardLike(@RequestBody Board board) {
		return adminEtcService.getBoardCategoryTitleLike(board);
	}
	
	
	//도움말 등록 /수정
	@RequestMapping(value = "/admin/etc/help", method = RequestMethod.POST)
	public String addAdminEtcHelp(@ModelAttribute Board board, HttpSession session) throws MemberInfoNotFoundException {
		try {
			board.setBoardType(2);
			Member loginMember = ((Member)session.getAttribute("loginMember"));
			if(loginMember == null) throw new MemberInfoNotFoundException("로그인 후 이용 바랍니다.");
			board.setBoardWriterNo(loginMember.getMemberNo());
			
			adminEtcService.addAdminBoardHelp(board);
			
			System.out.println(board.toString());
		} catch (RuntimeException e) {
			System.out.println("error = " + e);
			System.out.println(board.toString());
			return "admin/etc/help";
		}
		
		return "redirect:help";
	}
	
	@RequestMapping(value = "/admin/etc/help", method = RequestMethod.GET)
	public String adminEtcHelp(@RequestParam Map<String, Object> filter, Model model) {
		//
		Map<String, Object> map = new HashMap<String, Object>();
		// 필터세팅
		// 받을 필터가 없을 경우를 확인. 필터내 객체가 없을 경우
		if(filter.entrySet().size() != 0) {
			// 필터를 위한 기본 세팅
			
			List<String> titles = new ArrayList<String>();
			List<String> writers = new ArrayList<String>();
			
			List<Integer> states = new ArrayList<Integer>();
			
			// 범위 검색을 위해 반환
			int keywordCount = (String)filter.get("keywordCount")==""?0:Integer.parseInt((String)filter.get("keywordCount"));
			
						
			// 키워드 검색
			for(int i=1; i<=keywordCount; i++) {
				String keywordFormat = (String)filter.get("keywordFormat"+i);
				// 선택된 필터정보를 리스트에 추가
				if(keywordFormat != null) {
					switch (keywordFormat) {
					case "title":
						titles.add((String)filter.get("keywordValue"+i));
						break;
					case "writer":
						writers.add((String)filter.get("keywordValue"+i));
						break;
					}
				}
			}
			
			// 게시판 게시 상태 필터 추가
			if((String)filter.get("statePost") != null){
				states.add(((String)filter.get("statePost")).equals("")?10:Integer.parseInt((String)filter.get("statePost")));
			}
			if((String)filter.get("stateStop") != null){
				states.add(((String)filter.get("stateStop")).equals("")?10:Integer.parseInt((String)filter.get("stateStop")));
			}
			
			// 필터에서 받은 검색정보를 맵에 저장
			map.put("category", filter.get("category"));
			
			map.put("titles", titles);
			map.put("writers", writers);
			
			map.put("states", states);
			
			map.put("count", Integer.parseInt((String)filter.get("searchRow")));
			
			// 맵을 이용하여 검색
			model.addAttribute("boardTableList", adminEtcService.getAdminEtcHelp(map));
		}else {
			// filter가 적용되지 않을 경우
			map.put("filter", "off");
			map.put("count", adminTableDefaultRowCount);
			model.addAttribute("boardTableList", adminEtcService.getAdminEtcHelp(map));
		}
		
		
		// 업데이트 시간을 반환
		model.addAttribute("changeDate", adminTableNowDateFormat.format(new Date()));
		// 요청 필터정보를 반환
		try {
			model.addAttribute("filter", jacksonmapper.writeValueAsString(filter));
		} catch (JsonProcessingException e) {
			// pasting error
			logger.info("!!! jacksonParsing Exception !!!");
		}
		//
		
		
		return "admin/etc/help";
	}
	
	
	@RequestMapping(value = "/admin/etc/help/{boardNo}", method = RequestMethod.POST)
	@ResponseBody
	public Board adminEtcBoardHelp(@PathVariable("boardNo") int boardNo) {
		return adminEtcService.getBoardNo(boardNo);
	}
	
	@RequestMapping(value = "/admin/etc/help/match", method = RequestMethod.POST)
	@ResponseBody
	public Board adminEtcBoardHelpEqual(@RequestBody Board board) {
		return adminEtcService.getBoardHelpCategoryTitleEqual(board);
	}
	
	@RequestMapping(value = "/admin/etc/help/match/like", method = RequestMethod.POST)
	@ResponseBody
	public List<Board> adminEtcBoardHelpLike(@RequestBody Board board) {
		return adminEtcService.getBoardHelpCategoryTitleLike(board);
	}
	
	@RequestMapping(value = "/admin/etc/sns", method = RequestMethod.GET)
	public String adminEtcSns() {
		return "admin/etc/sns";
	}
	
	@RequestMapping(value = "/admin/etc/sns/data", method = RequestMethod.GET)
	@ResponseBody
	public Sns adminRestEtcSns(HttpServletRequest request) {
		try {
			return adminEtcService.getAdminSns(request);
		} catch (IOException e) {
			return null;
		}
	}
	
	@RequestMapping(value = "/admin/etc/sns/data", method = RequestMethod.POST)
	@ResponseBody
	public boolean adminRestEtcSns(@RequestBody(required = true) Sns sns, HttpServletRequest request) {
		try {
			return adminEtcService.modifySns(sns, request);
		} catch (IOException e) {
			return false;
		}
	}
	
	
	//약관 등록 /수정
	@Transactional
	@RequestMapping(value = "/admin/etc/terms", method = RequestMethod.POST)
	@ResponseBody
	public int addAdminEtcTerms(@RequestBody Board board, HttpSession session) throws MemberInfoNotFoundException {
		try {
			board.setBoardType(3);
			Member loginMember = ((Member)session.getAttribute("loginMember"));
			if(loginMember == null) throw new MemberInfoNotFoundException("로그인 후 이용 바랍니다.");
			board.setBoardWriterNo(loginMember.getMemberNo());
			return adminEtcService.addAdminBoardTerms(board);
			
		} catch (RuntimeException e) {
			System.out.println("error = " + e);
			return 0;
		}
	}
	
	@RequestMapping(value = "/admin/etc/terms", method = RequestMethod.GET)
	public String adminEtcTerms() {
		
		return "admin/etc/terms";
	}	
	
	@RequestMapping(value = "/admin/etc/terms/match", method = RequestMethod.POST)
	@ResponseBody
	public Board adminEtcTermsEqual(@RequestBody Board board) {
		return adminEtcService.getBoardTermsCategoryEqual(board);
	}
	
	/*
	 * @RequestMapping(value = "/admin/etc/board/state", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public int modifyAdminBoardState(@RequestBody Board board) {
	 * return adminEtcService.modifyAdminBoardState(board); }
	 */
	
	@RequestMapping(value = "/rest/admin/etc/board/state", method = RequestMethod.POST)
	@ResponseBody
	public int adminBoardUpdateState(@RequestBody Board board) {
		int rows = adminEtcService.modifyAdminBoardState(board);
		return rows;
	}
	
	@RequestMapping(value = "/rest/admin/etc/board/state/all", method = RequestMethod.POST)
	@ResponseBody
	public int adminBoardUpdateState(@RequestBody List<Board> boardList) {
		int rows = adminEtcService.modifyAdminBoardState(boardList);
		return rows;
	}
	
	@RequestMapping(value = "/rest/admin/etc/help/state", method = RequestMethod.POST)
	@ResponseBody
	public int adminHelpUpdateState(@RequestBody Board board) {
		int rows = adminEtcService.modifyAdminBoardState(board);
		return rows;
	}
	
	@RequestMapping(value = "/rest/admin/etc/help/state/all", method = RequestMethod.POST)
	@ResponseBody
	public int adminHelpUpdateState(@RequestBody List<Board> boardList) {
		int rows = adminEtcService.modifyAdminBoardState(boardList);
		return rows;
	}
	
	
	@RequestMapping(value = "/admin/etc/advertise", method = RequestMethod.POST)
	public String adminSendEmail(@RequestParam Map<String, String> input, Model model) throws MessagingException {
		System.out.println("입력된 값" + input);
		String title = input.get("title");
		String content = input.get("content");
			
		List<String> mailList = adminEtcService.getMemberMailing();
		
		for(String mail : mailList) {
			adminUtil.sendEmail(mail, title, content);
		}
		
		model.addAttribute("messageTitle", "알림 메시지");
		model.addAttribute("messageContent", mailList.size() + " 개의 메일 발송을 완료했습니다.");
		
		return "admin/etc/advertise"; 
	}

	
	
}
