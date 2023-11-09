package com.dev.pilafix.member.question;

import java.util.List;

public interface QuestionService {
	
	List<QuestionVO> getQuestionList();
	QuestionVO getQuestion(int qsNumber);
	
	int insertQuestion(QuestionVO vo); 
	int updateQuestion(QuestionVO vo);
	int deleteQuestion(int qsNumber); 
	
//	QuestionReplyVO getQuestionReply(int reTargetPostNumber);
	
}
