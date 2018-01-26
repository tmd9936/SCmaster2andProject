package com.seung.web1.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seung.web1.user.dao.UserDAO;
import com.seung.web1.user.vo.User;

@Controller
@RequestMapping(value="user")
public class UserLoginRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginRestController.class);
	
	@Autowired
	UserDAO dao;
	
	@ResponseBody
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public String loginCheck(@RequestBody User user) {
		logger.info("로그인 체크 시작");
		
		String str = "?";
		User resultUser = dao.idSearch(user.getId());
		
		if(resultUser == null) {
			str = "no";
			return str;
		}
		
		if(!resultUser.getPassword().equals(user.getPassword())) {
			str = "no";
		}else {	
			str = "yes";
		}
		
		
		logger.info("로그인 체크 종료");
		return str;
	}
	
	@RequestMapping(value="userLogin", method=RequestMethod.POST)
	public String userLogin(HttpServletRequest request,User u) {
		logger.info("로그인 시작");
		User user = dao.idSearch(u.getId());
		
		HttpSession session = request.getSession();
		session.setAttribute("id", user.getId());
		session.setAttribute("name", user.getName());
		session.setAttribute("img", user.getImg());
		
		logger.info("로그인 종료");
		return "redirect:/";
	}
}
