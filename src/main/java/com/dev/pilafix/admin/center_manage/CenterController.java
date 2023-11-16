package com.dev.pilafix.admin.center_manage;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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

import com.dev.pilafix.common.AwsS3;
import com.dev.pilafix.common.member.CenterVO;


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
	 * @throws IOException 
	 * @throws Exception
	 */
    @PostMapping("/insertCenter.do")
    public String insert(@ModelAttribute("center") CenterVO center, MultipartFile multipart, HttpSession session) throws IOException {
		
    	// aws s3 ���� ���ε� ó�� */
    	if (!multipart.getOriginalFilename().equals("")) {
			InputStream is = multipart.getInputStream();
			String key = multipart.getOriginalFilename();
			
			System.out.println("���� ���� �� : "+key);
			
			String fileExtension = key.substring(key.lastIndexOf("."),key.length());
			
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("������ �������ڿ�" + uniqueName);//����ڵ����_���͸�_�����ڵ�.���� ���� 
			System.out.println("Ȯ���ڸ�" + fileExtension);
			
			key = "����ڵ����_"+uniqueName +"_"+center.getCtName()+fileExtension; 
			
			System.out.println("���ϸ� : "+key);
			
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
	

	
	
}