package com.dev.pilafix.admin.center_manage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.common.member.CenterVO;


@Repository
public class CenterDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterVO> getCenterList(){
		return sqlSessionTemplate.selectList("CenterDAO.getCenterList");
	}
	
	public List<CenterVO> getExcelCenterList() {
		return sqlSessionTemplate.selectList("CenterDAO.getExelCenter");
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
	
	public int emailCheck(String ownerEmail) {
		return  sqlSessionTemplate.selectOne("CenterDAO.emailCheck",ownerEmail);
	}
	
	public int idCheck(String ctId) {
		return  sqlSessionTemplate.selectOne("CenterDAO.idCheck",ctId);
		  
	}


}