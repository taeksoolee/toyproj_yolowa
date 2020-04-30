package site.yolowa.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.ApplicationContext;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import site.yolowa.dao.ClaimDAO;
import site.yolowa.dao.HostingDAO;
import site.yolowa.dao.MemberDAO;
import site.yolowa.dao.ReservationDAO;
import site.yolowa.dto.AdminCard;
import site.yolowa.dto.AdminChart;
import site.yolowa.dto.Range;

@Service
public class AdminHomeServiceImpl implements AdminHomeService{
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private HostingDAO hostingDao;
	@Autowired
	private ClaimDAO claimDao;
	@Autowired
	private ReservationDAO reservationDao;
	
	//yy/MM/dd
	@Autowired
	@Qualifier("slashDateFormat")
	private SimpleDateFormat slashDateFormat;
	
	//방문에 대한 처리를 위한 객체
	@Autowired
	@Qualifier("visitedsitePath")
	private String visitedsitePath;
	
	@Autowired
	@Qualifier("visitedsiteProp")
	Properties visitedsiteProp;
	
	@Override
	@SuppressWarnings("deprecation")
	public Map<String, Object> getAdminHomeCard(){
		Map<String, Object> cards = new HashMap<String, Object>();
		Date now = new Date();
		Date previousDay = new Date();
		previousDay.setDate(previousDay.getDate()-1);
		
		//
		List<AdminCard> joinMemberCardList = memberDao.selectAdminJoinMemberCard();
		Map<String, Object> joinMemberCard = setCard(joinMemberCardList, "now", slashDateFormat.format(now), "previous", slashDateFormat.format(previousDay));
		cards.put("joinMemberCard", joinMemberCard);
		
		List<AdminCard> stateMemberCardList = memberDao.selectAdminStateMemberCard();
		Map<String, Object> stateMemberCard = setCard(stateMemberCardList, "guest", "guest", "host", "host");
		cards.put("stateMemberCard", stateMemberCard);
		
		List<AdminCard> applyHostingCardList = hostingDao.selectAdminApplyHostingCard();
		Map<String, Object> applyHostingCard = setCard(applyHostingCardList, "now", slashDateFormat.format(now), "previous", slashDateFormat.format(previousDay));
		cards.put("applyHostingCard", applyHostingCard);
		
		List<AdminCard> stateHostingCardList = hostingDao.selectAdminStateHostingCard();
		Map<String, Object> stateHostingCard = setCard(stateHostingCardList, "active", "1", "pause", "0");
		cards.put("stateHostingCard", stateHostingCard);
		
		List<AdminCard> reviewClaimCardList = claimDao.selectAdminReivewClaimCard();
		Map<String, Object> reviewClaimCard = setCard(reviewClaimCardList, "cancel", "0", "waiting", "1", "complete", "2");
		cards.put("reviewClaimCard", reviewClaimCard);
		
		List<AdminCard> guestClaimCardList = claimDao.selectAdminToGuestClaimCard();
		Map<String, Object> guestClaimCard = setCard(guestClaimCardList, "cancel", "0", "waiting", "1", "complete", "2");
		cards.put("guestClaimCard", guestClaimCard);
		
		List<AdminCard> hostClaimCardList = claimDao.selectAdminToHostClaimCard();
		Map<String, Object> hostClaimCard = setCard(hostClaimCardList, "cancel", "0", "waiting", "1", "complete", "2");
		cards.put("hostClaimCard", hostClaimCard);
		
		return cards;
	}
	
	@Override
	public Map<String, Object> getAdminHomeTable(Range range){
		reservationDao.selectAdminDashBoardTable(range);
		
		return null;
	}
	
