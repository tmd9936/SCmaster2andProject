package com.seung.web1.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seung.web1.board.vo.Board;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertBoard(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.insertBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public ArrayList<Board> boardList(int groupnum){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		ArrayList<Board> list = null;
		
		try {
			list = mapper.boardList(groupnum);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return list;
	}
	
	public Board selectBoard(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		Board board = null;
		try {
			board = mapper.selectBoard(boardnum);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return board;
	}
	
	public int deleteBoard(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.deleteBoard(boardnum);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
}
