package com.dev.pilafix.admin.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.info.AdminInfoVO;

@Repository
public class AdminInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminInfoVO> getAdminInfoList(){
		return sqlSessionTemplate.selectList("AdminInfoDAO.getAdminInfoList");
	}
	
	public AdminInfoVO getAdminInfo(int iwNumber) {
	    return sqlSessionTemplate.selectOne("AdminInfoDAO.getAdminInfo",iwNumber);
	}
	
	public int insertAdminInfo(AdminInfoVO vo) {
		return sqlSessionTemplate.insert("AdminInfoDAO.insertAdminInfo", vo);
	}
	
	public int updateAdminInfo(AdminInfoVO vo) {
		return sqlSessionTemplate.update("AdminInfoDAO.updateAdminInfo", vo);
	}
	
	public int deleteAdminInfo(int iwNumber) {
		return sqlSessionTemplate.delete("AdminInfoDAO.deleteAdminInfo", iwNumber);
	}
	
	public void updateAdminInfoViewCnt(int iwNumber) {
		sqlSessionTemplate.update("AdminInfoDAO.updateAdminInfoViewCnt", iwNumber);
	}
}
