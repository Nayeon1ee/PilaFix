package com.dev.pilafix.common.notice;

import java.util.List;

public interface NotificationService {

	void processUnsentNotifications();

	List<NoticeVO> getUnReadNotification(int csMemberCode);

	int getUnReadNotificationCount(int csMemberCode);

	void updateNoticeStatus(String ncId);
	

}
