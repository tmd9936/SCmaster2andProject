package com.seung.web1.group.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seung.web1.group.dao.GroupDAO;
import com.seung.web1.group.vo.Group;

@Controller
@RequestMapping(value="group")
public class GroupViewController {
	
	@Autowired
	GroupDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupViewController.class);
	
	@RequestMapping(value="groupForm", method=RequestMethod.GET)
	public String groupForm(Model model,int groupnum) {
		logger.info("그룹 폼 시작");
		Group group = dao.selectGroupOne(groupnum);
		
		model.addAttribute("group", group);
		logger.info("그룹 폼 종료");
		return "group/groupForm";
	}
	
}
