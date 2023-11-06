package com.dev.pilafix.admin.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.info.AdminInfoVO;

@Repository
public class AdminInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminInfoVO> getInfoList(){
		return sqlSessionTemplate.selectList("InfoDAO.getInfoList");
	}
	
	public AdminInfoVO getInfo(int seq) {
	    return sqlSessionTemplate.selectOne("InfoDAO.getInfo",seq);
	}
	
	public int insertInfo(AdminInfoVO vo) {
		return sqlSessionTemplate.insert("InfoDAO.insertInfo", vo);
	}
	
	public int updateInfo(AdminInfoVO vo) {
		return sqlSessionTemplate.update("InfoDAO.updateInfo", vo);
	}
	
	public int deleteInfo(int seq) {
		return sqlSessionTemplate.delete("InfoDAO.deleteInfo", seq);
	}
}
