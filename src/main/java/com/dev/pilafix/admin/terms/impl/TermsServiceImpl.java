package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.CenterVO;
import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.admin.center_manage.impl.CenterDAO;
import com.dev.pilafix.admin.terms.TermsService;
import com.dev.pilafix.admin.terms.TermsVO;

@Service
public class TermsServiceImpl implements TermsService {
	@Autowired
	private TermsDAO dao;

	@Autowired
	private JavaMailSender mailSender;
	
	// ���Ϲ߼��̷� test������ �켱 �߰�
	@Autowired
    private CenterDAO centerDAO;
	
	@Override
	public List<CenterVO> getCenterList() {
		return centerDAO.getCenterList();
	}
	

	@Override
	public List<TermsVO> getTermsList() {
		return dao.getTermsList();
	}

	@Override
	public TermsVO getTerms(int tmCode) {
		return dao.getTerms(tmCode);
	}

	@Override
	public int insertTerms(TermsVO vo) {
		return dao.insertTerms(vo);
	}

	@Override
	public int updateTerms(TermsVO vo) {
		return dao.updateTerms(vo);
	}

	@Override
	public int deleteTerms(int tmCode) {
		return dao.deleteTerms(tmCode);
	}

	@Override
	public void sendEmailAndInsertSendEmailHistory(CenterVO center) {
		int flag = 0;// �߼� ���� ����
		String errorMessage = ""; // ���� �� ���� ����

		String ownerEmail = center.getOwnerEmail();
		String ctId = center.getCtId();
		String ctPassword = center.getCtPassword();
		String ownerName = center.getOwnerName();

		// ====�̸��� �߼�======
		String from = "inayeon1212@gmail.com"; // ������ ���
		String title = "[�ʶ��Ƚ�] �̿��� ���� �ȳ�"; // ����
		String toSend = ownerEmail; // �޴� ���

		// ���� ����
		StringBuilder content = new StringBuilder();
		content.append(
				"<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
		content.append(
				"<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
		content.append("<h1 style='color: #333333; text-align: center;'>�̿��� ���� �ȳ�</h1>");
		content.append("<p style='color: #555555; text-align: center;'>");
		content.append(ownerName);
		content.append(" ��, �ȳ��ϼ��� �ʶ��Ƚ��Դϴ�.");
		content.append(center.getCtName());
		content.append(" �ʶ��Ƚ� ���񽺸� �̿����ֽô� ȸ�� �����в� ����帳�ϴ�. </p>");
		content.append("<p style='color: #555555; text-align: center;'>�̿����� ������ 2024�� 1�� 10���ڷ� ����� �������� �ȳ��帳�ϴ�.</p>");
		content.append("<p style='color: #555555; text-align: center;'>1. ���泻��\r\n"
				+ "\r\n"
				+ "�̹� ��� ������ �ֿ� ������ �Ʒ��� �����ϴ�. ���� ������ ��� ������ Ȯ���Ͽ� �ֽñ� �ٶ��ϴ�.</p>");
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
		email.setMhEmailSendType("����������");
		email.setMhRecipientName(center.getOwnerName());
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
		dao.sendEmail(email);
	
	}

}
