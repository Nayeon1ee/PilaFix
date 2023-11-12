package com.dev.pilafix.admin.terms;

import java.util.List;

import com.dev.pilafix.admin.center_manage.CenterVO;

public interface TermsService {
	List<TermsVO> getTermsList();

	TermsVO getTerms(int tmCode);

	int insertTerms(TermsVO vo); 

	int updateTerms(TermsVO vo);

	int deleteTerms(int tmCode); 
	
	
	List<CenterVO> getCenterList();
	void sendEmailAndInsertSendEmailHistory(CenterVO center);
	
}
