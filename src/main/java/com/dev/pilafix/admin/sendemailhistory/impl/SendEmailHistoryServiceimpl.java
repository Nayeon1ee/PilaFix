package com.dev.pilafix.admin.sendemailhistory.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.sendemailhistory.SendEmailHistoryService;
import com.dev.pilafix.admin.sendemailhistory.SendEmailHistoryVO;

@Service
public class SendEmailHistoryServiceimpl implements SendEmailHistoryService {

	@Autowired
	private SendEmailHistoryDAO dao;
	
	@Override
	public List<SendEmailHistoryVO> getSendEmailHistoryInfoList() {
		return dao.getSendEmailHistoryInfoList();
	}

	@Override
	public SendEmailHistoryVO getSendEmailHistoryInfo(String mheMailSendCode) {
		return dao.getSendEmailHistoryInfo(mheMailSendCode);
	}

}
