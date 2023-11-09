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
	 * �Ķ���� qsNumber�� �´� �ϳ��� ���ǻ��� ��ȸ
	 */
	@Override
	public QuestionVO getTargetQuestion(int qsNumber) {
		return dao.getTargetQuestion(qsNumber);
	}
	
	/**
	 * �Ķ���� reTargetPostNumber�� �´� (���ǻ��׿� ����) �亯 ���� ��ȸ
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
	 * �亯�� ��ϵǸ� ������ �亯���� �÷� true�� ������Ʈ
	 */
	@Override
	public void updateAnswerYn(int qsNumber) {
		dao.updateAnswerYn(qsNumber);
		
	}
	
	

}
