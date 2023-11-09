package com.dev.pilafix.admin.member_manage;

import java.util.List;


public interface MemberManageSerice {
	
	List<MemberVO> getMemberList();
	MemberVO getMember(int csMemberCode);
	
//	������ ���� �̷� ��ȸ
	List<PaymentHistoryVO> getPaymentList(int csMemberCode);
	
//	���� ���� �̷� ��ȸ �߰�
	List<CenterConnectHistoryVO> getCenterConnectHistory(int csMemberCode);
	

}
