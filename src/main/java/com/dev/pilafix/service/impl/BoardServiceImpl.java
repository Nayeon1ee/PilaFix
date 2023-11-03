package com.dev.pilafix.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.board.BoardVO;
import com.dev.pilafix.board.impl.BoardDAO;
import com.dev.pilafix.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Override
	public BoardVO getBoard(int seq) {
		return dao.getBoard(seq);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		return dao.insertBoard(vo);
	}


}
