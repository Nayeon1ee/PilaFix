package com.dev.pilafix.admin.terms;

import java.util.List;

public interface TermsService {
	List<TermsVO> getBoardList();

	TermsVO getBoardByTmCode(String tmCode);

	int insertBoard(TermsVO boardVO); 

	int updateBoard(TermsVO boardVO);

	int deleteBoard(String tmCode); 
}
