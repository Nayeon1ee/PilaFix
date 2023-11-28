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

	
	
	/**
	 * 로그인한 강사의 csMemberCode로 가져오는 그룹수업 리스트
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/getGroupLessonList.do")
	public String getGroupLessonList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
//			int csMemberCode = 8016; // 임의로 부여함
			model.addAttribute("GrouplessonList", service.getGroupLessonListWithCtName(csMemberCode));
			return "member/trainer_classlist_test"; //수업리스트 화면으로 

		} else {
			return "member/login";
		}
	}

	
	
	/**
	 * 로그인한 강사의 csMemberCode로 가져오는 개인수업 리스트
	 * @param lessonCode
	 * @param attendedMemberCodes
	 * @return
	 */
	@GetMapping("/getPesonalLessonList.do")
	public String getPesonalLessonList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("personalLessonList", service.getLessonListWithCtNameAndCsName(csMemberCode));
			return "member/trainer_classList_test"; //수업리스트 화면으로
			
		}else {
			return "member/login";
		}
		}
	
	
	/**
	 * 개인수업 출석 업데이트
	 * @return
	 */
	@PostMapping("/updateAttendP.do")
    public String updatePersonalAttend() {
			
        // 출석처리 메서드
        service.updateAttendancePersonalLesson();

        return "member/trainer_classList_test"; // 수업 리스트 화면으로
    }
	
	
	/**
	 * 그룹수업 출석 업데이트
	 * @return
	 */
	@PostMapping("/updateAttendG.do")
    public String updateGroupAttend() {
			
        // 출석처리 메서드
        service.updateAttendanceGroupLesson();

        return "member/trainer_classList_test"; // 수업 리스트 화면으로
    }
	
	
	
	
	
}