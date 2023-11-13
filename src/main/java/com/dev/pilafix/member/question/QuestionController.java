package com.dev.pilafix.member.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.admin.center_manage.CenterVO;

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
	public String getQuestionList(Model model) {
		//로그인 후 세션에 저장된 사용자 정보에서 코드 꺼내서 getQuestionList의 파라미터로 전달해야 함
		model.addAttribute("questionList", service.getQuestionList());
//		service.getQuestionReply();
		return "member/centerinquiry";
	}
	
	/**
	 * js로 답변 목록 받음 
	 * @return
	 */
	@GetMapping("/getQuestionReplyOnJS.do")
	@ResponseBody
	public List<QuestionReplyVO> getQustionReply(@RequestParam("qsWriterMemberCode") int qsWriterMemberCode) {
		System.out.println("작성자 번호 : "+qsWriterMemberCode);
		return service.getQuestionReply(qsWriterMemberCode);
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
