package com.dev.pilafix.member.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.login.MemberLoginService;
import com.dev.pilafix.member.login.MemberLoginVO;


@Service
public class MemberLoginServiceImpl implements MemberLoginService {
	
	@Autowired
	private MemberLoginDAO dao;
	

	@Override
    public MemberLoginVO memberLogin(String csEmailId, String csPassword) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        MemberLoginVO member = dao.getMemberLoginInfo(csEmailId);
        if (member != null && encoder.matches(csPassword, member.getCsPassword())) {
            return member;
        }
        return null;
    }
}
