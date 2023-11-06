package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.terms.TermsService;
import com.dev.pilafix.admin.terms.TermsVO;

@Service
public class TermsServiceImpl implements TermsService {
	@Autowired
    private TermsDAO boardDAO;


	@Override
	public List<TermsVO> getBoardList() {
		return boardDAO.getBoardList();
	}


	@Override
	public TermsVO getBoardByTmCode(String tmCode) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertBoard(TermsVO boardVO) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateBoard(TermsVO boardVO) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteBoard(String tmCode) {
		// TODO Auto-generated method stub
		return 0;
	}


   
}
