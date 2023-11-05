package com.dev.pilafix.center.userguide;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserguideController {
	@Autowired
	private UserguideService service;

	@GetMapping("/insertUserguide.do")
	public String insertForm() {
		return "userguide/insertUserguide.jsp";
	}

	@PostMapping("/insertUserguide.do")
	public String insert(UserguideVO vo) {
		service.insertUserguide(vo);
		return "redirect:getUserguideList.do";
	}
	
	@GetMapping("/updateUserguide.do")
	public String updateForm(@RequestParam("ugCode") Integer ugCode, Model model) {
		model.addAttribute("userguide", service.getUserguide(ugCode));
		return "userguide/updateUserguide.jsp";
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
	public String getUserguideList(Model model) {
		model.addAttribute("userguideList", service.getUserguideList());
		return "userguide/getUserguideList.jsp";
	}
	
	@GetMapping("/getUserguide.do")
	public String getUserguide(@RequestParam("ugCode") Integer ugCode, Model model) {
//		UserguideVO vo = service.getUserguide(ugCode);
//		System.out.println(vo.getUgCode());
//		System.out.println(vo.getUgName());
//		System.out.println("===========");

		model.addAttribute("userguide", service.getUserguide(ugCode));
		return "userguide/getUserguide.jsp";
	}
	
	
	
	
}
