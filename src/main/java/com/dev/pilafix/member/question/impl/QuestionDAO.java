package com.dev.pilafix.member.question.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.question.QuestionReplyVO;
import com.dev.pilafix.member.question.QuestionVO;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<QuestionVO> getQuestionList() {
		return sqlSessionTemplate.selectList("QuestionDAO.getQuestionList");
	}
	
	public List<QuestionReplyVO> getQuestionReply(int writerMemberCode) {
		return sqlSessionTemplate.selectList("QuestionDAO.getQuestionReplyList",writerMemberCode);
	}

	
	public QuestionVO getQuestion(int qsNumber) {
		return sqlSessionTemplate.selectOne("QuestionDAO.getQuestion",qsNumber);
	}
	
	public int insertQuestion(QuestionVO vo) {
		return sqlSessionTemplate.insert("QuestionDAO.insertQuestion", vo);
	}
	
	public int updateQuestion(QuestionVO vo) {
		return sqlSessionTemplate.update("QuestionDAO.updateQuestion", vo);
	}
	
	public int deleteQuestion(int qsNumber) {
		return sqlSessionTemplate.delete("QuestionDAO.deleteQuestion", qsNumber);
	}
	



}