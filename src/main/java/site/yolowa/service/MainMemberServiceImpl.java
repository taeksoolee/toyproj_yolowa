package site.yolowa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.MemberDAO;
import site.yolowa.dto.Member;

@Service
public class MainMemberServiceImpl implements MainMemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public Member selectMember(String email) {
		Member member=memberDAO.selectMainMember(email);
		return member;
	}

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMainMember(member);	
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMainMember(member);
	}

	@Override
	public int removeMember(String email) {
		return memberDAO.deleteMainMember(email);		
	}

	@Override
	public int updateJoinDate(String email) {
		return memberDAO.updateMainJoindateMember(email);
	}

	@Override
	public int newPassword(Member member) {
		return memberDAO.updateMainNewPasswdMember(member);
	}

	@Override
	public int updateMemberImage(Member member) {
		return memberDAO.updateMainImageMember(member);
	}

	@Override
	public int updateMemberHostState(int memberNo) {
		return memberDAO.updateMemberHostState(memberNo);
	}

	
	
	
	
}
