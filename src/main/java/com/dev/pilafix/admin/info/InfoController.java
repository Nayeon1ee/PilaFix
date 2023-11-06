package com.dev.pilafix.admin.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InfoController {
	@Autowired
	private InfoService service;
	
	@GetMapping("/insertInfo.do")
	public String insertForm() {
		return "info/insertInfo.jsp";
	}
	
	@PostMapping("/insertInfo.do")
	public String insert(InfoVO vo) {
		service.insertInfo(vo);
		return "redirect:getInfoList.do";
	}
	
	@PostMapping("/updateInfo.do")
	public String update(InfoVO vo, Model model) {
		service.updateInfo(vo);
		return "redirect:getInfoList.do";
	}
	
	@GetMapping("/deleteInfo.do")
	public String delete(int seq) {
		service.deleteInfo(seq);
		return "redirect:getInfoList.do";
	}
	
	@GetMapping("/getInfoList.do")
	public String getInfoList(Model model) {
		model.addAttribute("InfoList", service.getInfoList());
		return "info/getInfoList.jsp";
	}
	
	@GetMapping("/getInfo.do")
	public String getInfo(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("info", service.getInfo(seq));
		return "info/getInfo.do";
	}
}
