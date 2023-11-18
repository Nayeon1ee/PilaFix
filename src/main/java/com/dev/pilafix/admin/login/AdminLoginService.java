package com.dev.pilafix.admin.login;

import com.dev.pilafix.common.member.AdminVO;

public interface AdminLoginService {
	

	AdminVO adminLogin(String adId, String adPassword);

	int insertAdminRegister(AdminVO vo);

	int adIdCheck(String adId);
	
	void adminupdatePassword(String adCode, String newPassword);

}
