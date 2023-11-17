package com.dev.pilafix.center.question_reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.question_reply.QuestionReplyVO;
import com.dev.pilafix.member.question.QuestionVO;

@Repository
public class QuestionReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalQuestionCount() {
	    return sqlSessionTemplate.selectOne("QuestionReplyDAO.getTotalQuestionCount");
	}
	
	public List<QuestionVO> getQuestionReplyList(){
    	return sqlSessionTemplate.selectList("QuestionDAO.getQuestionList");
    }
	
	public QuestionVO getTargetQuestion(int qsNumber) {
    	return sqlSessionTemplate.selectOne("QuestionDAO.getTargetQuestion",qsNumber);
	}
	
    public QuestionReplyVO getQuestionReply(int reTargetPostNumber) {
    	return sqlSessionTemplate.selectOne("QuestionDAO.getQuestionReply",reTargetPostNumber);
    }
	
//	public QuestionReplyVO getQuestionReply(int reTargetPostNumber) {
//		return null;
//	};
    
    public int insertQuestionReply(QuestionReplyVO vo) {
    	return sqlSessionTemplate.insert("QuestionDAO.insertQuestionReply",vo);
    }
    public int updateQuestionReply(QuestionReplyVO vo) {
    	return sqlSessionTemplate.update("QuestionDAO.updateQuestionReply",vo);
    } 
    public int deleteQuestionReply(int reNumber){
    	return sqlSessionTemplate.delete("QuestionDAO.deleteQuestionReply",reNumber);
    }

	public int updateAnswerYn(int qsNumber) {
		return sqlSessionTemplate.update("QuestionDAO.updateAnswerYn", qsNumber);
	} 
	public int insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO vo) {
		// insert ¾Ë¸²ÀÌ·Â
		sqlSessionTemplate.update("QuestionDAO.updateAnswerYn", vo.getReTargetPostNumber());
    	return sqlSessionTemplate.insert("QuestionDAO.insertQuestionReply",vo);
	}
    
}
