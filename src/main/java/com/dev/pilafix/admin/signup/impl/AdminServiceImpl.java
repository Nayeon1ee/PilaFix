package com.dev.pilafix.admin.signup.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.signup.AdminService;
import com.dev.pilafix.common.member.AdminVO;



@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Override
	public int insertAdminRegister(AdminVO vo) {
		String adPassword = vo.getAdPassword();
		System.out.println("가입 시 입력한 비밀번호 : " + adPassword);
		
		// 암호화 한 후에
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(adPassword);
		
		System.out.println("암호화 비밀번호   : "+encodedPwd);
		
		// vo에 다시 넣어준다.
		vo.setAdPassword(encodedPwd);
		return dao.insertAdminRegister(vo);
	}
	
	
	@Override
	public int adIdCheck(String adId) {
		return dao.adIdCheck(adId);
	}
}