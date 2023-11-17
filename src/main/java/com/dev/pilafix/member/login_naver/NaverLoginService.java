package com.dev.pilafix.member.login_naver;

import com.dev.pilafix.common.member.MemberVO;

public interface NaverLoginService {

	int dbIdCheck(String email);

	MemberVO getMember(String email);

}
