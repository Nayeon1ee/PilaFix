package com.dev.pilafix.admin.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@GetMapping("/getCommunityList.do")
	public String getCommunityList(Model model) {
		model.addAttribute("communityList",service.getCommunityList());
		return "admin_community/getCommunityList.jsp";
		// jsp파일이 webapp밑에 admin_community폴더 안에 있어서
	}
	
	@GetMapping("/getCommunity.do")
	public String getCommunity(@RequestParam("cmNumber")Integer cmNumber,Model model) {
		model.addAttribute("community",service.getCommunity(cmNumber));
		return "admin_community/getCommunity.jsp";
	}
	
	@GetMapping("/deleteCommunity.do")
	public String delete(int cmNumber) {
		service.deleteCommunity(cmNumber);
		return "redirect:/getCommunityList.do"; // .do로 요청해야 위에 getCommunityList.do수행하고 디비가서 바뀐정보로 다시 가져옴
		
	}
}
