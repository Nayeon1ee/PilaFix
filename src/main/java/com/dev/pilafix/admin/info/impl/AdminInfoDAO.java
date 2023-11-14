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
	
	public AdminInfoVO getAdminInfo(int seq) {
	    return sqlSessionTemplate.selectOne("AdminInfoDAO.getAdminInfo",seq);
	}
	
	public int insertAdminInfo(AdminInfoVO vo) {
		return sqlSessionTemplate.insert("AdminInfoDAO.insertAdminInfo", vo);
	}
	
	public int updateAdminInfo(AdminInfoVO vo) {
		return sqlSessionTemplate.update("AdminInfoDAO.updateAdminInfo", vo);
	}
	
	public int deleteAdminInfo(int seq) {
		return sqlSessionTemplate.delete("AdminInfoDAO.deleteAdminInfo", seq);
	}
	
	public int updateAdminInfoViewCnt(int cnt) {
		return sqlSessionTemplate.update("AdminInfoDAO.updateAdminInfoViewCnt", cnt);
	}
}
