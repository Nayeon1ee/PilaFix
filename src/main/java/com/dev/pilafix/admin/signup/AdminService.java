package com.dev.pilafix.admin.signup;

import com.dev.pilafix.common.member.AdminVO;

public interface AdminService {

	int insertAdminRegister(AdminVO vo);

	int adIdCheck(String adId);
	

}
