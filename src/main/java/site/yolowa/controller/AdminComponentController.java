package site.yolowa.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import site.yolowa.dto.AdminHostingMemberDetail;
import site.yolowa.dto.AdminHostingReservationDetail;
import site.yolowa.dto.AdminMemberDetail;
import site.yolowa.dto.Member;
import site.yolowa.service.AdminComponentService;

//관리자페이지 컴포넌트 관련 Rest 서비스를 제공하는 컨트롤러
@RestController
public class AdminComponentController {
	@Autowired
	private AdminComponentService adminComponentService;
	
	@RequestMapping(value = "/rest/admin/component/member/{memberNo}", method = RequestMethod.POST)
	public AdminMemberDetail componentMember(@PathVariable("memberNo") int memberNo){
		return adminComponentService.getAdminMemberComponent(memberNo);
	}
	
	@RequestMapping(value = "/rest/admin/component/hosting/member/h/{hostingNo}", method = RequestMethod.POST)
	public AdminHostingMemberDetail componentHostingMemberHComponent(@PathVariable("hostingNo") int hostingNo){
		return adminComponentService.getAdminHostingMemberHComponent(hostingNo);
	}
	
	@RequestMapping(value = "/rest/admin/component/hosting/member/m/{memberNo}", method = RequestMethod.POST)
	public AdminHostingMemberDetail componentHostingMemberMComponent(@PathVariable("memberNo") int memberNo){
		return adminComponentService.getAdminHostingMemberMComponent(memberNo);
	}
	
	@RequestMapping(value = "/rest/admin/component/hosting/{hostingNo}", method = RequestMethod.POST)
	public AdminHostingReservationDetail componentHostingComponent(@PathVariable("hostingNo") int hostingNo){
		return adminComponentService.getAdminHostingComponent(hostingNo);
	}
	
	@RequestMapping(value = "/rest/admin/component/member/memo", method = RequestMethod.POST)
	public int AdminMemberMemoUpdate(@RequestBody Member member) {
		return adminComponentService.modifyMemberMemo(member);
	}
	
	@RequestMapping(value = "/rest/admin/component/member/forebiddendate/{plus}", method = RequestMethod.POST)
	public String AdminMemberForbiddenDateUpdate(@RequestBody Member member, @PathVariable("plus") int plus) {
		String result = adminComponentService.modifyMemberForbiddenDate(member, plus);
		return result;
	}
	
	@RequestMapping(value = "/rest/admin/component/member/forebiddendate/reset/{memeberNo}", method = RequestMethod.POST)
	public String AdminMemberForbiddenDateUpdate(@PathVariable("memeberNo") int memberNo) {
		return adminComponentService.modifyMemberForbiddenDateReset(memberNo);
	}
}