package com.dev.pilafix.member.login_naver.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.MemberVO;
@Repository
public class NaverLoginDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int dbIdCheck(String email) {
		return sqlSessionTemplate.selectOne("NaverDAO.getMemberEmail",email);
	}

	public MemberVO getMember(String email) {
		return sqlSessionTemplate.selectOne("NaverDAO.getMember",email);
	}

}
