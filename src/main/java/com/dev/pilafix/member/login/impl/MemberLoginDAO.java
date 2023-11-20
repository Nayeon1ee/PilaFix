package com.dev.pilafix.member.login.impl;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.common.member.MemberVO;

@Repository
public class MemberLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//로그인 이거사용해보기 : 이메일로 비밀번호만 select
	public String getPasswordByEmail(String csEmailId) {
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getPasswordByEmail", csEmailId);
    }
	
	//로그인 후 가져올 정보
	public MemberVO getMemberLoginInfo(String csEmailId) {
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getMemberLoginInfo", csEmailId);
	} 
	
	public MemberVO getMemberInfo(int csMemberCode) {
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getMemberInfo", csMemberCode);
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
    
    
    public MemberVO getMemberByNameAndEmail(String csName, String csEmailId) {
        Map<String, Object> params = new HashMap<>();
        params.put("csName", csName);
        params.put("csEmailId", csEmailId);
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getMemberByNameAndEmail", params);
    }

}