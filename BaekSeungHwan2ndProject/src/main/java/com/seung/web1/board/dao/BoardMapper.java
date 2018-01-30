package com.seung.web1.board.dao;

import java.util.ArrayList;

import com.seung.web1.board.vo.Board;

public interface BoardMapper {
	//<insert id="insertBoard" parameterType="board">
	public int insertBoard(Board board);
	
	//<select id="boardList" resultType="board">
	public ArrayList<Board> boardList(int groupnum);
	
	//<select id="selectBoard" resultType="board">
	public Board selectBoard(int boardnum);
	
	//<delete id="deleteBoard" parameterType="int">
	public int deleteBoard(int boardnum);
}
