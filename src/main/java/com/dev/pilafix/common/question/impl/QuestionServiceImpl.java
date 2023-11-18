package com.dev.pilafix.common.question.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.question.QuestionReplyVO;
import com.dev.pilafix.common.question.QuestionService;
import com.dev.pilafix.common.question.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
    private QuestionDAO dao;

	@Override
	public List<QuestionVO> getQuestionList() {
		return dao.getQuestionList();
	}
	
	@Override
	public List<QuestionReplyVO> getQuestionReply(int writerMemberCode) {
		return dao.getQuestionReply(writerMemberCode);
	}

	@Override
	public QuestionVO getQuestion(int qsNumber) {
		return dao.getQuestion(qsNumber);
	}

	@Override
	public int insertQuestion(QuestionVO vo) {
		return dao.insertQuestion(vo);
	}

	@Override
	public int updateQuestion(QuestionVO vo) {
		return dao.updateQuestion(vo);
	}

	@Override
	public int deleteQuestion(int qsNumber) {
		return dao.deleteQuestion(qsNumber);
	}



   
}
