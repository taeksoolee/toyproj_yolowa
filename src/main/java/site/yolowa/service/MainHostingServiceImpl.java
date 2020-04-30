package site.yolowa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.HostingDAO;
import site.yolowa.dao.ReservationDAO;
import site.yolowa.dto.MainHostingDetail;
import site.yolowa.dto.MainHostingSearch;
import site.yolowa.dto.MainHostingSearchCounting;
import site.yolowa.dto.Reservation;

@Service
public class MainHostingServiceImpl implements MainHostingService {
	
	@Autowired
	private HostingDAO hostingDAO;
	
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public List<MainHostingSearch> HostingSearchIndexLately() {
		//System.out.println(hostingDAO.HostingSearchIndexLately().toString());
		return hostingDAO.HostingSearchIndexLately();
	}

	@Override
	public List<MainHostingSearch> HostingSearchFamous() {
		return hostingDAO.HostingSearchFamous();
	}

	@Override
	public List<MainHostingSearch> HostingSearchSuperhost() {
		return hostingDAO.HostingSearchSuperhost();
	}

	@Override
	public MainHostingSearchCounting HostingSearchCounting() {
		return hostingDAO.HostingSearchCounting();
	}

	@Override
	public MainHostingDetail selectMainHostingDetail(int hostingNo) {
		return hostingDAO.selectMainHostingDetail(hostingNo);
	}

	@Override
	public int addReservation(Reservation reservation) {
		return reservationDAO.insertReservation(reservation);
	}

	@Override
	public List<MainHostingSearch> getMainHostingList(Map<String, Object> map) {
		return hostingDAO.selectMainHostingList(map);
	}

}
