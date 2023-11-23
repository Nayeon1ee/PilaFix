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
import com.siot.IamportRestClient.IamportClient;

@Controller
public class MemberTicketController {
	
	@Autowired
	private MemberTicketService service;
	
	private IamportClient api;
	
	//결제 api테스트위한 요청 나중에 지울거임
	@GetMapping("/buy.do")
	public String buy() {
		return "member/Purchase";
	}
	
	@PostMapping("/payments.do")
	public void payments(String imp_uid) {
//		imp_uid = extract_POST_value_from_url('imp_uid') //post ajax request로부터 imp_uid확인
//
//				payment_result = rest_api_to_find_payment(imp_uid) //imp_uid로 아임포트로부터 결제정보 조회
//				amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid) //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리
//
//				IF payment_result.status == 'paid' AND payment_result.amount == amount_to_be_paid
//					success_post_process(payment_result) //결제까지 성공적으로 완료
//				ELSE IF payment_result.status == 'ready' AND payment.pay_method == 'vbank'
//					vbank_number_assigned(payment_result) //가상계좌 발급성공
//				ELSE
//					fail_post_process(payment_result) //결제실패 처리
		System.out.println("컨트롤러 도달");
	}
	
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
