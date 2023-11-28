package com.dev.pilafix.member.schedule;

import java.util.List;

public interface MyScheduleService {

	List<MyScheduleVO> getReservList(int csMemberCode);

	List<MyScheduleVO> getAttendList(int csMemberCode);

	List<MyScheduleVO> getAbsentList(int csMemberCode);

}
