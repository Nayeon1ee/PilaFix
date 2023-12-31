package com.dev.pilafix.member.attend;

import java.util.List;
import java.util.Map;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.MemberVO;

public interface AttendService {

	List<CenterLessonVO> getAllLessonListWithCtName(int csMemberCode);

	List<MemberVO> getReservedMembersNamesForLesson(String lessonCode);

	CenterLessonVO getTrainerLessonDetail(String lessonCode);

	CenterLessonVO getLessonByTrainer(String lsCode);

	List<Integer> getReservedMemberCodeForLesson(String lessonCode);

	List<String> getReservedNameForLesson(String lessonCode);

//	boolean isAttendanceProcessed(String lessonCode);

	void updateAttendancePersonalLesson(String lessonCode, int memberCode);

	void updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes);

	int getReservedCountForLesson(String lessonCode);

    int getAttendedCountForLesson(String atCode);
    int getAbsentCountForLesson(String atCode);

	Map<String, Integer> getCountAttendanceForLesson(String lessonCode);

	// 진행중
	List<CenterLessonVO> getOngoingTrainerLessons(int csMemberCode);

	// 수업종료
	List<CenterLessonVO> getCompletedTrainerLessons(int csMemberCode);

	// 폐강
	List<CenterLessonVO> getClosedTrainerLessons(int csMemberCode);
	
    AttendVO getAttendanceByLessonCode(String lsCode);
//    int updateMemberAttendance(List<Integer> selectedMemberCodes);
    int updateAttendance(String atCode, List<Integer> memberCodes);
    int updateAttendanceP(String atCode, List<Integer> memberCodes);
}
