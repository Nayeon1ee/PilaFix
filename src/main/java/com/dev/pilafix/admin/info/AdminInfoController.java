package com.dev.pilafix.admin.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminInfoController {
	@Autowired
	private AdminInfoService service;

	@GetMapping("/getAdminInfoList.do")
	public String getAdminInfoList(Model model) {
		model.addAttribute("InfoList", service.getAdminInfoList());
		return "admin/admin_notice_board";
	}

	@GetMapping("/getAdminInfo.do")
	public String getAdminInfo(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("adminInfo", service.getInfo(seq));
		return "admin/admin_notice_board_detail";
	}

	@GetMapping("/insertAdminInfo.do")
	public String insertAdminInfo() {
		return "admin/admin_notice_board_register";
	}

	@PostMapping("/insertAdminInfo.do")
	public String insert(AdminInfoVO vo) {
		service.insertAdminInfo(vo);
		return "redirect:getAdminInfoList.do";
	}

	@GetMapping("/updateAdminInfo.do")
	public String updateAdminInfo(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("adminInfo", service.getInfo(seq));
		return "admin/admin_notice_board_modify";
	}

	@PostMapping("/updateAdminInfo.do")
	public String update(AdminInfoVO vo, Model model) {
		service.updateAdminInfo(vo);
		return "redirect:getAdminInfoList.do";
	}

	@GetMapping("/deleteAdminInfo.do")
	public String delete(int seq) {
		service.deleteAdminInfo(seq);
		return "redirect:getAdminInfoList.do";
	}
}