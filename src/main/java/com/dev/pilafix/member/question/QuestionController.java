package com.dev.pilafix.member.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService service;

	@GetMapping("/getQuestion.do")
	public String getQuestion(@RequestParam("qsNumber") Integer qsNumber, Model model) {
		model.addAttribute("question", service.getQuestion(qsNumber));
		return "question/getQuestion.jsp";
	}
	
	@GetMapping("/getQuestionList.do")
	public String getQuestionList(Model model) {
		model.addAttribute("questionList", service.getQuestionList());
//		service.getQuestionReply();
		return "question/getQuestionList.jsp";
	}
	

	@GetMapping("/insertQuestion.do")
	public String insertForm() {
		return "question/insertQuestion.jsp";
	}
	
	@PostMapping("/insertQuestion.do")
	public String insert(QuestionVO vo) {
		// ==========================
		// 테스트용 작성자 세팅 추후에 로그인 세션 값 넣고(insertQuestion.jsp) 삭제 필요 
		vo.setQsWriterMemberCode(123); 
		// ==========================

		service.insertQuestion(vo);
		return "redirect:getQuestionList.do";
	}
	
	
	@GetMapping("/updateQuestion.do")
	public String updateForm(@RequestParam("qsNumber")Integer qsNumber, Model model) {
		model.addAttribute("question", service.getQuestion(qsNumber));
		return "question/updateQuestion.jsp";
	}
	
	@PostMapping("/updateQuestion.do")
	public String update(QuestionVO vo, Model model) {
		service.updateQuestion(vo);
		return "redirect:getQuestionList.do";
	}
	
	
	@GetMapping("/deleteQuestion.do")
	public String delete(int qsNumber) {
		service.deleteQuestion(qsNumber);
		return "redirect:getQuestionList.do";
	}
	
	
	

}
