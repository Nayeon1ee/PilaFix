package com.dev.pilafix.center.member_trainer_manage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.member_trainer_manage.ConnectRequestVO;
import com.dev.pilafix.common.member.MemberVO;

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

	public List<ConnectRequestVO> getConnectRequestForMem() {
		return sqlSessionTemplate.selectList("MemberManageDAO.getCenterRequestForMe");
	}

	
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
			sqlSessionTemplate.update("MemberManageDAO.updateCSTConn", memberCode);
			
		} catch (Exception e) {
			// 예외 처리 
			throw new RuntimeException("데이터베이스 업데이트 오류", e);
		}
	}

}
