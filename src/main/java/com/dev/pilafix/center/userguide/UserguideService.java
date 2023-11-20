package com.dev.pilafix.center.userguide;

import java.util.List;

public interface UserguideService {
	
	List<UserguideVO> getUserguideList(int ctCode);
	UserguideVO getUserguide(int ugCode);
	int insertUserguide(UserguideVO vo);
	int updateUserguide(UserguideVO vo);
	int deleteUserguide(int ugCode);

}