	@Override
	@SuppressWarnings("deprecation")
	public Map<String, Object> getAdminHomeChart(String type, String end, int count, HttpServletRequest req) throws IOException{
		// 끝날짜와 기간을 받아서 변환 후 
		String[] ends = end.split("/");
		String[] dates = new String[count];
		Date endDate = new Date();
		
		//end date 세팅
		endDate.setDate(Integer.parseInt(ends[2]));
		endDate.setMonth(Integer.parseInt(ends[1]));
		endDate.setYear(Integer.parseInt(ends[0]));
		
		for(int i = 0; i<count; i++) {
			endDate.setMonth(endDate.getMonth()-1);
			dates[i] = slashDateFormat.format(endDate);
		}
		
		// query 검색
		Range range = new Range(dates[count-1], dates[0]);
		List<AdminChart> adminChartList = null;
		switch (type) {
		case "visit":
			//방문 수 (IOException 발생)
			System.out.println("AdminHomeServieImple : [realpath] " + req.getServletContext().getRealPath(visitedsitePath));
			visitedsiteProp.load(new FileInputStream(req.getServletContext().getRealPath(visitedsitePath)));
			adminChartList = new ArrayList<AdminChart>();
			AdminChart ac = null;
			for(int i = 0; i < dates.length; i++) {
				ac = new AdminChart();
				ac.setMonth(dates[i].substring(0,5));
				if(visitedsiteProp.getProperty(dates[i].substring(0,5)) != null) {
					ac.setCount(Integer.parseInt(visitedsiteProp.getProperty(dates[i].substring(0,5))));
				}else {
					ac.setCount(0);
				}
				adminChartList.add(ac);
			}
			break;
		case "memberjoin":
			//회원가입
			adminChartList = memberDao.selectAdminMemberJoinChart(range);
			break;
		case "hosting":
			//호스팅 차트
			adminChartList = hostingDao.selectAdminHostingChart(range);
			break;
		case "reservation":
			//거래내역 차트
			adminChartList = reservationDao.selectAdminSalesChart(range);
			break;
		case "claim":
			//신고
			adminChartList = claimDao.selectAdminClaimChart(range);
			break;
		}
		
		// 전체 결과를 저장할 목 객체 세팅 (없는게 있을 수도 있으니깐 세팅)
		List<AdminChart> tempChartList = new ArrayList<AdminChart>();
		for(int i = count-1; i>=0; i--) {
			AdminChart chart = new AdminChart();
			chart.setMonth(dates[i].substring(0,5));
			for(AdminChart ac : adminChartList) {
				if(ac.getMonth().equals(dates[i].substring(0,5))) {
					chart = ac;
				}
			}
			tempChartList.add(chart);
		}
		
		// 결과 반환 맵세팅
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> monthList = new ArrayList<String>();
		List<Integer> countList = new ArrayList<Integer>();
		List<Integer> sumList = new ArrayList<Integer>();
		for(AdminChart chart : tempChartList) {
			monthList.add(chart.getMonth());
			countList.add(chart.getCount());
			sumList.add(chart.getTatalPriceSum());
		}
		result.put("monthList", monthList);
		result.put("countList", countList);
		result.put("sumList", sumList);
		result.put("type", type);
		return result;
	}
	
	
	private Map<String, Object>setCard(List<AdminCard> cardList, String keyOne, String conditionOne, String keyTwo, String conditionTwo) {
		Map<String, Object> card = new HashMap<String, Object>();
		card.put(keyOne, 0);
		card.put(keyTwo, 0);
		for(AdminCard c : cardList) {
			if(c.getSeperator().equals(conditionOne)) {
				card.put(keyOne, c.getValue());
			}else if(c.getSeperator().equals(conditionTwo)) {
				card.put(keyTwo, c.getValue());
			}
		}
		return card;
	}
	private Map<String, Object>setCard(List<AdminCard> cardList, String keyOne, String conditionOne, String keyTwo, String conditionTwo, String keyThree, String conditionThree) {
		Map<String, Object> card = new HashMap<String, Object>();
		card.put(keyOne, 0);
		card.put(keyTwo, 0);
		for(AdminCard c : cardList) {
			if(c.getSeperator().equals(conditionOne)) {
				card.put(keyOne, c.getValue());
			}else if(c.getSeperator().equals(conditionTwo)) {
				card.put(keyTwo, c.getValue());
			}else if(c.getSeperator().equals(conditionThree)) {
				card.put(keyThree, c.getValue());
			}
		}
		return card;
	}

}
