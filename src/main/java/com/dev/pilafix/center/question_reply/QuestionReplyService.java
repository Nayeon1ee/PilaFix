package com.dev.pilafix.center.question_reply;

import java.util.List;

import com.dev.pilafix.member.question.QuestionVO;

public interface QuestionReplyService {
	
	
	int getTotalQuestionCount();
	
	QuestionVO getTargetQuestion(int qsNumber);
	
	List<QuestionVO> getQuestionReplyList();
	
	QuestionReplyVO getQuestionReply(int reTargetPostNumber);
	
	int insertQuestionReply(QuestionReplyVO vo);
	
	int deleteQuestionReply(int reNumber);
	
	void updateAnswerYn(int qsNumber);

	int insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO vo);
	
	

}
