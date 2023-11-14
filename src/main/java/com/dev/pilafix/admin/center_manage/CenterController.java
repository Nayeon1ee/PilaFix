package com.dev.pilafix.admin.center_manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CenterController {
	@Autowired
	private CenterService service;
	
//	private S3Service s3Service;
	
	
	
	@GetMapping("/getCenterList.do")
	public String getCenterList(Model model) {
		model.addAttribute("centerList", service.getCenterList());
		return "admin/admin_center_management";
	}

	@GetMapping("/getCenter.do")
	public String getCenter(int ctCode, Model model) {
		model.addAttribute("center", service.getCenter(ctCode));
		//이메일 상세 대신 문자 상세 들어와야 함
//		model.addAttribute("smsHistory", service.getSmsHistory(ctCode)); 
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
	 * @throws Exception
	 */
    @PostMapping("/insertCenter.do")
    public String insert(@ModelAttribute("center") CenterVO center, HttpSession session) {
//    	String path = s3Service.upload(file);
//    	center.setBusinessRegistrationFilePath(path);
    	
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
	
	
    @Value("${cloud.aws.credentials.access-key}")
    private String accessKey;

    @Value("${cloud.aws.credentials.secret-key}")
    private String secretKey;

    @Value("${cloud.aws.s3.bucket}")
    private String bucketName;
    
    @Value("${cloud.aws.region.static}")
    private String region;

    @GetMapping("/s3info")
    @ResponseBody
    public Map<String, String> getS3Info() {
        Map<String, String> s3Info = new HashMap<>();
        s3Info.put("accessKey", accessKey);
        s3Info.put("secretKey", secretKey);
        s3Info.put("bucketName", bucketName);
        s3Info.put("region", region);
        return s3Info;
    }
	
	
}
