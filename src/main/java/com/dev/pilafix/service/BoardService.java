package com.dev.pilafix.service;

import com.dev.pilafix.board.BoardVO;

public interface BoardService {
	
	BoardVO getBoard(int seq);
	int insertBoard(BoardVO vo);

}
