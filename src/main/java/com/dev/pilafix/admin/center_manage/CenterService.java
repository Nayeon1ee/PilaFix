package com.dev.pilafix.admin.center_manage;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryVO;

public interface CenterService {
	
	List<CenterVO> getCenterList();
	CenterVO getCenter(int ctCode);
	List<SendSmsHistoryVO> getSmsHistory(int ctCode);
	int insertCenter(CenterVO vo);
	int updateCenter(CenterVO vo);
	int deleteCenter(int ctCode);
	int idCheck(String ctId);
	int emailCheck(String ownerEmail);
    void sendEmailAndInsertSendEmailHistory(CenterVO center);
    void insertCenterAndSetSession(CenterVO center, HttpSession session);
    void revokeCenter(int ctCode);
    void resetPassword(int ctCode);
    List<CenterVO> getExcelCenterList();
}