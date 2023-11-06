package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.terms.TermsVO;

@Repository
public class TermsDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<TermsVO> getBoardList() {
		return sqlSessionTemplate.selectList("BoardDAO.getBoardList");
	}

	public void insertBoard(TermsVO board) {
		sqlSessionTemplate.insert("BoardDAO.insertBoard", board);
	}

}