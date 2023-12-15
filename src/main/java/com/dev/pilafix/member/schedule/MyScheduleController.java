package com.dev.pilafix.member.schedule;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyScheduleController {
	
	@Autowired
	private MyScheduleService service;
	
	@GetMapping("schedule.do")
	public String schedule(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		int csMemberCode = (int) user.get("csMemberCode");
		model.addAttribute("count", service.getCount(csMemberCode));
		return "member/scheduleTest";
	}

	// 캘린더 날짜에 해당하는 예약정보 가져옴 (한달 전체-달력에 보여주려고)
//	@PostMapping("/getMonthSchedule.do")
//	@ResponseBody
//	public List<CalenderVO> getMonthSchedule(HttpSession session,Date calenderDate) {
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//		int csMemberCode = (int) user.get("csMemberCode");
//		System.out.println("컨트롤러로 넘어온 풀캘린더 날자" + calenderDate);
//		List<CalenderVO> reservMonthInfo = (List<CalenderVO>) service.getMonthSchedule(csMemberCode,calenderDate);
//		return reservMonthInfo;
//	}
//	@PostMapping("/getMonthSchedule.do")
//	@ResponseBody
//	public List<String> getMonthSchedule(HttpSession session,Date calenderDate) {
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//		int csMemberCode = (int) user.get("csMemberCode");
//		System.out.println("컨트롤러로 넘어온 풀캘린더 날자" + calenderDate);
//		List<String> reservMonthInfo = (List<String>) service.getMonthSchedule(csMemberCode,calenderDate);
//		return reservMonthInfo;
//	}
	@PostMapping("/getMonthSchedule.do")
	@ResponseBody
	public Map<String, Object> getMonthSchedule(HttpSession session,Date calendarDate) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		int csMemberCode = (int) user.get("csMemberCode");
		System.out.println("컨트롤러로 넘어온 풀캘린더 날자" + calendarDate);
		return service.getMonthSchedule(csMemberCode,calendarDate);
	}
	
	// 회원의 당월 예약정보 가져옴 (오늘을 기준으로 예정된 수업만)
	@PostMapping("getReservList.do")
	@ResponseBody
	public List<MyScheduleVO> getReservList(HttpSession session) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
			System.out.println(user.get("csMemberCode"));
			//세션에서 가져온 값으로 서비스 호출
			int csMemberCode = (int) user.get("csMemberCode");
			List<MyScheduleVO> reservInfoList = service.getReservList(csMemberCode);
			return reservInfoList;
	}
	// 회원의 당월 출석정보 가져옴
	@PostMapping("getAttendList.do")
	@ResponseBody
	public List<MyScheduleVO> getAttendList(HttpSession session) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		//세션에서 가져온 값으로 서비스 호출
		int csMemberCode = (int) user.get("csMemberCode");
		List<MyScheduleVO> attendList = service.getAttendList(csMemberCode);
		return attendList;
	}
	// 회원의 당월 결석정보 가져옴
	@PostMapping("getAbsentList.do")
	@ResponseBody
	public List<MyScheduleVO> getAbsentList(HttpSession session) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		//세션에서 가져온 값으로 서비스 호출
		int csMemberCode = (int) user.get("csMemberCode");
		List<MyScheduleVO> AbsentList = service.getAbsentList(csMemberCode);
		return AbsentList;
	}
//	@PostMapping("getAttendanceList.do")
//	@ResponseBody
//	public List<MyScheduleVO> getAttendanceList(HttpSession session) {
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//		//세션에서 가져온 값으로 서비스 호출
//		int csMemberCode = (int) user.get("csMemberCode");
//		List<MyScheduleVO> attendanceList = service.getAttendanceList(csMemberCode);
//		return attendanceList;
//	}
	
	@PostMapping("getAllInfo.do")
	@ResponseBody
	public Map<String,Object> getAllInfo(HttpSession session){
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		//세션에서 가져온 값으로 서비스 호출
		int csMemberCode = (int) user.get("csMemberCode");
		return service.getAllInfo(csMemberCode);
		
	}
	
	
}
