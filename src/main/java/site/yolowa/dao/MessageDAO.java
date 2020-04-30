package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.MainMessage;
import site.yolowa.dto.MainMessageCount;
import site.yolowa.dto.Message;

public interface MessageDAO {
	List<Message> selectAdminMessageTable(Map<String, Object> map);
	int insertAdminMessage(Message message);
	int updateMessageState(int messageNo);

	//메인 페이지 헤더 공지(시스템) 메세지 출력
	List<MainMessage> selectMessageNoticeList(int memberNo);

	//메인 페이지 헤더 메세지 출력
	List<MainMessage> selectMessageHeaderList(int memberNo);

	//메인 페이지 새로 도착한 메세지, 알림 카운트
	MainMessageCount countingMessageHeader(int memberNo);

	//메인 메세지 전송
	int insertMessage(Message message);
	
	//마이페이지 출력
	List<MainMessage> selectMessageMypageList(Map<String, Object> map);
	int selectMessageMypageCount(Map<String, Object> map);
	
	int updateMessageList(int memberNo);
	int updateNoticeList(int memberNo);
}