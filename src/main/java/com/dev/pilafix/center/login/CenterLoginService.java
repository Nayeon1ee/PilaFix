package com.dev.pilafix.center.login;

import com.dev.pilafix.common.member.CenterVO;

public interface CenterLoginService {
	

	CenterVO centerLogin(String ctId, String ctPassword);
	 
	
}
