package com.dev.pilafix.common.sendsmshistory;

import java.util.List;

public interface SendSmsHistoryService {

	List<SendSmsHistoryVO> getSendSmsHistoryListForCenter(int currentUserCode);
	SendSmsHistoryVO getSendSmsHistoryForCenter(String shSendCode );
	
	List<SendSmsHistoryVO> getSendSmsHistoryListForAmdin();
	SendSmsHistoryVO getSendSmsHistoryForAmdin(int shSendCenterCode, String shSendCode);
	
}
