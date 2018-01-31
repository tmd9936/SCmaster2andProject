package com.seung.web1.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seung.web1.board.dao.BoardDAO;
import com.seung.web1.board.vo.Board;

@Controller
@RequestMapping(value="board")
public class BoardViewController {

	private static final Logger logger = LoggerFactory.getLogger(BoardViewController.class);
	
	@Autowired
	BoardDAO dao;
	
	@RequestMapping(value="c", method=RequestMethod.GET)
	public String updateForm(int boardnum,Model model) {
		logger.info("보드폼 불러오기 시작");
		Board board = dao.selectBoard(boardnum);
		
		model.addAttribute("board",board);
		logger.info("보드폼 불러오기 종료");
		return "board/updateForm";
	}
}
