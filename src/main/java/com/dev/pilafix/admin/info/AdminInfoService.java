package com.dev.pilafix.admin.info;

import java.util.List;

public interface AdminInfoService {
	List<AdminInfoVO> getInfoList();
	AdminInfoVO getInfo(int seq);
	int insertInfo(AdminInfoVO vo);
	int updateInfo(AdminInfoVO vo);
	int deleteInfo(int seq);
}