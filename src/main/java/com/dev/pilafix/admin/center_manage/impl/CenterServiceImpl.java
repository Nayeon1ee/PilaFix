package com.dev.pilafix.admin.center_manage.impl;

import java.util.List;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.CenterService;
import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.common.member.CenterVO;

@Service
public class CenterServiceImpl implements CenterService {
	
	@Autowired
	private CenterDAO dao;

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public List<CenterVO> getCenterList() {
		return dao.getCenterList();
	}

	@Override
	public CenterVO getCenter(int ctCode) {
		return dao.getCenter(ctCode);
	}

	@Override
	public int insertCenter(CenterVO center) {
		return dao.insertCenter(center);
	}

	@Override
	public int updateCenter(CenterVO center) {
		return dao.updateCenter(center);
	}

	@Override
	public int deleteCenter(int ctCode) {
		return dao.deleteCenter(ctCode);
	}

	/**
	 * ���̵� �ߺ� üũ 
	 */
	@Override
	public int idCheck(String ctId){
		return dao.idCheck(ctId);
	}
	
	/**
	 * �̸��� �ߺ� üũ 
	 */
	@Override
	public int emailCheck(String ownerEmail){
		return dao.emailCheck(ownerEmail);
	}

	/**
	 * �̸��� �߼� �� �̷� ���
	 */
    @Override
    public void sendEmailAndInsertSendEmailHistory(CenterVO center) {
    	
    	int flag = 0;// �߼� ���� ����
    	String errorMessage=""; //���� �� ���� ���� 
    	
        String ownerEmail = center.getOwnerEmail();
        String ctId = center.getCtId();
        String ctPassword = center.getCtPassword();
        String ownerName = center.getOwnerName();
		
		//====�̸��� �߼�======
	    String from = "pilafix1@gmail.com"; //������ ���
	    String title = "[�ʶ��Ƚ�] ���� ��� �Ϸ� �ȳ�"; // ����
	    String toSend = ownerEmail; //�޴� ���

	    //���� ����
	    StringBuilder content = new StringBuilder();
	    content.append("<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
	    content.append("<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
	    content.append("<h1 style='color: #333333; text-align: center;'>���� ��� �Ϸ� �ȳ�</h1>");
	    content.append("<p style='color: #555555; text-align: center;'>");
	    content.append(ownerName);
	    content.append(" ��ǥ��, ");
	    content.append(center.getCtName());
	    content.append(" ���� ����� �Ϸ�Ǿ����ϴ�.</p>");
	    content.append("<p style='color: #555555; text-align: center;'>�Ʒ� �������� �α��� ��, ��й�ȣ�� �� �����Ͽ� �ֽñ� �ٶ��ϴ�.</p>");
	    content.append("<p style='margin-top: 20px; text-align: center;'><strong>���̵�: </strong>");
	    content.append(ctId);
	    content.append("</p><p style='text-align: center;'><strong>��й�ȣ: </strong>");
	    content.append(ctPassword);
	    content.append("</p>");
	    content.append("<p style='color: #555555; text-align: center;'>�ʶ��Ƚ��� �̿����ּż� �����մϴ�.</p>");
	    content.append("</div></body></html>");
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;

			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(from); // �����»�� (�ʼ�)
		    messageHelper.setTo(toSend); // �޴»�� �̸���
		    messageHelper.setSubject(title); // ��������

		    // HTML ������ �̸��� ���� ����
		    messageHelper.setText(content.toString(), true); // ���� ������ HTML �������� ����

		    mailSender.send(message);
		    
		    flag=1;
		}catch (AuthenticationFailedException afe) {
		    System.out.println(afe.getMessage());
		    afe.printStackTrace();
		} catch (MessagingException me) {
		    errorMessage = me.getMessage();
		    me.printStackTrace();
		} catch (Exception e) {
		    errorMessage = e.getMessage();
		    e.printStackTrace();
		}
		
		//====�̸��� �߼� �̷� ���======
		SendEmailHistoryVO email = new SendEmailHistoryVO();
		email.setMhEmailSendType("���Ͱ�������");
		email.setMhRecipientName(center.getOwnerName());
		email.setMhRecipientTitle(title);
		email.setMhRecipientContent(content.toString());
		email.setMhRecipientEmail(toSend);

		if(flag == 1) {
			email.setMhSuccessYN(true);
			email.setMhSuccessDate(java.time.LocalDateTime.now());
		}else {
			email.setMhSuccessYN(false);
			email.setMhFailReason(errorMessage);
		}
		dao.sendEmail(email);
    }

    
    /**
     * ���� ��� �� ���� ���� 
     */
    @Override
    public void insertCenterAndSetSession(CenterVO center, HttpSession session) {
    	  
    	//�̸��� ������ ���� ���ǿ� center ��ü ����
    	session.setAttribute("pw", center.getCtPassword()); // ��ȣȭ �� pw ���� 
    	session.setAttribute("center", center);
    	
    	//���� ���� 
//    	MultipartFile file = center.getBusinessRegistrationFile();
//    	String fileName = file.getOriginalFilename();
//    	
//        s3Client.putObject(new PutObjectRequest(bucket, fileName, file.getInputStream(), null)
//                .withCannedAcl(CannedAccessControlList.PublicRead));
//    	
//    	//���� ���ϸ� 
//    	String fileRealName = file.getOriginalFilename();
//		// Ȯ���� ����
//    	String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//		// ���ε� ���
//    	String uploadFolder = "D:\\test\\upload"; //���� �ּҷ� �����ؾ� �� 
//		
//		//������ȣ ����
//		String[] uuids = UUID.randomUUID().toString().split("-");
//		
//		//���ε��� ���ϸ� ����
//		StringBuffer uniqueName = new StringBuffer();
//		uniqueName.append("����ڵ����_");
//		uniqueName.append(center.getCtName());
//		uniqueName.append("_");
//		uniqueName.append(uuids[0]); //������ȣ
//		
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  
//		//���� �ּ� ���� �Ŀ� db�� �ش� path ����� �� �ֵ��� ��
//		
//		try {
//			file.transferTo(saveFile); // ���� ���� ����޼���
//			
//		} catch (IllegalStateException e) {
//			System.out.println("���� ���� ����");
//			e.printStackTrace();
//		} catch (IOException e) {
//			System.out.println("���� ���� ����");
//			e.printStackTrace();
//		}
//		center.setBusinessRegistrationFilePath(s3Client.getUrl(bucket, fileName).toString());
    	
    	// Ŭ���̾�Ʈ���� pw ����(���ǿ� ���� �� ��ȣȭ)
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    	String encodedPwd = encoder.encode(center.getCtPassword());
    	center.setCtPassword(encodedPwd);
    	
    	dao.insertCenter(center);
    }

    
    /**
     * ��� ���� �޼��� 
     * �Ķ���ͷ� ���� ctCode�� �ش��ϴ� ������ ��� ���� true ����
     */
	@Override
	public void revokeCenter(int ctCode) {
		dao.revokeCenter(ctCode);

	}
	
	/**
	 * ��й�ȣ �ʱ�ȭ �޼��� 
	 */
	@Override
	public void resetPassword(int ctCode) {
		dao.resetPassword(ctCode);
	}	
	

}
