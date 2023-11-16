package com.dev.pilafix.center.login.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.login.CenterLoginService;
import com.dev.pilafix.common.member.CenterVO;

@Service
public class CenterLoginServiceImpl implements CenterLoginService {
	
	@Autowired
	private CenterLoginDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(CenterLoginServiceImpl.class);
	
	@Override
	public CenterVO centerLogin(String ctId, String ctPassword) {
		CenterVO center = dao.getCenterLoginInfo(ctId);
		if (center != null) {
			 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		        if (encoder.matches(ctPassword, center.getCtPassword())) {
		            return center;
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
