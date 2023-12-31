package com.dev.pilafix.admin.login;

import java.util.List;
import java.util.Map;

import com.dev.pilafix.common.member.AdminVO;


public interface AdminLoginService {
	
	AdminVO getAdminLoginInfo(String adId);
	AdminVO loginAndGetAdmin(String adId, String adPassword);
	boolean adminLogin(String adId, String adPassword);
	boolean checkPassword(String adCode, String currentPassword);
	void updatePassword(String adCode, String newPassword);
	
	
	
	
	//
//	AdminVO adminLogin(String adId, String adPassword);

	int insertAdminRegister(AdminVO vo);

	int adIdCheck(String adId);
	
	
	void adminupdatePassword(String adCode, String newPassword);

	boolean admincheckPassword(String adCode, String currentPassword);

	int adPasswordCheck(String adPassword);

	AdminVO getTotalMemberCount();
	
	Map<String,Object> getMonthlyContractCount();
	Map<String, Object> countMemberAge();
	Map<String, Integer> countGenterRatio();
	Map<String, Integer> centerRegionCount();





}
