package site.yolowa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.HostingDAO;
import site.yolowa.dao.ReservationDAO;
import site.yolowa.dao.ReviewDAO;
import site.yolowa.dto.Hosting;
import site.yolowa.dto.MainReview;
import site.yolowa.dto.Member;
import site.yolowa.dto.MypageBookmark;
import site.yolowa.dto.MypageHeaderCount;
import site.yolowa.dto.Reservation;

@Service
public class MypageHostingServiceImpl implements MypageHostingService {
	@Autowired
	private HostingDAO hostingDAO;
	
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private ReviewDAO ReviewDAO;
	
	@Override
	public int addHosting(Hosting hosting) {
		return hostingDAO.insertHosting(hosting);
	}

	@Override
	public MypageHeaderCount getMypageHeaderCount(int loginMemberNo) {
		return hostingDAO.selectMypageHeaderCount(loginMemberNo);
	}

	@Override
	public List<MypageBookmark> getBookmarkList(Map<String, Object> map) {
		return reservationDAO.selectBookmarkList(map);
	}

	@Override
	public int getBookmarkCount(int loginMemberNo) {
		return reservationDAO.selectBookmarkCount(loginMemberNo);
	}

	@Override
	public MypageBookmark getInvoice(int reservationNo) {
		return reservationDAO.selectInvoice(reservationNo);
	}

	@Override
	public int modifyReservationState(Reservation reservation) {
		return reservationDAO.updateReservationState(reservation);
	}

	@Override
	public List<MypageBookmark> getBookingList(Map<String, Object> map) {
		return reservationDAO.selectBookingList(map);
	}

	@Override
	public int getBookingCount(Map<String, Object> map) {
		return reservationDAO.selectBookingCount(map);
	}

	@Override
	public List<MainReview> getReviewGuestList(Map<String, Object> map) {
		return ReviewDAO.selectReviewGuestList(map);
	}

	@Override
	public Member getMypageMember(int memberNo) {
		return ReviewDAO.selectMypageMember(memberNo);
	}

	@Override
	public int getReviewGuestCount(int reviewMemberNo) {
		return ReviewDAO.selectReviewGuestCount(reviewMemberNo);
	}

	@Override
	public int getMypageHostingCount(Map<String, Object> map) {
		return hostingDAO.selectMypageHostingCount(map);
	}

	@Override
	public List<Hosting> getMypageHostingList(Map<String, Object> map) {
		return hostingDAO.selectMypageHostingList(map);
	}

	@Override
	public int modifyMypageHosting(Hosting hosting) {
		return hostingDAO.updateMypageHosting(hosting);
	}

	@Override
	public Hosting getMypageHosting(Map<String, Object> map) {
		return hostingDAO.selectMypageHosting(map);
	}

	@Override
	public int modifyMypageHostingList(Hosting hosting) {
		return hostingDAO.updateMypageHostingList(hosting);
	}

}
