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

	public List<MemberVO> getMemberManageList(int ctCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getMemberList", ctCode);
	}

	public List<MemberVO> getTrainerManageList(int ctCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getTrainerList", ctCode);
	}

	public List<ConnectRequestVO> getConnectRequestForMe(int ctCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getCenterRequestForMe", ctCode);
	}
	
	public List<ConnectRequestVO> getConnectRequestForTr(int ctCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getCenterRequestForTr", ctCode);
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
	 * 
	 * @return 실패 여부 
	 */
	@Transactional
	public boolean updateConnectionYnAndInsertConnHistory(String crCode, int memberCode, int centerCode) {
		try {
			// 연동요청처리 STEP01 - TBL_CENTER_REQUEST 연동여부, 일자 업데이트
			sqlSessionTemplate.update("MemberManageDAO.updateConn", crCode);
			
			// 연동처리 STEP02 - TBL_CENTER_CONN에 이력 등록
			Map<String, Object> params = new HashMap<>();
			params.put("crCode", crCode);
			params.put("memberCode", memberCode);
			params.put("centerCode", centerCode);
			sqlSessionTemplate.insert("MemberManageDAO.insertConnHistory", params);
			
			// 연동처리 STEP03 - TBL_CST CONNECTED_CENTER_CODE 업데이트
			//여기서 맵 줘야 함 centercode랑 memberCode
			sqlSessionTemplate.update("MemberManageDAO.updateCSTConn", params);
			
			return true;
			
		} catch (Exception e) {
			// 예외 처리
			throw new RuntimeException("데이터 베이스 업데이트 실패", e);
		}
	}

	/**
	 * 연동 요청 거절
	 * @param crCode
	 */
	public int updateRejectDate(String crCode) {
		sqlSessionTemplate.update("MemberManageDAO.updateRejectDate", crCode);
		//거절한 멤버 코드를 넘김 (화면 이동에 필요)
		return sqlSessionTemplate.selectOne("MemberManageDAO.getMemberCode", crCode);
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

	public CenterLessonVO getLessonCount(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberManageDAO.getLessonCount",csMemberCode);
	}


}