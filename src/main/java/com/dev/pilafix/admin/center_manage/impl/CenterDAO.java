package com.dev.pilafix.admin.center_manage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.common.member.CenterVO;

@Repository
public class CenterDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CenterVO> getCenterList() {
		return sqlSessionTemplate.selectList("CenterDAO.getCenterList");
	}

	public CenterVO getCenter(int ctCode) {
		return sqlSessionTemplate.selectOne("CenterDAO.getCenter", ctCode);
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
		return sqlSessionTemplate.selectOne("CenterDAO.ctIdCheck", ctId);
	}

	public int sendEmail(SendEmailHistoryVO email) {
		return sqlSessionTemplate.insert("CenterDAO.insertSendEmailHistory", email);
	}

	public void revokeCenter(int ctCode) {
		sqlSessionTemplate.update("CenterDAO.updateContractRevokeYN", ctCode);
	}

	public void resetPassword(String pw, int ctCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("pw", pw);
		params.put("ctCode", ctCode);
		
		sqlSessionTemplate.update("CenterDAO.resetPassword", params);
	}

	public int emailCheck(String ownerEmail) {
		return sqlSessionTemplate.selectOne("CenterDAO.emailCheck", ownerEmail);
	}

	public int idCheck(String ctId) {
		return sqlSessionTemplate.selectOne("CenterDAO.idCheck", ctId);
	}

	public List<CenterVO> getExcelCenterList() {
		return sqlSessionTemplate.selectList("CenterDAO.getExelCenter");
	}


}