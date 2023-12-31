package com.dev.pilafix.member.attend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.center.lesson.CenterLessonVO;

@Controller
public class AttendController {
	@Autowired
	private AttendService service;

	
	/**
	 * 수업 상태별로 가져오는 전체 수업 리스트
	 */
	@GetMapping("/trainerLessonPage.do")
	public String getAllLessonList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
	        List<CenterLessonVO> ongoingLessons = service.getOngoingTrainerLessons(csMemberCode);
	        List<CenterLessonVO> completedLessons = service.getCompletedTrainerLessons(csMemberCode);
	        List<CenterLessonVO> closedLessons = service.getClosedTrainerLessons(csMemberCode);

	        for (CenterLessonVO lesson : ongoingLessons) {
	            int reservedCount = service.getReservedCountForLesson(lesson.getLsCode());
	            lesson.setReservedCount(reservedCount);
	        }

	        for (CenterLessonVO lesson : completedLessons) {
	            int reservedCount = service.getReservedCountForLesson(lesson.getLsCode());
	            lesson.setReservedCount(reservedCount);
	        }

	        for (CenterLessonVO lesson : closedLessons) {
	            int reservedCount = service.getReservedCountForLesson(lesson.getLsCode());
	            lesson.setReservedCount(reservedCount);
	        }
	        
	        model.addAttribute("ongoingLessons", ongoingLessons);
	        model.addAttribute("completedLessons", completedLessons);
	        model.addAttribute("closedLessons", closedLessons);

	        return "member/trainer_classlist_test"; // 수업리스트 화면으로
		}else {
			return "member/login";
		}

	}

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
	 * 
	 */
	@GetMapping("/getTrainerLesson.do")
	public String getLessonDetails(Model model, HttpSession session, @RequestParam String lsCode) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			CenterLessonVO lessonDetail = service.getTrainerLessonDetail(lsCode);
			AttendVO attendVO = service.getAttendanceByLessonCode(lsCode);
			model.addAttribute("attendance", attendVO);
			model.addAttribute("lessonDetail", lessonDetail);

			if (lessonDetail.getLsType().equals("그룹")) {
				return "member/trainer_group_class_test";
			} else {
				return "member/trainer_personal_class_test";
			}
		} else {
			return "member/login";
		}
	}
	
	@GetMapping("/getAttendanceCounts.do")
    public ResponseEntity<?> getAttendanceCounts(@RequestParam String atCode) {
        int attendedCount = service.getAttendedCountForLesson(atCode);
        int absentCount = service.getAbsentCountForLesson(atCode);
        Map<String, Integer> counts = new HashMap<>();
        counts.put("attendedCount", attendedCount);
        counts.put("absentCount", absentCount);
        return ResponseEntity.ok(counts);
    }
	
	
    //Ajax처리하는 출석 처리 메서드
	@PostMapping("/updateAttendanceG.do")
	public ResponseEntity<?> updateAttendance(@RequestParam String atCode, @RequestBody List<Integer> memberCodes) {
	    try {
	        int updatedRows = service.updateAttendance(atCode, memberCodes);
	        return ResponseEntity.ok().body(updatedRows); // 처리된 행의 수를 반환
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	
	@PostMapping("/updateAttendanceP.do")
	public ResponseEntity<?> updateAttendanceP(@RequestParam String atCode, @RequestBody List<Integer> memberCodes) {
	    try {
	        System.out.println("개인수업 출결처리: " + atCode + ", memberCodes: " + memberCodes);
	        int updatedRows = service.updateAttendanceP(atCode, memberCodes);
	        return ResponseEntity.ok().body(updatedRows);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	
	
	
	
	
	
	
//	1204 주석처리
//	@GetMapping("/getTrainerLesson.do")
//	public String getLessonDetail(@RequestParam("lsCode") String lsCode, HttpSession session, Model model) {
//	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//
//	    if (user != null) {
//	        CenterLessonVO lessonDetail = service.getTrainerLessonDetail(lsCode);
//
//	        // 출석 처리 여부 확인 및 통계 추가
////	        boolean isAttendanceProcessed = service.isAttendanceProcessed(lsCode);
////	        if (isAttendanceProcessed) {
//	            int attendedCount = service.getAttendedCountForLesson(lsCode);
//	            int absentCount = service.getAbsentCountForLesson(lsCode);
//	            model.addAttribute("attendedCount", attendedCount);
//	            model.addAttribute("absentCount", absentCount);
////	        }
//
//	        model.addAttribute("lessonDetail", lessonDetail);
//
//	        if (lessonDetail.getLsType().equals("그룹")) {
//	            return "member/trainer_group_class_test";
//	        } else {
//	            return "member/trainer_personal_class_test";
//	        }
//	    } else {
//	        return "member/login";
//	    }
//	}
	
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
	 */
// 1204 주석처리	
//	@PostMapping("/updateAttendG.do")
//	public String updateGroupAttend(@RequestParam("lessonCode") String lessonCode, Model model,
//	                                @RequestParam(name = "selectedMemberCodes", required = false) List<Integer> selectedMemberCodes) {
//		
//		System.out.println("선택된 멤버 코드"+selectedMemberCodes);
//	    try {
//	        if (selectedMemberCodes != null && !selectedMemberCodes.isEmpty()) {
//	            // 선택된 회원에 대한 출석 처리
//	            service.updateAttendanceGroupLesson(lessonCode, selectedMemberCodes);
//	            System.out.println("출결 업데이트 성공: " + lessonCode + " " + selectedMemberCodes);
//	            
//	        	Map<String, Integer> attendanceCounts = service.getCountAttendanceForLesson(lessonCode);
//	        	int attendedCount = attendanceCounts.get("attendedCount");
//	        	int absentCount = attendanceCounts.get("absentCount");
//	        	
//	        	model.addAttribute("attendedCount",attendanceCounts.get("attendedCount"));
//	        	model.addAttribute("absentCount",attendanceCounts.get("absentCount"));
//	        	
//	        } else {
//	            // 아무것도 선택되지 않았을 경우 별도의 처리가 필요 없음
//	            System.out.println("선택된 회원 없음: " + lessonCode);
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        System.out.println("출결 업데이트 실패: " + lessonCode + " " + selectedMemberCodes);
//	    }
//
//	    return "redirect:/getTrainerLesson.do?lsCode=" + lessonCode;
//	}


}