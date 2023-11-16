package com.dev.pilafix.admin.login.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.login.AdminLoginService;
import com.dev.pilafix.common.member.AdminVO;



@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginServiceImpl.class);
	
//	@Override
//	public AdminVO adminLogin(String adId, String adPassword) {
//		AdminVO admin = dao.getAdminLoginInfo(adId);
//		if (admin != null) {
//			 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		        if (encoder.matches(adPassword, admin.getAdPassword())) {
//		            return admin;
//		        }
//		}
//		return null;
//	}
	@Override
	public AdminVO adminLogin(String adId, String adPassword) {
		AdminVO admin = dao.getAdminLoginInfo(adId);
//		if (admin != null) {
//			 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		        if (encoder.matches(adPassword, admin.getAdPassword())) {
//		            return admin;
//		        }
//		}
//		return null;
		if (admin != null) {
		    // 여기서 admin은 사용자 객체일 것으로 가정합니다.
		    String hashedAdPassword = admin.getAdPassword(); // admin 객체로부터 해싱된 비밀번호를 가져옵니다.

		    if (adPassword.equals(hashedAdPassword)) {
		        // adPassword와 해싱된 비밀번호가 일치한다면, 인증이 성공한 것으로 가정합니다.
		        return admin;
		    }
		}
		return null;
	} 

	
//	//로그찍어보기
//	@Override
//	public CenterLoginVO centerLogin(String ctId, String ctPassword) {
//	    CenterLoginVO center = dao.getCenterLoginInfo(ctId);
//	    
//	    System.out.println("memberLogin - Member info from DB: " + center);
//	    if (center != null) {
//	        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	        if (encoder.matches(ctPassword, center.getCtPassword())) {
//                logger.info("Password matches for user: {}", ctId);
//                return center;
//            } else {
//                logger.warn("Password does not match for user: {}", ctId);
//            }
//        } else {
//            logger.warn("No member found with email: {}", ctId);
//        }
//	    return null;
//	}

}
