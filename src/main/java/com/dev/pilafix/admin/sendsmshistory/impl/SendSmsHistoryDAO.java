package com.dev.pilafix.admin.sendsmshistory.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.sendsmshistory.SendSmsHistoryVO;

@Repository
public class SendSmsHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	
	public List<SendSmsHistoryVO> getSendSmsHistoryInfoList(){
		return sqlsessiontemplate.selectList("SendSmsHistoryDAO.getSendSmsHistoryInfoList");
	}
	
	
	public SendSmsHistoryVO getSendSmsHistoryInfo(int shSendCode) {
		return sqlsessiontemplate.selectOne("SendSmsHistoryDAO.getSendSmsHistoryInfo", shSendCode);
	
	}
}
