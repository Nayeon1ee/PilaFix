package com.dev.pilafix.center.member_trainer_manage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
			// 연동처리 STEP01 - TBL_CENTER_REQUEST 연동여부, 일자 업데이트
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
			
		} catch (Exception e) {
			// 예외 처리 
			throw new RuntimeException("데이터베이스 업데이트 오류", e);
		}
	}

	/**
	 * 연동 거절 
	 * @param crCode
	 */
	public void updateRejectDate(String crCode) {
		sqlSessionTemplate.update("MemberManageDAO.updateRejectDate", crCode);
	}

	


}
