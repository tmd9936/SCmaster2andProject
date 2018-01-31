package com.seung.web1.board.vo;

import java.util.ArrayList;

public class Board {
	private int boardnum;
	private int groupnum;
	private String id;
	private String content;
	private String inputdate;
	private String originalfile;
	private String savedfile;
	
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int boardnum, int groupnum, String id, String content, String inputdate, String originalfile,
			String savedfile) {
		super();
		this.boardnum = boardnum;
		this.groupnum = groupnum;
		this.id = id;
		this.content = content;
		this.inputdate = inputdate;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public int getGroupnum() {
		return groupnum;
	}

	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", groupnum=" + groupnum + ", id=" + id + ", content=" + content
				+ ", inputdate=" + inputdate + ", originalfile=" + originalfile + ", savedfile=" + savedfile + "]";
	}
	
	
}