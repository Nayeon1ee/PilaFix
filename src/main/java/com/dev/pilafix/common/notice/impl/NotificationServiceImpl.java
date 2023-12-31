package com.dev.pilafix.common.notice.impl;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.common.notice.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService{

	
	@Autowired
	private NoticeDAO noticeDAO;
	

	/**
	 * 미확인 알림 카운트 조회
	 */
	@Override
	public int getUnReadNotificationCount(int csMemberCode) {
		return noticeDAO.getUnReadNotificationCount(csMemberCode);
	}

	@Override
    @Async
    public CompletableFuture<Integer> getUnReadNotificationCountAsync(int csMemberCode) {
        try {
            return CompletableFuture.completedFuture(noticeDAO.getUnReadNotificationCount(csMemberCode));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
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
