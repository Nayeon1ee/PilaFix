package com.dev.pilafix.center.question_reply.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.question_reply.QuestionReplyService;
import com.dev.pilafix.center.question_reply.QuestionReplyVO;
import com.dev.pilafix.member.question.QuestionVO;

@Service
public class QuestionReplyServiceImpl implements QuestionReplyService {

	@Autowired
	private QuestionReplyDAO dao;
	

	@Override
	public List<QuestionVO> getQuestionReplyList() {
		return dao.getQuestionReplyList();
	}

	/**
	 * 파라미터 qsNumber에 맞는 하나의 문의사항 조회
	 */
	@Override
	public QuestionVO getTargetQuestion(int qsNumber) {
		return dao.getTargetQuestion(qsNumber);
	}
	
	/**
	 * 파라미터 reTargetPostNumber에 맞는 (문의사항에 대한) 답변 내용 조회
	 */
	@Override
	public QuestionReplyVO getQuestionReply(int reTargetPostNumber) {
		return dao.getQuestionReply(reTargetPostNumber);
	}

	@Override
	public int insertQuestionReply(QuestionReplyVO vo) {
		return dao.insertQuestionReply(vo);
	}

	@Override
	public int updateQuestionReply(QuestionReplyVO vo) {
		return dao.updateQuestionReply(vo);
	}

	@Override
	public int deleteQuestionReply(int reNumber) {
		return dao.deleteQuestionReply(reNumber);
	}

	
	/**
	 * 답변이 등록되면 원글의 답변여부 컬럼 true로 업데이트
	 */
	@Override
	public void updateAnswerYn(int qsNumber) {
		dao.updateAnswerYn(qsNumber);
		
	}
	
	

}
