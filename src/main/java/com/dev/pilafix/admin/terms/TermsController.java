package com.dev.pilafix.admin.terms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TermsController {
	@Autowired
	private TermsService service;
	
	
	
	@GetMapping("/getTerms.do")
	public String getTerms(@RequestParam("tmCode")Integer tmCode, Model model) {
		model.addAttribute("terms", service.getTerms(tmCode));
		return "terms/getTerms.jsp";
	}
	
	@GetMapping("/getTermsList.do")
	public String getTermsList(Model model) {
		model.addAttribute("termsList", service.getTermsList());
		return "terms/getTermsList.jsp";
	}

	@GetMapping("/insertTerms.do")
	public String insertTerms() {
		return "terms/insertTerms.jsp";
	}
	
	@PostMapping("/insertTerms.do")
	public String insert(TermsVO vo) {
		service.insertTerms(vo);
		return "redirect:getTermsList.do";
	}
	

	@GetMapping("/updateTerms.do")
	public String updateTerms(@RequestParam("tmCode") Integer tmCode, Model model) {
		model.addAttribute("terms", service.getTerms(tmCode));
		return "terms/updateTerms.jsp";
	}
	
	@PostMapping("/updateTerms.do")
	public String update(TermsVO vo, Model model) {
		service.updateTerms(vo);
		return "redirect:getTermsList.do";
	}
	
	@GetMapping("/deleteTerms.do")
	public String delete(int tmCode) {
		service.deleteTerms(tmCode);
		return "redirect:getTermsList.do";
	}
	
	
	
	
}
