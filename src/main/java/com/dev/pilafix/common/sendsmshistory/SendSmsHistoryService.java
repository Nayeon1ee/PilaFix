package com.dev.pilafix.common.sendsmshistory;

import java.util.List;

public interface SendSmsHistoryService {
	List<SendSmsHistoryVO> getSendSmsHistoryInfoList();
	List<SendSmsHistoryVO> getSendSmsHistoryInfoList(int currentUserCode);
	SendSmsHistoryVO getSendSmsHistoryInfo(String shSendCode);
	
}
