package com.seung.web1.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.seung.web1.board.vo.Board;
import com.seung.web1.board.vo.Reply;

public interface BoardMapper {
	//<insert id="insertBoard" parameterType="board">
	public int insertBoard(Board board);
	
	//<select id="boardList" resultType="board">
	public ArrayList<HashMap<String, Object>> boardList(int groupnum);
	
	//<select id="selectBoard" resultType="board">
	public Board selectBoard(int boardnum);
	
	//<delete id="deleteBoard" parameterType="int">
	public int deleteBoard(Board board);
	
	//<update id="updateBoard" parameterType="board">
	public int updateBoard(Board board);
	
	//<insert id="insertReply" parameterType="reply"> 리플 넣기
	public int insertReply(Reply reply);
	
	//<select id="getReplyListById" resultType="reply">
	public ArrayList<Reply> getReplyListById(int boardnum);
	
	//<delete id="deleteReply" parameterType="reply">
	public int deleteReply(Reply reply);
	
	//<update id="updateReply" parameterMap="reply">
	public int updateReply(Reply reply);
}
