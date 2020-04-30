package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminDashBoardTable;
import site.yolowa.dto.MypageBookmark;
import site.yolowa.dto.Range;
import site.yolowa.dto.Reservation;

public interface ReservationDAO {
	List<AdminChart> selectAdminSalesChart(Range range);
	List<AdminDashBoardTable> selectAdminDashBoardTable(Range range);
	List<Reservation> selectAdminReservationTable(Map<String, Object> map);
	
	int insertReservation(Reservation reservation);
	List<MypageBookmark> selectBookmarkList(Map<String, Object> map);
	int selectBookmarkCount(int loginMemberNo);
	MypageBookmark selectInvoice(int reservationNo);
	int updateReservationState(Reservation reservation);
	List<MypageBookmark> selectBookingList(Map<String, Object> map);
	int selectBookingCount(Map<String, Object> map);
	
}