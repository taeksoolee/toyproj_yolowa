package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.MypageBookmark;
import site.yolowa.dto.Reservation;

public interface MainReservationMapper {
	int insertReservation(Reservation reservation);
	List<MypageBookmark> selectBookmarkList(Map<String, Object> map);
	int selectBookmarkCount(int loginMemberNo);
	MypageBookmark selectInvoice(int reservationNo);
	int updateReservationState(Reservation reservation);
	List<MypageBookmark> selectBookingList(Map<String, Object> map);
	int selectBookingCount(Map<String, Object> map);
}
