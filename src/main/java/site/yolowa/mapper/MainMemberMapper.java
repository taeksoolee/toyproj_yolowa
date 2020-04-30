package site.yolowa.mapper;

import site.yolowa.dto.Member;

public interface MainMemberMapper {
	int insertMainMember(Member member);
	int updateMainMember(Member member);
	int updateMainNewPasswdMember(Member member);
	int deleteMainMember(String email);
	Member selectMainMember(String email);
	int updateMainJoindateMember(String email);
	int updateMainImageMember(Member member);
	
	int updateMemberHostState(int memberNo);
}
