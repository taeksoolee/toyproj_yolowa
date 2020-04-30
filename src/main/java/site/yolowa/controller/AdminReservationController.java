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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import site.yolowa.dao.ReservationDAOImpl;
import site.yolowa.dto.Range;
import site.yolowa.service.AdminReservationService;
import site.yolowa.utils.AdminUtil;

@Controller
public class AdminReservationController {
	private Logger logger = LoggerFactory.getLogger(AdminReservationController.class);
	private Integer adminTableDefaultRowCount = 300;
	
	@Autowired
	private AdminUtil util;
	
	@Autowired
	private AdminReservationService adminReservationService;
	
	//yyyy년 MM월 dd일 hh:mm:ss
	@Autowired
	@Qualifier("AdminTableNowDateFormat")
	private SimpleDateFormat adminTableNowDateFormat;
	
	@Autowired
	@Qualifier("jacksonMapper")
	private ObjectMapper jacksonmapper;
	
	@RequestMapping(value = "/admin/reservation/reservation", method = RequestMethod.GET)
	public String adminReservationReservation(@RequestParam Map<String, Object> filter, Model model) {
		
		//
		Map<String, Object> map = new HashMap<String, Object>();
		// 필터세팅
		// 받을 필터가 없을 경우를 확인. 필터내 객체가 없을 경우
		if(filter.entrySet().size() != 0) {
			// 필터를 위한 기본 세팅
			List<Range> checkins = new ArrayList<Range>();
			List<Range> checkouts = new ArrayList<Range>();
			
			List<Integer> nos = new ArrayList<Integer>();
			List<String> memberNos = new ArrayList<String>();
			List<String> hostingNos = new ArrayList<String>();
			List<String> payers = new ArrayList<String>();
			
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
					switch (rangeFormat) {
					case "checkIn":
						checkins.add(new Range(range.getStart(), range.getEnd()));
						break;
					case "checkOut":
						checkouts.add(new Range(range.getStart(), range.getEnd()));
						break;
					}
		        }
			}
			
			// 키워드 검색
			for(int i=1; i<=keywordCount; i++) {
				String keywordFormat = (String)filter.get("keywordFormat"+i);
				// 선택된 필터정보를 리스트에 추가
				if(keywordFormat != null) {
					switch (keywordFormat) {
					case "reservationNo":
						int no = (String)filter.get("keywordValue"+i)==""?0:Integer.parseInt((String)filter.get("keywordValue"+i));
						// 필터에 0이 들어 올 경우 필터링 하지 않도록 함.
						if(no != 0)
							nos.add(no);
						break;
					case "memberNo":
						memberNos.add((String)filter.get("keywordValue"+i));
						break;
					case "hostingNo":
						hostingNos.add((String)filter.get("keywordValue"+i));
						break;
					case "payer":
						payers.add((String)filter.get("keywordValue"+i));
						break;
					}
				}
			}
			
			// 호스트 상태 필터 추가
			if((String)filter.get("stateWating") != null){
				states.add(((String)filter.get("stateWating")).equals("")?10:Integer.parseInt((String)filter.get("stateWating")));
			}
			if((String)filter.get("stateAccess") != null){
				states.add(((String)filter.get("stateAccess")).equals("")?10:Integer.parseInt((String)filter.get("stateAccess")));
			}
			if((String)filter.get("stateComplete") != null){
				states.add(((String)filter	.get("stateComplete")).equals("")?10:Integer.parseInt((String)filter.get("stateComplete")));
			}
			if((String)filter.get("stateCancel") != null){
				states.add(((String)filter	.get("stateCancel")).equals("")?10:Integer.parseInt((String)filter.get("stateCancel")));
			}
			
			// 필터에서 받은 검색정보를 맵에 저장
			map.put("checkins", checkins);
			map.put("checkouts", checkouts);
			
			map.put("nos", nos);
			map.put("memberNos", memberNos);
			map.put("hostingNos", hostingNos);
			map.put("payers", payers);
			
			map.put("states", states);
			
			map.put("count", Integer.parseInt((String)filter.get("searchRow")));
			
			// 맵을 이용하여 검색
			model.addAttribute("reservationTableList", adminReservationService.getAdminReservationTable(map));
		}else {
			// filter가 적용되지 않을 경우
			map.put("filter", "off");
			map.put("count", adminTableDefaultRowCount);
			model.addAttribute("reservationTableList", adminReservationService.getAdminReservationTable(map));
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
		
		return "admin/reservation/reservation";
	}
}
