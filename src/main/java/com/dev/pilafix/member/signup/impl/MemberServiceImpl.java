package com.dev.pilafix.member.signup.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.CenterVO;
import com.dev.pilafix.member.signup.MemberService;
import com.dev.pilafix.member.signup.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao; 
	
	@Override
	public MemberVO getUserRole() {
		return dao.getUserRole();
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ctIdCheck(String ctId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
