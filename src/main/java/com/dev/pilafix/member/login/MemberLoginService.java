package com.dev.pilafix.member.login;

import com.dev.pilafix.common.member.MemberVO;

public interface MemberLoginService {
	
	MemberVO getMemberByEmail(String csEmailId);
	MemberVO memberLogin(String csEmailId, String csPassword);
	 
	void updatePassword(int csMemberCode, String newPassword);
	 
	int createAuthNumber();
	int sendAuthEmail(MemberVO member);

	 

	
}
