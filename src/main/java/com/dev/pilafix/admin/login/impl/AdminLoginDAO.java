package com.dev.pilafix.admin.login.impl;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.AdminVO;

@Repository
public class AdminLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminVO getAdminLoginInfo(String adCode) {
        return sqlSessionTemplate.selectOne("AdminLoginDAO.getAdminLoginInfo", adCode);
	}

	
	//로그인 이거사용 id조회해서 비밀번호와 맞춰보기
	public String getPasswordByAdId(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.getPasswordByAdId", adId);
	}

	//로그인 후 가져올 관리자코드, 관리자 이름
	public AdminVO getLoginInfoA(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.getLoginInfoA", adId);
	}

	//관리자 비밀번호 변경
	public void updatePasswordAdmin(String adCode, String newPassword) {
		Map<String, Object> params = new HashMap<>();
        params.put("adCode", adCode);
        params.put("newPassword", newPassword);
        sqlSessionTemplate.update("AdminLoginDAO.updatePasswordAdmin", params);
    }
	

	
	
	
	public int insertAdminRegister(AdminVO vo) {
		return sqlSessionTemplate.insert("AdminLoginDAO.insertAdminRegister", vo);
	}
	
	public int adIdCheck(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.adIdCheck",adId);
	}
	
	public AdminVO getAdminInfo(String adCode) {
        return sqlSessionTemplate.selectOne("AdminLoginDAO.getAdminInfo", adCode);
    }


	public void adminupdatePassword(String adId, String newPassword) {
		Map<String, Object> params = new HashMap<>();
        params.put("adId", adId);
        params.put("newPassword", newPassword);
        sqlSessionTemplate.update("AdminLoginDAO.adminupdatePassword", params);
	}
	
	public int adPasswordCheck(String adPassword) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.adPasswordCheck",adPassword);
	}

	
}
