package com.dev.pilafix.member.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
