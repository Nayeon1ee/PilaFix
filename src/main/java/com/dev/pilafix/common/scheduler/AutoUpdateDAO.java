package com.dev.pilafix.common.scheduler;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.member.attend.AttendVO;

@Repository
public class AutoUpdateDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<String> getOpenLessonCodesForToday(Date today) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getOpenLessonCodesForToday", today);
	}

	public List<Integer> getMemberCodesByLessonCode(String lessonCode) {
		return sqlSessionTemplate.selectList("ReservDAO.getMemberCodesByLessonCode", lessonCode);
	}

	public void insertAttendance(AttendVO attend) {
		sqlSessionTemplate.insert("AttendDAO.insertAttendance", attend);
	}

	public void autoExpiryTicketsForGroup() {
		sqlSessionTemplate.update("MemberManageDAO.autoExpiryTicketsForGroup");
	}

	public void autoExpiryTicketsForPersonal() {
		sqlSessionTemplate.update("MemberManageDAO.autoExpiryTicketsForPersonal");
	}

	public List<String> getLessonsThreeHoursAgo() {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getLessonsThreeHoursAgo");
	}
	
	public void updateLessonsClosingYn(){
		sqlSessionTemplate.update("CenterLessonDAO.updateLessonsClosingYn");
	}
	
	public void updateAttendStatus(){
		sqlSessionTemplate.update("AttendDAO.updateAttendStatus");
	}
	

}
