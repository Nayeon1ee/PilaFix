package com.dev.pilafix.admin.complaints;

import java.util.List;
import java.util.Map;

public interface ComplaintsService {
	
	List<ComplaintsVO> getComplaintsInfoList();
	ComplaintsVO getComplaintsInfo(int cpCode);
	int insertComplaintsInfo(ComplaintsVO vo);
	int updateComplaintsInfo(ComplaintsVO vo);
	int deleteComplaintsInfo(int cp_code);
	void revokeComplaints(int cpCode);
	List<ComplaintsVO> getAllComplaintsList(int cpTargetPostNumber);
	
	List<ComplaintsVO> getBlameReasonsByCount(String cmBlameCount);
	
	
}
