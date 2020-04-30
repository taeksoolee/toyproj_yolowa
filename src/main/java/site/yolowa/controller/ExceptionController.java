package site.yolowa.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import site.yolowa.bean.Response;
import site.yolowa.exception.AjaxException;
import site.yolowa.exception.MemberAdminNotFoundException;
import site.yolowa.exception.MemberInfoNotFoundException;

@ControllerAdvice
public class ExceptionController {
	@ExceptionHandler(MemberAdminNotFoundException.class)
	 public String memberAdminNotFoundExceptionHandler(MemberAdminNotFoundException memberAdminNotFoundException, Model model) {
		memberAdminNotFoundException.printStackTrace();
		model.addAttribute("message", memberAdminNotFoundException.getMessage());
		return "main/error";
	 }
	
	@ExceptionHandler(MemberInfoNotFoundException.class)
	public String memberInfoNotFoundExceptionHandler(MemberInfoNotFoundException memberInfoNotFoundException, Model model) {
		memberInfoNotFoundException.printStackTrace();
		model.addAttribute("message", memberInfoNotFoundException.getMessage());
		return "main/error";
	}
	
	@ExceptionHandler(AjaxException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	@ResponseBody
	public Map<String, Object> AjaxExceptionHandler(HttpServletResponse response, AjaxException e) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", e.getMessage());
		map.put("type", e.getType());
		return map;
	}
	 
}
