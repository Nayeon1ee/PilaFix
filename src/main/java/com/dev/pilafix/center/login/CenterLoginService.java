package com.dev.pilafix.center.login;

import java.util.Map;

import com.dev.pilafix.common.member.CenterVO;

public interface CenterLoginService {
	
	
	CenterVO loginAndGetCenter(String ctId, String ctPassword);
	CenterVO getLoginCenterCodeName(String ctId);
	CenterVO getCenterAllInfoByCtId(String ctId);
	CenterVO getCenterAllInfoByCode(int ctCode);
	
	boolean centerLogin(String ctId, String ctPassword);
	boolean checkPassword(int ctCode, String currentPassword);
	void updatePassword(int ctCode, String newPassword);
	CenterVO countForBadge(int ctCode);
	
	CenterVO getTotalCenterCount(int ctCode);
	Map<String, Object> getMonthlyAmount(int ctCode);
	Map<String, Object> getPopularLesson(int ctCode);
}
