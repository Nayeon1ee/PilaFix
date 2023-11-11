package com.dev.pilafix.admin.sendemailhistory.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.sendemailhistory.SendEmailHistoryVO;



@Repository
public class SendEmailHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<SendEmailHistoryVO> getSendEmailHistoryInfoList(){
		return sqlSessionTemplate.selectList("SendEmailHistoryDAO.getSendEmailHistoryInfoList");
	}
	public SendEmailHistoryVO getSendEmailHistoryInfo(String mheMailSendCode) {
	    return sqlSessionTemplate.selectOne("SendEmailHistoryDAO.getSendEmailHistoryInfo",mheMailSendCode);
	}
	
	
}
