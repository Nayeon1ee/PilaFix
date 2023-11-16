package com.dev.pilafix.admin.login;

import com.dev.pilafix.common.member.AdminVO;

public interface AdminLoginService {
	

	AdminVO adminLogin(String adId, String adPassword);
	 
}
