package com.dev.pilafix.center.notice_history;

import java.util.List;

public interface NoticeHistoryService {

	List<NoticeHistoryVO> getNoticeHistoryList(int currentUserCode);
	NoticeHistoryVO getNoticeHistory(String ncId);



}
