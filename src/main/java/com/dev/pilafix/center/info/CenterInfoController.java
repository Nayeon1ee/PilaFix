package com.dev.pilafix.center.info;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CenterInfoController {
	@Autowired
	private CenterInfoService service;

	@GetMapping("/getCenterInfoList.do")
	public String getCenterInfoList(HttpSession session, Model model) {
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");

		if(!loginCenter.isEmpty()) {
			int ctCode = (int)loginCenter.get("ctCode");
			model.addAttribute("infoList", service.getCenterInfoList(ctCode));
			return "center/center_info_board";
		}
		return "redirect:centerLogin.do";
	}

	@GetMapping("/getCenterInfo.do")
	public String getCenterInfo(@RequestParam("icNumber") Integer icNumber, Model model) {
		// 조회수 증가
		service.updateCenterInfoViewCnt(icNumber);
		model.addAttribute("centerInfo", service.getCenterInfo(icNumber));
		return "center/center_info_board_detail";
	}

	@GetMapping("/insertCenterInfo.do")
	public String insertCenterInfo() {
		return "center/center_info_board_register";
	}

	/**
	 * 공지사항 등록 & 알림 등록 
	 *  
	 * @param session
	 * @param vo
	 * @return
	 */
	@PostMapping("/insertCenterInfo.do")
	public String insert(HttpSession session, CenterInfoVO vo) {
		Map<String, Object> loginCenter = (Map<String, Object>) session.getAttribute("loginCenter");

		if(!loginCenter.isEmpty()) {
			int ctCode = (int) loginCenter.get("ctCode");
			vo.setWriterMemberCode(ctCode);
			//공지 등록 밑 알림 등록
			service.insertCenterInfoAndLoadNotices(vo);
			return "redirect:getCenterInfoList.do";
		}
		return "redirect:centerLogin.do";
	}

	@GetMapping("/updateCenterInfo.do")
	public String updateCenterInfo(@RequestParam("icNumber") Integer icNumber, Model model) {
		CenterInfoVO vo = service.getCenterInfo(icNumber);
		System.out.println("update 폼 호출 시 제목 "+vo.getTitle());
		model.addAttribute("centerInfo", service.getCenterInfo(icNumber));
		return "center/center_info_board_modify";
	}
	
	/**
	 * 공지사항 수정 
	 * 
	 * 비공개글에서 공개글로 수정된 경우 
	 * 알림 발송 필요 
	 * 
	 * @param vo
	 * @param originalOpenYn
	 * @return
	 */
	@PostMapping("/updateCenterInfo.do")
	public String update(CenterInfoVO vo, @RequestParam("originalOpenYn") boolean originalOpenYn) {
		System.out.println("CenterInfoController에서 동작 ==> "+originalOpenYn);
		
		if(!originalOpenYn && vo.isOpenYN()) {// 기존 상태가 비공개였다가 공개로 수정한 경우 알림 발송
			service.updateCenterInfoAndLoadNotices(vo);
		}else {
			service.updateCenterInfo(vo);
		}
		return "redirect:getCenterInfoList.do";
	}

	@GetMapping("/deleteCenterInfo.do")
	public String delete(int seq) {
		service.deleteCenterInfo(seq);
		return "redirect:getCenterInfoList.do";
	}
}