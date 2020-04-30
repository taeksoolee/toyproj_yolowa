package site.yolowa.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import site.yolowa.dto.Member;
import site.yolowa.service.MainMemberServiceImpl;

public class MainMemberInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("인터셉터 접근");
		
		Cookie[] cookies = request.getCookies();
		String cookieName = "";
		String cookieValue = "";	
		
		if(cookies!=null) {
			System.out.println("쿠키있음 접근");
			for(Cookie cookie:cookies) {				
				if(cookie.getName().equals("autoLoginYolowa")) {
					cookieName = cookie.getName();
					cookieValue = cookie.getValue();
					break;
				}
			}
		
			MainMemberServiceImpl service=new MainMemberServiceImpl();
			HttpSession session=request.getSession();
			Member member=service.selectMember(cookieValue);
			session.setAttribute("loginMember", member);						
		}	
		
		return true;
	}
}
