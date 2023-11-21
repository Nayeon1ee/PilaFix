package com.dev.pilafix.center.info;

import java.util.List;

public interface CenterInfoService {
	List<CenterInfoVO> getCenterInfoList(int ctCode);
	CenterInfoVO getCenterInfo(int seq);
	int insertCenterInfo(CenterInfoVO vo);
	int updateCenterInfo(CenterInfoVO vo);
	int deleteCenterInfo(int seq);
	int updateCenterInfoViewCnt(int cnt);
}
