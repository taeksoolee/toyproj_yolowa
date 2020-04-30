package site.yolowa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import site.yolowa.dto.AdminClaimList;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Range;
import site.yolowa.service.AdminClaimService;
import site.yolowa.service.AdminMemberServiceImpl;
import site.yolowa.utils.AdminUtil;

@Controller
public class AdminClaimController {
	private Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	private Integer adminTableDefaultRowCount = 300;
	
	@Autowired
	private AdminUtil util;
	
	//yyyy년 MM월 dd일 hh:mm:ss
	@Autowired
	@Qualifier("AdminTableNowDateFormat")
	private SimpleDateFormat adminTableNowDateFormat;
	
	@Autowired
	@Qualifier("jacksonMapper")
	private ObjectMapper jacksonmapper;
	
	@Autowired
	private AdminClaimService adminClaimService;
	
	
	@RequestMapping(value = "/admin/claim/member", method = RequestMethod.GET)
	public String adminClaimMember(@RequestParam Map<String, Object> filter, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 필터세팅
		// 받을 필터가 없을 경우를 확인. 필터내 객체가 없을 경우
		if(filter.entrySet().size() != 0) {
			List<Range> claimDates = new ArrayList<Range>();
			List<String> reasons = new ArrayList<String>();
			List<Integer> applicantNos = new ArrayList<Integer>();
			List<Integer> suspectNos = new ArrayList<Integer>();
			List<Integer> suspectHostingNos = new ArrayList<Integer>();
			List<Integer> states = new ArrayList<Integer>();
			List<Integer> types = new ArrayList<Integer>();
			
			// 범위 검색을 위해 반환
			int rangeCount = (String)filter.get("rangeCount")==""?0:Integer.parseInt((String)filter.get("rangeCount"));
			int keywordCount = (String)filter.get("keywordCount")==""?0:Integer.parseInt((String)filter.get("keywordCount"));
			
			// 범위 검색 리스트 세팅
			for(int i=1; i<=rangeCount; i++) {
				String rangeFormat = (String)filter.get("rangeFormat"+i);
				
				//들어온 범위를 문자열로 세팅하여 Range 객체를 반환
				Range range = util.settingRange(filter, i);
		         
				// 선택된 필터정보를 리스트에 추가
		        if(rangeFormat != null) {
		        	claimDates.add(new Range(range.getStart(), range.getEnd()));
		        }
			}
			
			// 키워드 검색
			for(int i=1; i<=keywordCount; i++) {
				String keywordFormat = (String)filter.get("keywordFormat"+i);
				// 선택된 필터정보를 리스트에 추가
				if(keywordFormat != null) {
					int no = 0;
					switch (keywordFormat) {
					case "content":
						reasons.add((String)filter.get("keywordValue"+i));
						break;
					case "applicantNo":
						no = (String)filter.get("keywordValue"+i)==""?0:Integer.parseInt((String)filter.get("keywordValue"+i));
						// 필터에 0이 들어 올 경우 필터링 하지 않도록 함.
						if(no != 0)
							applicantNos.add(no);
						break;
					case "suspectNo":
						no = (String)filter.get("keywordValue"+i)==""?0:Integer.parseInt((String)filter.get("keywordValue"+i));
						// 필터에 0이 들어 올 경우 필터링 하지 않도록 함.
						if(no != 0)
							suspectNos.add(no);
						break;
					case "suspectHostingNo":
						no = (String)filter.get("keywordValue"+i)==""?0:Integer.parseInt((String)filter.get("keywordValue"+i));
						// 필터에 0이 들어 올 경우 필터링 하지 않도록 함.
						if(no != 0)
							suspectHostingNos.add(no);
						break;
					}
				}
			}
			
			// 상태 필터 추가
			if((String)filter.get("cancelState") != null){
				states.add(((String)filter.get("cancelState")).equals("")?10:Integer.parseInt((String)filter.get("cancelState")));
			}
			if((String)filter.get("watingState") != null){
				states.add(((String)filter.get("watingState")).equals("")?10:Integer.parseInt((String)filter.get("watingState")));
			}
			if((String)filter.get("completeState") != null){
				states.add(((String)filter.get("completeState")).equals("")?10:Integer.parseInt((String)filter.get("completeState")));
			}
			
			// 타겟 필터 추가
			if((String)filter.get("toGuest") != null){
				types.add(((String)filter.get("toGuest")).equals("")?10:Integer.parseInt((String)filter.get("toGuest")));
			}
			if((String)filter.get("toHost") != null){
				types.add(((String)filter.get("toHost")).equals("")?10:Integer.parseInt((String)filter.get("toHost")));
			}
			
			//
			map.put("claimDates", claimDates);
			map.put("reasons", reasons);
			map.put("applicantNos", applicantNos);
			map.put("suspectNos", suspectNos);
			map.put("suspectHostingNos", suspectHostingNos);
			map.put("states", states);
			map.put("types", types);
			
			// 카운트가 있을 경우 카운트 세팅
			map.put("count", Integer.parseInt((String)filter.get("searchRow")));
			/**/
			// 맵을 이용하여 검색
			model.addAttribute("userClaimTableList", adminClaimService.getAdminClaimUserTable(map));
		}else {
			// filter가 적용되지 않을 경우
			map.put("filter", "off");
			map.put("count", adminTableDefaultRowCount);
			model.addAttribute("userClaimTableList", adminClaimService.getAdminClaimUserTable(map));
		}
	
		// 업데이트 시간을 반환
		model.addAttribute("changeDate", adminTableNowDateFormat.format(new Date()));
		// 요청 필터정보를 반환
		try {
			model.addAttribute("filter", jacksonmapper.writeValueAsString(filter));
		} catch (JsonProcessingException e) {
			// pasting error
		}
		return "admin/claim/member";
	}
	
