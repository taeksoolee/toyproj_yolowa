package site.yolowa.mapper;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminCard;
import site.yolowa.dto.AdminChart;
import site.yolowa.dto.AdminClaimReview;
import site.yolowa.dto.AdminDashBoardTable;
import site.yolowa.dto.AdminHostingMemberDetail;
import site.yolowa.dto.AdminHostingReservationDetail;
import site.yolowa.dto.AdminHostingTable;
import site.yolowa.dto.AdminMemberDetail;
import site.yolowa.dto.AdminMemberTable;
import site.yolowa.dto.Board;
import site.yolowa.dto.Claim;
import site.yolowa.dto.Member;
import site.yolowa.dto.Message;
import site.yolowa.dto.Range;
import site.yolowa.dto.Reservation;
import site.yolowa.dto.Review;

public interface AdminMapper {
	//setting test
	List<Member> selectAllMember();
	
	// member
	List<AdminMemberTable> selectAdminMemberTable(Map<String, Object> map);
	Member selectNoMember(int memberNo);
	int updateMemberForbiddenDate(Member member);
	int updateMemberForbiddenDateReset(int memberNo);
	List<AdminChart> selectAdminMemberJoinChart(Range range);
	List<AdminCard> selectAdminJoinMemberCard();
	List<AdminCard> selectAdminStateMemberCard();
	AdminMemberDetail selectAdminMemberDetail(int memberNo);
	int updateMemberMemo(Member member);
	int AdminHostingMemberDetailNo(int memberNo);
	AdminHostingMemberDetail selectAdminMemberHostingDetail(int memberNo);
	List<String> selectMemberMailing();
	
	
	//hosting
	List<AdminHostingTable> selectAdminHostingTable(Map<String, Object> map);
	List<AdminChart> selectAdminHostingChart(Range range);
	List<AdminCard> selectAdminApplyHostingCard();
	List<AdminCard> selectAdminStateHostingCard();
	AdminHostingReservationDetail selectAdminHostingDetail(int hostingNo);
	
	// reservation
	List<AdminChart> selectAdminSalesChart(Range range);
	List<AdminDashBoardTable> selectAdminDashBoardTable(Range Range);
	List<Reservation> selectAdminReservationTable(Map<String, Object> map);
	
	//message
	List<Message> selectAdminMessageTable(Map<String, Object> map);
	int insertAdminMessage(Message message);
	int updateAdminMessageState(int messagerNo);
	
	//claim
	List<Claim> selectAdminClaimUserTable(Map<String, Object> map);
	int updateClaimState(Claim claim);
	List<AdminClaimReview> selectAdminClaimReviewTable(Map<String, Object> map);
	List<AdminChart> selectAdminClaimChart(Range range);
	List<AdminCard> selectAdminToGuestClaimCard();
	List<AdminCard> selectAdminToHostClaimCard();
	List<AdminCard> selectAdminReivewClaimCard();
	
	//review
	int updateReviewStateStop(Review review);
	int updateReviewStatePost(Review review);
	
	//board
	List<Board> selectAllBoard(Map<String, Object> map);
	
	//게시판
	int insertAdminBoardNotice(Board board);
	int updateAdminBoardNoticeContent(Board board);
	List<Board> selectAdminEtcNotice(Map<String, Object> map);
	//int updateAdminBoardNoticeState(Board board);
	
	Board selectBoardCategoryTitleEqual(Board board);
	List<Board> selectBoardCategoryTitleLike(Board board);
	
	//도움말
	int insertAdminBoardHelp(Board board);
	int updateAdminBoardHelpContent(Board board);
	List<Board> selectAdminEtcHelp(Map<String, Object> map);
	//int updateAdminBoardHelpState(Board board);
	
	Board selectBoardHelpCategoryTitleEqual(Board board);
	List<Board> selectBoardHelpCategoryTitleLike(Board board);
	
	//게시판, 도움말 공통
	Board selectBoardNo(int boardNo);
	int updateAdminBoardState(Board board);
	
	
	//약관관리
	int insertAdminBoardTerms(Board board);
	int updateAdminBoardTermsContent(Board board);
	Board selectBoardTermsCategoryEqual(Board board);
	
	
}
