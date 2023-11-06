package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.terms.TermsService;
import com.dev.pilafix.admin.terms.TermsVO;

@Service
public class TermsServiceImpl implements TermsService {
	@Autowired
    private TermsDAO dao;

	@Override
	public List<TermsVO> getTermsList() {
		return dao.getTermsList();
	}

	@Override
	public TermsVO getTerms(int tmCode) {
		return dao.getTerms(tmCode);
	}

	@Override
	public int insertTerms(TermsVO vo) {
		return dao.insertTerms(vo);
	}

	@Override
	public int updateTerms(TermsVO vo) {
		return dao.updateTerms(vo);
	}

	@Override
	public int deleteTerms(int tmCode) {
		return dao.deleteTerms(tmCode);
	}



   
}
