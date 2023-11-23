package com.dev.pilafix.center.ticket;

import java.util.List;

public interface CenterTicketService {
	List<CenterTicketVO> getCenterTicketList(int ctCode);
	CenterTicketVO getCenterTicket(String tkCode);
	int insertCenterTicket(CenterTicketVO vo);
	int deleteCenterTicket(String tkCode);
	int updateCenterTicket(CenterTicketVO vo);
}
