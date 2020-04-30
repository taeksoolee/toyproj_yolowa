package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminDashBoardTable;
import site.yolowa.dto.Range;
import site.yolowa.dto.Reservation;

public interface AdminReservationService {
	List<AdminDashBoardTable> getDashboardTable(Range range);
	List<Reservation> getAdminReservationTable(Map<String, Object> map);

}