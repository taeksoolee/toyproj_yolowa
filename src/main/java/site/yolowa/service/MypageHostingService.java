package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Hosting;
import site.yolowa.dto.MainReview;
import site.yolowa.dto.Member;
import site.yolowa.dto.MypageBookmark;
import site.yolowa.dto.MypageHeaderCount;
import site.yolowa.dto.Reservation;

public interface MypageHostingService {
	int addHosting(Hosting hosting);
	MypageHeaderCount getMypageHeaderCount(int loginMemberNo);
	List<MypageBookmark> getBookmarkList(Map<String, Object> map);
	int getBookmarkCount(int loginMemberNo);
	MypageBookmark getInvoice(int reservationNo);
	int modifyReservationState(Reservation reservation);
	List<MypageBookmark> getBookingList(Map<String, Object> map);
	int getBookingCount(Map<String, Object> map);
	List<MainReview> getReviewGuestList(Map<String, Object> map);
	Member getMypageMember(int memberNo);
	int getReviewGuestCount(int reviewMemberNo);
	int getMypageHostingCount(Map<String, Object>map);
	List<Hosting> getMypageHostingList(Map<String, Object>map);
	int modifyMypageHosting(Hosting hosting);
	Hosting getMypageHosting(Map<String, Object>map);
	int modifyMypageHostingList(Hosting hosting);
}
