package site.yolowa.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//로그인 관련 권한 처리를 위한 인터셉터 클래스
//=> 로그인 사용자가 아닌 경우 로그인을 하기위해 메인 페이지(localhost:8000/yolowa)로 이동
//=> 로그인 성공 후 기존 요청 페이지로 응답되도록 설정 
public class LoginAuthInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		
		if(session.getAttribute("loginMember")==null) {
			String url=request.getRequestURI().substring(request.getContextPath().length());
			String query=request.getQueryString();
			if(query==null) {
				query="";
			} else {
				query="?"+query;
			}
			
			if(request.getMethod().equals("GET")) {
				session.setAttribute("destURI", url+query);
			}
			
			response.sendRedirect(request.getContextPath()+"/");
			return false;
			
		}
		return true;
	}
}
