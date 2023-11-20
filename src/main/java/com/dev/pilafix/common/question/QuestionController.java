package com.dev.pilafix.common.question;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.common.member.CenterVO;


@Controller
public class QuestionController {
	@Autowired
	private QuestionService service;

	/**
	 * 문의사항 조회 
	 * 
	 * @param qsNumber
	 * @param model
	 * @return
	 */
	@GetMapping("/getQuestion.do")
	public String getQuestion(@RequestParam("qsNumber") Integer qsNumber, Model model) {
		model.addAttribute("question", service.getQuestion(qsNumber));
		return "question/getQuestion.jsp";
	}
	
	/**
	 * 문의사항 목록 조회 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getQuestionList.do")
	public String getQuestionList(HttpSession session, Model model) {
		//로그인 후 세션에 저장된 사용자 정보에서 코드 꺼내서 getQuestionList의 파라미터로 전달해야 함
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("questionList", service.getQuestionList());
			// service.getQuestionReply();
//			return "member/inquiry";
			return "member/inquiry_test";
		} else {
			return "member/login";
		}
	}
	
	
	/**
	 * 회원의 연동된 센터 목록
	 */
	@GetMapping("/getCTlistByME.do")
	public String showInsertQuestionForm(HttpSession session, Model model) {
		int csMemberCode = (Integer) session.getAttribute("csMemberCode");
		List<CenterVO> connectedCenters = service.getConnectedCenters(csMemberCode);
		model.addAttribute("connectedCenters", connectedCenters);
//		return "member/inquiry_detail";
		return "member/inquiry_detail_test";
	}
	
	
	/**
	 * js로 답변 목록 받음 
	 * @return
	 */
	@GetMapping("/getQuestionReplyOnJS.do")
	@ResponseBody
	public List<QuestionReplyVO> getQuestionReply(@RequestParam("qsWriterMemberCode") int qsWriterMemberCode) {
		System.out.println("작성자 번호 : "+qsWriterMemberCode);
		return service.getQuestionReply(qsWriterMemberCode);
	}
	
	@GetMapping("/insertQuestion.do")
	public String insertForm(HttpSession session) {
	    if(session.getAttribute("loginUser") == null) {
	    	return "member/login";
	    }
//	    return "member/inquiry_detail"; 
	    return "member/inquiry_detail_test"; 
	}
	
	@PostMapping("/insertQuestion.do")
	public String insert(HttpSession session, QuestionVO vo) {
		
		if(session.getAttribute("loginUser") == null) {
			return "member/login";
	    }
		// ==========================
		// 테스트용 작성자 세팅 추후에 로그인 세션 값 넣고(insertQuestion.jsp) 삭제 필요 
		//vo.setQsWriterMemberCode(123); 
		// ==========================

		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    int csMemberCode = (int) user.get("csMemberCode");
	    vo.setQsWriterMemberCode(csMemberCode); 
	    
		service.insertQuestion(vo);
		return "redirect:getQuestionList.do";
	}
	
	
	@GetMapping("/updateQuestion.do")
	public String updateForm(@RequestParam("qsNumber") Integer qsNumber, HttpSession session,Model model) {
		 if(session.getAttribute("loginUser") == null) {
			 return "member/login";
		    }
		 QuestionVO question = service.getQuestion(qsNumber); //
		 model.addAttribute("question", question);
		 List<CenterVO> connectedCenters = service.getConnectedCenters(question.getQsWriterMemberCode());
		 model.addAttribute("connectedCenters", connectedCenters); //
		 return "member/inquiry_edit";
	}
	
	
	@PostMapping("/updateQuestion.do")
	public String update(QuestionVO vo,HttpSession session) {
		 if(session.getAttribute("loginUser") == null) {
			 return "member/login";
		    }
		
		service.updateQuestion(vo);
		return "redirect:getQuestionList.do";
	}

	@GetMapping("/deleteQuestion.do")
	public String delete(@RequestParam("qsNumber") int qsNumber, HttpSession session) {
	    if(session.getAttribute("loginUser") == null) {
	    	return "member/login";
	    }
		service.deleteQuestion(qsNumber);
		return "redirect:getQuestionList.do";
	}
	
	
	
	
	
	
	/**
	 * 센터 로그인 이후 
	 * 회원들의 문의사항 리스트 
	 */
	@GetMapping("/getCTQuestionList.do")
	public String getCTQuestionList(Model model) {
		int totalQuestionCount = service.getTotalQuestionCount();
		model.addAttribute("totalQuestionCount", totalQuestionCount);
		model.addAttribute("questionList", service.getQuestionList());
		return "center/center_inquiry";
	}
	
	/**
	 * 센터의 답변
	 */
	@GetMapping("/getQuestionReply.do")
	public String getQuestionReply(@RequestParam("reTargetPostNumber") Integer reTargetPostNumber, Model model) {

		model.addAttribute("question", service.getTargetQuestion(reTargetPostNumber)); // �亯�� targetNumber�� ���Ǳ���
																						// qsNumber�� �����ϹǷ�
		model.addAttribute("questionReply", service.getQuestionReply(reTargetPostNumber));
		return "center/center_inquiry_response";
	}

	/**
	 * 답변 등록
	 * + 회원의 답변여부 컬럼 update
	 * DAO에서 Transactional 하나라도 실패 시 전부 실패 try~catch 문 써서 에러 처리
	 * 참고 : com.dev.pilafix.center.member_trainer_manage 패키지의 컨트롤러 acceptRequest.do 호출 시 동작 과정
	 */
	@GetMapping("/insertQuestionReply.do")
	public String insertQuestionReplyForm(@RequestParam("qsNumber") Integer qsNumber, Model model) {
		QuestionVO question = service.getQuestion(qsNumber); // ���ǻ��� ������ ��ȸ
		model.addAttribute("question", question);
		return "center/center_inquiry_response";
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