package com.dev.pilafix.member.ticket.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.ticket.CenterTicketVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.member.ticket.MemberTicketVO;

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

	public int insertPaymentinfo(MemberTicketVO vo) {
		return sqlSessionTemplate.insert("MemberTicketDAO.insertPaymentinfo", vo);
	}

	public int updateMemberTicketInfo(MemberTicketVO vo) {
		return sqlSessionTemplate.update("MemberTicketDAO.updateMemberTicketInfo", vo);
	}

//	@Transactional(rollbackFor = Exception.class)
//	public boolean insertPaymentAndUpdateMemberTicketInfo(MemberTicketVO vo) {
//		try {
//			sqlSessionTemplate.insert("MemberTicketDAO.insertPaymentinfo", vo);
//			sqlSessionTemplate.update("MemberTicketDAO.updateMemberTicketInfo", vo);
//			return true;
//			
//		} catch (Exception e) {
//			// 예외 처리
//			throw new RuntimeException("데이터 베이스 업데이트 실패", e);
//		}
//	}

}
