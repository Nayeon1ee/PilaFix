package com.dev.pilafix.member.login;

public interface MemberLoginService {
	
	MemberLoginVO getMemberByEmail(String csEmailId);
	MemberLoginVO memberLogin(String csEmailId, String csPassword);
	 
	void updatePassword(int csMemberCode, String newPassword);
	 
	int createAuthNumber();
	int sendAuthEmail(MemberLoginVO member);

	 

	
}
