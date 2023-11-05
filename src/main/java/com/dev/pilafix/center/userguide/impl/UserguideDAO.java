package com.dev.pilafix.center.userguide.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.userguide.UserguideVO;


@Repository
public class UserguideDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<UserguideVO> getUserguideList(){
		return sqlSessionTemplate.selectList("UserguideDAO.getUserguideList");
	}
	
	public UserguideVO getUserguide(int ugCode) {
	    return sqlSessionTemplate.selectOne("UserguideDAO.getUserguide",ugCode);
	}
	
	public int insertUserguide(UserguideVO vo) {
		return sqlSessionTemplate.insert("UserguideDAO.insertUserguide", vo);
	}
	
	public int updateUserguide(UserguideVO vo) {
		return sqlSessionTemplate.update("UserguideDAO.updateUserguide", vo);
	}
	
	public int deleteUserguide(int ugCode) {
		return sqlSessionTemplate.delete("UserguideDAO.deleteUserguide", ugCode);
	}
	
	
}
