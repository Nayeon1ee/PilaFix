package com.dev.pilafix.member.ticket;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.center.ticket.CenterTicketVO;
import com.siot.IamportRestClient.IamportClient;

@Controller
@PropertySource("classpath:config/application.properties")
public class MemberTicketController {
	
	@Autowired
	private MemberTicketService service;
	
	private IamportClient iamportClient;
	
	// 프로퍼티에 설정한 api key정보 가져옴
	@Value("${imp.api.key}")
    private String apiKey;
 
    @Value("${imp.api.secret}")
    private String secretKey;
    
    public MemberTicketController() {
        this.iamportClient = new IamportClient(apiKey, secretKey);
    }
	
	//결제 api테스트위한 요청 나중에 지울거임
	@GetMapping("/buy.do")
	public String buy() {
		return "member/ticket";
	}
	
	//결제 api테스트위한 요청 나중에 지울거임
		@GetMapping("/buyy.do")
		public String buyy() {
			return "member/ticketPurchase";
		}
	
	@PostMapping("/groupTicketCheck.do")
	@ResponseBody
	public String groupTicketCheck(int csCode) {
		return service.groupTicketCheck(csCode);
	}
	
	@PostMapping("/personalTicketCheck.do")
	@ResponseBody
	public String personalTicketCheck(int csCode) {
		return service.personalTicketCheck(csCode);
	}
		
		
	@PostMapping("/payments.do")
	@ResponseBody
	public int payments(MemberTicketVO vo) throws ParseException {
		// Unix timestamp로 들어온 결제 일시를 java.sql.Timestamp로 변환
        long date = vo.getPaymentDateTime()*1000L;
     // Unix 타임스탬프를 Date 객체로 변환하기
        Date parseDate = new Date(date);
     // SimpleDateFormat을 사용하여 날짜와 시간 형식 지정하기
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = formatter.format(parseDate);
        vo.setPaDateTime(formattedDate);
            System.out.println("변환된 시간: " + formattedDate);
            System.out.println("컨트롤러 도달 /결제 고유번호 : "+vo.getPaId());
        
        
        boolean success = service.insertPaymentAndUpdateMemberTicketInfo(vo);  
        if (success) {
        	System.out.println("트랜잭션 성공하고 컨트롤러까지 옴 => 맞음");
            return 0;
        } else {
        	System.out.println("이거 찍히면 DAO에서 오류나고 컨트롤러까지 옴");
            return 1;
        }
		// 둘중 하나라도 수행 못하면 
//		if (insertResult+updateResult < 2) {
//			
//		}else {
//			
//		}
		
		//return "success";
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
			
			return "member/Purchase";
		}
		return "member/login"; //로그인 페이지로 이동
	
	}
	
	//수강권 상세조회
//	@PostMapping("/getCenterTicketInfo.do")
//	@ResponseBody
//	public List<CenterTicketVO> getCenterTicketInfo(int ctCode,Model model){
//		System.out.println("컨트롤러로 넘어온 센터코드: " + ctCode);
//		List<CenterTicketVO> centerTicketInfo = service.getCenterTicketInfo(ctCode);
//		return centerTicketInfo;
//	}
	//수강권 상세조회 - 전체
	@PostMapping("/getCenterTicketInfo.do")
	@ResponseBody
	public List<CenterTicketVO> getCenterTicketInfo(int ctCode,String type,Model model){
		System.out.println("컨트롤러로 넘어온 센터코드: " + ctCode);
		System.out.println("컨트롤러로 넘어온 타입: " + type);
		List<CenterTicketVO> centerTicketInfo = service.getCenterTicketInfo(ctCode,type);
		return centerTicketInfo;
	}

	
	// 수강권누르면 수강권상세정보랑 이용정책 뿌려줌
	@GetMapping("/getTicketDetail.do")
	@ResponseBody
	public Map<String, Object> getTicketDetail (int centerCode,String tkCode,HttpSession session) {
		System.out.println("컨트롤러로 넘어온 센터코드 확인 : "+centerCode);
		System.out.println("컨트롤러로 넘어온 티켓코드 확인 : "+tkCode);
		
		Map<String, Object> ticket = new HashMap<>();
		ticket.put("ticketDetail", service.getTicketDetail(tkCode));
		ticket.put("ticketGuide", service.getCenterTicketGuide(centerCode));
		//수강권 결제시 로그인 회원의 이름,연락처,이메일 필요해서 넣음
		ticket.put("member", session.getAttribute("loginUser"));
		return ticket;
	}
	
	//구매취소 (시스템 오류)
	@PostMapping("/cancel.do")
	@ResponseBody
	public int cancel(String imp_uid ) throws IOException {
		System.out.println("프로퍼티스에 있는 인증키 출력 : "+apiKey+"/"+secretKey);
		String token = service.getToken(apiKey, secretKey);
		service.refundRequest(token,imp_uid);
        return 0;
	}
	
	// 사용자 요구 구매취소 
		@PostMapping("/memberCancel.do")
		@ResponseBody
		public int memberCancel(String imp_uid,String tkLessonType,int tkUsageCount,HttpSession session) throws IOException {
			System.out.println("컨트롤러로 넘어온 수강권 타입:"+tkLessonType);
			System.out.println("컨트롤러로 넘어온 수강권 횟수:"+tkUsageCount);
			Map<String,Object> user = (Map<String, Object>) session.getAttribute("loginUser");
			int csMemberCode = (int) user.get("csMemberCode");
			
			// 마이페이지에서 결제 취소 버튼 클릭시 수강권을 사용했는지 안했는지 먼저 검사
			int memberTicketUsageCount = service.checkTicketUsage(tkLessonType,csMemberCode);
			
			//수강권 사용안했으면 결제취소 진행,사용했으면 취소 못하게 함
			if(tkUsageCount == memberTicketUsageCount) {
				String token = service.getToken(apiKey, secretKey);
				int updateResult = service.refundMemberRequest(token,imp_uid,csMemberCode,tkLessonType);
				if (updateResult == 0) {
					return 0;
				}else {
					return 100;
				}
				
			}else {
				
				return 1;
			}
		}
		
	// 마이페이지에서 결제 취소 버튼 클릭시 수강권을 사용했는지 안했는지 먼저 검사
//		@PostMapping("checkTicketUsage.do")
//		@ResponseBody
//		public int checkTicketUsage(String tkLessonType,int tkUsageCount,HttpSession session) {
//			System.out.println("컨트롤러로 넘어온 수강권 타입:"+tkLessonType);
//			System.out.println("컨트롤러로 넘어온 수강권 횟수:"+tkUsageCount);
//			Map<String,Object> user = (Map<String, Object>) session.getAttribute("loginUser");
//			int csMemberCode = (int) user.get("csMemberCode");
//			int memberTicketUsageCount = service.checkTicketUsage(tkLessonType,csMemberCode);
//			if(tkUsageCount == memberTicketUsageCount) {
//				return 0;
//			}else {
//				return 1;
//			}
//			
//		}

}
