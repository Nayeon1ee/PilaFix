package com.dev.pilafix.member.login_naver;

import java.util.Map;

import com.dev.pilafix.common.member.MemberVO;

public interface NaverLoginService {

	int dbIdCheck(String email);

	MemberVO getMember(String email);

	int insertNaverMember(Map<String, Object> naverMember);

}
