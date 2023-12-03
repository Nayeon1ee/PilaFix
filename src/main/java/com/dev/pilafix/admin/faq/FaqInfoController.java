package com.dev.pilafix.admin.faq;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FaqInfoController {
	
	@Autowired
	private FaqService service;
	
	@GetMapping("/insertFaqInfo.do")
	public String insertFaqInfo(FaqVO vo) {
		return "admin/admin_FAQ_register";
	}
	
	@PostMapping("/insertFaqInfo.do")
	public String insert(HttpSession session, FaqVO vo) {
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!admin.isEmpty()) {
			String adCode = (String) admin.get("adCode");
			vo.setFqWriterMemberCode(adCode);
			service.insertFaqInfo(vo);
			return "redirect:getFaqInfoList.do";
		}
		return "redirect:adminLogin.do";
		
		
	}
	
	@GetMapping("/updateFaqInfo.do")
	public String updateFaqInfo(@RequestParam("fqNumber") Integer fqNumber, Model model) {
		model.addAttribute("faqInfo", service.getFaqInfo(fqNumber));
		return "admin/admin_FAQ_edit";
	}
	
	@PostMapping("/updateFaqInfo.do")
	public String update(FaqVO vo, Model model) {
		service.updateFaqInfo(vo);
		return "redirect:getFaqInfoList.do";
	}
	
	@GetMapping("/deleteFaqInfo.do")
	public String delete(int fqNumber) {
		service.deleteFaqInfo(fqNumber);
		return "redirect:getFaqInfoList.do";
	}
	
	@GetMapping("/getFaqInfoList.do")
	public String getFaqInfoList(Model model) {
		model.addAttribute("FaqInfoList", service.getFaqInfoList());
		return "admin/admin_FAQ";
	}
	
	@GetMapping("/getFaqInfo.do")
	public String getFaqInfo(@RequestParam("fqNumber") Integer fqNumber,HttpSession session, Model model) {
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!admin.isEmpty()) {
			String adCode = (String)admin.get("adCode");
			model.addAttribute("faqInfo", service.getFaqInfo(fqNumber));
			return "admin/admin_FAQ_detail";
		}
		return "redirect:adminLogin.do";
	}
	
}
