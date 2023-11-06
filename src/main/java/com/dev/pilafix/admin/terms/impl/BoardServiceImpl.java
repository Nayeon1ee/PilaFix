package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.terms.BoardService;
import com.dev.pilafix.admin.terms.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
    private BoardDAO boardDAO;


	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}


	@Override
	public BoardVO getBoardByTmCode(String tmCode) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteBoard(String tmCode) {
		// TODO Auto-generated method stub
		return 0;
	}


   
}
