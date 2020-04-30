package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminCard;
import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminHostingReservationDetail;
import site.yolowa.dto.AdminHostingTable;
import site.yolowa.dto.Hosting;
import site.yolowa.dto.MainHostingDetail;
import site.yolowa.dto.MainHostingSearch;
import site.yolowa.dto.MainHostingSearchCounting;
import site.yolowa.dto.MypageHeaderCount;
import site.yolowa.dto.Range;

public interface HostingDAO {
	List<AdminHostingTable> selectAdminHostingTable(Map<String, Object> map);
	List<AdminChart> selectAdminHostingChart(Range range);
	List<AdminCard> selectAdminApplyHostingCard();
	List<AdminCard> selectAdminStateHostingCard();
	AdminHostingReservationDetail selectAdminHostingDetail(int hostingNo);
	//main hosting DAO
	//index 페이지 최근 등록 디스플레이
	List<MainHostingSearch> HostingSearchIndexLately();

	//index 페이지 지역 유명 호스트 디스플레이
	List<MainHostingSearch> HostingSearchFamous();

	//index 페이지 전국 유명 호스트 디스플레이
	List<MainHostingSearch> HostingSearchSuperhost();

	//index 페이지 등록된 호스팅 갯수 카운팅
	MainHostingSearchCounting HostingSearchCounting();

	//디테일 페이지 출력
	MainHostingDetail selectMainHostingDetail(int hostingNo);

	//mypage hosting DAO
	int insertHosting(Hosting hosting);
	
	//mypage 헤더 카운팅
	MypageHeaderCount selectMypageHeaderCount(int loginMemberNo);
	
	//mypage 호스팅 관리 디스플레이
	int selectMypageHostingCount(Map<String, Object>map);
	List<Hosting> selectMypageHostingList(Map<String, Object>map);
	
	//mypage 호스팅 관리 상태 변경
	int updateMypageHosting(Hosting hosting);
	Hosting selectMypageHosting(Map<String, Object>map);
	int updateMypageHostingList(Hosting hosting);
	
	//main 디테일 검색
	List<MainHostingSearch> selectMainHostingList(Map<String, Object> map);
}