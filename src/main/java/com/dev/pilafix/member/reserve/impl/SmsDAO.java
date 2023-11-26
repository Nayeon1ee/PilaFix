package com.dev.pilafix.member.reserve.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryVO;

@Repository
public class SmsDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 알림 등록 
	 * 
	 * @param notice
	 */
	public void saveSMSHistory(SendSmsHistoryVO smsHistory) {
		System.out.println("SmsDAO까지 옴 "+smsHistory.getShSendCode());
		sqlSessionTemplate.insert("ReservDAO.saveSMSHistory", smsHistory);
		System.out.println(smsHistory.getShRecipientContent()+" ==== 문자이력 등록 완료");
	}

	
}
