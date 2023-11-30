package com.dev.pilafix.center.member_trainer_manage;



import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;



@Controller
public class MemberManageController {
	
	@Autowired
	private MemberManageService service;


	/* ======================== 회원관리 ======================== */ 
	/**
	 * 회원목록 조회
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManageList.do")
	public String getMemberManageList(HttpSession session, Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");

        if (center != null) {
            //세션에서 받아온 값 넣어야 함
        	int ctCode = (int)center.get("ctCode");
        	
        	model.addAttribute("request", service.getConnectRequestForMe(ctCode));
    		model.addAttribute("memberList", service.getMemberManageList(ctCode));
    		return "center/center_member_list";
        } else {
            // 값이 없으면 로그인 페이지로 이동 
            return "redirect:centerLogin.do"; 
        }

	}
	
	/**
     * 회원 상세 조회 
     * 회원 정보, 문의 내역, 예약 수업 내역, 결제 내역 조회 필요
     *  
	 * @param csMemberCode
	 * @param csRoleCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getMemberManage.do")

	public String getMemberManage(HttpSession session, int csMemberCode, Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		
		MemberVO member = service.getMember(csMemberCode);
		String tkCodeG = member.getTicketCodeGroup1();
		String tkCodeP= member.getTicketCodePersonal1();
		
		
		if(!center.isEmpty()) {
			//회원정보
			model.addAttribute("member", member);

			// 최근 문의 내역 저장
			model.addAttribute("QList", service.getQuestionForManage(csMemberCode));
			
			// 최근 예약 수업 내역 저장  
//			model.addAttribute("RList", service.getReserveForManage(csMemberCode));

			
			// 최근 결제 내역 저장 
			model.addAttribute("PList", service.getPaymentForManage(csMemberCode));
			
			// 수강권 정보 가져오기 
			// NullpointException 처리 값이 null이면 0으로 채워줌 
			if(tkCodeP == null) tkCodeP = "0";
			if(tkCodeG == null)	tkCodeG = "0";
			
			model.addAttribute("ticketInfo", service.getTicketInfo(tkCodeP, tkCodeG));
			
			return "center/center_member_detail";
		}
		return "redirect:centerLogin.do"; 

		
	}
	
	
	

	/* ======================== 강사관리 ======================== */ 
	/**
	 * 강사 목록 조회
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/getTrainerManageList.do")
	public String getTrainerManageList(HttpSession session, Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		
		if(!center.isEmpty()) {
			 //세션에서 받아온 값 넣어야 함
        	int ctCode = (int)center.get("ctCode");
        	
        	model.addAttribute("request", service.getConnectRequestForTr(ctCode));
    		model.addAttribute("memberList",service.getTrainerManageList(ctCode));
    		return "center/center_trainer_list";
		} else {
            return "redirect:centerLogin.do"; 
        }
		
	}
	
	
	
	
	/**
     * 강사 상세 조회 
     * 수업 진행 현황, 그룹 수업 내역, 개인 수업 내역, 전체 수업 내역 
	 * 
	 * @param csMemberCode
	 * @param csRoleCode
	 * @param model
	 * @return
	 */
	@GetMapping("/getTrainerManage.do")
	public String getTrainerManage(HttpSession session, int csMemberCode, Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		
		if(!center.isEmpty()) {
			//회원 정보 
			model.addAttribute("member", service.getMember(csMemberCode));
			//그룹 수업내용
			model.addAttribute("groupLesson", service.getGroupLesson(csMemberCode));
			//개인 수업내용
			model.addAttribute("personalLesson", service.getPersonalLesson(csMemberCode));
			// 강사의 전월 수업수 세옴
			model.addAttribute("lessonCount", service.getLessonCount(csMemberCode));
			//전체 수업내용
			model.addAttribute("allLesson", service.getAllLesson(csMemberCode));

			return "center/center_trainer_detail";
		}
		return "redirect:centerLogin.do"; 

	}
	
	

	/* ======================== 공통 ======================== */ 

