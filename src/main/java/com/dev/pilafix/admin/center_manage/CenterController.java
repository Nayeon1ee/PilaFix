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
		//�̸��� �� ��� ���� �� ���;� ��
//		model.addAttribute("smsHistory", service.getSmsHistory(ctCode)); 
		return "admin/admin_center_management_detail";
	}
	
	@GetMapping("/insertCenter.do")
	public String insertForm() {
		return "admin/admin_center_management_register";
	}

	/**
	 * ���� ��� �� ���� ���� 
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
//	// �̹��� ���ε� �׽�Ʈ 
//	@PostMapping("/uploadTest.do")
//	public String uploadTest(@ModelAttribute("businessRegistrationFile")MultipartFile businessRegistrationFile) {
//		System.out.println("upload ȣ��");
//		
//		String fileRealName = businessRegistrationFile.getOriginalFilename(); //���ϸ��� �� �� �ִ� �޼���
//		long size = businessRegistrationFile.getSize(); //���� ������
//		
//		System.out.println("���ϸ� : "  + fileRealName);
//		System.out.println("�뷮ũ��(byte) : " + size);
//		//������ ������ �����̸� fileextension���� .jsp�̷�����  Ȯ���� ���� ����
//		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//		String uploadFolder = "D:\\test\\upload";
//		
//		UUID uuid = UUID.randomUUID();
//		System.out.println(uuid.toString());
//		String[] uuids = uuid.toString().split("-");
//		
//		String uniqueName = uuids[0];
//		System.out.println("������ �������ڿ�" + uniqueName);//����ڵ����_���͸�_�����ڵ�.���� ���� 
//		System.out.println("Ȯ���ڸ�" + fileExtension);
//		
//		
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // ���� ��
//		try {
//			businessRegistrationFile.transferTo(saveFile); // ���� ���� ����޼���(filewriter �۾��� �ս��� �ѹ濡 ó�����ش�.)
//		} catch (IllegalStateException e) {
//			System.out.println("���� ���� ����");
//			e.printStackTrace();
//		} catch (IOException e) {
//			System.out.println("���� ���� ����");
//			e.printStackTrace();
//		}
//		
//		return "redirect:getCenterList.do";
//	}
	//======================================================================================
	
	
	/**
	 * �̸��� �߼� �� �߼� �̷� ���� 
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/sendEmail.do")
	public String sendmail(HttpSession session) {
        CenterVO center = (CenterVO) session.getAttribute("center");
        center.setCtPassword((String)session.getAttribute("pw")); //��ȣȭ ���� ���� pw
        service.sendEmailAndInsertSendEmailHistory(center);
        session.removeAttribute("center");
        return "redirect:getCenterList.do";
    }
	
	/**
	 * ���� ��û 
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
	 * ���� DB ���� ���� 
	 * @param vo
	 * @return
	 */
	@PostMapping("/updateCenter.do")
	public String update(CenterVO vo) {
		service.updateCenter(vo);
		return "redirect:getCenterList.do";
	}
	
	/**
	 * Json �׽�Ʈ ���� 
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
