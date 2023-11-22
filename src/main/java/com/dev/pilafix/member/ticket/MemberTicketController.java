package com.dev.pilafix.member.ticket;

import java.util.HashMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.center.ticket.CenterTicketVO;

@Controller
public class MemberTicketController {
	
	@Autowired
	private MemberTicketService service;
	
	/**
	 * 수강권 구매시 해당회원의 연동된 센터 코드로 센터 이름 가져와 화면의 셀렉트박스에 넣어줌
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/ticketPage.do")
	public String ticket(HttpSession session,Model model) {
		Map<String,Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		
		if(user!=null){
			//세션에서 가져온 값으로 서비스 호출
			int csMemberCode = (int) user.get("csMemberCode");
			model.addAttribute("connCenterList", service.getConnCenterList(csMemberCode));
			
			return "member/ticketPurchase";
		}
		return "member/login"; //로그인 페이지로 이동
	
	}
	
	@PostMapping("/getCenterTicketInfo.do")
	@ResponseBody
	public List<CenterTicketVO> getCenterTicketInfo(int ctCode,Model model){
		System.out.println("컨트롤러로 넘어온 센터코드: " + ctCode);
		List<CenterTicketVO> centerTicketInfo = service.getCenterTicketInfo(ctCode);
		return centerTicketInfo;
	}
	
	@GetMapping("/getTicketDetail.do")
	@ResponseBody
	public Map<String, Object> getTicketDetail (int centerCode,String tkCode) {
		System.out.println("컨트롤러로 넘어온 센터코드 확인 : "+centerCode);
		System.out.println("컨트롤러로 넘어온 티켓코드 확인 : "+tkCode);
		Map<String, Object> ticket = new HashMap<>();
		ticket.put("ticketDetail", service.getTicketDetail(tkCode));
		ticket.put("ticketGuide", service.getCenterTicketGuide(centerCode));
//		service.getTicketDetail(tkCode);
//		service.getCenterTicketGuide(centerCode);
		return ticket;
	}

}
