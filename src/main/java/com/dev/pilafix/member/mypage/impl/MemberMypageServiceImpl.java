package com.dev.pilafix.member.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.faq.FaqVO;
import com.dev.pilafix.admin.info.AdminInfoVO;
import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.mypage.MemberMypageVO;

@Service
public class MemberMypageServiceImpl implements com.dev.pilafix.member.mypage.MemberMypageService {
	@Autowired
	private MemberMypageDAO dao;
	
	/**
	 * 마이페이지에서 결제내역 가져오는 것
	 */
	@Override
	public List<MemberMypageVO> getMyPaymentInfo(int csMemberCode) {
		return dao.getMyPaymentInfo(csMemberCode);
	}

	/**
	 * 회원의 연동센터 리스트 가져오기
	 */
	@Override
	public List<CenterVO> getConnectedCenterList(int csMemberCode) {
		return dao.getConnectedCenterList(csMemberCode);
	}

	/**
	 * 연동센터해제
	 * 선택된 센터 코드가 회원의 연동된 센터코드에서 일치하는것 0으로 업데이트
	 */
	@Override
	public int disconnectCenter(int csMemberCode, int selectedCenterCode) {
		System.out.println("선택된센터코드" + selectedCenterCode);
		System.out.println("회원코드" + csMemberCode);
		return dao.disconnectCenter(csMemberCode, selectedCenterCode);

	}

	/**
	 * 회원 탈퇴
	 * 회원 테이블의 탈퇴여부 true로 업데이트
	 */
	@Override
	public int withdrawMember(int csMemberCode) {
		return dao.withdrawMember(csMemberCode);
	}

	/**
	 * 개인수강권
	 */
	@Override
	public MemberVO getPersonalTicketByMember(int csMemberCode) {
		return dao.getPersonalTicketByMember(csMemberCode);
	}

	/**
	 * 그룹수강권
	 */
	@Override
	public MemberVO getGroupTicketByMember(int csMemberCode) {
		return dao.getGroupTicketByMember(csMemberCode);
	}

	/**
	 * 센터의 공지사항 리스트, 상세
	 * 센터는 센터이름까지 가지고 옴
	 */
	@Override
	public List<CenterInfoVO> getCenterInfoListByMember(int csMemberCode) {
		return dao.getCenterInfoListByMember(csMemberCode);
	}
	@Override
	public CenterInfoVO getCenterInfoByMember(int icNumber) {
		return dao.getCenterInfoByMember(icNumber);
	}

	/**
	 * 웹관리자의 공지사항 리스트, 상세
	 * 작성자 '필라픽스' 로 고정
	 */
	@Override
	public List<AdminInfoVO> getAdminInfoListByMember(int csMemberCode) {
		return dao.getAdminInfoListByMember(csMemberCode);
	}
	@Override
	public AdminInfoVO getAdminInfoByMember(int iwNumber) {
		return dao.getAdminInfoByMember(iwNumber);
	}

	/**
	 * 웹관리자의 FAQ 리스트 상세
	 * 작성자 '필라픽스' 로 고정
	 */
	@Override
	public List<FaqVO> getFAQListByMember() {
		return dao.getFAQListByMember();
	}
	@Override
	public FaqVO getFaqByMember(int fqNumber) {
		return dao.getFaqByMember(fqNumber);
	}

	/**
	 * 마이페이지의 내정보보기
	 */
	@Override
	public MemberVO getMypageMemberInfo(int csMemberCode) {
		return dao.getMypageMemberInfo(csMemberCode);
	}

}
