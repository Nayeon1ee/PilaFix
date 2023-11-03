package com.dev.pilafix.board.impl;

import java.sql.Date;
import java.time.LocalDate;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.board.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public BoardVO getBoard(int seq) {
		System.out.println("MyBatis getBoard");
		return (BoardVO)sqlSessionTemplate.selectOne("BoardDAO.getBoard", seq);
	}
	
	public int insertBoard(BoardVO vo) {
		System.out.println("�� ���");
		vo.setRegDate(LocalDate.now());
		return sqlSessionTemplate.insert("BoardDAO.insertBoard", vo);
	}
	
	
}
