package site.yolowa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.yolowa.dto.AdminCard;
import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminClaimReview;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Range;
import site.yolowa.mapper.AdminMapper;
import site.yolowa.mapper.MainClaimMapper;
import site.yolowa.mapper.MainCommentMapper;

@Repository
public class ClaimDAOImpl implements ClaimDAO{
	@Autowired
	private SqlSession sqlSession;
	
	/* (non-Javadoc)
	 * @see site.yolowa.dao.ClaimDAO#selectAdminClaimUserTable(java.util.Map)
	 */
	@Override
	public List<Claim> selectAdminClaimUserTable(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminClaimUserTable(map);
	}
	
	/* (non-Javadoc)
	 * @see site.yolowa.dao.ClaimDAO#updateClaimState(site.yolowa.dto.Claim)
	 */
	@Override
	public int updateClaimState(Claim claim) {
		return sqlSession.getMapper(AdminMapper.class).updateClaimState(claim);
	}
	
	/* (non-Javadoc)
	 * @see site.yolowa.dao.ClaimDAO#selectAdminClaimReviewTable(java.util.Map)
	 */
	@Override
	public List<AdminClaimReview> selectAdminClaimReviewTable(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminClaimReviewTable(map);
	}
	
	/* (non-Javadoc)
	 * @see site.yolowa.dao.ClaimDAO#selectAdminClaimChart(site.yolowa.dto.Range)
	 */
	@Override
	public List<AdminChart> selectAdminClaimChart(Range range) {
		return sqlSession.getMapper(AdminMapper.class).selectAdminClaimChart(range);
	}
	
	/* (non-Javadoc)
	 * @see site.yolowa.dao.ClaimDAO#selectAdminToGuestClaimCard()
	 */
	@Override
	public List<AdminCard> selectAdminToGuestClaimCard(){
		return sqlSession.getMapper(AdminMapper.class).selectAdminToGuestClaimCard();
	}
	
	/* (non-Javadoc)
	 * @see site.yolowa.dao.ClaimDAO#selectAdminToHostClaimCard()
	 */
	@Override
	public List<AdminCard> selectAdminToHostClaimCard(){
		return sqlSession.getMapper(AdminMapper.class).selectAdminToHostClaimCard();
	}
	
	/* (non-Javadoc)
	 * @see site.yolowa.dao.ClaimDAO#selectAdminReivewClaimCard()
	 */
	@Override
	public List<AdminCard> selectAdminReivewClaimCard(){
			return sqlSession.getMapper(AdminMapper.class).selectAdminReivewClaimCard();
	}

	@Override
	public int insertClaimDetail(Claim claim) {
		return sqlSession.getMapper(MainClaimMapper.class).insertClaimDetail(claim);
	}

	@Override
	public int insertClaimGuest(Claim claim) {
		return sqlSession.getMapper(MainClaimMapper.class).insertClaimGuest(claim);
	}

	@Override
	public int insertClaimComment(Claim claim) {
		return sqlSession.getMapper(MainCommentMapper.class).insertClaimComment(claim);
	}

	@Override
	public Claim selectClaimReviewNo(int reviewNo) {
		return sqlSession.getMapper(MainCommentMapper.class).selectClaimReviewNo(reviewNo);
	}
}