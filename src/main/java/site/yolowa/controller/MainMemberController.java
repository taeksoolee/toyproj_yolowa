package site.yolowa.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import site.yolowa.dto.Board;
import site.yolowa.dto.Member;
import site.yolowa.service.MainMemberService;
import site.yolowa.service.MainServiceTermsService;
import site.yolowa.utils.AdminUtil;
import site.yolowa.utils.MainEncrypt;

@Controller
public class MainMemberController implements ApplicationContextAware {
	@Autowired
	private MainServiceTermsService mainServicetermsService;
	
	
	@Autowired
	private MainMemberService mainMemberService;
		
	@Autowired
	private AdminUtil util;
	
	private WebApplicationContext context;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		context=(WebApplicationContext)applicationContext;
	}
	
	@RequestMapping(value = "rePassword", method = RequestMethod.POST)
	@ResponseBody
	public String rePassword(@RequestBody Member member) throws MessagingException {
		String inputEmail=member.getMemberEmail();	
	
		Member searchMember=mainMemberService.selectMember(inputEmail);	
		
		if(searchMember==null) {
			return "false";
		}	
		
		
		String newPassword=UUID.randomUUID().toString().replace("-", "").substring(0, 10).toUpperCase();		
		String encNewPassword=MainEncrypt.encrypt(newPassword);				
		searchMember.setMemberPassword(encNewPassword);			
		mainMemberService.newPassword(searchMember);		
		String subject="yolowa계정의 임시비밀번호 발송 안내 메일";		
		String content="yolowa의 새로운 임시비밀번호입니다.<br><br>"+newPassword+"<br><br>임시비밀번호로 로그인 후 비밀번호를 변경해주세요.";	
		util.sendEmail(inputEmail, subject, content);	
		
		return "success";

				
	}
	
	//return "loginPage";
	
	
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "main/loginPage";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String email,String password, Model model, HttpSession session, String rememberYolowa, HttpServletResponse response,
				HttpServletRequest request) {
			
		if(rememberYolowa!=null) {
			Cookie auto=new Cookie("rememberYolowa", email);			
			int max=2147483647;			
			auto.setMaxAge(max);			
			response.addCookie(auto);
			
		} else if(rememberYolowa==null) {
			Cookie delete=new Cookie("rememberYolowa", null);
			delete.setMaxAge(0);
			response.addCookie(delete);
		}
		
		
		Member member=mainMemberService.selectMember(email);		
		
		String inputPass=MainEncrypt.encrypt(password);	
		
		
		
		if(member==null || !member.getMemberPassword().equals(inputPass)) {
			return "redirect:/";			
		}
		
		
		
		mainMemberService.updateJoinDate(email);
		session.setAttribute("loginMember", member);		
		
	
		if(session.getAttribute("destURI")!=null) {
			String destURI=(String)session.getAttribute("destURI");
			session.removeAttribute("destURI");
			return "redirect:"+destURI;
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "loginSubmit", method = RequestMethod.POST)
	@ResponseBody
	public String loginSubmit(@RequestBody Member member) {
		String inputEmail=member.getMemberEmail();
		String inputPassword=MainEncrypt.encrypt(member.getMemberPassword());		
		
		Member joinMember=mainMemberService.selectMember(inputEmail);

		if(inputEmail=="" || member.getMemberPassword()=="") {
			return "noContent";
		} else if(joinMember==null || !inputPassword.equals(joinMember.getMemberPassword()) || joinMember.getMemberState()==0) {
			return "noMatch";			
		} else if(joinMember.getMemberState()==2) {
			return "disabled";			
		} else {
			return "success";			
		}		
	}
	
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session,HttpServletResponse response) {
		session.invalidate();			
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String join(Board board, Model model) {		
		
		
			board.setBoardCategory(1);
			Board term = mainServicetermsService.getMainServiceTerms(board);
			String terms = "";
			String noTagTerms = "";
			String previewTerms = "";
			if(term != null) {
				terms= term.getBoardContent().toString();
				noTagTerms=terms.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
				previewTerms=noTagTerms.substring(0,60)+"....";
				//model.addAttribute("terms", mainServicetermsService.getMainServiceTerms(board));
			}
					
			model.addAttribute("terms",terms);
			model.addAttribute("previewTerms",previewTerms);	
			
				
			
		
		
			return "register";
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)	
	public String join(@RequestParam String name, String birthday, String email, String password, String mailingConfirm, HttpSession session ) {
	
		Member member=new Member();
		
		String inputPass=MainEncrypt.encrypt(password);
				
		member.setMemberName(name);
		member.setMemberBirthday(birthday);
		member.setMemberEmail(email);
		member.setMemberPassword(inputPass);
		member.setMemberState(1);				
			
		mainMemberService.insertMember(member);	
		
				
		return "redirect:/";
	}
	
	@RequestMapping(value = "mypage/user-profile", method = RequestMethod.GET)
	public String profile(HttpSession session,Model model) {
		Member member=(Member)session.getAttribute("loginMember");
		
		if(member==null) {			
			return "main/404";
		}
		
		
		String imagePath=member.getMemberImage();		
		
		if(imagePath!=null) {			
			model.addAttribute("imagePath",imagePath);
		}
		
		
		String photoMsg=(String)session.getAttribute("photoMsg");
		
		if(photoMsg!=null) {
			model.addAttribute("photoMsg",photoMsg);
			session.removeAttribute("photoMsg");
		} else {
			model.addAttribute("photoMsg","");			
		}
		
		
		
		
		model.addAttribute("name",member.getMemberName());
		model.addAttribute("birthday",member.getMemberBirthday());
		model.addAttribute("email",member.getMemberEmail());		
		if(member.getMemberPhone()!=null) model.addAttribute("phone",member.getMemberPhone());		
		model.addAttribute("sex",member.getMemberSex());		
		model.addAttribute("mailing",member.getMemberMailing());
		model.addAttribute("profile",member.getMemberProfile());
		
	
		return "mypage/user-profile";
	}
	
	
	
	@RequestMapping(value = "mypage/user-profile", method = RequestMethod.POST)
	public String profileSubmit(HttpSession session,Model model, String name, String birthday, String phone
			, String email, String sex, String mailing, String profile, String msg
			, String address, String detailAddress, String extraAddress, String postcode, String old_password, String new_password
			, String confirm_password, String old_email, String new_email, String confirm_new_email  ) {
		
		Member member=(Member)session.getAttribute("loginMember");		
				
		member.setMemberName(name);
		member.setMemberBirthday(birthday);
		member.setMemberPhone(phone);	
		member.setMemberSex(Integer.parseInt(sex));
		member.setMemberMailing(Integer.parseInt(mailing));
		member.setMemberProfile(profile);
		
		String[] addressTemp = {address,detailAddress,extraAddress,postcode};
		
		if(address!="" || detailAddress!="") {
			
			for(int i=0; i<addressTemp.length; i++) {			
				if(addressTemp[i]==null) {				
					addressTemp[i]="";
				}
			}
			
			String compAddress=addressTemp[0]+" "+addressTemp[1]+" "+addressTemp[2]+" / "+addressTemp[3];
			
			member.setMemberAddress(compAddress);
			
		}
		
		
		
				
		
		if(new_password!="") {
			member.setMemberPassword(MainEncrypt.encrypt(new_password));		
		}
		
		if(new_email!="") {			
			member.setMemberEmail(new_email);			
		}	
		
		mainMemberService.updateMember(member);	
		
		
		return "redirect:/mypage/user-profile";
	}
	
	@RequestMapping(value = "mypage/quit", method = RequestMethod.GET)
	@ResponseBody
	public String quit(HttpSession session) {
		Member member=(Member)session.getAttribute("loginMember");
		
		mainMemberService.removeMember(member.getMemberEmail());
		session.invalidate();
		
		return "success";	
	}
	
	@RequestMapping(value = "existCheck", method = RequestMethod.POST)
	@ResponseBody
	public String existCheck(@RequestBody Member member) {
		String inputEmail=member.getMemberEmail();
		
		Member checkmember=mainMemberService.selectMember(inputEmail);		
		
		if(checkmember==null) {			
			return "success";
		}			
		
		return "false";				
	}
	
	@RequestMapping(value="birthdayCheck", method = RequestMethod.POST)
	@ResponseBody
	public String birthdayCheck(@RequestBody Member member) {		
		String inputBirthday=member.getMemberBirthday();
		
		Date date=new Date();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		String now=sdf.format(date);
		
		
		
		int numBirthday=Integer.parseInt(inputBirthday.replace("-", ""));
		
		if((numBirthday+"").length()<8) {			
			return "false";
		} 
		
		String yearBirthday=(numBirthday+"").substring(0,4);		
		
		if(Integer.parseInt(yearBirthday)<1900) {
			return "false";
		}
		
		
		int numNow=Integer.parseInt(now);
		
		if((numBirthday-numNow)>0) {
			return "false";
		}
		
		return "success";		
	}
	
	@RequestMapping(value="passwordCheck", method = RequestMethod.POST)
	@ResponseBody
	public String passwordCheck(@RequestBody Member member) {	
		
				
		String email=member.getMemberEmail();		
		String inputPassword=member.getMemberPassword();		
	
		
		
		Member oldMember=mainMemberService.selectMember(email);
		
		if(inputPassword.equals("")) {
			inputPassword=oldMember.getMemberPassword();			
		} else {
			inputPassword=MainEncrypt.encrypt(inputPassword);		
		}		
		
		
		if(!oldMember.getMemberPassword().equals(inputPassword)) {			
			return "false";
		}		
		
		return "success";		
	}
	
	
	@RequestMapping(value = "mypage/profilePhoto", method = RequestMethod.POST)
	public String profilePhoto(@RequestParam MultipartFile imageFile
			, Model model, HttpSession session, String photoName) throws IllegalStateException, IOException {	

		Member member=(Member)session.getAttribute("loginMember");
		
		String uploadDirPath=context.getServletContext().getRealPath("/resources/img/member");
		
		
		String testName=imageFile.getOriginalFilename();
				
		
		//이미지파일이 해당 확장자면
		if(testName.endsWith(".jpg") || testName.endsWith(".png") || testName.endsWith(".jpeg") || testName.endsWith(".gif")) {
						
			
		
			
			
			//무작위 이름 imageFilename 생성
			String imageFilename=System.currentTimeMillis()+"";
			
			
			//현재의 member 인스턴스에 이미지컬럼값을 무작위이름으로 저장
			member.setMemberImage(imageFilename);
			
			//DB의 해당 이미지컬럼값을 변경
			mainMemberService.updateMemberImage(member);
			
			
			//새로운 파일 인스턴스 생성
			File file=new File(uploadDirPath, imageFilename);
			
			imageFile.transferTo(file);
			
			BufferedImage sourceImage=ImageIO.read(file);	
			
			model.addAttribute("imageFilename", sourceImage);					
			session.setAttribute("photoMsg", "이미지를 성공적으로 저장 하였습니다.");
			
			return "redirect:/mypage/user-profile";
			
		} 
			
		session.setAttribute("photoMsg", "jpg,png,jpeg,gif 형식의 파일만 저장 가능합니다.");
			
		
		
		return "redirect:/mypage/user-profile";
	}
	
	@RequestMapping (value = "mypage/profilePhotoRemove", method = RequestMethod.POST)
	public String profilePhotoRemove(HttpSession session, Model model) {
		Member member=(Member)session.getAttribute("loginMember");
			
		member.setMemberImage(null);
		
		mainMemberService.updateMemberImage(member);		
		
		session.setAttribute("photoMsg", "이미지를 성공적으로 삭제하였습니다.");
		
		return "redirect:/mypage/user-profile";
	}
	
	
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "loginPage";
	}
	
}

