package com.dev.pilafix.admin.complaints;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ComplaintsController {

	@Autowired
	private ComplaintsService service;
	
	/**
	 * 신고글 목록 조회 
	 * @param model
	 * @return
	 */
	@GetMapping("/getTargetComplaintsList.do")
	public String getTargetComplaintsList( HttpSession session,  Model model) {
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!admin.isEmpty()) {
			model.addAttribute("targetComplaintsList", service.getTargetComplaintsList());
			return "admin/admin_baned_comment";
		}
		return "redirect:adminLogin.do";
		
		
	}

	/**
	 * 신고 상세 조회 
	 * 
	 * @param cpCode
	 * @param cpTargetPostNumber
	 * @param model
	 * @return
	 */
	@GetMapping("/getComplaintsDetail.do")
	public String getComplaintsDetail(@RequestParam("cmNumber") int cmNumber,Model model) {
		// 신고글 상세 
		model.addAttribute("originBoard", service.getComplaintsDetail(cmNumber)); 
		
		// 해당 신고글에 대한 신고내역
		model.addAttribute("complaintList", service.getComplaintsList(cmNumber));
		
		return "admin/admin_baned_comment_detail";
	}
	
	/**
	 * 신고사유 툴팁 
	 * 
	 * @param cmCode
	 * @return
	 */
	@GetMapping("/blameReasonList.do")
	@ResponseBody
    public Map<String, Object> blameReasonList(@RequestParam("cmNumber") int cmNumber) {
		Map<String, Object> responseData = new HashMap<>();
		responseData.put("reasons", service.getComplaintsList(cmNumber));
		return responseData;
    }

	
	/**
	 * 신고글 처리 
	 * 커뮤니티 글 비공개처리 
	 * @param cpCode
	 * @return
	 */
	@GetMapping("/updateComplaintsStatus.do")
	public String updateComplaintsStatus(int cmNumber) {
		service.updateComplaintsStatus(cmNumber);
		return "redirect:getComplaintsDetail.do?cmNumber="+cmNumber;
	}
	

}
