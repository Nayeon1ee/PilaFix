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
	
	@GetMapping("/getCenterInfoList.do")
	public String getCenterInfoList(Model model) {
		model.addAttribute("infoList", service.getCenterInfoList());
		return "center/center_info_board";
	}
	
	@GetMapping("/getCenterInfo.do")
	public String getCenterInfo(@RequestParam("seq") Integer seq, Model model) {
		// 게시글 조회
	    CenterInfoVO centerInfo = service.getCenterInfo(seq);
	    
	    // 조회수 증가
	    service.updateCenterInfoViewCnt(seq);
	    
	    // 리스트 업데이트
	    int updatedList = service.updateCenterInfoViewCnt(centerInfo.getCnt());
		model.addAttribute("centerInfo", service.getCenterInfo(seq));
		model.addAttribute("updatedList", updatedList);
		return "center/center_info_board_detail";
	}
	
	@GetMapping("/insertCenterInfo.do")
	public String insertCenterInfo() {
		return "center/center_info_board_register";
	}
	
	@PostMapping("/insertCenterInfo.do")
	public String insert(CenterInfoVO vo) {
		service.insertCenterInfo(vo);
		return "redirect:getCenterInfoList.do";
	}
	
	@GetMapping("/updateCenterInfo.do")
	public String updateCenterInfo(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("centerInfo", service.getCenterInfo(seq));
		return "center/center_info_board_modify";
	}
	
	@PostMapping("/updateCenterInfo.do")
	public String update(CenterInfoVO vo) {
		service.updateCenterInfo(vo);
		return "redirect:getCenterInfoList.do";
	}
	
	@GetMapping("/deleteCenterInfo.do")
	public String delete(int seq) {
		service.deleteCenterInfo(seq);
		return "redirect:getCenterInfoList.do";
	}
}
