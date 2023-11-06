package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.terms.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<BoardVO> getBoardList() {
		return sqlSessionTemplate.selectList("BoardDAO.getBoardList");
	}

	public void insertBoard(BoardVO board) {
		sqlSessionTemplate.insert("BoardDAO.insertBoard", board);
	}

}