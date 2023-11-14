package com.dev.pilafix.center.login.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.login.CenterLoginVO;

@Repository
public class CenterLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public CenterLoginVO getCenterLoginInfo(String ctId) {
        return sqlSessionTemplate.selectOne("CenterLoginDAO.getCenterLoginInfo", ctId);
	} 

}
