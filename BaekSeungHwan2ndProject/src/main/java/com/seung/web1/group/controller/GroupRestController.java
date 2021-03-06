package com.seung.web1.group.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seung.web1.group.dao.GroupDAO;
import com.seung.web1.group.vo.Group;

@Controller
@RequestMapping(value="group")
public class GroupRestController {
	
	@Autowired
	GroupDAO dao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(GroupRestController.class);
	
	final String uploadPath = "/groupImg";
	
	@ResponseBody
	@RequestMapping(value="make", method=RequestMethod.POST)
	public void make(@RequestBody Group group,HttpSession session) {
		logger.info("그룹 생성 시작");
		System.out.println(dao.insertGroup(group));
		int groupnum = group.getGroupnum();
		String id = (String)session.getAttribute("id");
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("groupnum", groupnum);
		map.put("id", id);
		
		System.out.println(dao.groupAddUser(map));
		
		logger.info("그룹 생성 종료");
	}
	
	@ResponseBody
	@RequestMapping(value="myGroupList", method=RequestMethod.GET)
	public ArrayList<Group> myGroupList(HttpSession session) {
		logger.info("내가 가입한 그룹 가져오기 시작");
		String id = (String)session.getAttribute("id");
		
		ArrayList<Group> list = dao.myGroupList(id);
		 
		logger.info("내가 가입한 그룹 가져오기 종료");
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="searchBySubject", method=RequestMethod.GET)
	public ArrayList<Group> searchBySubject(String subject){
		logger.info("주제별 찾아오기 시작");
		
		ArrayList<Group> list = dao.searchBySubject(subject);
		
		logger.info("주제별 찾아오기 종료");
		return list;
	}
	
	@RequestMapping(value="groupAddUser", method=RequestMethod.GET)
	public String groupAddUser(int groupnum, HttpSession session,Model model) {
		logger.info("그룹 가입 시작");
		String id = (String)session.getAttribute("id");
		HashMap<String, Object> map = new HashMap<>();
		map.put("groupnum", groupnum);
		map.put("id", id);
	
		System.out.println(dao.groupAddUser(map));
		
		model.addAttribute("groupnum", groupnum);
		logger.info("그룹 가입 종료");
		return "redirect:groupForm";
	}
}
