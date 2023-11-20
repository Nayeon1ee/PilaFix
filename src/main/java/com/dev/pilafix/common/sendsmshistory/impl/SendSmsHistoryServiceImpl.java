package com.dev.pilafix.common.sendsmshistory.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryService;
import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryVO;


@Service
public class SendSmsHistoryServiceImpl implements SendSmsHistoryService {
	
	@Autowired
	private SendSmsHistoryDAO dao;
	
	@Override
	public List<SendSmsHistoryVO> getSendSmsHistoryListForCenter(int currentUserCode) {
		return dao.getSendSmsHistoryListForCenter(currentUserCode);
	}

	@Override
	public SendSmsHistoryVO getSendSmsHistoryForCenter(String shSendCode ) {
		return dao.getSendSmsHistoryForCenter(shSendCode );
	}
	

	@Override
	public List<SendSmsHistoryVO> getSendSmsHistoryListForAmdin() {
		return dao.getSendSmsHistoryListForAdmin();
	}
	
	@Override
	public SendSmsHistoryVO getSendSmsHistoryForAmdin(int shSendCenterCode, String shSendCode) {
		System.out.println("shSendCenterCode : "+ shSendCenterCode);
		System.out.println("shSendCenterCode : "+ shSendCode);
		
		return dao.getSendSmsHistoryForAdmin(shSendCenterCode, shSendCode);
	}
	

}