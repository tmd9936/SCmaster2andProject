package com.seung.web1.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seung.web1.board.vo.Board;
import com.seung.web1.board.vo.Reply;

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
	
	public ArrayList<HashMap<String, Object>> boardList(int groupnum){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		ArrayList<HashMap<String, Object>> list = null;
		
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
	
	public int deleteBoard(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.deleteBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public int updateBoard(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int result = 0;
		try {
			result = mapper.updateBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public int insertReply(Reply reply) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public ArrayList<Reply> getReplyListById(int boardnum){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		ArrayList<Reply> list = null;
		try {
			list = mapper.getReplyListById(boardnum);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	
	public int deleteReply(Reply reply) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.deleteReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public int updateReply(Reply reply) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int result = 0;
		try {
			result = mapper.updateReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
}




