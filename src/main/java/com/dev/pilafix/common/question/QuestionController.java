package com.dev.pilafix.common.question;

import java.util.List;

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
		return "member/inquiry";
	}
	
	
	/**
	 * ȸ���� ������ ���� ���
	 */
	@GetMapping("/getCTlistByME.do")
    public String showInsertQuestionForm(HttpSession session, Model model) {
        int csMemberCode = (Integer)session.getAttribute("csMemberCode");
        List<CenterVO> connectedCenters = service.getConnectedCenters(csMemberCode);
        model.addAttribute("connectedCenters", connectedCenters);
        return "member/inquiry_detail";
    }
	
	
	/**
	 * js�� �亯 ��� ���� 
	 * @return
	 */
	@GetMapping("/getQuestionReplyOnJS.do")
	@ResponseBody
	public List<QuestionReplyVO> getQuestionReply(@RequestParam("qsWriterMemberCode") int qsWriterMemberCode) {
		System.out.println("�ۼ��� ��ȣ : "+qsWriterMemberCode);
		return service.getQuestionReply(qsWriterMemberCode);
	}
	
	@GetMapping("/insertQuestion.do")
	public String insertForm() {
		return "member/inquiry_detail";
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
	
	
	
	
	
	
	/**
	 * ���� �α��� ���� 
	 * ȸ������ ���ǻ��� ����Ʈ 
	 */
	@GetMapping("/getCTQuestionList.do")
	public String getCTQuestionList(Model model) {
		int totalQuestionCount = service.getTotalQuestionCount();
	    model.addAttribute("totalQuestionCount", totalQuestionCount);
	    model.addAttribute("questionReplyList", service.getQuestionList());
	    return "center/center_inquiry";
	}
	
	/**
	 * ������ �亯
	 */
	@GetMapping("/getQuestionReply.do")
	public String getQuestionReply(@RequestParam("reTargetPostNumber") Integer reTargetPostNumber, Model model) {
		
		model.addAttribute("question", service.getTargetQuestion(reTargetPostNumber)); //�亯�� targetNumber�� ���Ǳ��� qsNumber�� �����ϹǷ� 
		model.addAttribute("questionReply", service.getQuestionReply(reTargetPostNumber));
	    return "center/center_inquiry_response";
	}
	

	/**
	 * �亯 ���
	 * + ȸ���� �亯���� �÷� update
	 * DAO���� Transactional �ϳ��� ���� �� ���� ���� try~catch �� �Ἥ ���� ó��
	 * ���� : com.dev.pilafix.center.member_trainer_manage ��Ű���� ��Ʈ�ѷ� acceptRequest.do ȣ�� �� ���� ����
	 */
//	@Transactional
	@PostMapping("/insertQuestionReply.do")
	public String insertQuestionReply(QuestionReplyVO replyvo) {
		service.insertQuestionReplyAndUpdateAnswerYn(replyvo);
		return "redirect:getQuestionReply.do?reTargetPostNumber="+replyvo.getReTargetPostNumber();
	}
	
	/**
	 * �亯 ����
	 */
	@GetMapping("/deleteQuestionReply.do")
	public String deleteQuestionReply(int reNumber) {
		service.deleteQuestionReply(reNumber);
		return "redirect:getQuestionReplyList.do";
	}

}
