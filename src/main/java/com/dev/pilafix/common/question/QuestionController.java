package com.dev.pilafix.common.question;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			model.addAttribute("questionList", service.getQuestionsByMemberCode(csMemberCode));
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
		return service.getReplyForQuestion(qsNumber);
	}
	
	/**
	 * 문의사항에 대한 답변 조회
	 * @param qsNumber 문의사항의 QS_NUMBER
	 * @return 문의사항에 대한 답변을 JSON 형식으로 반환
	 */
	@GetMapping("/getQuestionReplyOnJS.do")
	@ResponseBody
	public Map<String, Object> getQuestionReplyOnJS(@RequestParam("qsNumber") int qsNumber) {
	    Map<String, Object> resultMap = new HashMap<>();

	    QuestionReplyVO questionReply = service.getReplyForQuestion(qsNumber);

	    if (questionReply != null) {
	        resultMap.put("replyTitle", questionReply.getReTitle());
	        resultMap.put("replyContent", questionReply.getReContent());
	    } else {
	        resultMap.put("replyTitle", "답변 없음");
	        resultMap.put("replyContent", "등록된 답변이 없습니다.");
	    }

	    return resultMap;
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
	        model.addAttribute("connectedCenters", service.getConnectedCenters(csMemberCode));

	        return "member/inquiry_detail"; // 문의사항 작성 페이지 뷰 반환
	    } else {
	        return "member/login"; // 로그인 페이지로 리다이렉트
	    }
	}
	
	@PostMapping("/insertQuestion.do")
	@ResponseBody
	public ResponseEntity<?> insertQuestion(@RequestParam("ctCode") int ctCode, 
	                                        @RequestParam("qsTitle") String qsTitle,
	                                        @RequestParam("qsContent") String qsContent,
	                                        HttpSession session) {
		System.out.println(ctCode);
	    // 사용자 세션 확인
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    if (user != null) {
	        int csMemberCode = (int) user.get("csMemberCode");

	        // QuestionVO 객체 생성 및 데이터 설정
	        QuestionVO questionVO = new QuestionVO();
	        questionVO.setQsWriterMemberCode(csMemberCode);
	        questionVO.setSelectedCenterCode(ctCode);
	        questionVO.setQsTitle(qsTitle);
	        questionVO.setQsContent(qsContent);

	        // 서비스 로직 호출
	        service.insertQuestion(questionVO);

	        // 성공 응답 반환
	        return ResponseEntity.ok("Question submitted successfully");
	    } else {
	        // 로그인하지 않은 경우 에러 응답 반환
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
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
			model.addAttribute("connectedCenters", service.getConnectedCenters(csMemberCode));

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
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    if (user == null) {
	        return "member/login";
	    }

	    int csMemberCode = (int) user.get("csMemberCode");
	    QuestionVO question = service.getQuestion(qsNumber);
	    
	    if (question != null && question.getQsWriterMemberCode() == csMemberCode) {
	        model.addAttribute("question", question);
//	        List<String> connectedCenters = service.getConnectedCenters(question.getQsWriterMemberCode());
	        model.addAttribute("connectedCenters", service.getConnectedCenters(csMemberCode));

	        return "member/inquiry_edit";
	    } else {
	        return "member/inquiry"; 
	    }
	}

	@PostMapping("/updateQuestion.do")
	public String update(@ModelAttribute QuestionVO questionVO, 
	                     @RequestParam("selectedCenter") int selectedCenterCode, // 폼에서 선택한 센터 코드 받기
	                     HttpSession session) {
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    if (user == null) {
	        return "member/login";
	    }

	    int csMemberCode = (int) user.get("csMemberCode");
	    questionVO.setQsWriterMemberCode(csMemberCode);

	    // 폼에서 선택한 센터 코드를 QuestionVO 객체에 설정
	    questionVO.setSelectedCenterCode(selectedCenterCode);

	    // 로그인한 사용자의 코드와 문의사항 작성자 코드가 일치할 경우에만 update 수행
	    if (questionVO.getQsWriterMemberCode() == csMemberCode) {
	        service.updateQuestion(questionVO);
	    }
	    return "redirect:/getQuestionList.do";
	}

	@GetMapping("/deleteQuestion.do")
	public String delete(int qsNumber, HttpSession session) {
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    if (user == null) {
	        return "member/login";
	    }
//	    int csMemberCode = (int) user.get("csMemberCode");
		service.deleteQuestion(qsNumber);
		return "redirect:getQuestionList.do";
	}

	
	
	
	
	
	/**
	 * 센터 로그인 이후 회원들의 문의사항 리스트
	 */
	@GetMapping("/getCTQuestionList.do")
	public String getCTQuestionList(HttpSession session, Model model) {
	    Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");
	    if (loginCenter != null && !loginCenter.isEmpty()) {
	    	int ctCode = (int) loginCenter.get("ctCode");

	        
	        System.out.println("7777777ctCode: " + ctCode);

	        
	        int totalQuestionCount = service.getTotalQuestionCount(ctCode);
	        List<QuestionVO> questionList = service.getQuestionListWithWriterNames(ctCode);
	        
	     // 결과 로깅
	        System.out.println("Total Question Count: " + totalQuestionCount);
	        System.out.println("Question List: " + questionList);
	        
	        model.addAttribute("totalQuestionCount", totalQuestionCount);
	        model.addAttribute("questionList", questionList);
	        return "center/center_inquiry_test";
	    }
	    return "redirect:centerLogin.do";
	}
	/**
	 * 센터의 답변
	 */
	@GetMapping("/getQuestionReplyCt.do")
	public String getQuestionReply(@RequestParam("reTargetPostNumber") Integer reTargetPostNumber, HttpSession session, Model model) {
	    Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");

	    if (loginCenter != null && !loginCenter.isEmpty()) {
//	        model.addAttribute("question", service.getTargetQuestion(reTargetPostNumber));
//	        model.addAttribute("questionReply", service.getQuestionReplyCt(reTargetPostNumber));
	        model.addAttribute("question", service.getQuestion(reTargetPostNumber)); //qsNumber
	        model.addAttribute("questionReply", service.getReplyForQuestion(reTargetPostNumber)); //qsNumber
	        return "center/center_inquiry_response_test";
	    }
	    return "redirect:centerLogin.do";
	}

	/**
	 * 답변 등록 + 회원의 답변여부 컬럼 update + 알림발송이력 DAO에서 Transactional 하나라도 실패 시 전부 실패
	 * try~catch 문 써서 에러 처리 참고 : com.dev.pilafix.center.member_trainer_manage 패키지의
	 * 컨트롤러 acceptRequest.do 호출 시 동작 과정
	 */
	@GetMapping("/insertQuestionReply.do")
	public String insertQuestionReplyForm(@RequestParam("qsNumber") Integer qsNumber, HttpSession session, Model model) {
	    Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");

	    if (loginCenter != null && !loginCenter.isEmpty()) {
	        QuestionVO questionWithNames = service.getQuestionCenterWithNames(qsNumber);
	        QuestionReplyVO questionReply = service.getReplyForQuestion(qsNumber);
	        
	        model.addAttribute("question", questionWithNames);
	        model.addAttribute("questionReply", questionReply);
	        return "center/center_inquiry_response_test";
	    }
	    return "redirect:centerLogin.do";
	}

	@PostMapping("/insertQuestionReply.do")
    public String insertQuestionReply(@ModelAttribute QuestionReplyVO replyVO, 
                                      @RequestParam("qsNumber") Integer qsNumber, 
                                      HttpSession session, Model model) {
  
        Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");
        if (loginCenter == null || loginCenter.isEmpty()) {
            return "redirect:centerLogin.do";
        }

        int ctCode = (int) loginCenter.get("ctCode");
        replyVO.setWriterMemberCode(ctCode); // 센터코드설정
        replyVO.setReTargetPostNumber(qsNumber);    
//        QuestionVO vo = new QuestionVO();
//        vo.setQsNumber(qsNumber);

        // 답변등록, 답변여부업데이트, 알림이력 메서드
        service.insertQstReplyUpdateYnAndNotice(replyVO, new QuestionVO(qsNumber));
        
        // 답변 상세 정보 조회 후 모델에 추가
        QuestionReplyVO replyDetail = service.getReplyForQuestion(qsNumber); 
        model.addAttribute("questionReply", replyDetail);

        return "redirect:getCTQuestionList.do";
    }
	
	
	
	
	
	

	/**
	 * 답변 삭제
	 */
	@GetMapping("/deleteQuestionReply.do")
	public String deleteQuestionReply(int reNumber, QuestionVO vo, HttpSession session) {
	    Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");

	    if (loginCenter != null && !loginCenter.isEmpty()) {
	        service.deleteQuestionReplyAndUpdateYn(reNumber, vo);
	        return "redirect:getCTQuestionList.do";
	    }
	    return "redirect:centerLogin.do";
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


}
