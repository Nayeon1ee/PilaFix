package com.dev.pilafix.admin.info;

import java.util.List;

public interface AdminInfoService {
	List<AdminInfoVO> getAdminInfoList();
	AdminInfoVO getInfo(int seq);
	int insertAdminInfo(AdminInfoVO vo);
	int updateAdminInfo(AdminInfoVO vo);
	int deleteAdminInfo(int seq);
	int updateAdminInfoViewCnt(int cnt);
}