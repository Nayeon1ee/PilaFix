package com.dev.pilafix.admin.member_trainer_manage;

import java.util.List;

import com.dev.pilafix.common.member.MemberVO;


public interface MemberTrainerManageSerice {
	
	List<MemberVO> getMemberList();
	List<MemberVO> getTrainerList();
	
	MemberVO getMember(int csMemberCode);
	
//	수강권 결제 이력 조회
	List<PaymentHistoryVO> getPaymentList(int csMemberCode);
	
//	연동 센터 이력 조회 추가
	List<CenterConnectHistoryVO> getCenterConnectHistory(int csMemberCode);
	

}
