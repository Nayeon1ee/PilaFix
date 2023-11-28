package com.dev.pilafix.member.attend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.member.attend.AttendVO;

@Repository
public class AttendDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	/* lesson-mapper 쿼리 가져오는 메서드 */
	/**
	 * 로그인한 강사의 회원코드로 가져오는 그룹 수업리스트 + 센터이름
	 * @param csMemberCode
	 * @return
	 */
	public List<CenterLessonVO> getGroupLessonListWithCtName(int csMemberCode){
		return sqlSessionTemplate.selectList("CenterLessonDAO.getGroupLessonListWithCtName",csMemberCode);
	}
	
	/**
	 * 로그인한 강사의 회원코드로 가져오는 개인 수업리스트 + 센터이름 + 예약회원이름
	 * @param csMemberCode
	 * @return
	 */
	public List<CenterLessonVO> getLessonListWithCtNameAndCsName(int csMemberCode){
		return sqlSessionTemplate.selectList("CenterLessonDAO.getLessonListWithCtNameAndCsName",csMemberCode);
	}
	
	/**
	 * 로그인한 강사의 회원코드로 가져오는 수업 상세 + 회원이름
	 * @param lessonCode
	 * @param memberCode
	 * @param isAttended
	 */
	public CenterLessonVO getLessonByTrainerCodeWithCsName(int csMemberCode) {
		return sqlSessionTemplate.selectOne("CenterLessonDAO.getLessonByTrainerCodeWithCsName",csMemberCode);
	}

	
	/**
	 * 개인수업 출석 업데이트
	 * @param lessonCode
	 * @param memberCode
	 */
	public void updateAttendancePersonalLesson(String lessonCode, String memberCode) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("lessonCode", lessonCode);
	    params.put("selectedMemberCode", memberCode);
	    sqlSessionTemplate.update("AttendDAO.updateAttendancePersonalLesson", params);
	}

	/**
	 * 그룹수업 출석 업데이트
	 * @param lessonCode
	 * @param selectedMemberCodes
	 */
	public void updateAttendanceGroupLesson(String lessonCode, List<String> selectedMemberCodes) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("lessonCode", lessonCode);
	    params.put("selectedMemberCodes", selectedMemberCodes);
	    sqlSessionTemplate.update("AttendDAO.updateAttendanceGroupLesson", params);
	}
    
    
    

}
