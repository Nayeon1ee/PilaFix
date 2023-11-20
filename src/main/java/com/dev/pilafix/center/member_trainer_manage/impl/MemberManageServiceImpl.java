package com.dev.pilafix.center.member_trainer_manage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.center.member_trainer_manage.ConnectRequestVO;
import com.dev.pilafix.center.member_trainer_manage.MemberManageService;
import com.dev.pilafix.center.member_trainer_manage.TicketInfoVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.common.question.QuestionVO;

@Service
public class MemberManageServiceImpl implements MemberManageService {

	@Autowired
	private MemberManageDAO dao;

	/* ======================== ȸ�� ���� ======================== */

	@Override
	public List<MemberVO> getMemberManageList() {
		return dao.getMemberManageList();
	}

	@Override
	public List<ConnectRequestVO> getConnectRequestForMe() {
		return dao.getConnectRequestForMe();
	}

	/**
	 * ���ǳ��� ��ȸ
	 */
	@Override
	public List<QuestionVO> getQuestionForManage(int csMemberCode) {
		return dao.getQuestionForManage(csMemberCode);
	}

	/**
	 * ���� ���� ��ȸ
	 */
	@Override
	public List<PaymentHistoryVO> getPaymentForManage(int csMemberCode) {
		return dao.getPaymentForManage(csMemberCode);
	}

	/**
	 * ���� ���� ��ȸ ���� ���� �� VO ��������
	 */
//	@Override
//	public List<ReservationVO> getReserveForManage(int csMemberCode) {
//		return dao.getReserveForManage(csMemberCode);;
//	}

	/**
	 * �׷�/���� Ƽ�Ͽ� ���� ���� ��ȸ
	 * ������ �� ���� ���ο� ���� ��ȸ�Ͽ� List�� ����� 
	 * 
	 */
	@Override
	public Map<String, TicketInfoVO> getTicketInfo(String tkCodeP, String tkCodeG) {
		 Map<String, TicketInfoVO> ticketMap = new HashMap<>();
		
		// center/center_manage.jsp ȭ�鿡�� ���¿� ���� ���� ������ �ϱ� ���� 
		
		if (!tkCodeP.equals("0") && !tkCodeG.equals("0")) { // �Ѵ� ���� 
			ticketMap.put("group", dao.getTicketInfoForManage(tkCodeG));
			ticketMap.put("personal", dao.getTicketInfoForManage(tkCodeP));
		}else if (tkCodeP.equals("0") && !tkCodeG.equals("0")) { // �׷� �����Ǹ� ����
			ticketMap.put("group", dao.getTicketInfoForManage(tkCodeG));
		}else if (!tkCodeP.equals("0") && tkCodeG.equals("0")) { // ���� �����Ǹ� ����
			ticketMap.put("personal", dao.getTicketInfoForManage(tkCodeP));
		}

		return ticketMap;
	}

	/* ======================== ���� ���� ======================== */
	@Override
	public List<MemberVO> getTrainerManageList() {
		return dao.getTrainerManageList();
	}

	@Override
	public List<ConnectRequestVO> getConnectRequestForTr() {
		return dao.getConnectRequestForTr();
	}

	/**
	 * ���� ��û ����
	 */
	@Override
	public void acceptRequest(String crCode, int memberCode, int centerCode) {
		dao.updateConnectionYnAndInsertConnHistory(crCode, memberCode, centerCode);
	}

	/**
	 * ���� ��û ����
	 */
	@Override
	public void rejectRequest(String crCode) {
		dao.updateRejectDate(crCode);
	}

	/**
	 * ȸ�� �� ��ȸ
	 */
	@Override
	public MemberVO getMemberManage(int csMemberCode) {
		return dao.getMemberManage(csMemberCode);
	}

}
