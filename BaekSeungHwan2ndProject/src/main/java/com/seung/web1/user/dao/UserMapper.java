package com.seung.web1.user.dao;

import com.seung.web1.user.vo.User;

public interface UserMapper {
	//아이디 검사 <select id="idSearch" parameterType="string">
	public User idSearch(String id);
	
	//유저 등록 <insert id="insertUser" parameterType="user">
	public int insertUser(User user);
}
