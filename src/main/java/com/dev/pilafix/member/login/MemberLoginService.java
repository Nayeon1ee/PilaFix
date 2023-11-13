package com.dev.pilafix.member.login;

public interface MemberLoginService {
	
	 MemberLoginVO memberLogin(String csEmailId, String csPassword);
	 
	 void updatePassword(int csMemberCode, String newPassword);
	
}
