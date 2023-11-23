package com.dev.pilafix.center.member_trainer_manage;

import java.util.List;
import java.util.Map;

import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.common.question.QuestionVO;

public interface MemberManageService {

	List<MemberVO> getMemberManageList(int ctCode);

	List<MemberVO> getTrainerManageList(int ctCode);
	
	List<ConnectRequestVO> getConnectRequestForMe(int ctCode);

	List<ConnectRequestVO> getConnectRequestForTr(int ctCode);



	MemberVO getMember(int csMemberCode);
	
	
	List<QuestionVO> getQuestionForManage(int csMemberCode);

	List<PaymentHistoryVO> getPaymentForManage(int csMemberCode);

	Map<String, TicketInfoVO> getTicketInfo(String tkCodeP, String tkCodeG);




	List<CenterLessonVO> getGroupLesson(int csMemberCode);

	List<CenterLessonVO> getPersonalLesson(int csMemberCode);

	CenterLessonVO getLessonCount(int csMemberCode);


	boolean acceptRequest(String crCode, int memberCode, int centerCode);

	int rejectRequest(String crCode);


}
