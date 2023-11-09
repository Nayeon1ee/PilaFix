package com.dev.pilafix.member.question.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.question.QuestionReplyVO;
import com.dev.pilafix.member.question.QuestionService;
import com.dev.pilafix.member.question.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
    private QuestionDAO dao;

	@Override
	public List<QuestionVO> getQuestionList() {
		return dao.getQuestionList();
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

//	@Override
//	public QuestionReplyVO getQuestionReply(int reTargetPostNumber) {
//		// TODO Auto-generated method stub
//		return null;
//	}

   
}
