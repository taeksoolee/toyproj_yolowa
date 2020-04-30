package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminDashBoardTable;
import site.yolowa.dto.MypageBookmark;
import site.yolowa.dto.Range;
import site.yolowa.dto.Reservation;
import site.yolowa.mapper.AdminMapper;
import site.yolowa.mapper.MainReservationMapper;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminChart> selectAdminSalesChart(Range range) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminSalesChart(range);
	}
	
	@Override
	public List<AdminDashBoardTable> selectAdminDashBoardTable(Range range) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminDashBoardTable(range);
	}
	
	@Override
	public List<Reservation> selectAdminReservationTable(Map<String, Object> map){
		return sqlSession.getMapper(AdminMapper.class).selectAdminReservationTable(map);
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return sqlSession.getMapper(MainReservationMapper.class).insertReservation(reservation);
	}

	@Override
	public List<MypageBookmark> selectBookmarkList(Map<String, Object> map) {
		return sqlSession.getMapper(MainReservationMapper.class).selectBookmarkList(map);
	}

	@Override
	public int selectBookmarkCount(int loginMemberNo) {
		return sqlSession.getMapper(MainReservationMapper.class).selectBookmarkCount(loginMemberNo);
	}

	@Override
	public MypageBookmark selectInvoice(int reservationNo) {
		return sqlSession.getMapper(MainReservationMapper.class).selectInvoice(reservationNo);
	}

	@Override
	public int updateReservationState(Reservation reservation) {
		return sqlSession.getMapper(MainReservationMapper.class).updateReservationState(reservation);
	}

	@Override
	public int selectBookingCount(Map<String, Object> map) {
		return sqlSession.getMapper(MainReservationMapper.class).selectBookingCount(map);
	}

	@Override
	public List<MypageBookmark> selectBookingList(Map<String, Object> map) {
		return sqlSession.getMapper(MainReservationMapper.class).selectBookingList(map);
	}
	
	
}