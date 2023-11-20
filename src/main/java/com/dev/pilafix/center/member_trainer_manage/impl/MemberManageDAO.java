package com.dev.pilafix.center.member_trainer_manage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.dev.pilafix.center.lesson.CenterLessonVO;

import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;

import com.dev.pilafix.center.member_trainer_manage.ConnectRequestVO;
import com.dev.pilafix.center.member_trainer_manage.TicketInfoVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.common.question.QuestionVO;

@Repository
public class MemberManageDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MemberVO> getMemberManageList() {
		return sqlSessionTemplate.selectList("MemberManageDAO.getMemberList");
	}

	public List<MemberVO> getTrainerManageList() {
		return sqlSessionTemplate.selectList("MemberManageDAO.getTrainerList");
	}

	public List<ConnectRequestVO> getConnectRequestForMe() {
		return sqlSessionTemplate.selectList("MemberManageDAO.getCenterRequestForMe");
	}
	
	public List<ConnectRequestVO> getConnectRequestForTr() {
		return sqlSessionTemplate.selectList("MemberManageDAO.getCenterRequestForTr");
	}
	
	/**

	 * 문의사항 내역 조회 
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public List<QuestionVO> getQuestionForManage(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getQuestionForManage",csMemberCode);
	}

	/**
	 * 결제 내역 조회 
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public List<PaymentHistoryVO> getPaymentForManage(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getPaymentForManage",csMemberCode);
	}
	
	/**
	 * 티켓 정보 화면 출력용 
	 * (수강권 명, 수강권 총 횟수)
	 * 
	 * @param tkCode
	 * @return
	 */
	public TicketInfoVO getTicketInfoForManage(String tkCode){
		return sqlSessionTemplate.selectOne("MemberManageDAO.getTicketInfo",tkCode);
	}
	
//	public List<ReservationVO> getReserveForManage(int csMemberCode) {
//		return sqlSessionTemplate.selectList("MemberManageDAO.getReserveForManage",csMemberCode);
//	}
	
	/**
	 * 회원 상세 정보 조회
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public MemberVO getMemberManage(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberManageDAO.getMemberManage", csMemberCode);
	}
	
	/**
	 * 연동 요청 처리 
	 * @param crCode
	 * @param memberCode
	 * @param centerCode
	 */
	@Transactional
	public void updateConnectionYnAndInsertConnHistory(String crCode, int memberCode, int centerCode) {
		try {
			// 占쏙옙占쏙옙처占쏙옙 STEP01 - TBL_CENTER_REQUEST 占쏙옙占쏙옙占쏙옙占쏙옙, 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트
			sqlSessionTemplate.update("MemberManageDAO.updateConn", crCode);
			
			// 占쏙옙占쏙옙처占쏙옙 STEP02 - TBL_CENTER_CONN占쏙옙 占싱뤄옙 占쏙옙占
			Map<String, Object> params = new HashMap<>();
			params.put("crCode", crCode);
			params.put("memberCode", memberCode);
			params.put("centerCode", centerCode);
			sqlSessionTemplate.insert("MemberManageDAO.insertConnHistory", params);
			
			// 占쏙옙占쏙옙처占쏙옙 STEP03 - TBL_CST CONNECTED_CENTER_CODE 占쏙옙占쏙옙占쏙옙트
			//占쏙옙占썩서 占쏙옙 占쏙옙占 占쏙옙 centercode占쏙옙 memberCode
			sqlSessionTemplate.update("MemberManageDAO.updateCSTConn", params);
			
		} catch (Exception e) {
			// 占쏙옙占쏙옙 처占쏙옙 
			throw new RuntimeException("占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙占쏙옙트 占쏙옙占쏙옙", e);
		}
	}

	/**
	 * 占쏙옙占쏙옙 占쏙옙占쏙옙 
	 * @param crCode
	 */
	public void updateRejectDate(String crCode) {
		sqlSessionTemplate.update("MemberManageDAO.updateRejectDate", crCode);
	}


	public MemberVO getMember(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberManageDAO.getMember", csMemberCode);
	}
	
	public List<CenterLessonVO> getGroupLesson(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getGroupLesson",csMemberCode);
	}

	public List<CenterLessonVO> getPersonalLesson(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getPersonalLesson",csMemberCode);
	}


}
