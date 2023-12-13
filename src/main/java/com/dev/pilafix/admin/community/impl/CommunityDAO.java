package com.dev.pilafix.admin.community.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.community.CommunityVO;

@Repository
public class CommunityDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommunityVO> getCommunityList(){
		return sqlSessionTemplate.selectList("CommunityDAO.getCommunityList");
	}
	
	public CommunityVO getcommunity(int cmNumber) {
	    return sqlSessionTemplate.selectOne("CommunityDAO.getCommunity",cmNumber);
	}
	
	public int deleteCommunity(int cmNumber) {
		return sqlSessionTemplate.update("CommunityDAO.deleteCommunity", cmNumber);
	}

	public List<CommunityVO> getFilteringData(Map<String, Object> searchCondition) {
		return sqlSessionTemplate.selectList("CommunityDAO.getFilteringData", searchCondition);
	}

	public int updateArticleOpen(int cmNumber) {
		return sqlSessionTemplate.update("CommunityDAO.updateArticleOpen", cmNumber);
	}

}
