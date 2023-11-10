package com.dev.pilafix.admin.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FaqInfoController {
	
	@Autowired
	private FaqService service;
	
	@GetMapping("/insertFaqInfo.do")
	public String insertFaqInfo(FaqVO vo) {
		return "admin_faq/insertFaqInfo.jsp";
	}
	
	@PostMapping("/insertFaqInfo.do")
	public String insert(FaqVO vo) {
		service.insertFaqInfo(vo);
		return "redirect:getFaqInfoList.do";
	}
	
	@GetMapping("/updateFaqInfo.do")
	public String updateFaqInfo(@RequestParam("fq_number") Integer fq_number, Model model) {
		model.addAttribute("list", service.getFaqInfo(fq_number));
		return "admin_faq/updateFaqInfo.jsp";
	}
	
	@PostMapping("/updateFaqInfo.do")
	public String update(FaqVO vo, Model model) {
		service.updateFaqInfo(vo);
		return "redirect:getFaqInfoList.do";
	}
	
	@GetMapping("/deleteFaqInfo.do")
	public String delete(int fq_number) {
		service.deleteFaqInfo(fq_number);
		return "redirect:getFaqInfoList.do";
	}
	
	@GetMapping("/getFaqInfoList.do")
	public String getFaqInfoList(Model model) {
		model.addAttribute("FaqInfoList", service.getFaqInfoList());
		return "admin_faq/getFaqInfoList.jsp";
	}
	
	@GetMapping("/getFaqInfo.do")
	public String getFaqInfo(@RequestParam("fq_number") Integer fq_number, Model model) {
		model.addAttribute("faqInfo", service.getFaqInfo(fq_number));
		return "admin_faq/getFaqInfo.jsp";
	}
	
}
