package com.dev.pilafix.admin.center_manage;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.util.AwsS3;
@Controller
public class CenterController {
	@Autowired
	private CenterService service;
	public AwsS3 awss3 = AwsS3.getInstance();
	
	@GetMapping("/getCenterList.do")
	public String getCenterList(Model model) {
		model.addAttribute("centerList", service.getCenterList());
		return "admin/admin_center_management";
	}
	
	
	@GetMapping("/getCenter.do")
	public String getCenter(int ctCode, Model model) {
		model.addAttribute("center", service.getCenter(ctCode));
		model.addAttribute("smsHistory", service.getSmsHistory(ctCode)); 
		return "admin/admin_center_management_detail";
	}
	
	@GetMapping("/insertCenter.do")
	public String insertForm() {
		return "admin/admin_center_management_register";
	}
 
    
	/**
	 * 센터 등록 및 세션 저장 
	 * @param center
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
    @PostMapping("/insertCenter.do")
    public String insert(@ModelAttribute("center") CenterVO center, MultipartFile multipart, HttpSession session) throws IOException {
    	
    	System.out.println("insertCenter.do 호출");

    	System.out.println("파일명 세팅 ");
    	System.out.println("파일명 : " + multipart.getOriginalFilename());
    	// 파일 업로드 처리 때문에 막아둠 추후 업로드 열리면 삭제해야 함
		center.setBusinessRegistrationFilePath("https://pilafixbuc.s3.ap-northeast-2.amazonaws.com/"+multipart.getOriginalFilename());
    	

    	/* aws s3 파일 업로드 처리 */
    	if (!multipart.getOriginalFilename().equals("")) {
			InputStream is = multipart.getInputStream();
			String key = multipart.getOriginalFilename();
			
			System.out.println("기존 파일 명 : "+key);
			
			String fileExtension = key.substring(key.lastIndexOf("."),key.length());
			
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);//사업자등록증_센터명_센터코드.으로 변경 
			System.out.println("확장자명" + fileExtension);
			
			key = "사업자등록증_"+uniqueName +"_"+center.getCtName()+fileExtension; 
			
			System.out.println("파일명 : "+key);
			
			String contentType = multipart.getContentType();
			long contentLength = multipart.getSize();
			
			String bucket = "pilafixbuc";
			
			awss3.upload(is, key, contentType, contentLength, bucket);

			String filePath = "https://pilafixbuc.s3.ap-northeast-2.amazonaws.com/"+key;

			center.setBusinessRegistrationFilePath(filePath);
		}
		
    	service.insertCenterAndSetSession(center, session);
        return "redirect:sendEmail.do";
    }
	
    
    //======================================================================================
