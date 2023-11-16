package com.dev.pilafix.member.login_naver.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.login_naver.NaverLoginService;
import com.dev.pilafix.member.login_naver.NaverVO;

@Service
public class NaverLoginServiceImpl implements NaverLoginService {
	
	@Autowired
	private NaverLoginDAO dao;


	@Override
	public int dbIdCheck(String email) {
		return dao.dbIdCheck(email);

	}

}
