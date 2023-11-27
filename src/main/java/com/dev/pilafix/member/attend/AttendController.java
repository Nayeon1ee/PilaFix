package com.dev.pilafix.member.attend;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AttendController {
	@Autowired
	private AttendService service;

	@GetMapping("/getAttendList.do")
	public String getAttendList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
//			int csMemberCode = (int) user.get("csMemberCode");
//			int csMemberCode = 8016; // 임의로 부여함
			model.addAttribute("attendList", service.getAttendListByMemberCode(8016));
			return "member/inquiry"; //수업리스트 화면으로 

		} else {
			return "member/login";
		}
	}

	
	
	@PostMapping("/updateAttendance.do")
    public String updateAttendance(
            @RequestParam String lessonCode,
            @RequestParam(required = false) List<String> attendedMemberCodes) {
			
        // 출석처리 메서드
        service.updateAttendance(lessonCode, attendedMemberCodes);

        return "member/inquiry"; // 수업 리스트 화면으로
    }
	
	
	
}