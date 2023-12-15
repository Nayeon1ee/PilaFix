package com.dev.pilafix.member.schedule.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.schedule.CalenderVO;
import com.dev.pilafix.member.schedule.MyScheduleVO;

@Repository
public class MyScheduleDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//당월의 예약정보 가져옴(예약된 게 없으면 lessonCode없으므로 분기해줌)
	public List<MyScheduleVO> getReservList(int csMemberCode) {
		// 예약테이블에서 수업코드 가져옴
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
		if(lessonCode.isEmpty()) {
			return 	Collections.emptyList();
		}else {
			Map<String,Object> param = new HashMap<>();
			param.put("csMemberCode", csMemberCode);
			param.put("lessonCode", lessonCode);
			return sqlSessionTemplate.selectList("MyScheduleDAO.getLessonInfo", param);
		}
	}
	
	public List<MyScheduleVO> getAttendList(int csMemberCode) {
		//출석여부가 true인 것에 대해 데이터 가져옴
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getAttendLessonCode",csMemberCode );
		if(lessonCode.isEmpty()) {
			return 	Collections.emptyList();
		}else {
			return sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceLessonInfo", lessonCode);
		}
	}

	public List<MyScheduleVO> getAbsentList(int csMemberCode) {
		//출석여부가 false인 것에 대해 데이터 가져옴
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getAbsentLessonCode",csMemberCode );
		if(lessonCode.isEmpty()) {
			return 	Collections.emptyList();
		}else {
			return sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceLessonInfo",lessonCode);
		}
	}
	
	public Map<String, Integer> getCount(int csMemberCode) {
		Map<String,Integer> count = new HashMap<String, Integer>();
		// 당월의 예약수업 수 세와서 map에 담음 (예약수업이 없으면 lessonCodeReserv가 없으므로 0담음)
		List<String> lessonCodeReserv = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
		if(lessonCodeReserv.isEmpty()) {
			count.put("reservCount", 0);
		}else {
			count.put("reservCount", sqlSessionTemplate.selectOne("MyScheduleDAO.countReserv",lessonCodeReserv ));
		}
			count.put("attendCount", sqlSessionTemplate.selectOne("MyScheduleDAO.countAttend",csMemberCode ));
			count.put("absentCount", sqlSessionTemplate.selectOne("MyScheduleDAO.countAbsent",csMemberCode ));
		
		
		return count;
	}
// fullcalender사용시 DAO
//	public List<CalenderVO> getMonthSchedule(int csMemberCode,Date calenderDate) {
//		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
//		if(lessonCode.isEmpty()) {
//			return 	Collections.emptyList();
//		}else {
//			Map<String,Object> param = new HashMap<>();
//			param.put("lessonCode", lessonCode);
//			param.put("calenderDate", calenderDate);
//			
//			return sqlSessionTemplate.selectList("MyScheduleDAO.getMonthSchedule", param);
//		}
//	}
	// js로 만든 달력에 점 이미지 넣기 성공(상태분기는 x)
