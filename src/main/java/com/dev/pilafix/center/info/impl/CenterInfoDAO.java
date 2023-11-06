package com.dev.pilafix.center.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.info.CenterInfoVO;

@Repository
public class CenterInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterInfoVO> getCenterInfoList(){
		return sqlSessionTemplate.selectList("CenterInfoDAO.getCenterInfoList");
	}
	
	public CenterInfoVO getCenterInfo(int seq) {
	    return sqlSessionTemplate.selectOne("CenterInfoDAO.getCenterInfo",seq);
	}
	
	public int insertCenterInfo(CenterInfoVO vo) {
		return sqlSessionTemplate.insert("CenterInfoDAO.insertCenterInfo", vo);
	}
	
	public int updateCenterInfo(CenterInfoVO vo) {
		return sqlSessionTemplate.update("CenterInfoDAO.updateCenterInfo", vo);
	}
	
	public int deleteCenterInfo(int seq) {
		return sqlSessionTemplate.delete("CenterInfoDAO.deleteCenterInfo", seq);
	}
}
