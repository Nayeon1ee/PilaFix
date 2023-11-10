package com.dev.pilafix.center.question_reply;

import java.util.List;

import com.dev.pilafix.member.question.QuestionVO;

public interface QuestionReplyService {
	
	
	QuestionVO getTargetQuestion(int qsNumber);
	
	List<QuestionVO> getQuestionReplyList();
	
	QuestionReplyVO getQuestionReply(int reTargetPostNumber);
	
	int insertQuestionReply(QuestionReplyVO vo);
	
	int updateQuestionReply(QuestionReplyVO vo);
	
	int deleteQuestionReply(int reNumber);
	
	void updateAnswerYn(int qsNumber);

	int insertQuestionReplyAndUpdateAnswerYn(QuestionReplyVO vo);

}
