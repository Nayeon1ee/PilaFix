package com.dev.pilafix.common.question.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


	public List<QuestionVO> getQuestionReplyList() {
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

	public int insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO replyvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	



}