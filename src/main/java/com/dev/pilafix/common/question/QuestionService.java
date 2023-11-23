package com.dev.pilafix.common.question;

import java.util.List;

import com.dev.pilafix.common.member.CenterVO;

public interface QuestionService {
	
	List<QuestionVO> getQuestionList();
	QuestionVO getQuestion(int qsNumber);
	QuestionVO getQuestionCenter(int qsNumber);
	
	int insertQuestion(QuestionVO vo); 
	int updateQuestion(QuestionVO vo);
	int deleteQuestion(int qsNumber); 
	int getTotalQuestionCount();
	
	//센터
	List<QuestionReplyVO> getQuestionReplyCt(int reTargetPostNumber);
	//회원
	QuestionReplyVO getQuestionReply(int qsNumber);
	
	List<String> getConnectedCenters(int csMemberCode);
	
	List<QuestionVO> getQuestionListByMember(int csMemberCode);
	
	List<QuestionVO> getQuestionReplyList();
	QuestionVO getTargetQuestion(Integer reTargetPostNumber);
	
	void insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO replyvo, int questionNumber);
	int deleteQuestionReply(int reNumber);
	void updateAnswerYn(int qsNumber);
	List<QuestionVO> getQuestionListWithWriterNames();
	
}