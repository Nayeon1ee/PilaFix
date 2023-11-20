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

	/* ======================== 회원 관리 ======================== */

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
	 * 문의사항 내역조회
	 */
	@Override
	public List<QuestionVO> getQuestionForManage(int csMemberCode) {
		return dao.getQuestionForManage(csMemberCode);
	}


	/**
	 * 결제내역 조회
	 */
	@Override
	public List<PaymentHistoryVO> getPaymentForManage(int csMemberCode) {
		return dao.getPaymentForManage(csMemberCode);
	}

	/**
	 * 예약 내역 조회 예약 구현 후 VO 가져오기
	 */
//	@Override
//	public List<ReservationVO> getReserveForManage(int csMemberCode) {
//		return dao.getReserveForManage(csMemberCode);;
//	}

	
	
	/**
	 * 그룹/개인 티켓에 대한 정보 조회
	 * 수강권 별 존재 여부에 따라 조회하여 List에 저장됨 
	 * 
	 */
	@Override
	public List<ConnectRequestVO> getConnectRequestForTr() {
		return dao.getConnectRequestForTr();
	}

	public Map<String, TicketInfoVO> getTicketInfo(String tkCodeP, String tkCodeG) {
		 Map<String, TicketInfoVO> ticketMap = new HashMap<>();
		
		// center/center_manage.jsp 화면에서 상태에 따라 값을 꺼내야 하기 때문 
		
		if (!tkCodeP.equals("0") && !tkCodeG.equals("0")) { // 둘다 존재
			ticketMap.put("group", dao.getTicketInfoForManage(tkCodeG));
			ticketMap.put("personal", dao.getTicketInfoForManage(tkCodeP));
		}else if (tkCodeP.equals("0") && !tkCodeG.equals("0")) { // 그룹 수강권만 존재
			ticketMap.put("group", dao.getTicketInfoForManage(tkCodeG));
		}else if (!tkCodeP.equals("0") && tkCodeG.equals("0")) { // 개인 수강권만 존재
			ticketMap.put("personal", dao.getTicketInfoForManage(tkCodeP));
		}

		return ticketMap;

	}

	/* ======================== 강사 관리 ======================== */ 
	@Override
	public List<MemberVO> getTrainerManageList() {
		return dao.getTrainerManageList();
	}

	@Override
	
	public List<CenterLessonVO> getGroupLesson(int csMemberCode) {
		return dao.getGroupLesson(csMemberCode);
	}
	
	@Override
	public List<CenterLessonVO> getPersonalLesson(int csMemberCode) {
		return dao.getPersonalLesson(csMemberCode);
	}
	
	
	/**
	 * 연동 요청 수락
	 */
	@Override
	public void acceptRequest(String crCode, int memberCode, int centerCode) {
		dao.updateConnectionYnAndInsertConnHistory(crCode, memberCode, centerCode);
	}

	/**
	 * 연동 요청 거절
	 */
	@Override
	public void rejectRequest(String crCode) {
		dao.updateRejectDate(crCode);
	}


}
