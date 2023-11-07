package com.dev.pilafix.member.signup.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.signup.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO getUserRole() {
		return sqlSessionTemplate.selectOne("MemberDAO.getUserRole");
		
	}

}
