package site.yolowa.exception;

import org.springframework.http.HttpStatus;

public class AjaxException extends Exception{
	private static final long serialVersionUID = 1L;
	// 1 : 로그인 오류
	private int type;
	
	public AjaxException() {
		super();
	}
	
	public AjaxException(int type, String message) {
		super(message);
		this.type = type;
	}
	
	public AjaxException(Throwable e) {
		super(e);
	}
	
	public AjaxException(String message, Throwable e) {
		super(message, e);
	}

	public int getType() {
		return type;
	}
}
