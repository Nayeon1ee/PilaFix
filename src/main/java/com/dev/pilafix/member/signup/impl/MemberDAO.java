package com.dev.pilafix.member.signup.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.admin.terms.TermsVO;
import com.dev.pilafix.common.member.MemberVO;


@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO getUserRole() {
		return sqlSessionTemplate.selectOne("MemberDAO.getUserRole");
		
	}
	
	public int idCheck(String csEmailId) {
		return  sqlSessionTemplate.selectOne("MemberDAO.idCheck",csEmailId);
		  
	}
	
	public int insertMember(MemberVO vo) {
		return sqlSessionTemplate.insert("MemberDAO.insertMember", vo);
		 
	}
	
	public int sendEmailToMem(SendEmailHistoryVO email) {
		return sqlSessionTemplate.insert("MemberDAO.insertSendEmailHistory",email);
	}
	
	public List<TermsVO> getTermsList() {
		return sqlSessionTemplate.selectList("MemberDAO.getTermsList");
	}

}