	/**
	 * 회원/강사 연동 요청 수락
	 * 
     * 연동처리 STEP01 - TBL_CENTER_REQUEST 연동여부, 일자 업데이트
     * 연동처리 STEP02 - TBL_CENTER_CONN에 이력 등록
     * 연동처리 STEP03 - TBL_CST CONNECTED_CENTER_CODE 업데이트
     * 
	 * @param crCode
	 * @param memberCode
	 * @param centerCode
	 * 
	 */
//	@GetMapping("/acceptRequest.do")
//	public void acceptRequest(HttpSession session, @RequestParam("crCode") String crCode, @RequestParam("memberCode") int memberCode) {
//		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
//		
//		if(!center.isEmpty()) {
//			int ctCode = (int) center.get("ctCode");
//			service.acceptRequest(crCode, memberCode, ctCode);
//		}	
//	}
	@GetMapping("/acceptRequest.do")
	@ResponseBody
	public ResponseEntity<String> acceptRequest(HttpSession session, @RequestParam("crCode") String crCode, @RequestParam("memberCode") int memberCode) {
	    Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");

	    if (!center.isEmpty()) {
	        int ctCode = (int) center.get("ctCode");
	        boolean success = service.acceptRequest(crCode, memberCode, ctCode);

	        if (success) {
	            return ResponseEntity.ok("Acceptance successful");
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Acceptance failed");
	        }
	    } else {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Not logged in with a center");
	    }
	}

	
	
	/**
	 * 회원/강사 연동 요청 거절
	 * 
	 * TBL_CENTER_REQUEST 거절 일시 업데이트 
	 * 
	 * @param crCode
	 * @return
	 */
	@GetMapping("/rejectRequest.do")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> rejectRequest(@RequestParam("crCode") String crCode) {
	    Map<String, Object> response = new HashMap<>();
	    
	    int memberCode = service.rejectRequest(crCode);
	    
	    response.put("memberCode", memberCode); //body에 멤버코드로 등록 
	    System.out.println("컨트롤러에서 찍은 거절 요청 시 멤버 코드 " + memberCode);
	    
	    return ResponseEntity.ok(response);
	}

