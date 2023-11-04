package com.dev.pilafix.member.board;

public interface BoardService {
	
	BoardVO getBoard(int seq);
	int insertBoard(BoardVO vo);

}
