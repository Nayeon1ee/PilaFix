package com.dev.pilafix.center.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class CenterInfoController {
	@Autowired
	private CenterInfoService service;
	
	@GetMapping("/insertCenterInfo.do")
	public String insertCenterInfo() {
		return "center_info/insertCenterInfo.jsp";
	}
	
	@PostMapping("/insertCenterInfo.do")
	public String insert(CenterInfoVO vo) {
		service.insertCenterInfo(vo);
		return "redirect:getCenterInfoList.do";
	}
	
	@GetMapping("/updateCenterInfo.do")
	public String updateCenterInfo(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("list", service.getCenterInfo(seq));
		return "center_info/updateCenterInfo.jsp";
	}
	
	@PostMapping("/updateCenterInfo.do")
	public String update(CenterInfoVO vo, Model model) {
		service.updateCenterInfo(vo);
		return "redirect:getCenterInfoList.do";
	}
	
	@GetMapping("/deleteCenterInfo.do")
	public String delete(int seq) {
		service.deleteCenterInfo(seq);
		return "redirect:getCenterInfoList.do";
	}
	
	@GetMapping("/getCenterInfoList.do")
	public String getCenterInfoList(Model model) {
		model.addAttribute("infoList", service.getCenterInfoList());
		return "center_info/getCenterInfoList.jsp";
	}
	
	@GetMapping("/getCenterInfo.do")
	public String getCenterInfo(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("centerInfo", service.getCenterInfo(seq));
		return "center_info/getCenterInfo.jsp";
	}
}