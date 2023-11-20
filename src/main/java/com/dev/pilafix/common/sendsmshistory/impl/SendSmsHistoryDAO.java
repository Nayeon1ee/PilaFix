package com.dev.pilafix.common.sendsmshistory.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryVO;

@Repository
public class SendSmsHistoryDAO {

	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;


	/**
	 * 센터에서 호출하는 이력 list
	 * 
	 * @return
	 */
	public List<SendSmsHistoryVO> getSendSmsHistoryListForCenter(int currentUserCode) {
		return sqlsessiontemplate.selectList("SendSmsHistoryDAO.getSendSmsHistoryListForCenter", currentUserCode);
	}

	public SendSmsHistoryVO getSendSmsHistoryForCenter(String shSendCode) {
		return sqlsessiontemplate.selectOne("SendSmsHistoryDAO.getSendSmsHistoryForCenter", shSendCode);

	}

	/**
	 * 웹 관리자가 호출하는 이력 list
	 * 
	 * @return
	 */
	public List<SendSmsHistoryVO> getSendSmsHistoryListForAdmin() {
		return sqlsessiontemplate.selectList("SendSmsHistoryDAO.getSendSmsHistoryListForAdmin");
	}

	public SendSmsHistoryVO getSendSmsHistoryForAdmin(int shSendCenterCode, String shSendCode) {
		System.out.println("shSendCenterCode : "+ shSendCenterCode);
		System.out.println("shSendCenterCode : "+ shSendCode);	

		// 파라미터가 2개이므로 Map으로 넘김
		Map<String, Object> params = new HashMap<>();
		params.put("shSendCenterCode", shSendCenterCode);
		params.put("shSendCode", shSendCode);
		
		System.out.println("파라미터 값 "+params.toString());
		System.out.println("shSendCenterCode : "+ params.get("shSendCenterCode"));
		System.out.println("shSendCenterCode : "+ params.get("shSendCode"));
		
		return sqlsessiontemplate.selectOne("SendSmsHistoryDAO.getSendSmsHistoryForAdmin", params);
	}
}
