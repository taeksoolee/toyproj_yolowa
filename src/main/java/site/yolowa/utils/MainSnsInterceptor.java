package site.yolowa.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import site.yolowa.service.AdminEtcService;

public class MainSnsInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private AdminEtcService adminEtcService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
		if(request != null && modelAndView != null) {
			modelAndView.addObject("sns", adminEtcService.getAdminSns(request));
		}
	}

}
