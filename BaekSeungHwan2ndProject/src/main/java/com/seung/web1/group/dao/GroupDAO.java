package com.seung.web1.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seung.web1.group.vo.Group;

@Repository
public class GroupDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertGroup(Group group) {
		GroupMapper mapper = session.getMapper(GroupMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.insertGroup(group);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public int groupAddUser(HashMap<String, Object> map) {
		GroupMapper mapper = session.getMapper(GroupMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.groupAddUser(map);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return result;
	}
	
	public ArrayList<Group> myGroupList(String id){
		GroupMapper mapper = session.getMapper(GroupMapper.class);
		
		ArrayList<Group> list = null;
		
		try {
			list = mapper.myGroupList(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	public Group selectGroupOne(int groupnum) {
		GroupMapper mapper = session.getMapper(GroupMapper.class);
		
		Group group = null;
		
		try {
			group = mapper.selectGroupOne(groupnum);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return group;
	}
}








