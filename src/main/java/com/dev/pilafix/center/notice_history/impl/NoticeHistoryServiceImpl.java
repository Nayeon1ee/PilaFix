package com.dev.pilafix.center.notice_history.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.notice_history.NoticeHistoryService;
import com.dev.pilafix.common.notice.NoticeVO;

@Service
public class NoticeHistoryServiceImpl implements NoticeHistoryService {

	@Autowired
	private NoticeHistoryDAO dao;
	
	@Override
	public List<NoticeVO> getNoticeHistoryList(int currentUserCode) {
		return dao.getNoticeHistoryList(currentUserCode);
	}

	@Override
	public NoticeVO getNoticeHistory(String ncId) {
		return dao.getNoticeHistory(ncId);
	}

}
