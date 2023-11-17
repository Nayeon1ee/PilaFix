package com.dev.pilafix.test;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.MemberVO;

@Repository
public class LoginTestDAO {
	

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * ∞°¿‘ 
	 * 
	 * @param vo
	 * @return
	 */
	public boolean signupTest(MemberVO vo) {
		int result = sqlSessionTemplate.insert("MemberDAO.insertMember",vo);
		
		if(result == 1) {
			return true;
		}
		return false;
	}

	public String loginTest(String csEmailId) {
		return sqlSessionTemplate.selectOne("MemberLoginDAO.loginTest", csEmailId);
	}

	public void updateNewPw(String id, String encodedNewPw) {
		 Map<String, Object> params = new HashMap<>();
	        params.put("csEmailId", id);
	        params.put("newPassword", encodedNewPw);
	        sqlSessionTemplate.update("MemberLoginDAO.updatePwTest", params);
	}
	

}
