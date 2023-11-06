package com.dev.pilafix.admin.center_manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class CenterController {
	@Autowired
	private CenterService service;

	@GetMapping("/insertCenter.do")
	public String insertForm() {
		return "admin_centermanage/insertCenter.jsp";
	}

	@PostMapping("/insertCenter.do")
	public String insert(CenterVO vo) {
		service.insertCenter(vo);
		return "redirect:getCenterList.do";
	}
	
	@GetMapping("/getCenterList.do")
	public String getCenterList(Model model) {
		model.addAttribute("centerList",service.getCenterList());
		return "admin_centermanage/getCenterList.jsp";
	}
	
	@GetMapping("/getCenter.do")
	public String getCenter(int ctCode, Model model) {
		model.addAttribute("center",service.getCenter(ctCode));
		return "admin_centermanage/getCenter.jsp";
	}
	
	
}
