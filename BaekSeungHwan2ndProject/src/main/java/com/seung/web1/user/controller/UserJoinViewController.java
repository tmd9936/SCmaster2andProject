package com.seung.web1.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "user")
@SessionAttributes("user")
public class UserJoinViewController {

	private static final Logger logger = LoggerFactory.getLogger(UserJoinViewController.class);
	//private static final Logger logger = LoggerFactory.getLogger();
	@RequestMapping(value = "userJoin", method=RequestMethod.GET)
	public String userJoin() {
		logger.info("로그인 화면 시작");

		logger.info("로그인 화면 종료");
		return "user/userJoin";
	}
}
