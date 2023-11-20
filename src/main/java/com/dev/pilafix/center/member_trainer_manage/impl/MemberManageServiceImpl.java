package com.dev.pilafix.center.member_trainer_manage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.member_trainer_manage.ConnectRequestVO;
import com.dev.pilafix.center.member_trainer_manage.MemberManageService;
import com.dev.pilafix.common.member.MemberVO;

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
	public MemberVO getMember(int csMemberCode, String csRoleCode) {
		return null;
	}

	@Override
	public List<ConnectRequestVO> getConnectRequestForMem() {
		return dao.getConnectRequestForMem();
	}

	/**
	 * ���� ��û ����
	 */
	@Override
	public void acceptRequest(String crCode, int memberCode, int centerCode) {
		dao.updateConnectionYnAndInsertConnHistory(crCode, memberCode, centerCode);
	}
	
	

	/* ======================== ���� ���� ======================== */ 
	@Override
	public List<MemberVO> getTrainerManageList() {
		return dao.getTrainerManageList();
	}

}
