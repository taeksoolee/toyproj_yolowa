package site.yolowa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.ClaimDAO;
import site.yolowa.dao.MessageDAO;
import site.yolowa.dao.ReviewDAO;
import site.yolowa.dto.Claim;
import site.yolowa.dto.MainMessage;
import site.yolowa.dto.MainMessageCount;
import site.yolowa.dto.MainReview;
import site.yolowa.dto.MainReviewStarCount;
import site.yolowa.dto.Message;
import site.yolowa.dto.Review;

@Service
public class MainMessageServiceImpl implements MainMessageService {
	
	@Autowired
	MessageDAO messageDAO;
	
	@Autowired
	ClaimDAO claimDAO;
	
	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public List<MainMessage> getMessageNoticeList(int memberNo) {
		return messageDAO.selectMessageNoticeList(memberNo);
	}

	@Override
	public List<MainMessage> getMessageHeaderList(int memberNo) {
		return messageDAO.selectMessageHeaderList(memberNo);
	}

	@Override
	public MainMessageCount getCountingMessageHeader(int memberNo) {
		return messageDAO.countingMessageHeader(memberNo);
	}

	@Override
	public void addMessage(Message message) {
		messageDAO.insertMessage(message);
	}

	@Override
	public void addClaim(Claim claim) {
		claimDAO.insertClaimDetail(claim);
	}

	@Override
	public void addReviewDetail(Review review) {
		reviewDAO.insertReviewDtail(review);
	}

	@Override
	public List<MainReview> getReviewDetailList(Map<String, Object> map) {
		return reviewDAO.selectReviewDetailList(map);
	}

	@Override
	public MainReviewStarCount getReviewStarCount(int hostingNo) {
		return reviewDAO.selectReviewStarCount(hostingNo);
	}

	@Override
	public int addReviewGuest(Review review) {
		return reviewDAO.insertReviewGuest(review);
	}

	@Override
	public int addClaimGuest(Claim claim) {
		return claimDAO.insertClaimGuest(claim);
	}

	@Override
	public int addReviewReGuest(Review review) {
		return reviewDAO.insertReviewReGuest(review);
	}

	@Override
	public List<MainMessage> getMessageMypageList(Map<String, Object> map) {
		return messageDAO.selectMessageMypageList(map);
	}

	@Override
	public int getMessageMypageCount(Map<String, Object> map) {
		return messageDAO.selectMessageMypageCount(map);
	}

	@Override
	public int updateMessageList(int memberNo) {
		return messageDAO.updateMessageList(memberNo);
	}

	@Override
	public int updateNoticeList(int memberNo) {
		return messageDAO.updateNoticeList(memberNo);
	}
	
}
