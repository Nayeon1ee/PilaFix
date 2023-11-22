package com.dev.pilafix.center.info;

import java.util.List;

public interface CenterInfoService {
	List<CenterInfoVO> getCenterInfoList(int ctCode);
	CenterInfoVO getCenterInfo(int icNumber);
	void insertCenterInfoAndLoadNotices(CenterInfoVO vo);
	int insertCenterInfo(CenterInfoVO vo);
	int updateCenterInfo(CenterInfoVO vo);
	void updateCenterInfoAndLoadNotices(CenterInfoVO vo);
	int deleteCenterInfo(int icNumber);
	int updateCenterInfoViewCnt(int icNumber);
}
