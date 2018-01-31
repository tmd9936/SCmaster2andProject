package com.seung.web1.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//컨트롤러에서 에러가나면 여기로 넘어오게 하는 익셉션
@ControllerAdvice
public class WebExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public String errorHandler(Exception e) {
		e.printStackTrace();
		return "/error";
	}
}
