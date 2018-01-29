package com.seung.web1.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seung.web1.user.dao.UserDAO;
import com.seung.web1.user.vo.User;

@Controller
@RequestMapping(value="user")
public class UserInfoViewController {

	@Autowired
	UserDAO dao;
	
	@RequestMapping(value="infoForm", method=RequestMethod.GET)
	public String infoForm(Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		User user = dao.idSearch(id); 
		
		model.addAttribute("user", user);
		
		return "user/infoForm";
	}
	
	@RequestMapping(value="profileChange", method=RequestMethod.GET)
	public String profileChange() {
		
		return "user/profileForm";
	}
}
