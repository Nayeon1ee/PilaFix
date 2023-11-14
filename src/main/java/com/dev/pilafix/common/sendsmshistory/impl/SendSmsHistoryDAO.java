package com.dev.pilafix.common.sendsmshistory.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryVO;

@Repository
public class SendSmsHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	/**
	 * 웹 관리자가 호출하는 이력 list
	 * @return
	 */
	public List<SendSmsHistoryVO> getSendSmsHistoryInfoList(){
		return sqlsessiontemplate.selectList("SendSmsHistoryDAO.getSendSmsHistoryInfoListForAdmin");
	}
	
	/**
	 * 센터에서 호출하는 이력 list
	 * @return
	 */
	public List<SendSmsHistoryVO> getSendSmsHistoryInfoList(int currentUserCode){
		return sqlsessiontemplate.selectList("SendSmsHistoryDAO.getSendSmsHistoryInfoListForCenter", currentUserCode);
	}
	
	
	public SendSmsHistoryVO getSendSmsHistoryInfo(String shSendCode) {
		return sqlsessiontemplate.selectOne("SendSmsHistoryDAO.getSendSmsHistoryInfo", shSendCode);
	
	}
}
