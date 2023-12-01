package com.dev.pilafix.member.attend;

import java.util.List;
import java.util.Map;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.MemberVO;

public interface AttendService {

	List<CenterLessonVO> getAllLessonListWithCtName(int csMemberCode);
	List<CenterLessonVO> getGroupLessonListWithCtName(int csMemberCode);
	List<CenterLessonVO> getLessonListWithCtNameAndCsName(int csMemberCode);
	List<MemberVO> getReservedMembersNamesForLesson(String lessonCode);
	CenterLessonVO getTrainerLessonDetail(String lessonCode);
	CenterLessonVO getLessonByTrainer(String lsCode);
	
	List<Integer> getReservedMemberCodeForLesson(String lessonCode);
	List<String> getReservedNameForLesson(String lessonCode);
	boolean isAttendanceProcessed(String lessonCode);
	
	void updateAttendancePersonalLesson(String lessonCode, int memberCode);
	void updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes);

	
	int getReservedCountForLesson(String lessonCode);
	int getAttendedCountForLesson(String lessonCode);
	int getAbsentCountForLesson(String lessonCode);
	Map<String, Integer> getCountAttendanceForLesson(String lessonCode);
}
