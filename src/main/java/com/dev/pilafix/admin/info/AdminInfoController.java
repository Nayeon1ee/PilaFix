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

	/**
	 * 공지사항 목록 조회 
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
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

	/**
	 * 상세 공지사항 조회 
	 * (클릭 시 조회수 증가)
	 * 
	 * @param iwNumber
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 공지사항 등록 및 알림 등록 
	 * 
	 * @param session
	 * @param vo
	 * @return
	 */
	@PostMapping("/insertAdminInfo.do")
	public String insert(HttpSession session, AdminInfoVO vo) {
		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!loginAdmin.isEmpty()) {
			String adCode = (String)loginAdmin.get("adCode");
			vo.setWriterMemberCode(adCode);
			if(vo.isOpenYN()) {
				service.insertAdminInfoAndLoadNotices(vo); // 공지 등록 및 알림 등록
			}else {
				service.insertAdminInfo(vo);// 비공개로 등록 시 알림 등록 x
			}
			return "redirect:getAdminInfoList.do";
		}
		return "redirect:centerLogin.do";
	}

	@GetMapping("/updateAdminInfo.do")
	public String updateAdminInfo(@RequestParam("iwNumber") Integer iwNumber, Model model) {
		model.addAttribute("adminInfo", service.getInfo(iwNumber));
		return "admin/admin_info_board_modify";
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
	@PostMapping("/updateAdminInfo.do")
	public String update(HttpSession session, AdminInfoVO vo, @RequestParam("originalOpenYn") boolean originalOpenYn) {
		Map<String, Object> loginAdmin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!loginAdmin.isEmpty()) {
			String adCode = (String)loginAdmin.get("adCode");
			vo.setWriterMemberCode(adCode);
			if(!originalOpenYn && vo.isOpenYN()) {// 기존 상태가 비공개였다가 공개로 수정한 경우 알림 발송
				service.updateAdminInfoAndLoadNotices(vo);
			}else {
				service.updateAdminInfo(vo);
			}
			return "redirect:getAdminInfoList.do";
		}
		return "redirect:centerLogin.do";
	}
	

	@GetMapping("/deleteAdminInfo.do")
	public String delete(int iwNumber) {
		service.deleteAdminInfo(iwNumber);
		return "redirect:getAdminInfoList.do";
	}
}