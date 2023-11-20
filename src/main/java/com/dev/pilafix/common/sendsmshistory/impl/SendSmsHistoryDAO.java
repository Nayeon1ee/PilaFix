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
	 * ���Ϳ��� ȣ���ϴ� �̷� list
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
	 * �� �����ڰ� ȣ���ϴ� �̷� list
	 * 
	 * @return
	 */
	public List<SendSmsHistoryVO> getSendSmsHistoryListForAdmin() {
		return sqlsessiontemplate.selectList("SendSmsHistoryDAO.getSendSmsHistoryListForAdmin");
	}

	public SendSmsHistoryVO getSendSmsHistoryForAdmin(int shSendCenterCode, String shSendCode) {
		System.out.println("shSendCenterCode : "+ shSendCenterCode);
		System.out.println("shSendCenterCode : "+ shSendCode);	

		// �Ķ���Ͱ� 2���̹Ƿ� Map���� �ѱ�
		Map<String, Object> params = new HashMap<>();
		params.put("shSendCenterCode", shSendCenterCode);
		params.put("shSendCode", shSendCode);
		
		System.out.println("�Ķ���� �� "+params.toString());
		System.out.println("shSendCenterCode : "+ params.get("shSendCenterCode"));
		System.out.println("shSendCenterCode : "+ params.get("shSendCode"));
		
		return sqlsessiontemplate.selectOne("SendSmsHistoryDAO.getSendSmsHistoryForAdmin", params);
	}
}
