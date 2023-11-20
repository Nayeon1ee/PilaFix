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
	 * ���ǻ��� ���� ��ȸ 
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public List<QuestionVO> getQuestionForManage(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getQuestionForManage",csMemberCode);
	}

	/**
	 * ���� ���� ��ȸ 
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public List<PaymentHistoryVO> getPaymentForManage(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberManageDAO.getPaymentForManage",csMemberCode);
	}
	
	/**
	 * Ƽ�� ���� ȭ�� ��¿� 
	 * (������ ��, ������ �� Ƚ��)
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
	 * ȸ�� �� ���� ��ȸ
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public MemberVO getMemberManage(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberManageDAO.getMemberManage", csMemberCode);
	}
	
	/**
	 * ���� ��û ó�� 
	 * @param crCode
	 * @param memberCode
	 * @param centerCode
	 */
	@Transactional
	public void updateConnectionYnAndInsertConnHistory(String crCode, int memberCode, int centerCode) {
		try {
			// ����ó�� STEP01 - TBL_CENTER_REQUEST ��������, ���� ������Ʈ
			sqlSessionTemplate.update("MemberManageDAO.updateConn", crCode);
			
			// ����ó�� STEP02 - TBL_CENTER_CONN�� �̷� ���
			Map<String, Object> params = new HashMap<>();
			params.put("crCode", crCode);
			params.put("memberCode", memberCode);
			params.put("centerCode", centerCode);
			sqlSessionTemplate.insert("MemberManageDAO.insertConnHistory", params);
			
			// ����ó�� STEP03 - TBL_CST CONNECTED_CENTER_CODE ������Ʈ
			//���⼭ �� ��� �� centercode�� memberCode
			sqlSessionTemplate.update("MemberManageDAO.updateCSTConn", params);
			
		} catch (Exception e) {
			// ���� ó�� 
			throw new RuntimeException("�����ͺ��̽� ������Ʈ ����", e);
		}
	}

	/**
	 * ���� ���� 
	 * @param crCode
	 */
	public void updateRejectDate(String crCode) {
		sqlSessionTemplate.update("MemberManageDAO.updateRejectDate", crCode);
	}

	


}
