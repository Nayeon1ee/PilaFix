package com.dev.pilafix.admin.terms;

import java.util.List;

public interface TermsService {
	List<TermsVO> getTermsList();

	TermsVO getTerms(int tmCode);

	int insertTerms(TermsVO vo); 

	int updateTerms(TermsVO vo);

	int deleteTerms(int tmCode); 
}
