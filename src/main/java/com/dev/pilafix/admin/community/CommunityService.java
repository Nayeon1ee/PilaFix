package com.dev.pilafix.admin.community;

import java.util.List;


public interface CommunityService {
	
	List<CommunityVO> getCommunityList();
	CommunityVO getCommunity(int cmNumber);
	int deleteCommunity(int cmNumber);
	

}
