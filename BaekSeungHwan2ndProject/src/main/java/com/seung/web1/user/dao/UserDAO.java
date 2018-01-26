package com.seung.web1.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seung.web1.user.vo.User;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSession session;
	
	public User idSearch(String id) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		User user = null;
		try {
			user = mapper.idSearch(id);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return user;
	}
	
	public int insertUser(User user) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertUser(user);
		} catch (Exception e) {
			e.getStackTrace();
			// TODO: handle exception
		}
		return result;
	}
}
