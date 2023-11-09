package com.dev.pilafix.member.signup.impl;

import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.CenterVO;
import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.member.signup.MemberService;
import com.dev.pilafix.member.signup.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao; 
	
	@Override
	public MemberVO getUserRole() {
		return dao.getUserRole();
	}

	@Override
	public int insertMember(MemberVO vo) {
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
	 
    @Override
    public void mailCheckAndInsertSendEmailHistory(MemberVO vo) {

        String ownerEmail = center.getOwnerEmail();
        String ctId = center.getCtId();
        String ctPassword = center.getCtPassword();
        String ownerName = center.getOwnerName();
		
		//====�̸��� �߼�======
	    String from = "inayeon1212@gmail.com"; //������ ���
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
		    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

		    messageHelper.setFrom(from); // �����»�� (�ʼ�)
		    messageHelper.setTo(toSend); // �޴»�� �̸���
		    messageHelper.setSubject(title); // ��������

		    // HTML ������ �̸��� ���� ����
		    messageHelper.setText(content.toString(), true); // ���� ������ HTML �������� ����

		    mailSender.send(message);
		} catch (Exception e) {
		    System.out.println(e);
		}
		
		//====�̸��� �߼� �̷� ���======
		SendEmailHistoryVO email = new SendEmailHistoryVO();
		email.setMhEmailSendType("���Ͱ�������");
		email.setMhRecipientName(center.getOwnerName());
		email.setMhRecipientTitle(title);
		email.setMhRecipientContent(content.toString());
		email.setMhRecipientEmail(toSend);
		//�̸��� �߼� �� ���� ���� �Ǵ��� �� �ִ���? �� �� �ִٸ� �Ǵ��ؼ� 
		// email.setSuccessYN ���ؾ� ��
    }
*/
}