	@RequestMapping(value = "/admin/claim/review", method = RequestMethod.GET)
	public String adminClaimReview(@RequestParam Map<String, Object> filter, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 필터세팅
		// 받을 필터가 없을 경우를 확인. 필터내 객체가 없을 경우
		if(filter.entrySet().size() != 0) {
			List<Range> claimDates = new ArrayList<Range>();
			List<String> reasons = new ArrayList<String>();
			List<Integer> applicantNos = new ArrayList<Integer>();
			List<Integer> suspectReviewNos = new ArrayList<Integer>();
			List<Integer> states = new ArrayList<Integer>();
			
			// 범위 검색을 위해 반환
			int rangeCount = (String)filter.get("rangeCount")==""?0:Integer.parseInt((String)filter.get("rangeCount"));
			int keywordCount = (String)filter.get("keywordCount")==""?0:Integer.parseInt((String)filter.get("keywordCount"));
			
			// 범위 검색 리스트 세팅
			for(int i=1; i<=rangeCount; i++) {
				String rangeFormat = (String)filter.get("rangeFormat"+i);
				
				//들어온 범위를 문자열로 세팅하여 Range 객체를 반환
				Range range = util.settingRange(filter, i);
		         
				// 선택된 필터정보를 리스트에 추가
		        if(rangeFormat != null) {
		        	claimDates.add(new Range(range.getStart(), range.getEnd()));
		        }
			}
			
			// 키워드 검색
			for(int i=1; i<=keywordCount; i++) {
				String keywordFormat = (String)filter.get("keywordFormat"+i);
				// 선택된 필터정보를 리스트에 추가
				if(keywordFormat != null) {
					int no = 0;
					switch (keywordFormat) {
					case "content":
						reasons.add((String)filter.get("keywordValue"+i));
						break;
					case "applicantNo":
						no = (String)filter.get("keywordValue"+i)==""?0:Integer.parseInt((String)filter.get("keywordValue"+i));
						// 필터에 0이 들어 올 경우 필터링 하지 않도록 함.
						if(no != 0)
							applicantNos.add(no);
						break;
					case "suspectReviewNo":
						no = (String)filter.get("keywordValue"+i)==""?0:Integer.parseInt((String)filter.get("keywordValue"+i));
						// 필터에 0이 들어 올 경우 필터링 하지 않도록 함.
						if(no != 0)
							suspectReviewNos.add(no);
						break;
					}
				}
			}
			
			// 상태 필터 추가
			if((String)filter.get("cancelState") != null){
				states.add(((String)filter.get("cancelState")).equals("")?10:Integer.parseInt((String)filter.get("cancelState")));
			}
			if((String)filter.get("watingState") != null){
				states.add(((String)filter.get("watingState")).equals("")?10:Integer.parseInt((String)filter.get("watingState")));
			}
			if((String)filter.get("completeState") != null){
				states.add(((String)filter.get("completeState")).equals("")?10:Integer.parseInt((String)filter.get("completeState")));
			}
			//
			map.put("claimDates", claimDates);
			map.put("reasons", reasons);
			map.put("applicantNos", applicantNos);
			map.put("suspectReviewNos", suspectReviewNos);
			map.put("states", states);
			
			// 카운트가 있을 경우 카운트 세팅
			map.put("count", Integer.parseInt((String)filter.get("searchRow")));
			/**/
			// 맵을 이용하여 검색
			model.addAttribute("reviewClaimTableList", adminClaimService.getAdminClaimReviewTable(map));
		}else {
			// filter가 적용되지 않을 경우
			map.put("filter", "off");
			map.put("count", adminTableDefaultRowCount);
			System.out.println(adminClaimService.getAdminClaimReviewTable(map));
			model.addAttribute("reviewClaimTableList", adminClaimService.getAdminClaimReviewTable(map));
		}
	
		// 업데이트 시간을 반환
		model.addAttribute("changeDate", adminTableNowDateFormat.format(new Date()));
		// 요청 필터정보를 반환
		try {
			model.addAttribute("filter", jacksonmapper.writeValueAsString(filter));
		} catch (JsonProcessingException e) {
			// pasting error
		}
		
		return "admin/claim/review";
	}
	
