package com.dev.pilafix.member.attend.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.lesson.impl.CenterLessonDAO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.attend.AttendService;
import com.dev.pilafix.member.reserve.impl.ReservDAO;

@Service
public class AttendServiceImpl implements AttendService {

	@Autowired
	private AttendDAO dao;
	@Autowired
	private CenterLessonDAO lessonDAO;
	@Autowired
	private ReservDAO reservDAO;

	/**
	 * 강사의 전체 수업 리스트 (개인/그룹) + 센터이름 + 예약인원 수업시간이 현재시간을 지나면 '수업종료', 폐강여부가 Y이면 '폐강',
	 * 아니면 '진행중'
	 */
	@Override
	public List<CenterLessonVO> getAllLessonListWithCtName(int csMemberCode) {
		return dao.getTrainerLessonListWithCtName(csMemberCode);
	}

	@Override
	public boolean isAttendanceProcessed(String lessonCode) {
	    int attendedCount = dao.getAttendedCountForLesson(lessonCode);
	    return attendedCount > 0;
	}
	/**
	 * 수업상세
	 */
	@Override
	public CenterLessonVO getTrainerLessonDetail(String lsCode) {
		CenterLessonVO lessonDetail = dao.getLessonByTrainer(lsCode);
		List<Integer> memberCodes = dao.getReservedMemberCodeForLesson(lsCode);
		List<String> memberNames = dao.getReservedNameForLesson(lsCode);

		// 회원 코드와 이름 결합
		List<MemberVO> reservedMembers = new ArrayList<>();
		for (int i = 0; i < memberCodes.size(); i++) {
			MemberVO member = new MemberVO();
			member.setCsMemberCode(memberCodes.get(i)); 
			member.setCsName(memberNames.get(i)); 
			reservedMembers.add(member);
		}

		lessonDetail.setReservedMembers(reservedMembers);
//	    // 예약한 회원 이름과 회원코드 List 주석처리
//	    List<MemberVO> reservedMembers = dao.getReservedMembersNamesForLesson(lsCode);
//	    lessonDetail.setReservedMembers(reservedMembers);
//	    System.out.println("Reserved Members: " + reservedMembers); // 데이터 확인

		// 예약한 회원수, 출석한 회원수, 결석한 회원수 설정
		lessonDetail.setReservedCount(dao.getReservedCountForLesson(lsCode));
//		lessonDetail.setAttendedCount(dao.getAttendedCountForLesson(lsCode));
//		lessonDetail.setAbsentCount(dao.getAbsentCountForLesson(lsCode));

		return lessonDetail;
	}

	/**
	 * 그룹수업 출결처리
	 */

//    @Transactional
	@Override
    public void updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("lessonCode", lessonCode);
        paramMap.put("selectedMemberCodes", selectedMemberCodes);
        dao.updateAttendanceGroupLesson(paramMap);

    }
	
	/**
	 * 출석,결석 수 저장
	 */
	
	@Override
	public Map<String, Integer> getCountAttendanceForLesson(String lessonCode) {
		// 출석/결석 count 가져오기
		int attendedCount = dao.getAttendedCountForLesson(lessonCode);
		int absentCount = dao.getAbsentCountForLesson(lessonCode);

		// 결과 맵 생성
		Map<String, Integer> counts = new HashMap<>();
		counts.put("attendedCount", attendedCount);
		counts.put("absentCount", absentCount);
		// 결과 반환
		return counts;
	}
	
