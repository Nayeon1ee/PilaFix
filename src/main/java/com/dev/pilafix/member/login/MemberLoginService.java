package com.dev.pilafix.member.login;

import com.dev.pilafix.common.member.MemberVO;

public interface MemberLoginService {
	
	MemberVO getMemberByEmail(String csEmailId);
//	MemberVO memberLogin(String csEmailId, String csPassword);
	MemberVO loginAndGetMember(String csEmailId, String csPassword);
	boolean memberLogin(String csEmailId, String csPassword);
	boolean checkPassword(int csMemberCode, String currentPassword);
	void updatePassword(int csMemberCode, String newPassword);
	 
	int createAuthNumber();
	int sendAuthEmail(MemberVO member);

//	boolean login(String csEmailId, String csPassword);

	
}
