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

	@GetMapping("/insertComplaintsInfo.do")
	public String insertComplaintsInfo(ComplaintsVO vo) {
		return "admin_complaints/insertComplaintsInfo.jsp";
	}

	@PostMapping("/insertComplaintsInfo.do")
	public String insert(ComplaintsVO vo) {
		service.insertComplaintsInfo(vo);
		return "redirect:getComplaintsInfoList.do";
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

	@GetMapping("/getComplaintsInfoList.do")
	public String getComplaintsInfoList(/* HttpSession session, */ Model model) {
		
//		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginAdmin");
//
//		if(!admin.isEmpty()) {
//			String adCode = (String)admin.get("adCode");
//			model.addAttribute("ComplaintsInfoList", service.getComplaintsInfoList());
//			return "admin/admin_baned_comment";
//		}
//		return "redirect:adminLogin.do";
		
		model.addAttribute("ComplaintsInfoList", service.getComplaintsInfoList());
		return "admin/admin_baned_comment";
	}

	@GetMapping("/getComplaintsInfo.do")
	public String getComplaintsInfo(@RequestParam("cpCode") int cpCode, int cpTargetPostNumber, Model model) {
		//System.err.println(cpTargetPostNumber);
		model.addAttribute("ComplaintsInfo", service.getComplaintsInfo(cpCode));
		model.addAttribute("complaintsInfoBlamerList", service.getAllComplaintsList(cpTargetPostNumber));
		return "admin/admin_baned_comment_detail";
	}
	
	@GetMapping("/revokeComplaints.do")
	public String revokeComplaints(int cpCode) {
		service.revokeComplaints(cpCode);
		return "redirect:getComplaintsInfo.do?cpCode="+cpCode;
	}
	
	
	@GetMapping("/getBlameReasons")
    public List<ComplaintsVO> getBlameReasons(@RequestParam("cmBlameCount") String cmBlameCount) {
        // cmBlameCount 값을 사용하여 해당하는 Blame Reasons를 가져오는 서비스 메서드 호출
        return service.getBlameReasonsByCount(cmBlameCount);
    }
	
	
//	@GetMapping("/getAllComplaints.do")
//    public String getAllComplaints(@RequestParam("cpCode") int cpCode,Model model) {
//        List<ComplaintsVO> complaintsInfo = service.getAllComplaints(cpCode);
//        model.addAttribute("complaintsInfoList", complaintsInfo);
//        return "admin_baned_comment"; // complaintsPage는 complaintsInfoList를 사용하여 데이터를 표시하는 JSP 페이지입니다.
//    }
}
