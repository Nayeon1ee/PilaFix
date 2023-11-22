package com.dev.pilafix.common.question;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.common.member.CenterVO;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService service;

//	/**
//	 * 문의사항 조회
//	 * @param qsNumber
//	 * @param model
//	 * @return
//	 */
//	@GetMapping("/getQuestionList.do")
//	public String getQuestion(@RequestParam("qsNumber") Integer qsNumber, Model model) {
//		// 로그인 후 세션에 저장된 사용자 정보에서 코드 꺼내서 getQuestionList의 파라미터로 전달해야 함
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//	}

	/**
	 * 회원의 문의사항 목록 조회
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getQuestionList.do")
	public String getQuestionList(HttpSession session, Model model) {
		// 로그인 후 세션에 저장된 사용자 정보에서 코드 꺼내서 getQuestionList의 파라미터로 전달해야 함
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("questionList", service.getQuestionListByMember(csMemberCode));
	        return "member/inquiry";

		} else {
			return "member/login";
		}
	}


	/**
	 * 회원의 문의사항에 대한 답변
	 * @param qsNumber
	 * @return
	 */
	@GetMapping("/getQuestionReply.do")
	public QuestionReplyVO getQuestionReply(@RequestParam int qsNumber) {
		return service.getQuestionReply(qsNumber);
	}

	
	
	/**
	 * 회원의 문의사항 등록 setQsWriterMemberCode에 로그인한 회원코드
	 * @param session
	 * @param vo
	 * @return
	 */
	@GetMapping("/insertQuestion.do")
	public String insertQuestionForm(HttpSession session, Model model) {
	    Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
	    
	    if (loginUser != null) {
	        int csMemberCode = (int) loginUser.get("csMemberCode");
	        List<String> connectedCenters = service.getConnectedCenters(csMemberCode);
	        model.addAttribute("connectedCenters", connectedCenters);
	        return "member/inquiry_detail"; // 문의사항 작성 페이지 뷰 반환
	    } else {
	        return "member/login"; // 로그인 페이지로 리다이렉트
	    }
	}
	
	@PostMapping("/insertQuestion.do")
	public String insertQuestion(@ModelAttribute QuestionVO questionVO, 
	                             @RequestParam("selectedCenter") String selectedCenterCode,
	                             HttpSession session) {
	    // 로그인 세션에서 사용자 정보 가져오기
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    if (user != null) {
	        int csMemberCode = (int) user.get("csMemberCode");
	        // 작성자 코드가 회원코드
	        questionVO.setQsWriterMemberCode(csMemberCode);

	        // 폼에서 선택한 센터 코드 설정
	        questionVO.setSelectedCenterCode(selectedCenterCode);

	        service.insertQuestion(questionVO);
	        return "redirect:/getQuestionList.do"; // 문의사항 목록으로 리다이렉트
	    } else {
	        return "member/login"; // 로그인 페이지로 리다이렉트
	    }
	}

	
	/**
	 * 회원의 연동된 센터 목록
	 */
	@GetMapping("/getCTlistByME.do")
	public String showInsertQuestionForm(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			List<String> connectedCenters = service.getConnectedCenters(csMemberCode);
			model.addAttribute("connectedCenters", connectedCenters);

			return "member/inquiry_detail";
		} else {
			return "member/login";
		}
	}
	
	
	/**
	 * 로그인한 회원의 문의사항 수정, 
	 * @param qsNumber
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/updateQuestion.do")
	public String updateForm(@RequestParam("qsNumber") Integer qsNumber, HttpSession session, Model model) {
	    Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "member/login";
	    }

	    int loggedInMemberCode = (int) loginUser.get("csMemberCode");
	    QuestionVO question = service.getQuestion(qsNumber);
	    if (question != null && question.getQsWriterMemberCode() == loggedInMemberCode) {
	        model.addAttribute("question", question);
	        List<String> connectedCenters = service.getConnectedCenters(question.getQsWriterMemberCode());
	        model.addAttribute("connectedCenters", connectedCenters);
	        return "member/inquiry_edit";
	    } else {
	        return "member/inquiry"; 
	    }
	}

	@PostMapping("/updateQuestion.do")
	public String update(@ModelAttribute QuestionVO questionVO, HttpSession session) {
	    Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "member/login";
	    }

	    int loggedInMemberCode = (int) loginUser.get("csMemberCode");
	    if (questionVO.getQsWriterMemberCode() == loggedInMemberCode) {
	        service.updateQuestion(questionVO);
	        return "redirect:/getQuestionList.do";
	    } else {
	        return "redirect:/getQuestionList.do"; 
	    }
	}
	
		
//	/**
//	 * js로 답변 목록 받음 
//	 * @return
//	 */
//	@GetMapping("/getQuestionReplyOnJS.do")
//	@ResponseBody
//	public List<QuestionReplyVO> getQuestionReply(@RequestParam("qsWriterMemberCode") int qsWriterMemberCode) {
//		System.out.println("작성자 번호 : "+qsWriterMemberCode);
//		return service.getQuestionReply(qsWriterMemberCode);
//	}
//	
//	@GetMapping("/insertQuestion.do")
//	public String insertForm(HttpSession session) {
//	    if(session.getAttribute("loginUser") == null) {
//	    	return "member/login";
//	    }
////	    return "member/inquiry_detail"; 
//	    return "member/inquiry_detail_test"; 
//	}

