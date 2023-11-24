package com.dev.pilafix.center.ticket.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.ticket.CenterTicketVO;


@Repository
public class CenterTicketDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterTicketVO> getCenterTicketList(int ctCode) {
		return sqlSessionTemplate.selectList("CenterTicketDAO.getCenterTicketList", ctCode);
	}
	
	public CenterTicketVO getCenterTicket(String tkCode) {
		return sqlSessionTemplate.selectOne("CenterTicketDAO.getCenterTicket", tkCode);
	}
	
	public int insertCenterTicket(CenterTicketVO vo) {
		return sqlSessionTemplate.insert("CenterTicketDAO.insertCenterTicket", vo);
	}
	
	public int deleteCenterTicket(String tkCode) {
		return sqlSessionTemplate.delete("CenterTicketDAO.deleteCenterTicket", tkCode);
	}
	
	public int updateCenterTicket(CenterTicketVO vo) {
		return sqlSessionTemplate.update("CenterTicketDAO.updateCenterTicket", vo);
	}
}
