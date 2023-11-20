package com.dev.pilafix.common.question.impl;

import java.util.List;

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
	 * 센터가 답변을 등록하면 회원의 답변여부 true로 업데이트
	 * @param replyvo
	 * @param questionNumber
	 */
	@Transactional
    public void insertReplyAndUpdateQuestion(QuestionReplyVO replyvo, int questionNumber) {
        try {
            sqlSessionTemplate.insert("QuestionMapper.insertReply", replyvo);
           
            sqlSessionTemplate.update("QuestionMapper.updateAnswerYn", questionNumber);
        } catch (Exception e) {
            
            throw new RuntimeException("RuntimeException: ", e);
        }
    }
	
	



}