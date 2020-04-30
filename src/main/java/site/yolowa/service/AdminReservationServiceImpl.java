package site.yolowa.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.controller.AdminMemberController;
import site.yolowa.dao.ReservationDAO;
import site.yolowa.dto.AdminDashBoardTable;
import site.yolowa.dto.Range;
import site.yolowa.dto.Reservation;

@Service
public class AdminReservationServiceImpl implements AdminReservationService {
	@Autowired
	ReservationDAO reservationDao;
	
	@Override
	public List<AdminDashBoardTable> getDashboardTable(Range range){
		return reservationDao.selectAdminDashBoardTable(range);
	}
	
	@Override
	public List<Reservation> getAdminReservationTable(Map<String, Object> map){
		return reservationDao.selectAdminReservationTable(map);
	}
}