	@RequestMapping(value = "/rest/admin/claim/member/state/all/{plus}", method = RequestMethod.POST)
	@ResponseBody
	public int adminClaimMemberUpdateState(@RequestBody List<Claim> claimList, @PathVariable int plus) {
		System.out.println(claimList);
		int rows = adminClaimService.modifyClaimMemberState(claimList, plus);
		System.out.println(rows);
		return rows;
	}
	
	@RequestMapping(value = "/rest/admin/claim/member/state/{plus}", method = RequestMethod.POST)
	@ResponseBody
	public int adminClaimMemberUpdateState(@RequestBody Claim claim, @PathVariable int plus) {
		int rows = adminClaimService.modifyClaimMemberState(claim, plus);
		return rows;
	}
	
	@RequestMapping(value = "/rest/admin/claim/review/state", method = RequestMethod.POST)
	@ResponseBody
	public int adminClaimReviewUpdateState(@RequestBody Claim claim) {
		int rows = adminClaimService.modifyClaimReviewState(claim);
		return rows;
	}
	
	@RequestMapping(value = "/rest/admin/claim/review/state/all", method = RequestMethod.POST)
	@ResponseBody
	public int adminClaimReviewUpdateState(@RequestBody List<Claim> claimList) {
		int rows = adminClaimService.modifyClaimReviewState(claimList);
		return rows;
	}
	
	@RequestMapping(value = "/rest/admin/claim/review/state/post", method = RequestMethod.POST)
	@ResponseBody
	public int adminClaimReviewUpdateStatePost(@RequestBody Claim claim) {
		int rows = adminClaimService.modifyClaimReviewState(claim);
		return rows;
	}
	
}
