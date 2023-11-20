package com.dev.pilafix.center.notice_history.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.notice_history.NoticeHistoryVO;

@Repository
public class NoticeHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<NoticeHistoryVO> getNoticeHistoryList(int currentUserCode) {
		
		return sqlSessionTemplate.selectList("NoticeHistoryDAO.getNoticeHistoryList",String.valueOf(currentUserCode));
	}

	public NoticeHistoryVO getNoticeHistory(String ncId) {
		return sqlSessionTemplate.selectOne("NoticeHistoryDAO.getNoticeHistory",ncId);
	}

}
