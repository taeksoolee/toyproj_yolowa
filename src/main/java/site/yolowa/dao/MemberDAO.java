package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminCard;
import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminHostingMemberDetail;
import site.yolowa.dto.AdminMemberDetail;
import site.yolowa.dto.AdminMemberTable;
import site.yolowa.dto.Member;
import site.yolowa.dto.Range;

public interface MemberDAO {
	List<Member> selectAllMember();
	List<AdminMemberTable> selectAdminMemberTable(Map<String, Object> map);
	Member selectNoMember(int memberNo);
	int updateMemberForbiddenDate(Member member);
	int updateMemberForbiddenDateReset(int memberNo);
	List<AdminChart> selectAdminMemberJoinChart(Range range);
	List<AdminCard> selectAdminJoinMemberCard();
	List<AdminCard> selectAdminStateMemberCard();
	AdminMemberDetail selectAdminMemberDetail(int memberNo);
	int AdminHostingMemberDetailNo(int memberNo);
	AdminHostingMemberDetail selectAdminMemberHostingDetail(int memberNo);
	int updateMemberMemo(Member member);
	Member selectMainMember(String email);
	int insertMainMember(Member member);
	int updateMainMember(Member member);
	List<String> selectMemberMailing();
	int deleteMainMember(String email);
	int updateMainJoindateMember(String email);
	int updateMainNewPasswdMember(Member member);
	int updateMainImageMember(Member member);
	
	int updateMemberHostState(int memberNo);
}