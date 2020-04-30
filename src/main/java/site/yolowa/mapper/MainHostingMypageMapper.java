package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.Hosting;
import site.yolowa.dto.MypageHeaderCount;

public interface MainHostingMypageMapper {
	int insertHosting(Hosting hosting);
	MypageHeaderCount selectMypageHeaderCount(int loginMemberNo);
	
	int selectMypageHostingCount(Map<String, Object>map);
	List<Hosting> selectMypageHostingList(Map<String, Object>map);
	int updateMypageHosting(Hosting hosting);
	
	Hosting selectMypageHosting(Map<String, Object>map);
	int updateMypageHostingList(Hosting hosting);
}
