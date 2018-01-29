package com.seung.web1.group.vo;

public class Group {
	private int groupnum;
	private String name;
	private String master;
	private String introduce;
	private String subject;
	private String img;
	
	public Group() {
		// TODO Auto-generated constructor stub
	}

	public Group(int groupnum, String name, String master, String introduce, String subject, String img) {
		super();
		this.groupnum = groupnum;
		this.name = name;
		this.master = master;
		this.introduce = introduce;
		this.subject = subject;
		this.img = img;
	}

	public int getGroupnum() {
		return groupnum;
	}

	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Group [groupnum=" + groupnum + ", name=" + name + ", master=" + master + ", introduce=" + introduce
				+ ", subject=" + subject + ", img=" + img + "]";
	}
	
	
}
