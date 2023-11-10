package com.dev.pilafix.admin.sendsmshistory.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.sendsmshistory.SendSmsHistoryService;
import com.dev.pilafix.admin.sendsmshistory.SendSmsHistoryVO;

@Service
public class SendSmsHistoryServiceImpl implements SendSmsHistoryService {
	
	@Autowired
	private SendSmsHistoryDAO dao;
	
	@Override
	public List<SendSmsHistoryVO> getSendSmsHistoryInfoList() {
		return dao.getSendSmsHistoryInfoList();
	}

	@Override
	public SendSmsHistoryVO getSendSmsHistoryInfo(int shSendCode) {
		return dao.getSendSmsHistoryInfo(shSendCode);
	}

}
