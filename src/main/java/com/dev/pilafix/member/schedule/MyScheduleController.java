package com.dev.pilafix.member.schedule;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyScheduleController {
	
	@Autowired
	private MyScheduleService service;
	
	@GetMapping("schedule.do")
	public String schedule() {
		return "member/myschedule";
	}
	
	@PostMapping("getReservList.do")
	public String getReservList(HttpSession session) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		if(user!=null){
			//세션에서 가져온 값으로 서비스 호출
			int csMemberCode = (int) user.get("csMemberCode");
			service.getReservList(csMemberCode);
			return "";
		}
		return "center/login"; //로그인 페이지로 이동
		
	}

}
