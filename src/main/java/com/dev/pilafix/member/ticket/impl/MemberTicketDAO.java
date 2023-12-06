package com.dev.pilafix.member.ticket.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

//	public List<CenterTicketVO> getCenterTicketInfo(int ctCode) {
//		return sqlSessionTemplate.selectList("MemberTicketDAO.getCenterTicketInfo",ctCode );
//	}
	public List<CenterTicketVO> getCenterTicketInfo(int ctCode, String type) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("ctCode", ctCode);
		param.put("type", type);
		
		return sqlSessionTemplate.selectList("MemberTicketDAO.getCenterTicketInfo",param );
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

	public int checkTicketUsage(String tkLessonType, int csMemberCode) {
		Map<String,Object> memberInfo = new HashMap<>();
		memberInfo.put("tkLessonType", tkLessonType);
		memberInfo.put("csMemberCode", csMemberCode);
		return sqlSessionTemplate.selectOne("MemberTicketDAO.checkTicketUsage", memberInfo);
	}
	//결제취소해서 회원테이블에 수강권없애고 결제테이블에 결제취소여부 t로 update
	public int cancelMemberTicketInfo(int csMemberCode, String tkLessonType, String imp_uid) {
		Map<String,Object> paymentInfo = new HashMap<>();
		paymentInfo.put("csMemberCode", csMemberCode);
		paymentInfo.put("tkLessonType", tkLessonType);
		paymentInfo.put("imp_uid", imp_uid);
		
		return sqlSessionTemplate.update("MemberTicketDAO.cancelMemberTicketInfo",paymentInfo);
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
