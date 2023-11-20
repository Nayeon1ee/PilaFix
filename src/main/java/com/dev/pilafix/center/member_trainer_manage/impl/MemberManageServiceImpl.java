package com.dev.pilafix.center.member_trainer_manage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.member_trainer_manage.ConnectRequestVO;
import com.dev.pilafix.center.member_trainer_manage.MemberManageService;
import com.dev.pilafix.center.member_trainer_manage.TicketInfoVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.common.question.QuestionVO;

@Service
public class MemberManageServiceImpl implements MemberManageService {

	@Autowired
	private MemberManageDAO dao;

	/* ======================== �쉶�썝 愿�由� ======================== */

	@Override
	public List<MemberVO> getMemberManageList() {
		return dao.getMemberManageList();
	}

	@Override
	public MemberVO getMember(int csMemberCode) {
		return dao.getMember(csMemberCode);
		
	}

    @Override
	public List<ConnectRequestVO> getConnectRequestForMe() {
		return dao.getConnectRequestForMe();

	}

	/**
	 * 臾몄쓽�궡�뿭 議고쉶
	 */
	@Override
	public List<QuestionVO> getQuestionForManage(int csMemberCode) {
		return dao.getQuestionForManage(csMemberCode);
	}


	/**
	 * 寃곗젣 �궡�뿭 議고쉶
	 */
	@Override
	public List<PaymentHistoryVO> getPaymentForManage(int csMemberCode) {
		return dao.getPaymentForManage(csMemberCode);
	}

	/**
	 * �삁�빟 �궡�뿭 議고쉶 �삁�빟 援ы쁽 �썑 VO 媛��졇�삤湲�
	 */
//	@Override
//	public List<ReservationVO> getReserveForManage(int csMemberCode) {
//		return dao.getReserveForManage(csMemberCode);;
//	}

	/**
	 * 洹몃９/媛쒖씤 �떚耳볦뿉 ���븳 �젙蹂� 議고쉶
	 * �닔媛뺢텒 蹂� 議댁옱 �뿬遺��뿉 �뵲�씪 議고쉶�븯�뿬 List�뿉 ���옣�맖 
	 * 
	 */
	@Override

	public List<CenterLessonVO> getGroupLesson(int csMemberCode) {
		return dao.getGroupLesson(csMemberCode);
	}
	
	@Override
	public List<CenterLessonVO> getPersonalLesson(int csMemberCode) {
		return dao.getPersonalLesson(csMemberCode);
	}
	
	@Override
	public List<ConnectRequestVO> getConnectRequestForTr() {
		return dao.getConnectRequestForTr();
	}

	public Map<String, TicketInfoVO> getTicketInfo(String tkCodeP, String tkCodeG) {
		 Map<String, TicketInfoVO> ticketMap = new HashMap<>();
		
		// center/center_manage.jsp �솕硫댁뿉�꽌 �긽�깭�뿉 �뵲�씪 媛믪쓣 爰쇰궡�빞 �븯湲� �븣臾� 
		
		if (!tkCodeP.equals("0") && !tkCodeG.equals("0")) { // �몮�떎 議댁옱 
			ticketMap.put("group", dao.getTicketInfoForManage(tkCodeG));
			ticketMap.put("personal", dao.getTicketInfoForManage(tkCodeP));
		}else if (tkCodeP.equals("0") && !tkCodeG.equals("0")) { // 洹몃９ �닔媛뺢텒留� 議댁옱
			ticketMap.put("group", dao.getTicketInfoForManage(tkCodeG));
		}else if (!tkCodeP.equals("0") && tkCodeG.equals("0")) { // 媛쒖씤 �닔媛뺢텒留� 議댁옱
			ticketMap.put("personal", dao.getTicketInfoForManage(tkCodeP));
		}

		return ticketMap;

	}

	/* ======================== 媛뺤궗 愿�由� ======================== */
	@Override
	public List<MemberVO> getTrainerManageList() {
		return dao.getTrainerManageList();
	}

	/**
	 * �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕泥� �뜝�룞�삕�뜝�룞�삕
	 */
	@Override
	public void acceptRequest(String crCode, int memberCode, int centerCode) {
		dao.updateConnectionYnAndInsertConnHistory(crCode, memberCode, centerCode);
	}

	/**
	 * �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕泥� �뜝�룞�삕�뜝�룞�삕
	 */
	@Override
	public void rejectRequest(String crCode) {
		dao.updateRejectDate(crCode);
	}


}
