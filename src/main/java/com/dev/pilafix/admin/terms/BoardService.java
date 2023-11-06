package com.dev.pilafix.admin.terms;

import java.util.List;

public interface BoardService {
	List<BoardVO> getBoardList();

	BoardVO getBoardByTmCode(String tmCode);

	int insertBoard(BoardVO boardVO); 

	int updateBoard(BoardVO boardVO);

	int deleteBoard(String tmCode); 
}
