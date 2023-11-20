package com.dev.pilafix.common.question;

import java.util.List;
import java.util.Map;

import com.dev.pilafix.common.member.CenterVO;

public interface QuestionService {
	
	List<Map<String, Object>> getQuestionList();
	QuestionVO getQuestion(int qsNumber);
	
	int insertQuestion(QuestionVO vo); 
	int updateQuestion(QuestionVO vo);
	int deleteQuestion(int qsNumber); 
	
	List<QuestionReplyVO> getQuestionReply(int writerMemberCode);
	List<CenterVO> getConnectedCenters(int csMemberCode);
	

	int getTotalQuestionCount();
	List<QuestionVO> getQuestionReplyList();
	QuestionVO getTargetQuestion(Integer reTargetPostNumber);
	
	
	void insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO replyvo, int questionNumber);
	int deleteQuestionReply(int reNumber);
	void updateAnswerYn(int qsNumber);
	
	
}