//    @GetMapping("/uploadTest.do")
//    public String uploadTest() {
//    	return "admin/uploadTest";
//    }
//    
//	// 이미지 업로드 테스트 
//	@PostMapping("/uploadTest.do")
//	public String uploadTest(@ModelAttribute("businessRegistrationFile")MultipartFile businessRegistrationFile) {
//		System.out.println("upload 호출");
//		
//		String fileRealName = businessRegistrationFile.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드
//		long size = businessRegistrationFile.getSize(); //파일 사이즈
//		
//		System.out.println("파일명 : "  + fileRealName);
//		System.out.println("용량크기(byte) : " + size);
//		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
//		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//		String uploadFolder = "D:\\test\\upload";
//		
//		UUID uuid = UUID.randomUUID();
//		System.out.println(uuid.toString());
//		String[] uuids = uuid.toString().split("-");
//		
//		String uniqueName = uuids[0];
//		System.out.println("생성된 고유문자열" + uniqueName);//사업자등록증_센터명_센터코드.으로 변경 
//		System.out.println("확장자명" + fileExtension);
//		
//		
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
//		try {
//			businessRegistrationFile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
//		} catch (IllegalStateException e) {
//			System.out.println("파일 저장 실패");
//			e.printStackTrace();
//		} catch (IOException e) {
//			System.out.println("파일 저장 실패");
//			e.printStackTrace();
//		}
//		
//		return "redirect:getCenterList.do";
//	}
	//======================================================================================
	
	
	/**
	 * 이메일 발송 및 발송 이력 저장 
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/sendEmail.do")
	public String sendmail(HttpSession session) {
        CenterVO center = (CenterVO) session.getAttribute("center");
        center.setCtPassword((String)session.getAttribute("pw")); //암호화 되지 않은 pw
        service.sendEmailAndInsertSendEmailHistory(center);
        session.removeAttribute("center");
        return "redirect:getCenterList.do";
    }
	
	/**
	 * 수정 요청 
	 * @param ctCode
	 * @param model
	 * @return
	 */
	@GetMapping("/updateCenter.do")
	public String updateForm(int ctCode, Model model) {
		model.addAttribute("center", service.getCenter(ctCode));
		return "admin/admin_center_management_edit";
	}
	
	/**
	 * 실제 DB 수정 시행 
	 * @param vo
	 * @return
	 */
	@PostMapping("/updateCenter.do")
	public String update(CenterVO vo) {
		service.updateCenter(vo);
		return "redirect:getCenterList.do";
	}
	
	/**
	 * Json 테스트 샘플 
	 * @return
	 */
	@RequestMapping("/jsTest.do")
	@ResponseBody
	public List<CenterVO> jsTest() {
		List<CenterVO> boardList = service.getCenterList();
		return boardList;
	}
	
	@GetMapping("/deleteCenter.do")
	public String delete(int ctCode) {
		service.deleteCenter(ctCode);
		return "redirect:getCenterList.do";
	}
	
	@GetMapping("/revokeCenter.do")
	public String revoke(int ctCode) {
		service.revokeCenter(ctCode);
		return "redirect:getCenter.do?ctCode="+ctCode;
	}
	
	@GetMapping("/resetPassword.do")
	public String resetPassword(int ctCode) {
		service.resetPassword(ctCode);
		return "redirect:getCenter.do?ctCode="+ctCode;		
	}
	
	@PostMapping("/ctIdCheck.do")
	@ResponseBody
	public int idCheck(@RequestParam("ctId") String ctId) {
		return service.idCheck(ctId);
	}
	
	@PostMapping("/ctEmailCheck.do")
	@ResponseBody
	public int emailCheck(@RequestParam("ownerEmail") String ownerEmail) {
		return service.emailCheck(ownerEmail);
	}
	
	@RequestMapping("/excelDown.do")
	public void excelDownload(HttpServletResponse response, @ModelAttribute("center")CenterVO center) throws IOException{
		XSSFWorkbook wb = new XSSFWorkbook();
	    XSSFSheet sheet = wb.createSheet("센터 관리 목록");
		
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
        
		
		List<CenterVO> centerList = service.getExcelCenterList();
		System.out.println("테스트중" + centerList);
		
		 // 헤더 행 생성
	    int cellCount = 0;
	    XSSFRow headerRow = sheet.createRow(0);
	    String[] headers = {"센터코드", "센터이름", "센터주소", "센터번호", "대표자명", "대표자번호", "대표자이메일", "사업자등록번호", "계약일", "계약만료일", "아이디", "계약상태", "만료여부"};
	    for (String header : headers) {
	        XSSFCell cell = headerRow.createCell(cellCount++);
	        cell.setCellValue(header);
	        cell.setCellStyle(headerXssfCellStyle);
	    }
	    
	    // 데이터 행 채우기
	    for (int i = 0; i < centerList.size(); i++) {
	        // 새로운 행 생성
	        XSSFRow dataRow = sheet.createRow(i + 1);
	        cellCount = 0;

	        // 행의 각 셀에 데이터 설정
	        CenterVO currentCenter = centerList.get(i);
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getCtCode());
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getCtName());
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getCtAddress1() + currentCenter.getCtAddress2() + currentCenter.getCtAddress3());
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getCtPhoneNumber1() + "-" + currentCenter.getCtPhoneNumber2() + "-" + currentCenter.getCtPhoneNumber3());
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getOwnerName());
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getOwnerPhoneNumber1() + "-" + currentCenter.getOwnerPhoneNumber2() + "-" + currentCenter.getOwnerPhoneNumber3());
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getOwnerEmail());
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getBusinessRegistrationNumber());
	        
	        Cell startDateCell = dataRow.createCell(cellCount++);
	        if (currentCenter.getContractStartDate() != null) {
	        	Date startDate = currentCenter.getContractStartDate();
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	            String formattedStartDate = dateFormat.format(startDate); // 날짜를 원하는 형식으로 변환
	            startDateCell.setCellValue(formattedStartDate); // 날짜 문자열을 셀에 입력
	        }

	        Cell endDateCell = dataRow.createCell(cellCount++);
	        if (currentCenter.getContractEndDate() != null) {
	        	Date endDate = currentCenter.getContractEndDate();
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 날짜 형식 설정
	            String formattedEndDate = dateFormat.format(endDate); // 날짜를 원하는 형식으로 변환
	            endDateCell.setCellValue(formattedEndDate); // 날짜 문자열을 셀에 입력
	        }
	        
	        dataRow.createCell(cellCount++).setCellValue(currentCenter.getCtId());
	        
	        // 계약 상태 설정
	        String contractStatus;
	        if (!centerList.get(i).isContractExpiryYn() && !centerList.get(i).isContractRevokeYn()) {
	            contractStatus = "계약";
	        } else if (centerList.get(i).isContractExpiryYn() && !centerList.get(i).isContractRevokeYn()) {
	            contractStatus = "만료";
	        } else {
	            contractStatus = "해지";
	        }
	        dataRow.createCell(cellCount++).setCellValue(contractStatus);

	        // 만료 여부 설정
	        String expiryStatus = centerList.get(i).isContractExpiryYn() ? "Y" : "N";
	        dataRow.createCell(cellCount++).setCellValue(expiryStatus);
	        
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
//		response.setHeader("Content-Disposition", "attachment;filename=필라픽스_센터관리.xlsx");  //파일이름지정.
		String fileName = "필라픽스_센터관리.xlsx";
		String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
		response.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	
   

}