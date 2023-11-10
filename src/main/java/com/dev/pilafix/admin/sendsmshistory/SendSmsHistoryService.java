package com.dev.pilafix.admin.sendsmshistory;

import java.util.List;

public interface SendSmsHistoryService {
	List<SendSmsHistoryVO> getSendSmsHistoryInfoList();
	SendSmsHistoryVO getSendSmsHistoryInfo(int shSendCode);
	
}
