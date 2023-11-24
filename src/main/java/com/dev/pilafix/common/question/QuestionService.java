package com.dev.pilafix.common.question;

import java.util.List;

import com.dev.pilafix.common.member.CenterVO;

public interface QuestionService {
	

	QuestionVO getQuestion(int qsNumber);

	int insertQuestion(QuestionVO vo); 
	int updateQuestion(QuestionVO vo);
	int deleteQuestion(int qsNumber); 
	int getTotalQuestionCount(int ctCode);
	List<QuestionVO> getQuestionListWithWriterNames(int ctCode);
	QuestionVO getQuestionCenterWithNames(int qsNumber);
	void insertQstReplyUpdateYnAndNotice(QuestionReplyVO replyVO, QuestionVO vo);
	List<CenterVO> getConnectedCenters(int csMemberCode);

	
	QuestionReplyVO getReplyForQuestion(int qsNumber);
	List<QuestionVO> getQuestionListByMember(int csMemberCode);


	int deleteQuestionReply(int reNumber);


	
}