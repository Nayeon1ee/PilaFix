package com.dev.pilafix.admin.center_manage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.center_manage.CenterVO;
import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;


@Repository
public class CenterDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterVO> getCenterList(){
		return sqlSessionTemplate.selectList("CenterDAO.getCenterList");
	}
	
	public CenterVO getCenter(int ctCode) {
	    return sqlSessionTemplate.selectOne("CenterDAO.getCenter",ctCode);
	}
	
	
	public int insertCenter(CenterVO vo) {
		return sqlSessionTemplate.insert("CenterDAO.insertCenter", vo);
	}
	
	public int updateCenter(CenterVO vo) {
		return sqlSessionTemplate.update("CenterDAO.updateCenter", vo);
	}
	
	public int deleteCenter(int ctCode) {
		return sqlSessionTemplate.delete("CenterDAO.deleteCenter", ctCode);
	}

	public int ctIdCheck(String ctId) {
		return sqlSessionTemplate.selectOne("CenterDAO.ctIdCheck",ctId);
	}

	public int sendEmail(SendEmailHistoryVO email) {
		return sqlSessionTemplate.insert("CenterDAO.insertSendEmailHistory",email);
	}
	
	public void revokeCenter(int ctCode) {
		sqlSessionTemplate.update("CenterDAO.updateContractRevokeYN", ctCode);
	}
	
	public void resetPassword(int ctCode) {
		sqlSessionTemplate.update("CenterDAO.resetPassword", ctCode);
	}
	

}
