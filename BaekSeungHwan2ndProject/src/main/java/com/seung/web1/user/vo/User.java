package com.seung.web1.user.vo;

public class User {
	private String id;
	private String password;
	private String name;
	private String location;
	private String img;
	private String indate;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String id, String password, String name, String location, String img, String indate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.location = location;
		this.img = img;
		this.indate = indate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", location=" + location + ", img="
				+ img + ", indate=" + indate + "]";
	}
	
	
}
