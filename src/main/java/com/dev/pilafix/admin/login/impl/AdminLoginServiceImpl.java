package com.dev.pilafix.admin.login.impl;

import java.util.Map;

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
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	
	@Override
	public AdminVO getAdminLoginInfo(String adId) {
		return dao.getAdminLoginInfo(adId);
	}
	
	@Override
    public boolean adminLogin(String adId, String adPassword) {
        String storedPassword = dao.getPasswordByAdId(adId);
        return storedPassword != null && encoder.matches(adPassword, storedPassword);
    }
	
	@Override
	public AdminVO loginAndGetAdmin(String adId, String adPassword) {
		String storedPassword = dao.getPasswordByAdId(adId);
		if (storedPassword != null && encoder.matches(adPassword, storedPassword)) {
	        // 로그인 성공, adminVO 객체 반환
	    	System.out.println("비밀번호일치회원: " + adId);
	    	//로그인 시 필요한 기본 정보 조회 mapper
	    	return dao.getLoginInfoA(adId);
	    } else {
	        // 로그인 실패, null 반환
	        return null;
	    }
	}
	
	
	@Override
    public boolean checkPassword(String adCode, String currentPassword) {
        AdminVO admin = dao.getAdminLoginInfo(adCode);
        if (admin != null && admin.getAdPassword() != null) {
            return encoder.matches(currentPassword, admin.getAdPassword());
        }
        return false;
    }
	
	
	@Override
	public void updatePassword(String adCode, String newPassword) {
		String encodedNewPassword = encoder.encode(newPassword);
		dao.updatePasswordAdmin(adCode, encodedNewPassword);

	}
	
	
	
	
	
	

//	@Override
//	public AdminVO adminLogin(String adId, String adPassword) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int insertAdminRegister(AdminVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adIdCheck(String adId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void adminupdatePassword(String adCode, String newPassword) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean admincheckPassword(String adCode, String currentPassword) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int adPasswordCheck(String adPassword) {
		// TODO Auto-generated method stub
		return 0;
	}

//	//통계 총 회원수&센터 계약수 세오기ㅣ
// 	@Override
//	public Map<String, Integer> getTotalMemberCount() {
//		return dao.getTotalMemberCount();
//	}


	
	
	



	
}