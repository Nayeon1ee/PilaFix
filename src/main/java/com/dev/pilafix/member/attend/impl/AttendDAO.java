package com.dev.pilafix.member.attend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.MemberVO;

@Repository
public class AttendDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/* lesson-mapper 쿼리 가져오는 메서드 */

	public List<CenterLessonVO> getTrainerLessonListWithCtName(int csMemberCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getTrainerLessonListWithCtName", csMemberCode);
	}

	/**
	 * 로그인한 강사의 회원코드로 가져오는 그룹 수업리스트 + 센터이름
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public List<CenterLessonVO> getGroupLessonListWithCtName(int csMemberCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getGroupLessonListWithCtName", csMemberCode);
	}

	/**
	 * 로그인한 강사의 회원코드로 가져오는 개인 수업리스트 + 센터이름 + 예약회원이름
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public List<CenterLessonVO> getLessonListWithCtNameAndCsName(int csMemberCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getLessonListWithCtNameAndCsName", csMemberCode);
	}

	/**
	 * 수업 상세 + 회원이름
	 * 
	 * @param lessonCode
	 * @param memberCode
	 * @param isAttended
	 */
	public CenterLessonVO getLessonByTrainerWithCsName(String lsCode) {
		return sqlSessionTemplate.selectOne("CenterLessonDAO.getLessonByTrainerWithCsName", lsCode);
	}

	/**
	 * 개인수업 출석 업데이트
	 * 
	 * @param lessonCode
	 * @param memberCode
	 */
	public void updateAttendancePersonalLesson(String lessonCode, int memberCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("lessonCode", lessonCode);
		params.put("selectedMemberCode", memberCode);
		sqlSessionTemplate.update("AttendDAO.updateAttendancePersonalLesson", params);
	}

	/**
	 * 그룹수업 출석 업데이트
	 * 
	 * @param lessonCode
	 * @param selectedMemberCodes
	 */
	public void updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes) {
		Map<String, Object> params = new HashMap<>();
		params.put("lessonCode", lessonCode);
		params.put("selectedMemberCodes", selectedMemberCodes);
		sqlSessionTemplate.update("AttendDAO.updateAttendanceGroupLesson", params);
	}

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
	public int getReservedCountForLesson(String lsCode) {
		return sqlSessionTemplate.selectOne("AttendDAO.getReservedCountForLesson", lsCode);
	}

	/**
	 * 출석한 회원 수
	 */
	public int getAttendedCountForLesson(String lsCode) {
		return sqlSessionTemplate.selectOne("AttendDAO.getAttendedCountForLesson", lsCode);
	}

	/**
	 * 결석한 회원 수
	 */
	public int getAbsentCountForLesson(String lsCode) {
		return sqlSessionTemplate.selectOne("AttendDAO.getAbsentCountForLesson", lsCode);
	}

}
