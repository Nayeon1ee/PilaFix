package com.dev.pilafix.member.signup;

import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.pilafix.common.member.MemberVO;


public interface MemberService {
	MemberVO getUserRole();
	int insertMember(MemberVO vo);
	int idCheck(String csEmailId);
//	void idCheck(String csEmailId, HttpServletResponse response) throws IOException;
//	int idCheck(MemberVO vo) throws Exception;
	
	int mailCheckAndInsertSendEmailHistory(String csEmailId);
	
	List<TermsVO> getTermsList();
	

//	void mailCheckAndInsertSendEmailHistory(String csEmailId);
	

}
