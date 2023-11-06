package com.dev.pilafix.admin.info;

import java.util.List;

public interface InfoService {
	List<InfoVO> getInfoList();
	InfoVO getInfo(int seq);
	int insertInfo(InfoVO vo);
	int updateInfo(InfoVO vo);
	int deleteInfo(int seq);
}