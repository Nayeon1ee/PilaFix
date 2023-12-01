package com.dev.pilafix.center.notice_history;

import java.util.List;

import com.dev.pilafix.common.notice.NoticeVO;

public interface NoticeHistoryService {

	List<NoticeVO> getNoticeHistoryList(int currentUserCode);
	NoticeVO getNoticeHistory(String ncId);



}
