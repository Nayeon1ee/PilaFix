package com.dev.pilafix.admin.terms;

import java.util.List;

import com.dev.pilafix.common.member.CenterVO;


public interface TermsService {
	List<TermsVO> getTermsList();
	List<TermsVO> getTermsExcelList();

	TermsVO getTerms(int tmCode);

	int insertTerms(TermsVO vo); 

	int updateTerms(TermsVO vo);

	int deleteTerms(int tmCode); 
	
	
	List<CenterVO> getCenterList();
	void sendEmailAndInsertSendEmailHistory(CenterVO center);
	
}
