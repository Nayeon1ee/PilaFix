package com.dev.pilafix.member.ticket.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.ticket.CenterTicketVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.member.ticket.MemberTicketService;

@Service
public class MemberTicketServiceImpl implements MemberTicketService {

	@Autowired
	private MemberTicketDAO dao;
	
	@Override
	public List<CenterVO> getConnCenterList(int csMemberCode) {
		return dao.getConnCenterList(csMemberCode);
		
	}
	
	//해당 센터의 수강권정보 가져옴
	@Override
	public List<CenterTicketVO> getCenterTicketInfo(int ctCode) {
		return dao.getCenterTicketInfo(ctCode);
	}

	// 해당 센터의 해당 수강권의 상세정보 가져오는 메서드
	@Override
	public CenterTicketVO getTicketDetail(String tkCode) {
		return dao.getTicketDetail(tkCode);
	}
	
	//센터코드로 해당 센터 이용정책 가져옴
	@Override
	public List<UserguideVO> getCenterTicketGuide(int centerCode) {
		return dao.getCenterTicketGuide(centerCode);
	}

}
