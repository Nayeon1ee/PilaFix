package com.dev.pilafix.admin.community;

import java.util.List;
import java.util.Map;


public interface CommunityService {
	
	List<CommunityVO> getCommunityList();
	CommunityVO getCommunity(int cmNumber);
	int deleteCommunity(int cmNumber);
	
	List<CommunityVO> getFilteringData(Map<String, Object> searchCondition);
	

}
