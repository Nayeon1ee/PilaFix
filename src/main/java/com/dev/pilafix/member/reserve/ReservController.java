package com.dev.pilafix.member.reserve;

import java.util.Collections;
import java.util.Date;
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

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.CenterVO;

@Controller
public class ReservController {
	
	@Autowired
	private ReservService service;
	
	/**
	 * 예약 메인 페이지 
	 * 
	 * 센터 정보 저장 
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("reservPage.do")
	public String reservPage(HttpSession session, Model model) {
		// 예약 메인 페이지 
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		
	    if (loginUser != null) {
	    	// 세션에서 회원번호 가져옴 
	    	int csMemberCode = (int) loginUser.get("csMemberCode");

	    	// 꺼내온 회원번호로 ct_code, ct_name이 담긴 list 조회 
	    	List<CenterVO> connCenterList = service.getConnCenterList(csMemberCode);
	    	model.addAttribute("connCenterList",connCenterList);
	    	System.out.println("컨트롤러에서 센터 조회 완료 ");
	    	
	    	//테스트 후 지우기 (jsp 페이지 호출될 때 나오므로)
	    	
	    	// 리스트에서 꺼내와서 첫 번째에 있는 센터 코드 꺼내서 그 센터가 가진 수업 내역 조회 
	    	int ctCode = connCenterList.get(0).getCtCode();
	    	System.out.println("첫 번째 코드"+ctCode);
	    	
			if (ctCode != 0) { // 첫 번째로 연동된 센터코드가 있다면
				// 서비스에 오늘 날짜를 전달하여 수업 내역 조회
				List<CenterLessonVO> lessonList = service.getLessonList(ctCode, new Date());
				
				//수업 목록이 비었다면 빈 목록 전달 
				if(!lessonList.isEmpty()) {
					model.addAttribute("lessonList", lessonList);
				}else {
				    model.addAttribute("lessonList", Collections.emptyList()); 
				}
			}
	    	
			return "member/reservation_ny";
	        
	    }else {
	    	return "redirect:memberLogin.do";
	    }
	}
	
	/**
	 * 센터 선택 시마다 요청되는 수업 조회 
	 * 
	 * @param ctCode
	 * @param model
	 * @return
	 */
	@PostMapping("/getLessonList.do")
	@ResponseBody
	public List<CenterLessonVO> getLessonList(int ctCode, Date selectedDate, String lessonType, Model model){ // 파라미터로 날짜 받아야 함 
		System.out.println("센터코드: " + ctCode);
		System.out.println("선택날짜: "+selectedDate);
		System.out.println("수업 유형 : "+lessonType);
		
		List<CenterLessonVO> lessonList = service.getLessonList(ctCode, selectedDate); //여기에 타입줘야 함
		
		//수업 목록이 비었다면 빈 목록 전달 
		if(lessonList.isEmpty()) {
		    lessonList=Collections.emptyList();
		}
		
		return lessonList;
	}
	
	
	/**
	 * 예약하기 버튼 클릭 시 상세 정보 조회 
	 * 
	 * 1. 클릭한 수업 정보 (param : lsCode)
	 * 2. 내가 가진 수강권 정보 (param: csMemberCode) 
	 * 3. 센터의 예약 이용정책 정보 (param: ctCode)
	 * 
	 * 
	 * @param lsCode
	 * @param ctCode
	 * @param session
	 * 
	 * @return 
	 */
	@GetMapping("/getMyTicketInfo.do")
	@ResponseBody
	public Map<String, Object> getMyTicketInfo(@RequestParam("lsCode")String lsCode, @RequestParam("ctCode") int ctCode, HttpSession session) {
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		Map<String, Object> detail = new HashMap<>();

		 if (loginUser != null) {
	    	int csMemberCode = (int) loginUser.get("csMemberCode");
	    	detail = service.getReservDetail(lsCode, csMemberCode, ctCode);
	    	System.out.println("Detail Map: " + detail.toString());

		}
		return detail;
		
	}
	
	/**
	 * 
	 * 
	 * @param session
	 * @param ctCode
	 * @param ticketCode
	 * @param lsCode
	 * @return
	 */
	@PostMapping("/makeReservation.do")
	public String makeReservation(int ctCode, String ticketCode,String lsCode,HttpSession session) {
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		
		int csMemberCode = (int) loginUser.get("csMemberCode");
		
		
		/* 모달에서 예약하기 누르면 
		 * 로그인한 멤버 코드, 선택한 수업 코드, 수강권 코드, 센터코드
		 * 
		 * 1. insert 예약 테이블에 쌓이고 
		 * 2. update 회원테이블에서 수강권 매수 -1
		 * 3. update 수업 테이블에 현재 신청 인원 + 1
		 * 4. insert 알림 테이블에 쌓기 
		 * 5. 문자 발송 로직 추가
		 * 6. 문자발송이력 쌓기 
		 */
		
		
		service.makeReservation(csMemberCode, ctCode, ticketCode, lsCode);
		
		
		
		return null;
	}
	
	
	
	
}