	/**
	 * 회원 목록 엑셀 출력
	 * @param session
	 * @param response
	 * @param member
	 * @throws IOException
	 */
	@RequestMapping("/centerMemberExcelDown.do")
	public void centerMemberExcelDown(HttpSession session, HttpServletResponse response, @ModelAttribute("member")MemberVO member) throws IOException{
		XSSFWorkbook wb = new XSSFWorkbook();
	    XSSFSheet sheet = wb.createSheet("회원 관리 목록");
		
        /**
         * header font style
         */
        XSSFFont headerXSSFFont = (XSSFFont) wb.createFont();
        headerXSSFFont.setColor(new XSSFColor(new byte[]{(byte) 0, (byte) 0, (byte) 0}));
        headerXSSFFont.setBold(true);

        /**
         * header cell style
         */
        XSSFCellStyle headerXssfCellStyle = (XSSFCellStyle) wb.createCellStyle();

        // 테두리 설정
        headerXssfCellStyle.setBorderLeft(BorderStyle.MEDIUM);
        headerXssfCellStyle.setBorderRight(BorderStyle.MEDIUM);
        headerXssfCellStyle.setBorderTop(BorderStyle.MEDIUM);
        headerXssfCellStyle.setBorderBottom(BorderStyle.MEDIUM);

        // 배경 설정
        headerXssfCellStyle.setFillForegroundColor(new XSSFColor(new byte[]{(byte) 226, (byte) 239, (byte) 218}));
        headerXssfCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        headerXssfCellStyle.setFont(headerXSSFFont);

        /**
         * body cell style
         */
        XSSFCellStyle bodyXssfCellStyle = (XSSFCellStyle) wb.createCellStyle();

        // 테두리 설정
        bodyXssfCellStyle.setBorderLeft(BorderStyle.MEDIUM);
        bodyXssfCellStyle.setBorderRight(BorderStyle.MEDIUM);
        bodyXssfCellStyle.setBorderTop(BorderStyle.MEDIUM);
        bodyXssfCellStyle.setBorderBottom(BorderStyle.MEDIUM);
        
        Map<String, Object> centerMember = (Map<String, Object>) session.getAttribute("loginCenter");
        
        int ctCode = (int)centerMember.get("ctCode");
        
		
		List<MemberVO> centerMemberList = service.getMemberExcelManageList(ctCode);
		System.out.println("테스트중" + centerMemberList);
		
		 // 헤더 행 생성
	    int cellCount = 0;
	    XSSFRow headerRow = sheet.createRow(0);
	    String[] headers = {"회원코드", "이메일아이디", "회원이름", "회원전화번호", "가입일자", "생년월일", "성별"};
	    for (String header : headers) {
	        XSSFCell cell = headerRow.createCell(cellCount++);
	        cell.setCellValue(header);
	        cell.setCellStyle(headerXssfCellStyle);
	    }
	    
	    // 데이터 행 채우기
	    for (int i = 0; i < centerMemberList.size(); i++) {
	        // 새로운 행 생성
	        XSSFRow dataRow = sheet.createRow(i + 1);
	        cellCount = 0;

	        // 행의 각 셀에 데이터 설정
	        MemberVO currentMember = centerMemberList.get(i);
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsMemberCode());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsEmailId());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsName());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsPhoneNumber1() + "-" + currentMember.getCsPhoneNumber2() + "-" + currentMember.getCsPhoneNumber3());
	        
	        Cell csRegistrationDateCell = dataRow.createCell(cellCount++);
	        if (currentMember.getCsRegistrationDate() != null) {
	        	Date csRegistrationDate = currentMember.getCsRegistrationDate();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedStartDate = dateFormat.format(csRegistrationDate); // 날짜를 원하는 형식으로 변환
	        	csRegistrationDateCell.setCellValue(formattedStartDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        Cell csBirthCell = dataRow.createCell(cellCount++);
	        if (currentMember.getCsBirth() != null) {
	        	Date csBirthDate = currentMember.getCsBirth();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedEndDate = dateFormat.format(csBirthDate); // 날짜를 원하는 형식으로 변환
	        	csBirthCell.setCellValue(formattedEndDate); // 날짜 문자열을 셀에 입력
	        }

	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsGenderMw());
	           
	        for (int j = 0; j < cellCount; j++) {
	            // 각 셀에 bodyXssfCellStyle 적용
	            dataRow.getCell(j).setCellStyle(bodyXssfCellStyle);
	        }
	        
	    }
	    
	    for (int i = 0; i < headers.length; i++) {
	        sheet.autoSizeColumn(i); // 각 열의 셀 너비를 콘텐츠에 맞게 자동으로 조정
	    }
		
	    String ctName = (String) centerMember.get("ctName");
	    
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		String fileName = ctName + "_회원관리.xlsx";
		String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
		response.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	
	/**
	 * 강사 목록 엑셀 출력
	 * @param session
	 * @param response
	 * @param member
	 * @throws IOException
	 */
	@RequestMapping("/centerTrainerExcelDown.do")
	public void centerTrainerExcelDown(HttpSession session, HttpServletResponse response, @ModelAttribute("member")MemberVO member) throws IOException{
		XSSFWorkbook wb = new XSSFWorkbook();
	    XSSFSheet sheet = wb.createSheet("강사 관리 목록");
		
        /**
         * header font style
         */
        XSSFFont headerXSSFFont = (XSSFFont) wb.createFont();
        headerXSSFFont.setColor(new XSSFColor(new byte[]{(byte) 0, (byte) 0, (byte) 0}));
        headerXSSFFont.setBold(true);

        /**
         * header cell style
         */
        XSSFCellStyle headerXssfCellStyle = (XSSFCellStyle) wb.createCellStyle();

        // 테두리 설정
        headerXssfCellStyle.setBorderLeft(BorderStyle.MEDIUM);
        headerXssfCellStyle.setBorderRight(BorderStyle.MEDIUM);
        headerXssfCellStyle.setBorderTop(BorderStyle.MEDIUM);
        headerXssfCellStyle.setBorderBottom(BorderStyle.MEDIUM);

        // 배경 설정
        headerXssfCellStyle.setFillForegroundColor(new XSSFColor(new byte[]{(byte) 226, (byte) 239, (byte) 218}));
        headerXssfCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        headerXssfCellStyle.setFont(headerXSSFFont);

        /**
         * body cell style
         */
        XSSFCellStyle bodyXssfCellStyle = (XSSFCellStyle) wb.createCellStyle();

        // 테두리 설정
        bodyXssfCellStyle.setBorderLeft(BorderStyle.MEDIUM);
        bodyXssfCellStyle.setBorderRight(BorderStyle.MEDIUM);
        bodyXssfCellStyle.setBorderTop(BorderStyle.MEDIUM);
        bodyXssfCellStyle.setBorderBottom(BorderStyle.MEDIUM);
        
        Map<String, Object> centerTrainer = (Map<String, Object>) session.getAttribute("loginCenter");
        
        int ctCode = (int)centerTrainer.get("ctCode");
        
		
		List<MemberVO> centerTrainerList = service.getTrainerExcelManageList(ctCode);
		System.out.println("테스트중" + centerTrainerList);
		
		 // 헤더 행 생성
	    int cellCount = 0;
	    XSSFRow headerRow = sheet.createRow(0);
	    String[] headers = {"강사코드", "이메일아이디", "강사이름", "강사전화번호", "가입일자", "생년월일", "성별"};
	    for (String header : headers) {
	        XSSFCell cell = headerRow.createCell(cellCount++);
	        cell.setCellValue(header);
	        cell.setCellStyle(headerXssfCellStyle);
	    }
	    
	    // 데이터 행 채우기
	    for (int i = 0; i < centerTrainerList.size(); i++) {
	        // 새로운 행 생성
	        XSSFRow dataRow = sheet.createRow(i + 1);
	        cellCount = 0;

	        // 행의 각 셀에 데이터 설정
	        MemberVO currentTRainer = centerTrainerList.get(i);
	        dataRow.createCell(cellCount++).setCellValue(currentTRainer.getCsMemberCode());
	        dataRow.createCell(cellCount++).setCellValue(currentTRainer.getCsEmailId());
	        dataRow.createCell(cellCount++).setCellValue(currentTRainer.getCsName());
	        dataRow.createCell(cellCount++).setCellValue(currentTRainer.getCsPhoneNumber1() + "-" + currentTRainer.getCsPhoneNumber2() + "-" + currentTRainer.getCsPhoneNumber3());
	        
	        Cell csRegistrationDateCell = dataRow.createCell(cellCount++);
	        if (currentTRainer.getCsRegistrationDate() != null) {
	        	Date csRegistrationDate = currentTRainer.getCsRegistrationDate();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedStartDate = dateFormat.format(csRegistrationDate); // 날짜를 원하는 형식으로 변환
	        	csRegistrationDateCell.setCellValue(formattedStartDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        Cell csBirthCell = dataRow.createCell(cellCount++);
	        if (currentTRainer.getCsBirth() != null) {
	        	Date csBirthDate = currentTRainer.getCsBirth();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedEndDate = dateFormat.format(csBirthDate); // 날짜를 원하는 형식으로 변환
	        	csBirthCell.setCellValue(formattedEndDate); // 날짜 문자열을 셀에 입력
	        }

	        dataRow.createCell(cellCount++).setCellValue(currentTRainer.getCsGenderMw());
	           
	        for (int j = 0; j < cellCount; j++) {
	            // 각 셀에 bodyXssfCellStyle 적용
	            dataRow.getCell(j).setCellStyle(bodyXssfCellStyle);
	        }
	        
	    }
	    
	    for (int i = 0; i < headers.length; i++) {
	        sheet.autoSizeColumn(i); // 각 열의 셀 너비를 콘텐츠에 맞게 자동으로 조정
	    }
		
	    String ctName = (String) centerTrainer.get("ctName");
	    
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		String fileName = ctName + "_강사관리.xlsx";
		String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
		response.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}

}
