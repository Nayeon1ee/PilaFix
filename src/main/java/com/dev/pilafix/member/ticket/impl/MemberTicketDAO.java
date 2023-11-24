package com.dev.pilafix.member.ticket.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.ticket.CenterTicketVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;

@Repository
public class MemberTicketDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CenterVO> getConnCenterList(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberTicketDAO.getConnCenterList",csMemberCode );
	}

	public List<CenterTicketVO> getCenterTicketInfo(int ctCode) {
		return sqlSessionTemplate.selectList("MemberTicketDAO.getCenterTicketInfo",ctCode );
	}

	public CenterTicketVO getTicketDetail(String tkCode) {
		return sqlSessionTemplate.selectOne("MemberTicketDAO.getTicketDetail",tkCode);
	}

	public List<UserguideVO> getCenterTicketGuide(int centerCode) {
		return sqlSessionTemplate.selectList("MemberTicketDAO.getCenterTicketGuide", centerCode);
	}
	
	public String groupTicketCheck(int csCode) {
		return sqlSessionTemplate.selectOne("MemberTicketDAO.groupTicketCheck",csCode);
	}

	public String personalTicketCheck(int csCode) {
		return sqlSessionTemplate.selectOne("MemberTicketDAO.personalTicketCheck",csCode);
	}

}
