package com.dev.pilafix.center.login;

import com.dev.pilafix.common.member.CenterVO;

public interface CenterLoginService {
	
	
	CenterVO loginAndGetCenter(String ctId, String ctPassword);
	CenterVO getLoginCenterCodeName(String cdId);
	CenterVO getCenterAllInfoByCtId(String ctId);
	CenterVO getCenterAllInfoByCode(int ctCode);
	
	boolean centerLogin(String ctId, String ctPassword);
	boolean checkPassword(int ctCode, String currentPassword);
	void updatePassword(int ctCode, String newPassword);
	
}
