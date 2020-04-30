package site.yolowa.service;

import site.yolowa.dto.Member;

public interface MainMemberService {
	Member selectMember(String email);
	int updateMember(Member member);
	int insertMember(Member member); 
	int removeMember(String email);
	int updateJoinDate(String email);
	int newPassword(Member member);
	int updateMemberImage(Member member);
	
	int updateMemberHostState(int memberNo);
}
