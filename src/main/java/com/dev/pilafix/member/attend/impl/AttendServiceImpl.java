package com.dev.pilafix.member.attend.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.impl.CenterLessonDAO;
import com.dev.pilafix.member.attend.AttendService;
import com.dev.pilafix.member.attend.AttendVO;
import com.dev.pilafix.member.reserve.impl.ReservDAO;

@Service
public class AttendServiceImpl implements AttendService{
	
	@Autowired
	private AttendDAO dao;

	@Autowired
	private CenterLessonDAO lessonDAO;
	
	@Autowired
	private ReservDAO reservDAO;

	@Override
	public List<AttendVO> getAttendListByMemberCode(int csMemberCode) {
		return dao.getAttendListByMemberCode(csMemberCode);
	}
	
	/**
	 * 출석처리메서드
	 * 해당 수업의 멤버코드 불러와서 출석여부 true
	 */
	 @Override
	    public void updateAttendance(String lessonCode, List<String> attendedMemberCodes) {
	        for (String memberCode : attendedMemberCodes) {
	            dao.updateAttendance(lessonCode, memberCode, true);
	        }
	    }

}
