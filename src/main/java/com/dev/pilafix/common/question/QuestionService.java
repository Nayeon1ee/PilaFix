package com.dev.pilafix.common.question;

import java.util.List;

import com.dev.pilafix.common.member.CenterVO;

public interface QuestionService {
	
	List<QuestionVO> getQuestionList();
	QuestionVO getQuestion(int qsNumber);
	
	int insertQuestion(QuestionVO vo); 
	int updateQuestion(QuestionVO vo);
	int deleteQuestion(int qsNumber); 
	
	List<QuestionReplyVO> getQuestionReply(int writerMemberCode);
	List<CenterVO> getConnectedCenters(int csMemberCode);
	

	int getTotalQuestionCount();
	List<QuestionVO> getQuestionReplyList();
	QuestionVO getTargetQuestion(Integer reTargetPostNumber);
	
	int insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO replyvo);
	int deleteQuestionReply(int reNumber);
	void updateAnswerYn(int qsNumber);
	
	
}
