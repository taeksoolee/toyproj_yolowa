package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.MainMessage;
import site.yolowa.dto.MainMessageCount;
import site.yolowa.dto.Message;

public interface MainMessageMapper {
	List<MainMessage> selectMessageNoticeList(int memberNo);
	List<MainMessage> selectMessageHeaderList(int memberNo);
	MainMessageCount countingMessageHeader(int memberNo);
	int insertMessage(Message message);
	List<MainMessage> selectMessageMypageList(Map<String, Object> map);
	int selectMessageMypageCount(Map<String, Object> map);
	
	int updateMessageList(int memberNo);
	int updateNoticeList(int memberNo);
}
