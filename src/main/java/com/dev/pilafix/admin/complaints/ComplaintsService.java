package com.dev.pilafix.admin.complaints;

import java.util.List;

import com.dev.pilafix.admin.community.CommunityVO;

public interface ComplaintsService {
	
	List<CommunityVO> getTargetComplaintsList();
	CommunityVO getComplaintsDetail(int cmNumber);
	List<ComplaintsVO> getComplaintsList(int cmNumber);
	void updateComplaintsStatus(int cmNumber);
	
}
