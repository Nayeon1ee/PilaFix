package com.dev.pilafix.member.signup;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.dev.pilafix.admin.center_manage.CenterVO;

public interface MemberService {
	MemberVO getUserRole();
	int insertMember(MemberVO vo);
	int idCheck(String csEmailId);
//	void idCheck(String csEmailId, HttpServletResponse response) throws IOException;
//	int idCheck(MemberVO vo) throws Exception;
	

}
