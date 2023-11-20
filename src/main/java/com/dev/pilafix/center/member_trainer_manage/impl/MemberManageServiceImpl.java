package com.dev.pilafix.center.member_trainer_manage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.member_trainer_manage.ConnectRequestVO;
import com.dev.pilafix.center.member_trainer_manage.MemberManageService;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.common.question.QuestionVO;

@Service
public class MemberManageServiceImpl implements MemberManageService{
	
	@Autowired
	private MemberManageDAO dao;
	
	/* ======================== ȸ�� ���� ======================== */ 


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

	/* ======================== ���� ���� ======================== */ 
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
	
	@Override
	public List<ConnectRequestVO> getConnectRequestForTr() {
		return dao.getConnectRequestForTr();
	}

	@Override
	public List<QuestionVO> getQuestion() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PaymentHistoryVO> getPayment() {
		// TODO Auto-generated method stub
		return null;
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

	

	
	

}
