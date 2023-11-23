package com.dev.pilafix.center.ticket.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.ticket.CenterTicketService;
import com.dev.pilafix.center.ticket.CenterTicketVO;

@Service
public class CenterTicketServiceImpl implements CenterTicketService {

	@Autowired
	private CenterTicketDAO dao;

	@Override
	public List<CenterTicketVO> getCenterTicketList(int ctCode) {
		return dao.getCenterTicketList(ctCode);
	}

	@Override
	public CenterTicketVO getCenterTicket(String tkCode) {
		return dao.getCenterTicket(tkCode);
	}

	@Override
	public int insertCenterTicket(CenterTicketVO vo) {
		return dao.insertCenterTicket(vo);
	}

	@Override
	public int deleteCenterTicket(String tkCode) {
		return dao.deleteCenterTicket(tkCode);
	}

	@Override
	public int updateCenterTicket(CenterTicketVO vo) {
		return dao.updateCenterTicket(vo);
	}

}
