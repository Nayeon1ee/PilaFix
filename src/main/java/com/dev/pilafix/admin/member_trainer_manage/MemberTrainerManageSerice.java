package com.dev.pilafix.admin.member_trainer_manage;

import java.util.List;

import com.dev.pilafix.common.member.MemberVO;


public interface MemberTrainerManageSerice {
	
	List<MemberVO> getMemberList();
	List<MemberVO> getTrainerList();
	
	MemberVO getMember(int csMemberCode);
	
//	������ ���� �̷� ��ȸ
	List<PaymentHistoryVO> getPaymentList(int csMemberCode);
	
//	���� ���� �̷� ��ȸ �߰�
	List<CenterConnectHistoryVO> getCenterConnectHistory(int csMemberCode);
	

}
