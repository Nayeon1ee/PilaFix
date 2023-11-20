package com.dev.pilafix.admin.login.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.login.AdminLoginService;
import com.dev.pilafix.common.member.AdminVO;
import com.dev.pilafix.common.member.CenterVO;



@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginServiceImpl.class);
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Override
	public AdminVO adminLogin(String adId, String adPassword) {
		AdminVO admin = dao.getAdminLoginInfo(adId);

		if (admin != null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if (encoder.matches(adPassword, admin.getAdPassword())) {
				return admin;
			}else {
	            // 로그인 실패
	            logger.warn("Password does not match for user: {}", adId);
	        }
	    } else {
	        logger.warn("No member found with email: {}", adId);
	    }
		return null;
	}
	
//		if (admin != null) {
//		    // 여기서 admin은 사용자 객체일 것으로 가정합니다.
//		    String hashedAdPassword = admin.getAdPassword(); // admin 객체로부터 해싱된 비밀번호를 가져옵니다.
//
//		    if (adPassword.equals(hashedAdPassword)) {
//		        // adPassword와 해싱된 비밀번호가 일치한다면, 인증이 성공한 것으로 가정합니다.
//		        return admin;
//		    }
//		}
//		return null;
//	}
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
	@Override
	public void adminupdatePassword(String adCode, String newPassword) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedNewPassword = encoder.encode(newPassword);
		dao.adminupdatePassword(adCode, encodedNewPassword);
		
	}

	@Override
	public boolean admincheckPassword(String adCode, String currentPassword) {
		AdminVO admin = dao.getAdminInfo(adCode);
        if (admin != null && admin.getAdPassword() != null) {
            return encoder.matches(currentPassword, admin.getAdPassword());
        }
        return false;
	}

	@Override
	public int adPasswordCheck(String adPassword) {
		return dao.adPasswordCheck(adPassword);
	}

//	@Override
//	public int updateAdminInfo(AdminVO vo) {
//		return dao.updateAdminInfo(vo);
//	}




	
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