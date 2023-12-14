package com.dev.pilafix.member.attend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.attend.AttendVO;

@Repository
public class AttendDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/* lesson-mapper 쿼리 가져오는 메서드 */

	public List<CenterLessonVO> getTrainerLessonListWithCtName(int csMemberCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getTrainerLessonListWithCtName", csMemberCode);
	}

	/**
	 * 수업 상태별로 3가지 리스트 
	 */
	//진행중 
	public List<CenterLessonVO> getOngoingTrainerLessons(int csMemberCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getOngoingTrainerLessons",csMemberCode);
	}
	//수업종료
	public List<CenterLessonVO> getCompletedTrainerLessons(int csMemberCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getCompletedTrainerLessons",csMemberCode);
	}
	
	//폐강
	public List<CenterLessonVO> getClosedTrainerLessons(int csMemberCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getClosedTrainerLessons",csMemberCode);
	}
	
	
	// 1204 수업코드로 가져오는 해당 AttnedVO
	public AttendVO selectAttendanceByLessonCode(String lsCode) {
        return sqlSessionTemplate.selectOne("AttendDAO.selectAttendanceByLessonCode", lsCode);
    }
	// atCode의 attendVO 출결처리
	  public int updateMemberAttendance(String atCode, int memberCode) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("atCode", atCode);
	        params.put("memberCode", memberCode);
	        return sqlSessionTemplate.update("AttendDAO.updateMemberAttendance", params);
	    }
	  


	/**
	 * 수업상세
	 * @param lsCode
	 * @return
	 */
	public CenterLessonVO getLessonByTrainer(String lsCode) {
		return sqlSessionTemplate.selectOne("CenterLessonDAO.getLessonByTrainer", lsCode);
	}
	
	

	/**
	 * 개인수업 출석 업데이트
	 * 
	 * @param lessonCode
	 * @param memberCode
	 */
	public void updateAttendancePersonalLesson(String atCode, int memberCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("atCode", atCode);
		params.put("selectedMemberCode", memberCode);
		sqlSessionTemplate.update("AttendDAO.updateAttendancePersonalLesson", params);
	}

	/**
	 * 그룹수업 출석 업데이트
	 * 
	 * @param lessonCode
	 * @param selectedMemberCodes
	 */
	public void updateAttendanceGroupLesson(Map<String, Object> paramMap) {
        sqlSessionTemplate.update("AttendDAO.updateAttendanceGroupLesson", paramMap);
    }
//	public void updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes) {
//		Map<String, Object> params = new HashMap<>();
//		params.put("lessonCode", lessonCode);
//		params.put("selectedMemberCodes", selectedMemberCodes);
//		sqlSessionTemplate.update("AttendDAO.updateAttendanceGroupLesson", params);
//	}

	/**
	 * 예약한 회원 이름, 회원코드
	 */
	public List<MemberVO> getReservedMembersNamesForLesson(String lessonCode) {
		List<MemberVO> members = sqlSessionTemplate.selectList("AttendDAO.getReservedMembersNamesForLesson",
				lessonCode);
		System.out.println("DAO Returned Members: " + members);
		return members;
	}
	// 회원 코드 목록 가져오기
	public List<Integer> getReservedMemberCodeForLesson(String lessonCode) {
	    List<Integer> memberCode = sqlSessionTemplate.selectList("AttendDAO.getReservedMemberCodeForLesson", lessonCode);
	    System.out.println("DAO Returned Member Codes: " + memberCode);
	    return memberCode;
	}

	// 회원 이름 목록 가져오기
	public List<String> getReservedNameForLesson(String lessonCode) {
	    List<String> memberName = sqlSessionTemplate.selectList("AttendDAO.getReservedNameForLesson", lessonCode);
	    System.out.println("DAO Returned Member Names: " + memberName);
	    return memberName;
	}

	/**
	 * 예약한 회원 수
	 */
	public int getReservedCountForLesson(String lessonCode) {
		return sqlSessionTemplate.selectOne("AttendDAO.getReservedCountForLesson", lessonCode);
	}

	/**
	 * 출석한 회원 수
	 */
    public int getAttendedCountForLesson(String atCode) {
        return sqlSessionTemplate.selectOne("AttendDAO.getAttendedCountForLesson", atCode);
    }

	/**
	 * 결석한 회원 수
	 */
    public int getAbsentCountForLesson(String atCode) {
        return sqlSessionTemplate.selectOne("AttendDAO.getAbsentCountForLesson", atCode);
    }
}
