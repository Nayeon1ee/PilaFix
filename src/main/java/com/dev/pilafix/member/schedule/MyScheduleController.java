package com.dev.pilafix.member.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyScheduleController {
	
	@GetMapping("schedule.do")
	public String schedule() {
		return "member/myschedule";
	}

}
