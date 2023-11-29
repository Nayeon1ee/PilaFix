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

import com.dev.pilafix.center.lesson.CenterLessonVO;

@Controller
public class AttendController {
	@Autowired
	private AttendService service;

	/**
	 * 로그인한 강사의 csMemberCode로 가져오는 전체 수업 리스트(그룹/개인)
	 * 
	 */
	@GetMapping("/getTrainerLessonList.do")
	public String getLessonList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			List<CenterLessonVO> lessonList = service.getAllLessonListWithCtName(csMemberCode);

			// 예약된 회원 수를 추가하는 로직
			for (CenterLessonVO lesson : lessonList) {
				int reservedCount = service.getReservedCountForLesson(lesson.getLsCode());
				lesson.setReservedCount(reservedCount); // CenterLessonVO에 reservedCount 추가함
			}

			model.addAttribute("lessonList", lessonList);
			return "member/trainer_classlist_test"; // 수업리스트 화면으로
		} else {
			return "member/login";
		}
	}

	/**
	 * 수업 상세 가져오기
	 */
	@GetMapping("/getTrainerLesson.do")
	public String getLessonDetail(@RequestParam("lsCode") String lsCode, HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
//			int csMemberCode = (int) user.get("csMemberCode");
			CenterLessonVO lessonDetail = service.getTrainerLessonDetail(lsCode);

			if (lessonDetail.getLsType().equals("그룹")) {
				model.addAttribute("lessonDetail", lessonDetail);
				return "member/trainer_group_class_test";
			}else {
				model.addAttribute("lessonDetail", lessonDetail);
				return "member/trainer_personal_class_test";
			}

		} else {
			return "member/login";
		}
	}
	/**
	 * 개인수업 출석 업데이트
	 * 
	 * @return
	 */
	@PostMapping("/updateAttendP.do")
	public String updatePersonalAttend(
			@RequestParam("lessonCode") String lessonCode,
			@RequestParam("memberCode") int memberCode) {

	    try {
	        // 개인수업 출석 업데이트 처리
	        service.updateAttendancePersonalLesson(lessonCode, memberCode);
	        System.out.println("출결 업데이트 성공" + lessonCode + memberCode);
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("출결 업데이트 실패"+ lessonCode + memberCode);
	    }

	    return "redirect:/getTrainerLesson.do?lsCode=" + lessonCode; // 해당 수업 상세 페이지로 리다이렉트
	}

	/**
	 * 그룹수업 출석 업데이트
	 * 
	 * @return
	 */
	@PostMapping("/updateAttendG.do")
	public String updateGroupAttend(
	        @RequestParam("lessonCode") String lessonCode,
	        @RequestParam("selectedMemberCodes") List<Integer> selectedMemberCodes) {

	    try {
	        // 그룹수업 출석 업데이트 처리
	        service.updateAttendanceGroupLesson(lessonCode, selectedMemberCodes);
	        System.out.println("출결 업데이트 성공" + lessonCode + selectedMemberCodes);
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("출결 업데이트 실패"+ lessonCode + selectedMemberCodes);	       
	    }
	    return "redirect:/getTrainerLesson.do?lsCode=" + lessonCode; // 해당 수업 상세 페이지로 리다이렉트
	}

	
	
//	@GetMapping("/getLessonList.do")
//	public String getLessonList(HttpSession session, Model model) {
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//
//		if (user != null) {
//			int csMemberCode = (int) user.get("csMemberCode");
//			model.addAttribute("lessonList", service.getAllLessonListWithCtName(csMemberCode));
//			return "member/trainer_classlist_test"; //수업리스트 화면으로 
//
//		} else {
//			return "member/login";
//		}
//	}


	/**
	 * 로그인한 강사의 csMemberCode로 가져오는 그룹수업 리스트
	 */
	@GetMapping("/getGroupLessonList.do")
	public String getGroupLessonList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
//			int csMemberCode = 8016; // 임의로 부여함
			model.addAttribute("GrouplessonList", service.getGroupLessonListWithCtName(csMemberCode));
			return "member/trainer_classlist_test"; // 수업리스트 화면으로

		} else {
			return "member/login";
		}
	}

	/**
	 * 로그인한 강사의 csMemberCode로 가져오는 개인수업 리스트
	 */
	@GetMapping("/getPesonalLessonList.do")
	public String getPesonalLessonList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("personalLessonList", service.getLessonListWithCtNameAndCsName(csMemberCode));
			return "member/trainer_classlist_test"; // 수업리스트 화면으로

		} else {
			return "member/login";
		}
	}



}