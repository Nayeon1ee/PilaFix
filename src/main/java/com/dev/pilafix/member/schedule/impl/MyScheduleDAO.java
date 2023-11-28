package com.dev.pilafix.member.schedule.impl;

import java.util.List;

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

}
