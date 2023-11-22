package com.dev.pilafix.admin.info;

import java.util.List;


public interface AdminInfoService {
	List<AdminInfoVO> getAdminInfoList();
	AdminInfoVO getInfo(int iwNumber);
	int insertAdminInfo(AdminInfoVO vo);
	void insertAdminInfoAndLoadNotices(AdminInfoVO vo);
	int updateAdminInfo(AdminInfoVO vo);
	void updateAdminInfoAndLoadNotices(AdminInfoVO vo);
	int deleteAdminInfo(int iwNumber);
	void updateAdminInfoViewCnt(int iwNumber);
}