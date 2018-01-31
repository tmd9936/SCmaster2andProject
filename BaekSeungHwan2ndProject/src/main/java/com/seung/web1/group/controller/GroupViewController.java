package com.seung.web1.group.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seung.web1.board.dao.BoardDAO;
import com.seung.web1.board.vo.Board;
import com.seung.web1.group.dao.GroupDAO;
import com.seung.web1.group.vo.Group;
import com.seung.web1.user.vo.User;

@Controller
@RequestMapping(value="group")
public class GroupViewController {
	
	@Autowired
	GroupDAO dao;
	
	@Autowired
	BoardDAO boardDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupViewController.class);
	
	@RequestMapping(value="groupForm", method=RequestMethod.GET)
	public String groupForm(Model model,int groupnum,HttpSession session) {
		logger.info("그룹 폼 시작");
		Group group = dao.selectGroupOne(groupnum);
		
		logger.debug("그룹의 가입된 유저 가져오기");
		ArrayList<User> list = dao.groupInUserList(groupnum);
		String loginId = (String)session.getAttribute("id");
		String member = "unknown";
		
		if(loginId != null) {
			member = "memberNo";
			for (User user : list) {
				if(user.getId().equals(loginId)) {
					member = "memberYes";
				}
			}	
		}
		
		int boardLength = 0;
		List<HashMap<String, Object>> boardList =  boardDAO.boardList(groupnum);
		if(boardList.size() <4) {
			boardLength = boardList.size();
		}else {
			boardLength = 4;
		}
		List<HashMap<String, Object>> boardList2 = boardList.subList(0, boardLength);
		
		//System.out.println(boardList);
		model.addAttribute("boardList", boardList2);	
		model.addAttribute("member", member);
		model.addAttribute("group", group);
		logger.info("그룹 폼 종료");
		
		return "group/groupForm";
	}
	
}
