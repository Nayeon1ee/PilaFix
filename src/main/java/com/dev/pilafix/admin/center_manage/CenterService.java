package com.dev.pilafix.admin.center_manage;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface CenterService {
	
	List<CenterVO> getCenterList();
	CenterVO getCenter(int ctCode);
	int insertCenter(CenterVO vo);
	int updateCenter(CenterVO vo);
	int deleteCenter(int ctCode);
	int ctIdCheck(String ctId);
    void sendEmailAndInsertSendEmailHistory(CenterVO center);
    void insertCenterAndSetSession(CenterVO center, HttpSession session);
	
}
