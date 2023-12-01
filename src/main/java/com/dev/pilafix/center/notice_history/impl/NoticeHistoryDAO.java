package com.dev.pilafix.center.notice_history.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.notice.NoticeVO;

@Repository
public class NoticeHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<NoticeVO> getNoticeHistoryList(int currentUserCode) {
		return sqlSessionTemplate.selectList("NoticeDAO.getNoticeHistoryList",String.valueOf(currentUserCode));
	}

	public NoticeVO getNoticeHistory(String ncId) {
		return sqlSessionTemplate.selectOne("NoticeDAO.getNoticeHistory",ncId);
	}

}
