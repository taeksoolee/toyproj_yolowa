package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.MainHostingDetail;
import site.yolowa.dto.MainHostingSearch;
import site.yolowa.dto.MainHostingSearchCounting;
import site.yolowa.dto.Reservation;

public interface MainHostingService {
	List<MainHostingSearch> HostingSearchIndexLately();
	List<MainHostingSearch> HostingSearchFamous();
	List<MainHostingSearch> HostingSearchSuperhost();
	MainHostingSearchCounting HostingSearchCounting();
	MainHostingDetail selectMainHostingDetail(int hostingNo);
	int addReservation(Reservation reservation);
	List<MainHostingSearch> getMainHostingList(Map<String, Object> map);
}
