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
	        // 로그인 성공, MemberVO 객체 반환
	    	System.out.println("비밀번호일치회원: " + csEmailId);
	    	//로그인 시 필요한 기본 정보 조회 mapper
	    	return dao.getMemberLoginInfo(csEmailId);
	    } else {
	        // 로그인 실패, null 반환
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
//	            // 로그인 실패
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
	 * 이메일 발송 및 이력 등록
	 */
	@Override
	public int sendAuthEmail(MemberVO member) {
		String csEmailId = member.getCsEmailId();
		int flag = 0;// 발송 성공 여부
		String errorMessage = ""; // 에러 시 실패 사유

		int authNumber = createAuthNumber();

		// ====이메일 발송======
		String from = "inayeon1212@gmail.com"; // 보내는 사람
		String title = "[필라픽스] 비밀번호 찾기 인증 메일"; // 제목
		String toSend = csEmailId; // 받는 사람

		// 메일 내용
		StringBuilder content = new StringBuilder();
		content.append(
				"<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
		content.append(
				"<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
		content.append("<h1 style='color: #333333; text-align: center;'>비밀번호 찾기 인증번호 전송</h1>");
		content.append("<p style='color: #555555; text-align: center;'>");
		content.append("</p><p style='text-align: center;'><strong>인증번호: </strong>");
		content.append(authNumber);
		content.append("</p>");
		content.append("<p style='color: #555555; text-align: center;'>비밀번호 찾기 페이지로 돌아가 인증번호를 입력해 주시기 바랍니다.</p>");
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
		email.setMhEmailSendType("비밀번호찾기");
		email.setMhRecipientName("회원");
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
		dao.passAuthNumSendEmailHistory(email); // 이메일 발송이력 저장
		return authNumber;
	}

	/**
	 * 인증번호 난수로 발급
	 * 
	 * @return
	 */
	@Override
	public int createAuthNumber() {
		Random r = new Random();
		int authNumber = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + authNumber);
		return authNumber;
	}



}
