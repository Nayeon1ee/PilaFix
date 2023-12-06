package com.dev.pilafix.center.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.info.CenterInfoVO;

@Repository
public class CenterInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterInfoVO> getCenterInfoList(int ctCode){
		return sqlSessionTemplate.selectList("CenterInfoDAO.getCenterInfoList", ctCode);
	}
	
	public CenterInfoVO getCenterInfo(int icNumber) {
	    return sqlSessionTemplate.selectOne("CenterInfoDAO.getCenterInfo",icNumber);
	}
	
	public int insertCenterInfo(CenterInfoVO vo) {
		return sqlSessionTemplate.insert("CenterInfoDAO.insertCenterInfo", vo);
	}

	
	public int updateCenterInfo(CenterInfoVO vo) {
		return sqlSessionTemplate.update("CenterInfoDAO.updateCenterInfo", vo);
	}
	
	public int deleteCenterInfo(int icNumber) {
		return sqlSessionTemplate.delete("CenterInfoDAO.deleteCenterInfo", icNumber);
	}
	
	public int updateCenterInfoViewCnt(int icNumber) {
		return sqlSessionTemplate.update("CenterInfoDAO.updateCenterInfoViewCnt", icNumber);
	}
}