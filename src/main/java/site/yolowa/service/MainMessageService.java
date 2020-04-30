package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Claim;
import site.yolowa.dto.MainMessage;
import site.yolowa.dto.MainMessageCount;
import site.yolowa.dto.MainReview;
import site.yolowa.dto.MainReviewStarCount;
import site.yolowa.dto.Message;
import site.yolowa.dto.Review;

public interface MainMessageService {
	List<MainMessage> getMessageNoticeList(int memberNo);
	List<MainMessage> getMessageHeaderList(int memberNo);
	MainMessageCount getCountingMessageHeader(int memberNo);
	void addMessage(Message message);
	
	void addClaim(Claim claim);
	
	void addReviewDetail(Review review);
	List<MainReview> getReviewDetailList(Map<String, Object> map);
	MainReviewStarCount getReviewStarCount(int hostingNo);
	
	int addReviewGuest(Review review);
	int addReviewReGuest(Review review);
	
	int addClaimGuest(Claim claim);
	
	List<MainMessage> getMessageMypageList(Map<String, Object> map);
	int getMessageMypageCount(Map<String, Object> map);
	
	int updateMessageList(int memberNo);
	int updateNoticeList(int memberNo);
}
