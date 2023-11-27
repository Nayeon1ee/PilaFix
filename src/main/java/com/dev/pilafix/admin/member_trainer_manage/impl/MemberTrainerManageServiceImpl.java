package com.dev.pilafix.admin.member_trainer_manage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.member_trainer_manage.CenterConnectHistoryVO;
import com.dev.pilafix.admin.member_trainer_manage.MemberTrainerManageSerice;
import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;

@Service
public class MemberTrainerManageServiceImpl implements MemberTrainerManageSerice {
	
	@Autowired
	private MemberTrainerManageDAO dao;

	@Override
	public List<MemberVO> getMemberList() {
		return dao.getMemberList();
	}
	
	@Override
	public List<MemberVO> getTrainerList() {
		return dao.getTrainerList();
	}

	@Override
	public MemberVO getMember(int csMemberCode) {
		return dao.getMember(csMemberCode);
	}

	@Override
	public List<PaymentHistoryVO> getPaymentList(int csMemberCode) {
		return dao.getPaymentList(csMemberCode);
	}

	@Override
	public List<CenterConnectHistoryVO> getCenterConnectHistory(int csMemberCode) {
		return dao.getConnectCenterList(csMemberCode);
	}
	
	@Override
	public List<MemberVO> getExcelMemberList() {
		return dao.getExcelMemberList();
	}
	
	@Override
	public List<MemberVO> getExcelTrainerList() {
		return dao.getExcelTrainerList();
	}

}
