package com.dev.pilafix.admin.member_trainer_manage;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev.pilafix.common.member.MemberVO;

@Controller
public class MemberTrainerManageController {
	
	@Autowired
	private MemberTrainerManageSerice service;
	
	@GetMapping("/getMemberList.do")
	public String getMemberList(Model model) {
		model.addAttribute("memberList", service.getMemberList());
		return "admin/admin_membership";
	}
	
	
	@GetMapping("/getTrainerList.do")
	public String getTrainerList(Model model) {
		model.addAttribute("memberList", service.getTrainerList());
		return "admin/admin_trainer";
	}
	
	
	
	@GetMapping("/getMember.do")
	public String getMemberAndPaymentListAndConnectCenterList(int csMemberCode, Model model) {
		
		MemberVO member = service.getMember(csMemberCode);
		
		//강사는  paymentList 조회 X
		if(member.getCsRoleCode().equals("TR")) {
			model.addAttribute("type", "T"); // view에서 해당 타입에 따라 분기 
			model.addAttribute("paymentList", service.getPaymentList(csMemberCode));
		}
		
		model.addAttribute("member", member);
		model.addAttribute("centerConnectList", service.getCenterConnectHistory(csMemberCode));
		return "admin/admin_membership_detail";
	}
	
	/**
	 * 맴버 엑셀 다운로드
	 * @param response
	 * @param member
	 * @throws IOException
	 */
	@RequestMapping("/memberExcelDown.do")
	public void excelMemberDownload(HttpServletResponse response, @ModelAttribute("member")MemberVO member) throws IOException{
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
        
		
		List<MemberVO> memberList = service.getExcelMemberList();
		System.out.println("테스트중" + memberList);
		
		 // 헤더 행 생성
	    int cellCount = 0;
	    XSSFRow headerRow = sheet.createRow(0);
	    String[] headers = {"회원코드", "이메일아이디", "회원이름", "연락처", "가입일자", "생년월일", "성별", "탈퇴여부", "가입유형", "연동센터명1", "연동센터명2", "연동센터명3"};
	    for (String header : headers) {
	        XSSFCell cell = headerRow.createCell(cellCount++);
	        cell.setCellValue(header);
	        cell.setCellStyle(headerXssfCellStyle);
	    }
	    
	    // 데이터 행 채우기
	    for (int i = 0; i < memberList.size(); i++) {
	        // 새로운 행 생성
	        XSSFRow dataRow = sheet.createRow(i + 1);
	        cellCount = 0;

	        // 행의 각 셀에 데이터 설정
	        MemberVO currentMember = memberList.get(i);
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsMemberCode());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsEmailId());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsName());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsPhoneNumber1() + "-" + currentMember.getCsPhoneNumber2() + "-" + currentMember.getCsPhoneNumber3());
	        
	        Cell regDateCell = dataRow.createCell(cellCount++);
	        if (currentMember.getCsRegistrationDate() != null) {
	        	Date regDate = currentMember.getCsRegistrationDate();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedStartDate = dateFormat.format(regDate); // 날짜를 원하는 형식으로 변환
	        	regDateCell.setCellValue(formattedStartDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        Cell birthDateCell = dataRow.createCell(cellCount++);
	        if (currentMember.getCsBirth() != null) {
	        	Date endDate = currentMember.getCsBirth();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedEndDate = dateFormat.format(endDate); // 날짜를 원하는 형식으로 변환
	        	birthDateCell.setCellValue(formattedEndDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsGenderMw());
	        
	        // 탈퇴 여부 설정
	        String csDelete = currentMember.isCsDeleteYn() ? "Y" : "N";
	        dataRow.createCell(cellCount++).setCellValue(csDelete);
	        
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getCsRegistrationType());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getConnectedCenterName1());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getConnectedCenterName2());
	        dataRow.createCell(cellCount++).setCellValue(currentMember.getConnectedCenterName3());
	        
	        for (int j = 0; j < cellCount; j++) {
	            // 각 셀에 bodyXssfCellStyle 적용
	            dataRow.getCell(j).setCellStyle(bodyXssfCellStyle);
	        }
	        
	    }
	    
	    for (int i = 0; i < headers.length; i++) {
	        sheet.autoSizeColumn(i); // 각 열의 셀 너비를 콘텐츠에 맞게 자동으로 조정
	    }
		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		String fileName = "필라픽스_회원관리.xlsx"; //파일이름지정.
		String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
		response.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	
	/**
	 * 트레이너 엑셀 다운로드
	 * @param response
	 * @param trainer
	 * @throws IOException
	 */
	@RequestMapping("/trainerExcelDown.do")
	public void excelTrainerDownload(HttpServletResponse response, @ModelAttribute("trainer")MemberVO trainer) throws IOException{
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
        
		
		List<MemberVO> trainerList = service.getExcelTrainerList();
		System.out.println("테스트중" + trainerList);
		
		 // 헤더 행 생성
	    int cellCount = 0;
	    XSSFRow headerRow = sheet.createRow(0);
	    String[] headers = {"회원코드", "이메일아이디", "트레이너이름", "연락처", "가입일자", "생년월일", "성별", "탈퇴여부", "가입유형", "연동센터명1", "연동센터명2", "연동센터명3"};
	    for (String header : headers) {
	        XSSFCell cell = headerRow.createCell(cellCount++);
	        cell.setCellValue(header);
	        cell.setCellStyle(headerXssfCellStyle);
	    }
	    
	    // 데이터 행 채우기
	    for (int i = 0; i < trainerList.size(); i++) {
	        // 새로운 행 생성
	        XSSFRow dataRow = sheet.createRow(i + 1);
	        cellCount = 0;

	        // 행의 각 셀에 데이터 설정
	        MemberVO currentTrainer = trainerList.get(i);
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getCsMemberCode());
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getCsEmailId());
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getCsName());
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getCsPhoneNumber1() + "-" + currentTrainer.getCsPhoneNumber2() + "-" + currentTrainer.getCsPhoneNumber3());
	        
	        Cell regDateCell = dataRow.createCell(cellCount++);
	        if (currentTrainer.getCsRegistrationDate() != null) {
	        	Date regDate = currentTrainer.getCsRegistrationDate();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedStartDate = dateFormat.format(regDate); // 날짜를 원하는 형식으로 변환
	        	regDateCell.setCellValue(formattedStartDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        Cell birthDateCell = dataRow.createCell(cellCount++);
	        if (currentTrainer.getCsBirth() != null) {
	        	Date endDate = currentTrainer.getCsBirth();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedEndDate = dateFormat.format(endDate); // 날짜를 원하는 형식으로 변환
	        	birthDateCell.setCellValue(formattedEndDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getCsGenderMw());
	        
	        // 탈퇴 여부 설정
	        String csDelete = trainerList.get(i).isCsDeleteYn() ? "Y" : "N";
	        dataRow.createCell(cellCount++).setCellValue(csDelete);
	        
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getCsRegistrationType());
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getConnectedCenterName1());
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getConnectedCenterName2());
	        dataRow.createCell(cellCount++).setCellValue(currentTrainer.getConnectedCenterName3());
	        
	        for (int j = 0; j < cellCount; j++) {
	            // 각 셀에 bodyXssfCellStyle 적용
	            dataRow.getCell(j).setCellStyle(bodyXssfCellStyle);
	        }
	        
	    }
	    
	    for (int i = 0; i < headers.length; i++) {
	        sheet.autoSizeColumn(i); // 각 열의 셀 너비를 콘텐츠에 맞게 자동으로 조정
	    }
		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
//		response.setHeader("Content-Disposition", "attachment;filename=필라픽스_트레이너_관리.xlsx");  //파일이름지정.
		String fileName = "필라픽스_트레이너관리.xlsx";
		String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
		response.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	

}
