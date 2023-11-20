package com.dev.pilafix.common.question.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.question.QuestionReplyVO;
import com.dev.pilafix.common.question.QuestionVO;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> getQuestionList() {
	    return sqlSessionTemplate.selectList("QuestionDAO.getQuestionList");
	}
	
	public List<QuestionReplyVO> getQuestionReply(int writerMemberCode) {
		return sqlSessionTemplate.selectList("QuestionDAO.getQReplyList",writerMemberCode);
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
	
	// 로그인한 회원의 연동된 센터 이름 가져오려고 추가
	public List<CenterVO> getConnectedCT(int csMemberCode) {
        return sqlSessionTemplate.selectList("QuestionDAO.getConnectedCT", csMemberCode);
    }

	public int getTotalQuestionCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<QuestionVO> getQReplyList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertQuestionReply(QuestionReplyVO replyvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteQuestionReply(int reNumber) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	/**
	 * 문의사항 답변 등록시 회원의 답변여부 업데이트
	 * @param replyvo
	 * @param questionNumber
	 */
	@Transactional
    public void insertReplyAndUpdateQuestion(QuestionReplyVO replyvo, int questionNumber) {
        try {
            // 답변 등록
            sqlSessionTemplate.insert("QuestionMapper.insertReply", replyvo);
            
            // 문의사항 답변여부 업데이트
            sqlSessionTemplate.update("QuestionMapper.updateAnswerYn", questionNumber);
        } catch (Exception e) {
            // 예외 처리
            throw new RuntimeException("답변 등록 및 문의사항 업데이트 오류", e);
        }
    }
	
	



}