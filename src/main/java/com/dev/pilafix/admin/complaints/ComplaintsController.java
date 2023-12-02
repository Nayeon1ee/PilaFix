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


@Controller
public class ComplaintsController {

	@Autowired
	private ComplaintsService service;
	
	/**
	 * 신고글 목록 조회 
	 * @param model
	 * @return
	 */
	@GetMapping("/getComplaintsInfoList.do")
	public String getComplaintsInfoList( HttpSession session,  Model model) {
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginAdmin");

		if(!admin.isEmpty()) {
			model.addAttribute("ComplaintsInfoList", service.getComplaintsInfoList());
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
	@GetMapping("/getComplaintsInfo.do")
	public String getComplaintsInfo(@RequestParam("cpCode") int cpCode, int cpTargetPostNumber, Model model) {
		model.addAttribute("ComplaintsInfo", service.getComplaintsInfo(cpCode));
		model.addAttribute("complaintsInfoBlamerList", service.getAllComplaintsList(cpTargetPostNumber));
		return "admin/admin_baned_comment_detail";
	}
	
	/**
	 * 신고사유 목록 조회 
	 * 
	 * @param cmCode
	 * @return
	 */
	@GetMapping("/getBlameReasons")
    public List<ComplaintsVO> getBlameReasons(@RequestParam("cmCode") String cmCode) {
        return service.getBlameReasonsByCount(cmCode);
    }
	
	
	
	
	
	
	

	
	@GetMapping("/updateComplaintsInfo.do")
	public String updateComplaintsInfo(@RequestParam("cpCode") int cpCode, Model model) {
		model.addAttribute("list", service.getComplaintsInfo(cpCode));
		return "admin_complaints/updateComplaintsInfo.jsp";
	}

	@PostMapping("/updateComplaintsInfo.do")
	public String update(ComplaintsVO vo, Model model) {
		service.updateComplaintsInfo(vo);
		return "redirect:getComplaintsInfoList.do";
	}

	@GetMapping("/deleteComplaintsInfo.do")
	public String delete(int cp_code) {
		service.deleteComplaintsInfo(cp_code);
		return "redirect:getComplaintsInfoList.do";
	}


	@GetMapping("/revokeComplaints.do")
	public String revokeComplaints(int cpCode) {
		service.revokeComplaints(cpCode);
		return "redirect:getComplaintsInfo.do?cpCode="+cpCode;
	}
	

}
