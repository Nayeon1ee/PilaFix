package com.dev.pilafix.member.schedule.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.schedule.MyScheduleVO;

@Repository
public class MyScheduleDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//당월의 예약정보 가져옴
	public List<MyScheduleVO> getReservList(int csMemberCode) {
		// 예약테이블에서 수업코드 가져옴
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
		return sqlSessionTemplate.selectList("MyScheduleDAO.getLessonInfo", lessonCode);
	}

	public List<MyScheduleVO> getAttendList(int csMemberCode) {
		//출석여부가 true인 것에 대해 데이터 가져옴
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getAttendLessonCode",csMemberCode );
		return sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceLessonInfo", lessonCode);
	}

	public List<MyScheduleVO> getAbsentList(int csMemberCode) {
		//출석여부가 false인 것에 대해 데이터 가져옴
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getAbsentLessonCode",csMemberCode );
		return sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceLessonInfo",lessonCode);
	}

	public Map<String, Integer> getCount(int csMemberCode) {
		Map<String,Integer> count = new HashMap<String, Integer>();
		// 당월의 예약수업 수 세와서 map에 담음
		List<String> lessonCodeReserv = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
		count.put("reservCount", sqlSessionTemplate.selectOne("MyScheduleDAO.countReserv",lessonCodeReserv ));
		
		List<String> lessonCodeAttend = sqlSessionTemplate.selectList("MyScheduleDAO.getAttendLessonCode",csMemberCode );
		count.put("attendCount", sqlSessionTemplate.selectOne("MyScheduleDAO.countAttendance",lessonCodeAttend ));
		
		List<String> lessonCodeAbsent = sqlSessionTemplate.selectList("MyScheduleDAO.getAbsentLessonCode",csMemberCode );
		count.put("absentCount", sqlSessionTemplate.selectOne("MyScheduleDAO.countAttendance",lessonCodeAbsent ));
		
		
		return count;
	}

}
