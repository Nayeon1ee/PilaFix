package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.admin.terms.TermsVO;

@Repository
public class TermsDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<TermsVO> getTermsList() {
		return sqlSessionTemplate.selectList("TermsDAO.getTermsList");
	}
	
	public List<TermsVO> getTermsExcelList() {
		return sqlSessionTemplate.selectList("TermsDAO.getTermsExcelList");
	}
	
	public TermsVO getTerms(int tmCode) {
		return sqlSessionTemplate.selectOne("TermsDAO.getTerms",tmCode);
	}
	
	public int insertTerms(TermsVO vo) {
		return sqlSessionTemplate.insert("TermsDAO.insertTerms", vo);
	}
	
	public int updateTerms(TermsVO vo) {
		return sqlSessionTemplate.update("TermsDAO.updateTerms", vo);
	}
	
	public int deleteTerms(int tmCode) {
		return sqlSessionTemplate.delete("TermsDAO.deleteTerms", tmCode);
	}

	
	public int sendEmail(SendEmailHistoryVO email) {
		return sqlSessionTemplate.insert("TermsDAO.insertSendEmailHistory",email);
	}

}