package com.dev.pilafix.common.sendsmshistory.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryService;
import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryVO;


@Service
public class SendSmsHistoryServiceImpl implements SendSmsHistoryService {
	
	@Autowired
	private SendSmsHistoryDAO dao;
	
	@Override
	public List<SendSmsHistoryVO> getSendSmsHistoryInfoList(int currentUserCode) {
		return dao.getSendSmsHistoryInfoList(currentUserCode);
	}

	@Override
	public SendSmsHistoryVO getSendSmsHistoryInfo(String shSendCode) {
		return dao.getSendSmsHistoryInfo(shSendCode);
	}

	@Override
	public List<SendSmsHistoryVO> getSendSmsHistoryInfoList() {
		return dao.getSendSmsHistoryInfoList();
	}

}
