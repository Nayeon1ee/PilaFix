package com.dev.pilafix.member.signup;

import com.dev.pilafix.admin.center_manage.CenterVO;

public interface MemberService {
	MemberVO getUserRole();
	int insertMember(MemberVO vo);
	int ctIdCheck(String ctId);
	

}
