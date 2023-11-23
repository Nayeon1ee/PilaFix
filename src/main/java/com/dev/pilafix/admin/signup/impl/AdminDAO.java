package com.dev.pilafix.admin.signup.impl;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.AdminVO;


@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public int insertAdminRegister(AdminVO vo) {
		return sqlSessionTemplate.insert("AdminLoginDAO.insertAdminRegister", vo);
	}
	
	public int adIdCheck(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.adIdCheck",adId);
	}
	
}
