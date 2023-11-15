package com.dev.pilafix.center.notice;

import java.util.List;

public interface NoticeHistoryService {

	List<NoticeHistoryVO> getNoticeHistoryList(int currentUserCode);
	NoticeHistoryVO getNoticeHistory(String ncId);



}
