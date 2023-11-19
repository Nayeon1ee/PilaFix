package com.dev.pilafix.common.question.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.member.CenterVO;
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

	@Override
	public List<CenterVO> getConnectedCenters(int csMemberCode) {
		return dao.getConnectedCT(csMemberCode);
	}

	
	
	/**
	 * 문의사항 전체 건수 가져오기
	 */
	@Override
	public int getTotalQuestionCount() {
		return dao.getTotalQuestionCount();
	}

	@Override
	public List<QuestionVO> getQuestionReplyList() {
		return dao.getQuestionReplyList();
	}

	@Override
	public QuestionVO getTargetQuestion(Integer reTargetPostNumber) {
		// TODO Auto-generated method stub
		return null;
	}
	

	
	/**
	 * 답변이 등록될때 회원문의사항 답변여부 컬럼 true로 업데이트 (insert + update)
	 */
	@Override
	public int insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO replyvo) {
		return dao.insertQuestionReplyAndUpdateAnswerYn(replyvo);
	}

	@Override
	public int deleteQuestionReply(int reNumber) {
		return dao.deleteQuestionReply(reNumber);
	}

	@Override
	public void updateAnswerYn(int qsNumber) {
		// TODO Auto-generated method stub
		
	}



   
}
