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

	public AdminVO getAdminLoginInfo(String adId) {
        return sqlSessionTemplate.selectOne("AdminLoginDAO.getAdminLoginInfo", adId);
	}
	
	
	public int insertAdminRegister(AdminVO vo) {
		return sqlSessionTemplate.insert("AdminLoginDAO.insertAdminRegister", vo);
	}
	
	public int adIdCheck(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.adIdCheck",adId);
	}
	
	public void adminupdatePassword(String adId, String newPassword) {
		Map<String, Object> params = new HashMap<>();
        params.put("csMemberCode", adId);
        params.put("newPassword", newPassword);
        sqlSessionTemplate.update("AdminLoginDAO.adminupdatePassword", params);
	}
	

}
