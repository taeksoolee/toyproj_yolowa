package site.yolowa.service;

import site.yolowa.dto.AdminHostingMemberDetail;
import site.yolowa.dto.AdminHostingReservationDetail;
import site.yolowa.dto.AdminMemberDetail;
import site.yolowa.dto.Member;

public interface AdminComponentService {
	AdminMemberDetail getAdminMemberComponent(int memberNo);
	AdminHostingMemberDetail getAdminHostingMemberHComponent(int hostingNo);
	AdminHostingMemberDetail getAdminHostingMemberMComponent(int memberNo);
	AdminHostingReservationDetail getAdminHostingComponent(int hostingNo);
	int modifyMemberMemo(Member member);
	String modifyMemberForbiddenDate(Member member, int plus);
	String modifyMemberForbiddenDateReset(int memberNo);
}