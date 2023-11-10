package com.dev.pilafix.center.question_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QuestionReplyController {
	
	@Autowired
	private QuestionReplyService service;
	
	@GetMapping("/getQuestionReplyList.do")
	public String getQuestionReplyList(Model model) {
	    model.addAttribute("questionReplyList", service.getQuestionReplyList());
	    return "questionreply/getQuestionReplyList.jsp";
	}
	

	@GetMapping("/getQuestionReply.do")
	public String getQuestionReply(@RequestParam("reTargetPostNumber") Integer reTargetPostNumber, Model model) {
		
		model.addAttribute("question", service.getTargetQuestion(reTargetPostNumber)); //답변의 targetNumber와 문의글의 qsNumber가 동일하므로 
		model.addAttribute("questionReply", service.getQuestionReply(reTargetPostNumber));
	    return "questionreply/getQuestionReply.jsp";
	}
	
	
//	@GetMapping("/insertQuestionReply.do")
//	public String insertForm() {
//		return "questionreply/insertQuestionReply.jsp";
//	}
	
//	@Transactional
//	@PostMapping("/insertQuestionReply.do")
//	public String insert(QuestionReplyVO vo) {
//		service.insertQuestionReply(vo);
//		service.updateAnswerYn(vo.getReTargetPostNumber());
//		return "redirect:getQuestionReply.do?reTargetPostNumber="+vo.getReTargetPostNumber();
//	}

//	@Transactional
	@PostMapping("/insertQuestionReply.do")
	public String insert(QuestionReplyVO vo) {
		service.insertQuestionReplyAndUpdateAnswerYn(vo);
		return "redirect:getQuestionReply.do?reTargetPostNumber="+vo.getReTargetPostNumber();
	}
	

	
	@GetMapping("/deleteQuestionReply.do")
	public String delete(int reNumber) {
		service.deleteQuestionReply(reNumber);
		return "redirect:getQuestionReplyList.do";
	}
//	@GetMapping("/deleteQuestionReply.do")
//	public String delete(@RequestParam(name = "reNumber") Integer reNumber) {
//	    if (reNumber != null) {
//	        service.deleteQuestionReply(reNumber);
//	    }
//	    return "redirect:getQuestionReplyList.do";
//	}

	

}
