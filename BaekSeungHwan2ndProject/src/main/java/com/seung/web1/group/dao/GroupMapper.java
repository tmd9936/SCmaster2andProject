package com.seung.web1.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.seung.web1.group.vo.Group;

public interface GroupMapper {
	//그룹 생성 <insert id="insertGroup" parameterType="group">
	public int insertGroup(Group group);
	
	//그룹에 사용자 넣기 <insert id="groupAddUser">
	public int groupAddUser(HashMap<String, Object> map);
	
	//사용자가 가입된 그룹 <select id="myGroupList" resultType="group" parameterType="string">
	public ArrayList<Group> myGroupList(String id);
	
	//그룹 한 개 가져오기 <select id="selectGroupOne" resultType="group">
	public Group selectGroupOne(int groupnum);
}
