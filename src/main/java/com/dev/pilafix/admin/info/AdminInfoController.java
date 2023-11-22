package com.dev.pilafix.admin.info;

import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String getAdminInfoList(HttpSession session, Model model) {
		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!loginAdmin.isEmpty()) {
			String adCode = (String)loginAdmin.get("adCode");
			model.addAttribute("InfoList", service.getAdminInfoList());
			return "admin/admin_info_board";
		}
		return "redirect:adminLogin.do";
	}

	@GetMapping("/getAdminInfo.do")
	public String getAdminInfo(@RequestParam("iwNumber") Integer iwNumber, Model model) {
	    // 조회수 증가
	    service.updateAdminInfoViewCnt(iwNumber);
	    model.addAttribute("adminInfo", service.getInfo(iwNumber));
		return "admin/admin_info_board_detail";
	}

	@GetMapping("/insertAdminInfo.do")
	public String insertAdminInfo() {
		return "admin/admin_info_board_register";
	}

	@PostMapping("/insertAdminInfo.do")
	public String insert(HttpSession session, AdminInfoVO vo) {
		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!loginAdmin.isEmpty()) {
			String adCode = (String)loginAdmin.get("adCode");
			vo.setWriterMemberCode(adCode);
			service.insertAdminInfoAndLoadNotices(vo); // 공지 등록 및 알림 등록
			return "redirect:getAdminInfoList.do";
		}
		return "redirect:centerLogin.do";
	}

	@GetMapping("/updateAdminInfo.do")
	public String updateAdminInfo(@RequestParam("iwNumber") Integer iwNumber, Model model) {
		model.addAttribute("adminInfo", service.getInfo(iwNumber));
		return "admin/admin_info_board_modify";
	}

	@PostMapping("/updateAdminInfo.do")
	public String update(AdminInfoVO vo) {
		service.updateAdminInfo(vo);
		return "redirect:getAdminInfoList.do";
	}

	@GetMapping("/deleteAdminInfo.do")
	public String delete(int iwNumber) {
		service.deleteAdminInfo(iwNumber);
		return "redirect:getAdminInfoList.do";
	}
}