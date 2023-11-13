package com.dev.pilafix.member.login.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.login.MemberLoginService;
import com.dev.pilafix.member.login.MemberLoginVO;


@Service
public class MemberLoginServiceImpl implements MemberLoginService {
	
	@Autowired
	private MemberLoginDAO dao;
	 private static final Logger logger = LoggerFactory.getLogger(MemberLoginServiceImpl.class);


	@Override
	public MemberLoginVO memberLogin(String csEmailId, String csPassword) {
	    MemberLoginVO member = dao.getMemberLoginInfo(csEmailId);
	    
	    if (member != null) {
	        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	        if (encoder.matches(csPassword, member.getCsPassword())) {
	            return member;
	        }
	    }
	    return null;
	}
	
	
	
	//로그찍어보기
//	@Override
//	public MemberLoginVO memberLogin(String csEmailId, String csPassword) {
//	    MemberLoginVO member = dao.getMemberLoginInfo(csEmailId);
//	    
//	    System.out.println("memberLogin - Member info from DB: " + member);
//	    if (member != null) {
//	        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	        if (encoder.matches(csPassword, member.getCsPassword())) {
//                logger.info("Password matches for user: {}", csEmailId);
//                return member;
//            } else {
//                logger.warn("Password does not match for user: {}", csEmailId);
//            }
//        } else {
//            logger.warn("No member found with email: {}", csEmailId);
//        }
//	    return null;
//	}
	

	@Override
	public void updatePassword(int csMemberCode, String newPassword) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedNewPassword = encoder.encode(newPassword);
        dao.updatePassword(csMemberCode, encodedNewPassword);
		
	}
	
	

}
