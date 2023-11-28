package com.dev.pilafix.common.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.notice.NoticeDAO;
import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.common.notice.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public void processUnsentNotifications() {
		System.out.println("Scheduler 동작 중 ");
		// 회원 화면에 떠야 할 내용 
		List<NoticeVO> notices = noticeDAO.getNoticesForSend(0);
		noticeDAO.updateNoticeStatus(null);
	}

}
