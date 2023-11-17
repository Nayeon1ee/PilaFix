package com.dev.pilafix.member.login.impl;

import java.util.Random;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.login.MemberLoginService;

@Service
public class MemberLoginServiceImpl implements MemberLoginService {

	@Autowired
	private MemberLoginDAO dao;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(MemberLoginServiceImpl.class);
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	
	
	@Override
	public MemberVO getMemberByEmail(String csEmailId) {
		return dao.getMemberLoginInfo(csEmailId);
	}

	
	@Override
    public boolean memberLogin(String csEmailId, String csPassword) {
        String storedPassword = dao.getPasswordByEmail(csEmailId);
        return storedPassword != null && encoder.matches(csPassword, storedPassword);
    }
	
	@Override
	public MemberVO loginAndGetMember(String csEmailId, String csPassword) {
		String storedPassword = dao.getPasswordByEmail(csEmailId);
		if (storedPassword != null && encoder.matches(csPassword, storedPassword)) {
	        // �α��� ����, MemberVO ��ü ��ȯ
	    	System.out.println("��й�ȣ��ġȸ��: " + csEmailId);
	    	//�α��� �� �ʿ��� �⺻ ���� ��ȸ mapper
	    	return dao.getMemberLoginInfo(csEmailId);
	    } else {
	        // �α��� ����, null ��ȯ
	        return null;
	    }
	}
	
	
	@Override
    public boolean checkPassword(int csMemberCode, String currentPassword) {
        MemberVO member = dao.getMemberInfo(csMemberCode);
        if (member != null && member.getCsPassword() != null) {
            return encoder.matches(currentPassword, member.getCsPassword());
        }
        return false;
    }
//	@Override
//	public MemberVO memberLogin(String csEmailId, String csPassword) {
//		MemberVO member = dao.getMemberLoginInfo(csEmailId);
//
//		if (member != null) {
//			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
////			if (encoder.matches(csPassword, member.getCsPassword())) {
//			if (BCrypt.checkpw(csPassword, member.getCsPassword())) {
//				return member;
//			}else {
//	            // �α��� ����
//	            logger.warn("Password does not match for user: {}", csEmailId);
//	        }
//	    } else {
//	        logger.warn("No member found with email: {}", csEmailId);
//	    }
//		return null;
//	}



	@Override
	public void updatePassword(int csMemberCode, String newPassword) {
		String encodedNewPassword = encoder.encode(newPassword);
		dao.updatePassword(csMemberCode, encodedNewPassword);

	}

	/**
	 * �̸��� �߼� �� �̷� ���
	 */
	@Override
	public int sendAuthEmail(MemberVO member) {
		String csEmailId = member.getCsEmailId();
		int flag = 0;// �߼� ���� ����
		String errorMessage = ""; // ���� �� ���� ����

		int authNumber = createAuthNumber();

		// ====�̸��� �߼�======
		String from = "inayeon1212@gmail.com"; // ������ ���
		String title = "[�ʶ��Ƚ�] ��й�ȣ ã�� ���� ����"; // ����
		String toSend = csEmailId; // �޴� ���

		// ���� ����
		StringBuilder content = new StringBuilder();
		content.append(
				"<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
		content.append(
				"<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
		content.append("<h1 style='color: #333333; text-align: center;'>��й�ȣ ã�� ������ȣ ����</h1>");
		content.append("<p style='color: #555555; text-align: center;'>");
		content.append("</p><p style='text-align: center;'><strong>������ȣ: </strong>");
		content.append(authNumber);
		content.append("</p>");
		content.append("<p style='color: #555555; text-align: center;'>��й�ȣ ã�� �������� ���ư� ������ȣ�� �Է��� �ֽñ� �ٶ��ϴ�.</p>");
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

			flag = 1;
		} catch (AuthenticationFailedException afe) {
			System.out.println(afe.getMessage());
			afe.printStackTrace();
		} catch (MessagingException me) {
			errorMessage = me.getMessage();
			me.printStackTrace();
		} catch (Exception e) {
			errorMessage = e.getMessage();
			e.printStackTrace();
		}

		// ====�̸��� �߼� �̷� ���======
		SendEmailHistoryVO email = new SendEmailHistoryVO();
		email.setMhEmailSendType("��й�ȣã��");
		email.setMhRecipientName("ȸ��");
		email.setMhRecipientTitle(title);
		email.setMhRecipientContent(content.toString());
		email.setMhRecipientEmail(toSend);

		if (flag == 1) {
			email.setMhSuccessYN(true);
			email.setMhSuccessDate(java.time.LocalDateTime.now());
		} else {
			email.setMhSuccessYN(false);
			email.setMhFailReason(errorMessage);
		}
		dao.passAuthNumSendEmailHistory(email); // �̸��� �߼��̷� ����
		return authNumber;
	}

	/**
	 * ������ȣ ������ �߱�
	 * 
	 * @return
	 */
	@Override
	public int createAuthNumber() {
		Random r = new Random();
		int authNumber = r.nextInt(888888) + 111111;
		System.out.println("������ȣ : " + authNumber);
		return authNumber;
	}



}
