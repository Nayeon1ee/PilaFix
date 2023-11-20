package com.dev.pilafix.admin.terms.impl;

import java.util.List;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;
import com.dev.pilafix.admin.center_manage.impl.CenterDAO;
import com.dev.pilafix.admin.terms.TermsService;
import com.dev.pilafix.admin.terms.TermsVO;
import com.dev.pilafix.common.member.CenterVO;

@Service
public class TermsServiceImpl implements TermsService {
	@Autowired
	private TermsDAO dao;

	@Autowired
	private JavaMailSender mailSender;
	
	// 메일발송이력 test때문에 우선 추가
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
		int flag = 0;// 발송 성공 여부
		String errorMessage = ""; // 에러 시 실패 사유

		String ownerEmail = center.getOwnerEmail();
		String ctId = center.getCtId();
		String ctPassword = center.getCtPassword();
		String ownerName = center.getOwnerName();

		// ====이메일 발송======
		String from = "inayeon1212@gmail.com"; // 보내는 사람
		String title = "[필라픽스] 이용약관 변경 안내"; // 제목
		String toSend = ownerEmail; // 받는 사람

		// 메일 내용
		StringBuilder content = new StringBuilder();
		content.append(
				"<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
		content.append(
				"<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
		content.append("<h1 style='color: #333333; text-align: center;'>이용약관 변경 안내</h1>");
		content.append("<p style='color: #555555; text-align: center;'>");
		content.append(ownerName);
		content.append(" 님, 안녕하세요 필라픽스입니다.");
		content.append(center.getCtName());
		content.append(" 필라픽스 서비스를 이용해주시는 회원 여러분께 감사드립니다. </p>");
		content.append("<p style='color: #555555; text-align: center;'>이용약관의 내용이 2024년 1월 10일자로 변경될 예정임을 안내드립니다.</p>");
		content.append("<p style='color: #555555; text-align: center;'>1. 변경내용\r\n"
				+ "\r\n"
				+ "이번 약관 개정의 주요 내용은 아래와 같습니다. 상세한 내용은 약관 전문을 확인하여 주시기 바랍니다.</p>");
		content.append("</div></body></html>");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;

			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(from); // 보내는사람 (필수)
			messageHelper.setTo(toSend); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목

			// HTML 형식의 이메일 내용 설정
			messageHelper.setText(content.toString(), true); // 메일 내용을 HTML 형식으로 설정

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

		// ====이메일 발송 이력 등록======
		SendEmailHistoryVO email = new SendEmailHistoryVO();
		email.setMhEmailSendType("변경약관동의");
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