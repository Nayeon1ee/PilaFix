package com.dev.pilafix.admin.terms;

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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.common.member.MemberVO;

@Controller
public class TermsController {
	@Autowired
	private TermsService service;
	
	@Autowired
	private JavaMailSender mailSender;

	
	/**
	 * 이용약관의 상세
	 */
	@GetMapping("/getTerms.do")
	public String getTerms(@RequestParam("tmCode")Integer tmCode, Model model) {
		model.addAttribute("terms", service.getTerms(tmCode));
//		return "terms/getTerms.jsp";
		return "admin/admin_terms_detail";
	}
	

	@GetMapping("/getTermsList.do")
	public String getTermsList(Model model) {
		model.addAttribute("termsList", service.getTermsList());
		return "admin/admin_terms";
	}
	
	/**
	 * 이용약관 엑셀 생성
	 */
	@RequestMapping("/termsExcelDown.do")
	public void excelTermsDownload(HttpServletResponse response, @ModelAttribute("terms")TermsVO terms) throws IOException{
		XSSFWorkbook wb = new XSSFWorkbook();
	    XSSFSheet sheet = wb.createSheet("약관 관리 목록");
		
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
        
		
		List<TermsVO> termsList = service.getTermsExcelList();
		System.out.println("테스트중" + termsList);
		
		 // 헤더 행 생성
	    int cellCount = 0;
	    XSSFRow headerRow = sheet.createRow(0);
	    String[] headers = {"약관코드", "약관명", "약관내용", "약관등록일자", "약관최근수정일자", "필수여부", "공개여부"};
	    for (String header : headers) {
	        XSSFCell cell = headerRow.createCell(cellCount++);
	        cell.setCellValue(header);
	        cell.setCellStyle(headerXssfCellStyle);
	    }
	    
	    // 데이터 행 채우기
	    for (int i = 0; i < termsList.size(); i++) {
	        // 새로운 행 생성
	        XSSFRow dataRow = sheet.createRow(i + 1);
	        cellCount = 0;

	        // 행의 각 셀에 데이터 설정
	        TermsVO currentTerms = termsList.get(i);
	        dataRow.createCell(cellCount++).setCellValue(currentTerms.getTmCode());
	        dataRow.createCell(cellCount++).setCellValue(currentTerms.getTmName());
	        dataRow.createCell(cellCount++).setCellValue(currentTerms.getTmDetail());
	        
	        Cell tmRegDateCell = dataRow.createCell(cellCount++);
	        if (currentTerms.getTmRegdate() != null) {
	        	Date tmRegDate = currentTerms.getTmRegdate();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedStartDate = dateFormat.format(tmRegDate); // 날짜를 원하는 형식으로 변환
	        	tmRegDateCell.setCellValue(formattedStartDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        Cell tmModifiedDateCell = dataRow.createCell(cellCount++);
	        if (currentTerms.getTmModifiedDate() != null) {
	        	Date tmModifiedDate = currentTerms.getTmModifiedDate();
	        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	        	String formattedEndDate = dateFormat.format(tmModifiedDate); // 날짜를 원하는 형식으로 변환
	        	tmModifiedDateCell.setCellValue(formattedEndDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        // 필수 설정
	        String tmRequired = termsList.get(i).isTmRequiredYn() ? "필수" : "선택";
	        dataRow.createCell(cellCount++).setCellValue(tmRequired);
	        
	        // 필수 설정
	        String tmOpen = termsList.get(i).isTmOpenYn() ? "공개" : "비공개";
	        dataRow.createCell(cellCount++).setCellValue(tmOpen);
	        
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
		String fileName = "필라픽스_약관관리.xlsx";
		String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
		response.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}

	
	@GetMapping("/insertTerms.do")
	public String insertTerms() {
//		return "terms/insertTerms.jsp";
		return "admin/admin_terms_register";
	}

	@PostMapping("/insertTerms.do")
	public String insert(TermsVO vo) {
		service.insertTerms(vo);
		return "redirect:getTermsList.do";
	}

	

	
	
	/**
	 * 이용약관 수정하기
	 * 수정시 수정약관에 대해 이메일 발송 : 발송이력 쌓여야함
	 */
	@GetMapping("/updateTerms.do")
	public String updateTerms(@RequestParam("tmCode") Integer tmCode, Model model) {
		model.addAttribute("terms", service.getTerms(tmCode));
		return "admin/admin_terms_edit";
	}
	
	@PostMapping("/updateTerms.do")
	public String update(TermsVO vo, Model model) {
		service.updateTerms(vo);
		
//		/* 발송이력메서드 호출 위해 이메일발송 대상자 리스트가져옴 */
//		 List<CenterVO> centers = service.getCenterList();
//		    for (CenterVO center : centers) {
//		        service.sendEmailAndInsertSendEmailHistory(center);
//		    }
		return "redirect:getTermsList.do";

	}

	@GetMapping("/deleteTerms.do")
	public String delete(int tmCode) {
		service.deleteTerms(tmCode);
		return "redirect:getTermsList.do";
	}
	
	
	
	
}