package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.yolowa.dto.AdminCard;
import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminHostingMemberDetail;
import site.yolowa.dto.AdminMemberDetail;
import site.yolowa.dto.AdminMemberTable;
import site.yolowa.dto.Member;
import site.yolowa.dto.Range;
import site.yolowa.mapper.MainMemberMapper;
import site.yolowa.mapper.AdminMapper;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Member>selectAllMember() {
		return sqlSession.getMapper(AdminMapper.class).selectAllMember();
	}
	
	@Override
	public List<AdminMemberTable> selectAdminMemberTable(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminMemberTable(map);
	}
	
	@Override
	public Member selectNoMember(int memberNo) {
		return sqlSession.getMapper(AdminMapper.class).selectNoMember(memberNo);
	}
	
	@Override
	public int updateMemberForbiddenDate(Member member) {
		return sqlSession.getMapper(AdminMapper.class).updateMemberForbiddenDate(member);
	}
	
	@Override
	public int updateMemberForbiddenDateReset(int memberNo) {
		return sqlSession.getMapper(AdminMapper.class).updateMemberForbiddenDateReset(memberNo);
	}
	
	@Override
	public List<AdminChart> selectAdminMemberJoinChart(Range range) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminMemberJoinChart(range);
	}
	
	@Override
	public List<AdminCard> selectAdminJoinMemberCard(){
		return sqlSession.getMapper(AdminMapper.class).selectAdminJoinMemberCard();
	}
	
	@Override
	public List<AdminCard> selectAdminStateMemberCard(){
		return sqlSession.getMapper(AdminMapper.class).selectAdminStateMemberCard();
	}
	
	@Override
	public AdminMemberDetail selectAdminMemberDetail(int memberNo){
		return sqlSession.getMapper(AdminMapper.class).selectAdminMemberDetail(memberNo);
	}
	
	@Override
	public int AdminHostingMemberDetailNo(int memberNo){
		return sqlSession.getMapper(AdminMapper.class).AdminHostingMemberDetailNo(memberNo);
	}
	
	@Override
	public AdminHostingMemberDetail selectAdminMemberHostingDetail(int memberNo){
		return sqlSession.getMapper(AdminMapper.class).selectAdminMemberHostingDetail(memberNo);
	}
	
	
	@Override
	public int updateMemberMemo(Member member){
		return sqlSession.getMapper(AdminMapper.class).updateMemberMemo(member);
	}
	
	@Override
	public Member selectMainMember(String email){
		return sqlSession.getMapper(MainMemberMapper.class).selectMainMember(email);
	}
	
	@Override
	public int insertMainMember(Member member){
		return sqlSession.getMapper(MainMemberMapper.class).insertMainMember(member);
	}
	
	@Override
	public int updateMainMember(Member member){
		return sqlSession.getMapper(MainMemberMapper.class).updateMainMember(member);
	}

	@Override
	public List<String> selectMemberMailing() {
		return sqlSession.getMapper(AdminMapper.class).selectMemberMailing();
	}
	
	@Override
	public int deleteMainMember(String email) {		
		return sqlSession.getMapper(MainMemberMapper.class).deleteMainMember(email);
	}

	@Override
	public int updateMainJoindateMember(String email) {
		return sqlSession.getMapper(MainMemberMapper.class).updateMainJoindateMember(email);		
	}

	@Override
	public int updateMainNewPasswdMember(Member member) {
		return sqlSession.getMapper(MainMemberMapper.class).updateMainNewPasswdMember(member);	
	}

	@Override
	public int updateMainImageMember(Member member) {
		return sqlSession.getMapper(MainMemberMapper.class).updateMainImageMember(member);	
	}

	@Override
	public int updateMemberHostState(int memberNo) {
		return sqlSession.getMapper(MainMemberMapper.class).updateMemberHostState(memberNo);
	}
}
	
	
