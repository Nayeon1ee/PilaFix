package com.dev.pilafix.common.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.notice.NoticeDAO;
import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.common.notice.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService{

//	@Autowired
//	private WebSocketSessionManager sessionManager;
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public void processUnsentNotifications() {
//		System.out.println("Scheduler 동작 중 ");
//		int csMemberCode = (int) session.getAttributes().get("csMemberCode");
//
//		// 회원 화면에 떠야 할 내용 
//		List<NoticeVO> notices = noticeDAO.getNoticesForSend();
//		noticeDAO.updateNoticeStatus(null);
		
	}

	/**
	 * 미확인 알림 카운트 조회
	 */
	@Override
	public int getUnReadNotificationCount(int csMemberCode) {
		return noticeDAO.getUnReadNotificationCount(csMemberCode);

	}
	
	/**
	 * 미확인 알림 리스트 조회 
	 */
	@Override
	public List<NoticeVO> getUnReadNotification(int csMemberCode) {
		return noticeDAO.getUnReadNotification(csMemberCode);
	}

	/**
	 * 미확인 알림 클릭 시 상태 업데이트 
	 */
	@Override
	public void updateNoticeStatus(String ncId) {
		noticeDAO.updateNoticeStatus(ncId);
	}


	
	

}
