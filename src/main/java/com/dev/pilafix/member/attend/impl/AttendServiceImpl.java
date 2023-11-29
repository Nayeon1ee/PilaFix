package com.dev.pilafix.member.attend.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.lesson.impl.CenterLessonDAO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.attend.AttendService;
import com.dev.pilafix.member.reserve.impl.ReservDAO;

@Service
public class AttendServiceImpl implements AttendService{
	
	@Autowired
	private AttendDAO dao;
	@Autowired
	private CenterLessonDAO lessonDAO;	
	@Autowired
	private ReservDAO reservDAO;

	
	/**
	 * 강사의 전체 수업 리스트 (개인/그룹)
	 * + 센터이름
	 * + 예약인원
	 * 수업시간이 현재시간을 지나면 '수업종료', 폐강여부가 Y이면 '폐강', 아니면 '진행중'
	 */
	@Override
	public List<CenterLessonVO> getAllLessonListWithCtName(int csMemberCode) {
		return dao.getTrainerLessonListWithCtName(csMemberCode);
	}


	/**
	 * 수업상세
	 */
	@Override
	public CenterLessonVO getTrainerLessonDetail(String lsCode) {
	    CenterLessonVO lessonDetail = dao.getLessonByTrainerWithCsName(lsCode);

	    // 예약한 회원 이름과 회원코드 List
	    lessonDetail.setReservedMembers(dao.getReservedMembersNamesForLesson(lsCode));
	    // 예약한 회원수
	    lessonDetail.setReservedCount(dao.getReservedCountForLesson(lsCode));
	    // 출석한 회원수
	    lessonDetail.setAttendedCount(dao.getAttendedCountForLesson(lsCode));
	    // 결석한 회원수
	    lessonDetail.setAbsentCount(dao.getAbsentCountForLesson(lsCode));
	    return lessonDetail;
	}

	/**
	 * 개인수업출결
	 */
	@Override
	public void updateAttendancePersonalLesson(String lessonCode, int memberCode) {
		dao.updateAttendancePersonalLesson(lessonCode, memberCode);
	}

	/**
	 * 그룹수업출결
	 */
	@Override
	public void updateAttendanceGroupLesson(String lessonCode, List<Integer> selectedMemberCodes) {
		dao.updateAttendanceGroupLesson(lessonCode, selectedMemberCodes);
	}
	
	
	
	
	
	/**
	 * 수업상세내역
	 */
	@Override
	public CenterLessonVO getLessonByTrainerWithCsName(String lsCode) {
		return dao.getLessonByTrainerWithCsName(lsCode);
	}
	
	/**
	 * 수업상세에서 회원이름, 회원코드(출석처리 위해 받아옴)
	 */
	@Override
	public List<MemberVO> getReservedMembersNamesForLesson(String lessonCode) {
		return dao.getReservedMembersNamesForLesson(lessonCode);
	}

	@Override
	public int getReservedCountForLesson(String lsCode) {
		return dao.getReservedCountForLesson(lsCode);
	}
	

	@Override
	public List<CenterLessonVO> getGroupLessonListWithCtName(int csMemberCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CenterLessonVO> getLessonListWithCtNameAndCsName(int csMemberCode) {
		// TODO Auto-generated method stub
		return null;
	}





	
	
	





}
