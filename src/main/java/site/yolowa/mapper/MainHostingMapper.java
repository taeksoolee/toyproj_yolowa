package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.MainHostingDetail;
import site.yolowa.dto.MainHostingSearch;
import site.yolowa.dto.MainHostingSearchCounting;
import site.yolowa.dto.Review;

public interface MainHostingMapper {
	List<MainHostingSearch> HostingSearchIndexLately();
	List<MainHostingSearch> HostingSearchFamous();
	List<MainHostingSearch> HostingSearchSuperhost();
	MainHostingSearchCounting HostingSearchCounting();
	MainHostingDetail selectMainHostingDetail(int hostingNo);
	List<Review> selectReview();
	Review selectReviewNo(int reviewNo); 
	List<MainHostingSearch> selectMainHostingList(Map<String, Object> map);
}
