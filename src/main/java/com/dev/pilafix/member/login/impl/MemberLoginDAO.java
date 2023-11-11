package com.dev.pilafix.member.login.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.login.MemberLoginVO;

@Repository
public class MemberLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberLoginVO getMemberLoginInfo(String csEmailId) {
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getMemberLoginInfo", csEmailId);
	} 

}
