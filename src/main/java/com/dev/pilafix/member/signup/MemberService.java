package com.dev.pilafix.member.signup;

import java.util.List;

import com.dev.pilafix.admin.terms.TermsVO;
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
