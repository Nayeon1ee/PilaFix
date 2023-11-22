package com.dev.pilafix.member.login_naver.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.member.MemberVO;
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


	@Override
	public MemberVO getMember(String email) {
		return dao.getMember(email);
	}



	@Override
	public int insertNaverMember(NaverVO naverMemberProfile) {
		return dao.insertNaverMember(naverMemberProfile);
	}

}
