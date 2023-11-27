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
import com.dev.pilafix.common.member.MemberVO;


@Controller
public class ReservController {

	@Autowired
	private ReservService service;
	
	@Autowired
	private SMSService smsService;


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
			model.addAttribute("connCenterList", connCenterList);
			System.out.println("컨트롤러에서 센터 조회 완료 ");

			// 리스트에서 꺼내와서 첫 번째에 있는 센터 코드 꺼내서 그 센터가 가진 수업 내역 조회
			int ctCode = connCenterList.get(0).getCtCode();
			System.out.println("첫 번째 코드" + ctCode);

			if (ctCode != 0) { // 첫 번째로 연동된 센터코드가 있다면
				// 처음 예약 화면 호출 시 내가 가진 수강권의 정보에 따라 화면에 보여져야 하므로 
				MemberVO vo = service.getMyTicketInfo(csMemberCode);
				List<CenterLessonVO> lessonList = null;
				int selectedTab = 0;
				
				if(vo.getTicketCodeGroup1() == null && vo.getTicketCodePersonal1() != null) { //개인 수강권만 있는 경우 
					selectedTab = 1;
					lessonList = service.getLessonList(ctCode, new Date(), "개인");
				}else {
					lessonList = service.getLessonList(ctCode, new Date(), "그룹");
				}
				System.out.println(selectedTab);
				
				// 수업 목록이 비었다면 빈 목록 전달
				if (!lessonList.isEmpty()) {
					model.addAttribute("lessonList", lessonList);
				} else {
					model.addAttribute("lessonList", Collections.emptyList());
				}
				
			    // selectedTab 초기화 - 개인 수강권만 있다면 1
	            model.addAttribute("selectedTab", selectedTab);
	            
			}

			return "member/reservation_ny";

		} else {
			return "redirect:memberLogin.do";
		}
	}

	/**
	 * 센터 선택 시, 날짜 선택 시, 그룹/개인 선택 시 마다 요청되는 수업 조회
	 * 
	 * @param ctCode
	 * @param model
	 * @return
	 */
	@PostMapping("/getLessonList.do")
	@ResponseBody
	public List<CenterLessonVO> getLessonList(int ctCode, Date selectedDate, String lessonType, Model model) { 
		System.out.println("센터코드: " + ctCode);
		System.out.println("선택날짜: " + selectedDate);
		System.out.println("수업 유형 : " + lessonType);

		List<CenterLessonVO> lessonList = service.getLessonList(ctCode, selectedDate,lessonType); 

		// 수업 목록이 비었다면 빈 목록 전달
		if (lessonList.isEmpty()) {
			lessonList = Collections.emptyList();
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
	public Map<String, Object> getMyTicketInfo(@RequestParam("lsCode") String lsCode,
		@RequestParam("ctCode") int ctCode, HttpSession session) {
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
	 * 예약하기 버튼 클릭 시 예약
	 * 
	 * STEP01. 예약테이블 등록 
	 * STEP02. 회원테이블 수강권매수 -1 
	 * STEP03. 수업테이블 현재신청인원 +1 
	 * STEP04. 알림테이블 적재 
	 * STEP05. 문자발송 
	 * STEP05-1. 문자발송 이력 등록
	 * 
	 * 
	 * @param session
	 * @param ctCode
	 * @param ticketCode
	 * @param lsCode
	 * @return
	 */
	@PostMapping("/makeReservation.do")
	@ResponseBody
	public Map<String, Object> makeReservation(int ctCode, String ticketCode, String lsCode, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		
		if(loginUser != null) {
			int csMemberCode = (int) loginUser.get("csMemberCode");
			
			try {
				String rsCode = service.makeReservation(csMemberCode, ctCode, ticketCode, lsCode); //예약 정보 반환
				response.put("success", true);
				response.put("rsCode", rsCode); // 성공 시 예약정보 반환 
			} catch (Exception e) {
				response.put("success", false); //실패
			}
			
		}
		return response;
	}
	
	/**
	 * 문자발송 
	 * 파라미터로 받은 수업코드로 정보 가져와서 문자 내용에 추가
	 * 
	 * @param lsCode
	 * @param session
	 * @return
	 */
	@PostMapping("/sendSms.do")
	@ResponseBody
	public Map<String, Object> sendSms(String lsCode, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		
		System.out.println("sendSMS.do 호출됨");

		// 예약된 수업 정보 조회 
		CenterLessonVO reservLesson = service.getLessonDetail(lsCode);
		
		smsService.sendReservationConfirmation(lsCode, session);

		return response;
	}
	
	/**
	 * 예약 취소 페이지 
	 * 
	 * 취소 호출 시 예약번호 가져와야 함 잊지말고 파라미터로 예약번호 받기!
	 * STEP1. 예약 번호로 예약 정보 조회
	 * STEP2. 예약정보-수업코드로 수업테이블 조회
	 * STEP3. memberCode로 수강권 조회 
	 * STEP4. 위에서 받은 수업vo의 lsType이 그룹이면 map에 ~ticketCodeGroup만 저장 / 개인이면 ~ticketCodePersonal만 저장 
	 * STEP5. 위에서 받은 center_code로 이용정책 조회 
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/cancelPage.do")
	public String cancelPage(String rsCode, HttpSession session, Model model) {
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		Map<String, Object> cancelInfo =  new HashMap<>();
		
		if (loginUser != null) {
			cancelInfo = service.getReservationInfoAndTicketInfo(rsCode);
			model.addAttribute("cancelInfo",cancelInfo);
		}
		return "member/reservation_cancel";
	}
	
	/**
	 * 예약 취소 진행 
	 * 
	 * @param rsCode
	 * @param lsCode
	 * @param centerCode
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("/cancelReservation.do")
	@ResponseBody
	public Map<String, Object> cancelReservation(String rsCode,String lsCode, int centerCode, HttpSession session, Model model) {
		Map<String, Object> response = new HashMap<>();
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		
		if(loginUser != null) {
			System.out.println("컨트롤러 - cancelReservation 호출됨 ");
			int csMemberCode = (int) loginUser.get("csMemberCode");

			try {
				service.cancelReservation(csMemberCode, rsCode, lsCode, centerCode); 
				response.put("success", true);
			} catch (Exception e) {
				response.put("success", false); //실패
			}
			
		}
		return response;
		
	}

}
