package site.yolowa.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import site.yolowa.dto.Member;
import site.yolowa.dto.Range;

@Component
public class AdminUtil {
	// 이메일 발송을 위한 객체
	@Autowired
	private JavaMailSender mailSender;
	
	//yyyy-MM-dd
	@Autowired
	@Qualifier("underBarDateFormat")
	private SimpleDateFormat underBarDateFormat;
	
	@Autowired
	@Qualifier("slashDateFormat")
	private SimpleDateFormat slashDateFormat;
	
	
	// 범위 검색 필터의 날짜를 세팅
	public Range settingRange(Map<String, Object> filter, int index){
		// 시작 날짜 조합 yyyy-MM-dd
		String startDate = (String)filter.get("rangeStartYear"+index) + "-" + (String)filter.get("rangeStartMonth"+index) + "-" + (String)filter.get("rangeStartDay"+index);
		// 마지막 날짜 조합 yyyy-MM-dd
		String endDate = (String)filter.get("rangeEndYear"+index) + "-" + (String)filter.get("rangeEndMonth"+index) + "-" + (String)filter.get("rangeEndDay"+index);
		
		// test를 위한 포맷 객체 생성
		 underBarDateFormat.setLenient(false);
         try {
        	if(startDate.equals("--") || endDate.equals("--")) { 
        		startDate = "0001-01-01";
        		endDate = "2050-12-31";
        	}else {
        		underBarDateFormat.parse(startDate);
        		underBarDateFormat.parse(endDate);
        	}
		} catch (ParseException e) {
			// 날짜 형식이 아닐 경우 예외처리
		}
		
		return new Range(startDate, endDate);
	}
	
	// admin claim 서비스에서 사용
	// 회원을 전달받아 정지일을 설정하여 반환
	@SuppressWarnings("deprecation")
	public String setForbiddenDate(Member member, int plus) {
		String forbiddenDate = "";
		if(member.getMemberForbiddenDate() == null) {
			Date date = new Date(System.currentTimeMillis());
			date.setDate(date.getDate()+plus);
			forbiddenDate = slashDateFormat.format(date);
		} else {
			//date 객체 생성
			Date date = new Date();
			System.out.println("abcd"+member.getMemberForbiddenDate());
			if(!member.getMemberForbiddenDate().equals("")) {
				date.setYear(Integer.parseInt(member.getMemberForbiddenDate().substring(0, 4)));
				date.setMonth(Integer.parseInt(member.getMemberForbiddenDate().substring(5, 7))-1);
				date.setDate(Integer.parseInt(member.getMemberForbiddenDate().substring(8, 10)));
			}
			date.setDate(date.getDate()+plus);
			forbiddenDate = slashDateFormat.format(date);
		}
		return forbiddenDate; 
	}
	
	public String sendEmail(String email, String subject, String content) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
			message.setSubject(subject);
			message.setText(content, "utf-8", "html");
			message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
			mailSender.send(message);
		return email;
	}

}
