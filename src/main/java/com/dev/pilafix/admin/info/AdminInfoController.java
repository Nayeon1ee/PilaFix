package com.dev.pilafix.admin.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.member.community.MemberCommunityVO;

@Controller
public class AdminInfoController {
	@Autowired
	private AdminInfoService service;

	@GetMapping("/getAdminInfoList.do")
	public String getAdminInfoList(Model model) {
		model.addAttribute("InfoList", service.getAdminInfoList());
		return "admin/admin_info_board";
	}

	@GetMapping("/getAdminInfo.do")
	public String getAdminInfo(@RequestParam("seq") Integer seq, Model model) {
		// 게시글 조회
	    AdminInfoVO adminInfo = service.getInfo(seq);
	    
	    // 조회수 증가
	    service.updateAdminInfoViewCnt(seq);
	    
	    // 리스트 업데이트
	    int updatedList = service.updateAdminInfoViewCnt(adminInfo.getCnt());
	    
	    model.addAttribute("adminInfo", service.getInfo(seq));
	    model.addAttribute("updatedList", updatedList);
		return "admin/admin_info_board_detail";
	}

	@GetMapping("/insertAdminInfo.do")
	public String insertAdminInfo() {
		return "admin/admin_info_board_register";
	}

	@PostMapping("/insertAdminInfo.do")
	public String insert(AdminInfoVO vo) {
		service.insertAdminInfo(vo);
		return "redirect:getAdminInfoList.do";
	}

	@GetMapping("/updateAdminInfo.do")
	public String updateAdminInfo(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("adminInfo", service.getInfo(seq));
		return "admin/admin_info_board_modify";
	}

	@PostMapping("/updateAdminInfo.do")
	public String update(AdminInfoVO vo) {
		service.updateAdminInfo(vo);
		return "redirect:getAdminInfoList.do";
	}

	@GetMapping("/deleteAdminInfo.do")
	public String delete(int seq) {
		service.deleteAdminInfo(seq);
		return "redirect:getAdminInfoList.do";
	}
}