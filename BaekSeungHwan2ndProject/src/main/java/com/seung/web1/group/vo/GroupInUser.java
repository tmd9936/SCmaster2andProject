package com.seung.web1.group.vo;

public class GroupInUser {
	private int groupnum;
	private String id;
	
	public GroupInUser() {
		// TODO Auto-generated constructor stub
	}

	public GroupInUser(int groupnum, String id) {
		super();
		this.groupnum = groupnum;
		this.id = id;
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

	@Override
	public String toString() {
		return "GroupInUser [groupnum=" + groupnum + ", id=" + id + "]";
	}
	
	
}
