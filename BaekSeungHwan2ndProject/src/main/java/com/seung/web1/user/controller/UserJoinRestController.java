package com.seung.web1.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seung.web1.user.dao.UserDAO;
import com.seung.web1.user.vo.User;

@Controller
@RequestMapping(value="user")
public class UserJoinRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserJoinRestController.class);
	
	@Autowired
	UserDAO dao;
	
	
	@ResponseBody
	@RequestMapping(value="idCheak",method=RequestMethod.POST)
	public String idCheak(String id) {
		logger.info("아이디 검색 컨트롤러 시작");
		
		User user = null;
		user = dao.idSearch(id);
		String str = "??";
		if(user == null) {
			str = "yes";
		}
		else {
			str = "no";
		}
		System.out.println(str);
		logger.info("아이디 검색 컨트롤러 종료");
		return str;
	}
	
	@RequestMapping(value="insertUser", method=RequestMethod.POST)
	public String insertUser(@ModelAttribute User user,Model model) {
		System.out.println(user);
		int result = dao.insertUser(user);
		System.out.println(result);
		return "redirect:/";
	}
}
