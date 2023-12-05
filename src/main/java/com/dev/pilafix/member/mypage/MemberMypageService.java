package com.dev.pilafix.member.mypage;

import java.util.List;

import com.dev.pilafix.admin.faq.FaqVO;
import com.dev.pilafix.admin.info.AdminInfoVO;
import com.dev.pilafix.admin.terms.TermsVO;
import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.center.ticket.CenterTicketVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;

public interface MemberMypageService {

	List<MemberMypageVO> getMyPaymentInfo(int csMemberCode);

	List<CenterVO> getConnectedCenterList(int csMemberCode);
	int disconnectCenter(int csMemberCode, int selectedCenterCode);
	int withdrawMember(int csMemberCode);
	MemberVO getPersonalTicketByMember(int csMemberCode);
	MemberVO getGroupTicketByMember(int csMemberCode);
	List<CenterInfoVO> getCenterInfoListByMember(int csMemberCode);
	CenterInfoVO getCenterInfoByMember(int icNumber);
	List<AdminInfoVO> getAdminInfoListByMember(int csMemberCode);
	AdminInfoVO getAdminInfoByMember(int iwNumber);
	List<FaqVO> getFAQListByMember();
	FaqVO getFaqByMember(int fqNumber);
	MemberVO getMypageMemberInfo(int csMemberCode);
	List<TermsVO> getMyTermsListByMember();
	boolean checkPassword(int csMemberCode, String currentPassword);
	
}