//	public List<String> getMonthSchedule(int csMemberCode,Date calenderDate) {
//		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
//		if(lessonCode.isEmpty()) {
//			return 	Collections.emptyList();
//		}else {
//			Map<String,Object> param = new HashMap<>();
//			param.put("lessonCode", lessonCode);
//			param.put("calenderDate", calenderDate);
//			
//			return sqlSessionTemplate.selectList("MyScheduleDAO.getMonthSchedule", param);
//		}
//	}
	// js달력에 상태분기해서 이미지넣기 시도
	public Map<String, Object> getMonthSchedule(int csMemberCode,Date calendarDate) {
		Map<String, Object> calendarInfo = new HashMap<>();
		
		Map<String, Object> calendarAttendanceParam = new HashMap<>();
		calendarAttendanceParam.put("csMemberCode", csMemberCode);
		calendarAttendanceParam.put("calendarDate", calendarDate);
		
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
		System.out.println("DAO 달력 예약 날짜 가져옴");
		List<String> calendarReservlessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceCode",calendarAttendanceParam);
		System.out.println("DAO 달력 출결 날짜 가져옴");
		
		if (!lessonCode.isEmpty()) {
	        Map<String, Object> param = new HashMap<>();
	        param.put("lessonCode", lessonCode);
	        param.put("calendarDate", calendarDate);

	        calendarInfo.put("calendarReserv", sqlSessionTemplate.selectList("MyScheduleDAO.getMonthSchedule", param));
	        System.out.println("DAO첫번째 맵에 넣음");
	    }

	    if (!calendarReservlessonCode.isEmpty()) {
	    	System.out.println("DAO두번째 if문 실행");
	        Map<String, Object> param = new HashMap<>();
	        param.put("calendarReservlessonCode", calendarReservlessonCode);
	        param.put("csMemberCode", csMemberCode);
	        param.put("calendarDate", calendarDate);

	        List<MyScheduleVO> calendarAttendanceInfo = sqlSessionTemplate.selectList("MyScheduleDAO.calendarAttendanceInfo", param);

	        List<String> calendarAttend = new ArrayList<>();
	        List<String> calendarAbsent = new ArrayList<>();

	        for (MyScheduleVO attendance : calendarAttendanceInfo) {
	            boolean atAttendanceYn = attendance.isAtAttendanceYn();
	            Date lsDate = attendance.getLsDate();
	            
	         // Date를 필요한 포맷으로 변환하는 작업을 수행하여 문자열로 저장
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            String lsDateString = sdf.format(lsDate);
	            
	            if (atAttendanceYn) {
	                calendarAttend.add(lsDateString);
	            } else {
	                calendarAbsent.add(lsDateString);
	            }
	        }
	        // 콘솔에 출력
	        System.out.println("확인용 calendarAttend:  " + calendarAttend);
	        System.out.println("확인용 calendarAbsent: " + calendarAbsent);
	        
	        calendarInfo.put("calendarAttend", calendarAttend);
	        calendarInfo.put("calendarAbsent", calendarAbsent);
	    }

		return calendarInfo;
	}
	
	//전체탭에 뿌려줄 이번달 스케줄 가져오기
	public Map<String, Object> getAllInfo(int csMemberCode){
		Map<String, Object> allInfo = new HashMap<>();
		
		List<String> lessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getLessonCode",csMemberCode );
		List<String> reservlessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceLessonCode",csMemberCode);
		
		if (lessonCode.isEmpty()) {
			//allInfo.put("reservInfo", null);
			System.out.println("1 예약if문 null");
		}else {
			Map<String,Object> param = new HashMap<>();
			param.put("csMemberCode", csMemberCode);
			param.put("lessonCode", lessonCode);
			
			allInfo.put("reservInfo", sqlSessionTemplate.selectList("MyScheduleDAO.getLessonInfo", param));
			System.out.println("1 예약if문 값o");
		}
		
		if (reservlessonCode.isEmpty()) {
			//allInfo.put("attendanceInfo", null);
			System.out.println("2 출결if문 null");
		}else {
			Map<String,Object> param = new HashMap<>();
			param.put("reservlessonCode", reservlessonCode);
			param.put("csMemberCode", csMemberCode);
			
			allInfo.put("attendanceInfo", sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceInfo",param));
			System.out.println("2 출결if문 값o");
		}

			System.out.println("3 if문 탈출");
			return allInfo; 
		
		
	}

//	public List<MyScheduleVO> getAttendanceList(int csMemberCode) {
//		List<String> reservlessonCode = sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceLessonCode",csMemberCode);
//		
//		if (reservlessonCode.isEmpty()) {
//			return 	Collections.emptyList();
//		}else {
//			Map<String,Object> param = new HashMap<>();
//			param.put("reservlessonCode", reservlessonCode);
//			param.put("csMemberCode", csMemberCode);
//			
//			return sqlSessionTemplate.selectList("MyScheduleDAO.getAttendanceInfo",param);
//		}
//	}

}