//	@PostMapping("/insertQuestion.do")
//	public String insert(HttpSession session, QuestionVO vo) {
//		
//		if(session.getAttribute("loginUser") == null) {
//			return "member/login";
//	    }
//		// ==========================
//		// 테스트용 작성자 세팅 추후에 로그인 세션 값 넣고(insertQuestion.jsp) 삭제 필요 
//		//vo.setQsWriterMemberCode(123); 
//		// ==========================
//
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//	    int csMemberCode = (int) user.get("csMemberCode");
//	    vo.setQsWriterMemberCode(csMemberCode); 
//	    
//		service.insertQuestion(vo);
//		return "redirect:getQuestionList.do";
//	}


	@GetMapping("/deleteQuestion.do")
	public String delete(@RequestParam("qsNumber") int qsNumber, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			return "member/login";
		}
		service.deleteQuestion(qsNumber);
		return "redirect:getQuestionList.do";
	}

	/**
	 * 센터 로그인 이후 회원들의 문의사항 리스트
	 */
	@GetMapping("/getCTQuestionList.do")
	public String getCTQuestionList(Model model) {
		int totalQuestionCount = service.getTotalQuestionCount();
		model.addAttribute("totalQuestionCount", totalQuestionCount);
		model.addAttribute("questionList", service.getQuestionListWithWriterNames());
		return "center/center_inquiry";
	}

	/**
	 * 센터의 답변
	 */
	@GetMapping("/getQuestionReplyCt.do")
	public String getQuestionReply(@RequestParam("reTargetPostNumber") Integer reTargetPostNumber, Model model) {

		model.addAttribute("question", service.getTargetQuestion(reTargetPostNumber)); // targetNumber
																						// qsNumber
		model.addAttribute("questionReply", service.getQuestionReplyCt(reTargetPostNumber));
		return "center/center_inquiry_response";
	}

	/**
	 * 답변 등록 + 회원의 답변여부 컬럼 update + 알림발송이력 DAO에서 Transactional 하나라도 실패 시 전부 실패
	 * try~catch 문 써서 에러 처리 참고 : com.dev.pilafix.center.member_trainer_manage 패키지의
	 * 컨트롤러 acceptRequest.do 호출 시 동작 과정
	 */
	@GetMapping("/insertQuestionReply.do")
	public String insertQuestionReplyForm(@RequestParam("qsNumber") Integer qsNumber, Model model) {
		QuestionVO question = service.getQuestion(qsNumber); //
		model.addAttribute("question", question);
		return "center/center_inquiry_response_test";
	}

//	@Transactional
	@PostMapping("/insertQuestionReply.do")
	public String insertQuestionReply(QuestionReplyVO replyvo, @RequestParam("qsNumber") int qsNumber) {
		service.insertQuestionReplyAndUpdateAnswerYn(replyvo, qsNumber);
		return "redirect:getCTQuestionList.do";
	}

	/**
	 * 답변 삭제
	 */
	@GetMapping("/deleteQuestionReply.do")
	public String deleteQuestionReply(int reNumber) {
		service.deleteQuestionReply(reNumber);
		return "redirect:getQuestionReplyList.do";
	}

}
