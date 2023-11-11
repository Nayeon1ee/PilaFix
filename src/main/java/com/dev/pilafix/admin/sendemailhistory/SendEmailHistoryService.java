package com.dev.pilafix.admin.sendemailhistory;

import java.util.List;


public interface SendEmailHistoryService {
	List<SendEmailHistoryVO> getSendEmailHistoryInfoList();
	SendEmailHistoryVO getSendEmailHistoryInfo(String mhEmailSendCode);
	
}
