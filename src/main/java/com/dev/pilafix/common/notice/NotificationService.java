package com.dev.pilafix.common.notice;

import java.util.List;
import java.util.concurrent.CompletableFuture;

public interface NotificationService {

	List<NoticeVO> getUnReadNotification(int csMemberCode);

	int getUnReadNotificationCount(int csMemberCode);

	CompletableFuture<Integer> getUnReadNotificationCountAsync(int csMemberCode);

	void updateNoticeStatus(String ncId);
	

}
