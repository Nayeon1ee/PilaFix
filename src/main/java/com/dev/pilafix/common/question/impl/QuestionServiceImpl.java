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
	
	
	/**
	 * 회원이 작성한 문의사항에 센터의 답변이 등록되면 해당 답변을 가져와서 Ajax처리
	 */
	@Override
	public QuestionReplyVO getQuestionReply(int qsNumber) {
		return dao.getQuestionReply(qsNumber);
	}
	
	
	/**
	 * 센터의 답변 목록
	 */
	@Override
	public List<QuestionReplyVO> getQuestionReplyCt(int reTargetPostNumber) {
		return dao.getQuestionReplyCt(reTargetPostNumber);
	}
	
	/**
	 * 회원의 연동된 센터이름
	 */
	@Override
	public List<String> getConnectedCenters(int csMemberCode) {
		return dao.getConnectedCenters(csMemberCode);
	}
	
	
	/**
	 * 문의사항 전체 건수 가져오기
	 */
	@Override
	public int getTotalQuestionCount() {
		return dao.getTotalQuestionCount();
	}

	/**
	 * 센터가 조회하는 회원의 문의사항리스트
	 */
	@Override
	public List<QuestionVO> getQuestionListWithWriterNames() {
		return dao.getQuestionListWithWriterNames();
	}
	
	
	/**
	 * 답변이 등록될때 회원문의사항 답변여부 컬럼 true로 업데이트 (insert + update)
	 */
	@Override
    public void insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO replyvo, int questionNumber) {
        dao.insertReplyAndUpdateQuestion(replyvo, questionNumber);
    }
	
	
	/**
	 * 회원코드로 필터링해서 가져오는 문의사항 리스트
	 */
	@Override
	public List<QuestionVO> getQuestionListByMember(int csMemberCode) {
	    return dao.getQuestionListByMember(csMemberCode);
	}
	
	/**
	 * 회원의 문의사항 수정
	 */
	@Override
	public int updateQuestion(QuestionVO vo) {
		return dao.updateQuestion(vo);
	}
	
	/**
	 * 회원의 문의사항 상세
	 */
	@Override
	public QuestionVO getQuestion(int qsNumber) {
		return dao.getQuestion(qsNumber);
	}
	
	
	/**
	 * 센터가 조회하는 회원의 문의사항
	 */
	@Override
	public QuestionVO getQuestionCenter(int qsNumber) {
		return dao.getQuestionCenter(qsNumber);
	}
	
	
	

	@Override
	public int insertQuestion(QuestionVO vo) {
		return dao.insertQuestion(vo);
	}

	

	@Override
	public int deleteQuestion(int qsNumber) {
		return dao.deleteQuestion(qsNumber);
	}
	

	@Override
	public List<QuestionVO> getQuestionReplyList() {
		return dao.getQReplyList();
	}

	@Override
	public QuestionVO getTargetQuestion(Integer reTargetPostNumber) {
		// TODO Auto-generated method stub
		return null;
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