//호출할때
//	Map<String, Integer> attendanceCounts = service.getCountAttendanceForLesson(lessonCode);
//	int attendedCount = attendanceCounts.get("attended");
//	int absentCount = attendanceCounts.get("absent");
	
	
//	@Override
//	public int getCountAttendanceForLesson(String lessonCode) {
//        // 출석 및 결석 회원 수 가져오기
//        int attendedCount = dao.getAttendedCountForLesson(lessonCode);
//        int absentCount = dao.getAbsentCountForLesson(lessonCode);
//
//        // CenterLessonVO에 출석 및 결석 회원 수 업데이트
//        CenterLessonVO lesson = new CenterLessonVO();
//        lesson.setLsCode(lessonCode);
//        lesson.setAttendedCount(attendedCount);
//        lesson.setAbsentCount(absentCount);
//        
//        return 
//	}
//	@Transactional
//	public Map<String, Integer> updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes) {
//		// 출석한 회원에 대한 업데이트 로직
//		dao.updateAttendanceGroupLesson(lessonCode, selectedMemberCodes);
//
//		// 출석/결석 count 가져오기
//		int attendedCount = dao.getAttendedCountForLesson(lessonCode);
//		int absentCount = dao.getAbsentCountForLesson(lessonCode);
//
//		// 결과 맵 생성
//		Map<String, Integer> counts = new HashMap<>();
//		counts.put("attended", attendedCount);
//		counts.put("absent", absentCount);
//
//		// 결과 반환
//		return counts;
//	}

	/**
	 * 개인수업출결
	 */
	@Override
	public void updateAttendancePersonalLesson(String lessonCode, int memberCode) {
		dao.updateAttendancePersonalLesson(lessonCode, memberCode);
	}

//	/**
//	 * 그룹수업출결
//	 */
//	@Override
//	public void updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes) {
//		dao.updateAttendanceGroupLesson(lessonCode, selectedMemberCodes);
//	}

	/**
	 * 수업상세내역
	 */
	@Override
	public CenterLessonVO getLessonByTrainer(String lsCode) {
		return dao.getLessonByTrainer(lsCode);
	}

	/**
	 * 수업상세에서 회원이름, 회원코드(출석처리 위해 받아옴)
	 */
	@Override
	public List<MemberVO> getReservedMembersNamesForLesson(String lessonCode) {
		return dao.getReservedMembersNamesForLesson(lessonCode);
	}

	@Override
	public List<Integer> getReservedMemberCodeForLesson(String lessonCode) {
		return dao.getReservedMemberCodeForLesson(lessonCode);
	}

	@Override
	public List<String> getReservedNameForLesson(String lessonCode) {
		return dao.getReservedNameForLesson(lessonCode);
	}

	@Override
	public int getReservedCountForLesson(String lsCode) {
		return dao.getReservedCountForLesson(lsCode);
	}
	@Override
	public int getAttendedCountForLesson(String lsCode) {
		return dao.getAttendedCountForLesson(lsCode);
	}
	@Override
	public int getAbsentCountForLesson(String lsCode) {
		return dao.getAbsentCountForLesson(lsCode);
	}

	@Override
	public List<CenterLessonVO> getOngoingTrainerLessons(int csMemberCode) {
		return dao.getOngoingTrainerLessons(csMemberCode);
	}

	@Override
	public List<CenterLessonVO> getCompletedTrainerLessons(int csMemberCode) {
		return dao.getCompletedTrainerLessons(csMemberCode);
	}

//	@Override
//	public List<CenterLessonVO> getClosedTrainerLessons(int csMemberCode) {
//		return getClosedTrainerLessons(csMemberCode);
//	}
	
	@Override
    public List<CenterLessonVO> getClosedTrainerLessons(int csMemberCode) {
        List<CenterLessonVO> closedLessons = dao.getClosedTrainerLessons(csMemberCode);

        // 만약 폐강된 수업이 비어있으면 빈 리스트 반환
        if (closedLessons == null || closedLessons.isEmpty()) {
            return Collections.emptyList(); // 빈 리스트 반환
        }

        for (CenterLessonVO lesson : closedLessons) {
            int reservedCount = dao.getReservedCountForLesson(lesson.getLsCode());
            lesson.setReservedCount(reservedCount);
        }

        return closedLessons;
    }



}
