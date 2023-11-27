package com.dev.pilafix.member.attend;

import java.util.List;

public interface AttendService {
	
	List<AttendVO> getAttendListByMemberCode(int csMemberCode);
	void updateAttendance(String lessonCode, List<String> attendedMemberCodes);

}
