package com.dev.pilafix.admin.login.impl;


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

}
