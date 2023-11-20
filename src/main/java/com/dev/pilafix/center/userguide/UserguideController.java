package com.dev.pilafix.center.userguide;

import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserguideController {
	@Autowired
	private UserguideService service;

	@GetMapping("/insertUserguide.do")
	public String insertForm() {
		return "center/center_userguide_register";
	}

	@PostMapping("/insertUserguide.do")
	public String insert(HttpSession session, UserguideVO vo) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginCenter");
		// 세션에 있는 정보를 가져와서 작성센터코드 추가 
		if(!user.isEmpty()) {
			vo.setUgCenterCode((int)user.get("ctCode"));
			service.insertUserguide(vo);
			return "redirect:getUserguideList.do";
		}
		return "redirect:centerLogin.do";
	}
	
	@GetMapping("/updateUserguide.do")
	public String updateForm(int ugCode, Model model) {
		model.addAttribute("userguide", service.getUserguide(ugCode));
		return "center/center_userguide_edit";
	}

	@PostMapping("/updateUserguide.do")
	public String update(UserguideVO vo, Model model) {
		service.updateUserguide(vo);
		return "redirect:getUserguideList.do";
	}
	
	@GetMapping("/deleteUserguide.do")
	public String delete(int ugCode) {
		service.deleteUserguide(ugCode);
		return "redirect:getUserguideList.do";
	}
	
	@GetMapping("/getUserguideList.do")
	public String getUserguideList(HttpSession session, Model model) {
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginCenter");
		
		if(!user.isEmpty()) {
			model.addAttribute("userguideList", service.getUserguideList((int)user.get("ctCode")));
			return "center/center_userguide";
		}
		return "redirect:centerLogin.do";
	}
	
	@GetMapping("/getUserguide.do")
	public String getUserguide(@RequestParam("ugCode") Integer ugCode, Model model) {
		model.addAttribute("userguide", service.getUserguide(ugCode));
		return "center/center_userguide_detail";
	}
	
	
	
	
}