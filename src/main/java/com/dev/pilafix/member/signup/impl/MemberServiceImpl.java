package com.dev.pilafix.member.signup.impl;

import java.util.Random;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.member.signup.MemberService;
import com.dev.pilafix.member.signup.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao; 
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public MemberVO getUserRole() {
		return dao.getUserRole();
	}

	@Override
	public int insertMember(MemberVO vo) {
		// ���Խ� �Է��� ��й�ȣ�� �о�ͼ�
		String csPassword = vo.getCsPassword();
		
		// ��ȣȭ �� �Ŀ�
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(csPassword);
		// vo�� �ٽ� �־��ش�.
		vo.setCsPassword(encodedPwd);
		// ��ȣȭ�� ��й�ȣ�� ��� �ִ� vo�� dao�� �����ؼ� ���ο� ȸ�� ������ �߰��Ѵ�.
		return dao.insertMember(vo);
	}

	@Override
	public int idCheck(String csEmailId){
		int result= dao.idCheck(csEmailId);
		return result;
		  
	}
//	public void idCheck(String csEmailId, HttpServletResponse response) throws IOException {
//		int count = dao.idCheck(csEmailId);
//		if(count == 0) {
//			//dao���� select�� ���� �ʾƾ� true
//			//id�� ����� true(��� ����)
//			response.getWriter().print("1");
//		}else {
//			//id�� ������ false(�ߺ����� ��� �Ұ���)
//			response.getWriter().print("0");
//		}
//		
//	}
	
	/**
	 * �̸��� �߼� �� �̷� ���
	 */
	@Override
    public int mailCheckAndInsertSendEmailHistory(String csEmailId) {
    	
    	int flag = 0;// �߼� ���� ����
    	String errorMessage=""; //���� �� ���� ���� 
    	
    	
    	int authNumber = createAuthNumber();
    	
		
		//====�̸��� �߼�======
	    String from = "inayeon1212@gmail.com"; //������ ���
	    String title = "[�ʶ��Ƚ�] ȸ������ �̸��� ���� ����"; // ����
	    String toSend = csEmailId; //�޴� ���

	    //���� ����
	    StringBuilder content = new StringBuilder();
	    content.append("<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
	    content.append("<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
	    content.append("<h1 style='color: #333333; text-align: center;'>ȸ�� ���� �̸��� ������ȣ ����</h1>");
	    content.append("<p style='color: #555555; text-align: center;'>");
	    content.append("</p><p style='text-align: center;'><strong>������ȣ: </strong>");
	    content.append(authNumber);
	    content.append("</p>");
	    content.append("<p style='color: #555555; text-align: center;'>ȸ������ �������� ���ư� ������ȣ�� �Է��� �ֽñ� �ٶ��ϴ�.</p>");
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
		email.setMhEmailSendType("ȸ������ ����");
		email.setMhRecipientName("ȸ��"); //ȸ�����Խ� ȸ���� �̸��� ����
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
		dao.sendEmailToMem(email); //�̸��� �߼��̷� ����
		return authNumber;
    }
	
	/**
	 * ������ȣ ������ �߱�
	 * @return
	 */
    public int createAuthNumber() {
    	// ������ ���� 111111 ~ 999999 (6�ڸ� ����)
    	Random r = new Random();
    	int authNumber = r.nextInt(888888) + 111111;
    	System.out.println("������ȣ : " + authNumber);
    	return authNumber;
    }

    
}
