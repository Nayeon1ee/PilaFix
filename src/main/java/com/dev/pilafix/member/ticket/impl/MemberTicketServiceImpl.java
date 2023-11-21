package com.dev.pilafix.member.ticket.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.ticket.CenterTicketVO;
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

	@Override
	public List<CenterTicketVO> getCenterTicketInfo(int ctCode) {
		return dao.getCenterTicketInfo(ctCode);
	}

}
