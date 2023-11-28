package com.dev.pilafix.member.attend;

import java.util.List;

import com.dev.pilafix.center.lesson.CenterLessonVO;

public interface AttendService {

	List<CenterLessonVO> getGroupLessonListWithCtName(int csMemberCode);
	List<CenterLessonVO> getLessonListWithCtNameAndCsName(int csMemberCode);
	void updateAttendancePersonalLesson();
	void updateAttendanceGroupLesson();
	

	

}
