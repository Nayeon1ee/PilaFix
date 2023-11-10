package com.dev.pilafix.admin.member_manage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.member_manage.CenterConnectHistoryVO;
import com.dev.pilafix.admin.member_manage.MemberManageSerice;
import com.dev.pilafix.admin.member_manage.MemberVO;
import com.dev.pilafix.admin.member_manage.PaymentHistoryVO;

@Service
public class MemberManageServiceImpl implements MemberManageSerice {
	
	@Autowired
	private MemberManageDAO dao;

	@Override
	public List<MemberVO> getMemberList() {
		return dao.getMemberList();
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

}
