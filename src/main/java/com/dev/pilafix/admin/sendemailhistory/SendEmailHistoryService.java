package com.dev.pilafix.admin.sendemailhistory;

import java.util.List;


public interface SendEmailHistoryService {
	List<SendEmailHistoryVO> getSendEmailHistoryInfoList();
	SendEmailHistoryVO getSendEmailHistoryInfo(int mhEmailSendCode);
	int insertSendEmailHistoryInfo(SendEmailHistoryVO vo);
	int updateSendEmailHistoryInfo(SendEmailHistoryVO vo);
	int deleteSendEmailHistoryInfo(int mhEmailSendCode);
	
}
