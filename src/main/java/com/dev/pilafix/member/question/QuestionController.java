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
	 * ���ǻ��� ��ȸ 
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
	 * ���ǻ��� ��� ��ȸ 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getQuestionList.do")
	public String getQuestionList(Model model) {
		//�α��� �� ���ǿ� ����� ����� �������� �ڵ� ������ getQuestionList�� �Ķ���ͷ� �����ؾ� ��
		model.addAttribute("questionList", service.getQuestionList());
//		service.getQuestionReply();
		return "member/centerinquiry";
	}
	
	/**
	 * js�� �亯 ��� ���� 
	 * @return
	 */
	@GetMapping("/getQuestionReplyOnJS.do")
	@ResponseBody
	public List<QuestionReplyVO> getQustionReply(@RequestParam("qsWriterMemberCode") int qsWriterMemberCode) {
		System.out.println("�ۼ��� ��ȣ : "+qsWriterMemberCode);
		return service.getQuestionReply(qsWriterMemberCode);
	}
	
	@GetMapping("/insertQuestion.do")
	public String insertForm() {
		return "question/insertQuestion.jsp";
	}
	
	@PostMapping("/insertQuestion.do")
	public String insert(QuestionVO vo) {
		// ==========================
		// �׽�Ʈ�� �ۼ��� ���� ���Ŀ� �α��� ���� �� �ְ�(insertQuestion.jsp) ���� �ʿ� 
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
