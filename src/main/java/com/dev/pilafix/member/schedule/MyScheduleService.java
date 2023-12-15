package com.dev.pilafix.member.schedule;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface MyScheduleService {

	List<MyScheduleVO> getReservList(int csMemberCode);

	List<MyScheduleVO> getAttendList(int csMemberCode);

	List<MyScheduleVO> getAbsentList(int csMemberCode);

	Map<String, Integer> getCount(int csMemberCode);

	//List<CalenderVO> getMonthSchedule(int csMemberCode, Date calenderDate);
//	List<String> getMonthSchedule(int csMemberCode, Date calenderDate);
	Map<String, Object> getMonthSchedule(int csMemberCode, Date calendarDate);

	Map<String, Object> getAllInfo(int csMemberCode);

//	List<MyScheduleVO> getAttendanceList(int csMemberCode);

}
