package com.dev.pilafix.center.info;

import java.util.List;

public interface CenterInfoService {
	List<CenterInfoVO> getCenterInfoList();
	CenterInfoVO getCenterInfo(int seq);
	int insertCenterInfo(CenterInfoVO vo);
	int updateCenterInfo(CenterInfoVO vo);
	int deleteCenterInfo(int seq);
}