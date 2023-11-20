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

//	@GetMapping("/getMemberManageList.do")
//	public String getMemberManageList(HttpSession session, Model model) {
//		//���� ��� ������ 
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//
//		if(user!=null){
//			//���ǿ��� ������ ������ ���� ȣ��
//			int csMemberCode = (int) user.get("csMemberCode");
//			service.getList(csMemberCode);
//
//			return "center/center_member_list";
//		}
//		return "center/login"; //�α��� �������� �̵�
//	
//	}

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
	public String getQuestionList(HttpSession session, Model model) {
		// �α��� �� ���ǿ� ����� ����� �������� �ڵ� ������ getQuestionList�� �Ķ���ͷ� �����ؾ� ��
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");

		if (user != null) {
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("questionList", service.getQuestionList());
			// service.getQuestionReply();
			return "member/inquiry";
		} else {
			return "member/login";
		}
	}

	/**
	 * ȸ���� ������ ���� ���
	 */
	@GetMapping("/getCTlistByME.do")
	public String showInsertQuestionForm(HttpSession session, Model model) {
		int csMemberCode = (Integer) session.getAttribute("csMemberCode");
		List<CenterVO> connectedCenters = service.getConnectedCenters(csMemberCode);
		model.addAttribute("connectedCenters", connectedCenters);
		return "member/inquiry_detail";
	}

	/**
	 * js�� �亯 ��� ����
	 * 
	 * @return
	 */
	@GetMapping("/getQuestionReplyOnJS.do")
	@ResponseBody
	public List<QuestionReplyVO> getQuestionReply(@RequestParam("writerMemberCode") int writerMemberCode) {
		System.out.println("�ۼ��� ��ȣ : " + writerMemberCode);
		return service.getQuestionReply(writerMemberCode);
	}

	@GetMapping("/insertQuestion.do")
	public String insertForm(HttpSession session) {
	    if(session.getAttribute("loginUser") == null) {
	    	return "member/login";
	    }
	    return "member/inquiry_detail"; 
	}

	@PostMapping("/insertQuestion.do")
	public String insert(HttpSession session, QuestionVO vo) {
		
		if(session.getAttribute("loginUser") == null) {
			return "member/login";
	    }
		// ==========================
		// �׽�Ʈ�� �ۼ��� ���� ���Ŀ� �α��� ���� �� �ְ�(insertQuestion.jsp) ���� �ʿ�
		// vo.setQsWriterMemberCode(123);
		// ==========================
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
	    int csMemberCode = (int) user.get("csMemberCode");
	    vo.setQsWriterMemberCode(csMemberCode); // �α����� ������� ȸ���ڵ��
	    
		service.insertQuestion(vo);
		return "redirect:getQuestionList.do";
	}

	/**
	 * ȸ�� ���ǻ��� ����
	 * 
	 * @param qsNumber
	 * @param model
	 * @return
	 */
	@GetMapping("/updateQuestion.do")
	public String updateForm(@RequestParam("qsNumber") Integer qsNumber, HttpSession session,Model model) {
		 if(session.getAttribute("loginUser") == null) {
			 return "member/login";
		    }
		
		
		QuestionVO question = service.getQuestion(qsNumber); // ���ǻ����� �����͸� ��ȸ
		model.addAttribute("question", question);
		List<CenterVO> connectedCenters = service.getConnectedCenters(question.getQsWriterMemberCode());
		model.addAttribute("connectedCenters", connectedCenters); // ������ ���� ����� �߰�
		return "question/updateQuestion"; // ���� �� ������ ���
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
	 * ���� �α��� ���� ȸ������ ���ǻ��� ����Ʈ
	 */
	@GetMapping("/getCTQuestionList.do")
	public String getCTQuestionList(Model model) {
		int totalQuestionCount = service.getTotalQuestionCount();
		model.addAttribute("totalQuestionCount", totalQuestionCount);
		model.addAttribute("questionList", service.getQuestionList());
		return "center/center_inquiry";
	}

	/**
	 * ������ �亯
	 */
	@GetMapping("/getQuestionReply.do")
	public String getQuestionReply(@RequestParam("reTargetPostNumber") Integer reTargetPostNumber, Model model) {

		model.addAttribute("question", service.getTargetQuestion(reTargetPostNumber)); // �亯�� targetNumber�� ���Ǳ���
																						// qsNumber�� �����ϹǷ�
		model.addAttribute("questionReply", service.getQuestionReply(reTargetPostNumber));
		return "center/center_inquiry_response";
	}

	/**
	 * �亯 ��� + ȸ���� �亯���� �÷� update DAO���� Transactional �ϳ��� ���� �� ���� ���� try~catch �� �Ἥ
	 * ���� ó�� ���� : com.dev.pilafix.center.member_trainer_manage ��Ű���� ��Ʈ�ѷ�
	 * acceptRequest.do ȣ�� �� ���� ����
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
	 * �亯 ����
	 */
	@GetMapping("/deleteQuestionReply.do")
	public String deleteQuestionReply(int reNumber) {
		service.deleteQuestionReply(reNumber);
		return "redirect:getQuestionReplyList.do";
	}

}
