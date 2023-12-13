package com.dev.pilafix.admin.community.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.community.CommunityService;
import com.dev.pilafix.admin.community.CommunityVO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDAO dao;
	
	@Override
	public List<CommunityVO> getCommunityList() {
		return dao.getCommunityList();
	}

	@Override
	public CommunityVO getCommunity(int cmNumber) {
		return dao.getcommunity(cmNumber);
	}

	@Override
	public int deleteCommunity(int cmNumber) {
		return dao.deleteCommunity(cmNumber);
	}

	@Override
	public List<CommunityVO> getFilteringData(Map<String, Object> searchCondition) {
		return dao.getFilteringData(searchCondition);
	}

	@Override
	public int updateArticleOpen(int cmNumber) {
		return dao.updateArticleOpen(cmNumber);
	}

}
