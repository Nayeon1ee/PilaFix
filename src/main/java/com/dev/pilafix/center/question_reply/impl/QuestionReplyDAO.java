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
	
	public List<QuestionVO> getQuestionReplyList(){
    	return sqlSessionTemplate.selectList("QuestionReplyDAO.getQuestionReplyList");
    }
	
	public QuestionVO getTargetQuestion(int qsNumber) {
    	return sqlSessionTemplate.selectOne("QuestionReplyDAO.getTargetQuestion",qsNumber);
	}
	
    public QuestionReplyVO getQuestionReply(int reTargetPostNumber) {
    	return sqlSessionTemplate.selectOne("QuestionReplyDAO.getQuestionReply",reTargetPostNumber);
    }
    
    public int insertQuestionReply(QuestionReplyVO vo) {
    	return sqlSessionTemplate.insert("QuestionReplyDAO.insertQuestionReply",vo);
    }
    public int updateQuestionReply(QuestionReplyVO vo) {
    	return sqlSessionTemplate.update("QuestionReplyDAO.updateQuestionReply",vo);
    } 
    public int deleteQuestionReply(int reNumber){
    	return sqlSessionTemplate.delete("QuestionReplyDAO.deleteQuestionReply",reNumber);
    }

	public int updateAnswerYn(int qsNumber) {
		return sqlSessionTemplate.update("QuestionReplyDAO.updateAnswerYn");
	} 


    
}
