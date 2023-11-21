package com.dev.pilafix.member.ticket;

import java.util.List;

import com.dev.pilafix.center.ticket.CenterTicketVO;
import com.dev.pilafix.common.member.CenterVO;

public interface MemberTicketService {

	List<CenterVO> getConnCenterList(int csMemberCode);

	List<CenterTicketVO> getCenterTicketInfo(int ctCode);

}
