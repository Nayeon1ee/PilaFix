package com.dev.pilafix.center.member_trainer_manage;

import java.util.List;

import com.dev.pilafix.common.member.MemberVO;

public interface MemberManageService {

	List<MemberVO> getMemberManageList();

	List<MemberVO> getTrainerManageList();

	MemberVO getMember(int csMemberCode, String csRoleCode);

	List<ConnectRequestVO> getConnectRequestForMem();

	void acceptRequest(String crCode, int memberCode, int centerCode);



}
