package com.dev.pilafix.member.login.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.member.login.MemberLoginVO;
import com.dev.pilafix.member.signup.TermsVO;

@Repository
public class MemberLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberLoginVO getMemberLoginInfo(String csEmailId) {
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getMemberLoginInfo", csEmailId);
	} 

	// 비밀번호변경
    public void updatePassword(int csMemberCode, String newPassword) {
        Map<String, Object> params = new HashMap<>();
        params.put("csMemberCode", csMemberCode);
        params.put("newPassword", newPassword);
        sqlSessionTemplate.update("MemberLoginDAO.updatePassword", params);
    }
    
    
    public void passAuthNumSendEmailHistory(SendEmailHistoryVO email) {
        sqlSessionTemplate.insert("MemberLoginDAO.insertSendEmailHistory", email);
    }
    
    
    public MemberLoginVO getMemberByNameAndEmail(String csName, String csEmailId) {
        Map<String, Object> params = new HashMap<>();
        params.put("csName", csName);
        params.put("csEmailId", csEmailId);
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getMemberByNameAndEmail", params);
    }

}
