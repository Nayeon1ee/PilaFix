package com.dev.pilafix.member.signup.impl;

import java.util.List;


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
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.signup.MemberService;
import com.dev.pilafix.member.signup.TermsVO;


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
		// 가입시 입력한 비밀번호를 읽어와서
		String csPassword = vo.getCsPassword();
		System.out.println("가입 시 입력한 비밀번호 : " + csPassword);
		
		// 암호화 한 후에
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(csPassword);
		
		System.out.println("암호화 비밀번호   : "+encodedPwd);
		
		// vo에 다시 넣어준다.
		vo.setCsPassword(encodedPwd);
		// 암호화된 비밀번호가 들어 있는 vo를 dao에 전달해서 새로운 회원 정보를 추가한다.
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
//			//dao에서 select이 되지 않아야 true
//			//id가 없어야 true(사용 가능)
//			response.getWriter().print("1");
//		}else {
//			//id가 있으면 false(중복으로 사용 불가능)
//			response.getWriter().print("0");
//		}
//		
//	}
	
	/**
	 * 이메일 발송 및 이력 등록
	 */
	@Override
    public int mailCheckAndInsertSendEmailHistory(String csEmailId) {
    	
    	int flag = 0;// 발송 성공 여부
    	String errorMessage=""; //에러 시 실패 사유 
    	
    	
    	int authNumber = createAuthNumber();
    	
		
		//====이메일 발송======
	    String from = "inayeon1212@gmail.com"; //보내는 사람
	    String title = "[필라픽스] 회원가입 이메일 인증 메일"; // 제목
	    String toSend = csEmailId; //받는 사람

	    //메일 내용
	    StringBuilder content = new StringBuilder();
	    content.append("<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
	    content.append("<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
	    content.append("<h1 style='color: #333333; text-align: center;'>회원 가입 이메일 인증번호 전송</h1>");
	    content.append("<p style='color: #555555; text-align: center;'>");
	    content.append("</p><p style='text-align: center;'><strong>인증번호: </strong>");
	    content.append(authNumber);
	    content.append("</p>");
	    content.append("<p style='color: #555555; text-align: center;'>회원가입 페이지로 돌아가 인증번호를 입력해 주시기 바랍니다.</p>");
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
		
		//====이메일 발송 이력 등록======
		SendEmailHistoryVO email = new SendEmailHistoryVO();
		email.setMhEmailSendType("회원가입 인증");
		email.setMhRecipientName("회원"); //회원가입시 회원은 이름이 없음
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
		dao.sendEmailToMem(email); //이메일 발송이력 저장
		return authNumber;
    }
	
	/**
	 * 인증번호 난수로 발급
	 * @return
	 */
    public int createAuthNumber() {
    	// 난수의 범위 111111 ~ 999999 (6자리 난수)
    	Random r = new Random();
    	int authNumber = r.nextInt(888888) + 111111;
    	System.out.println("인증번호 : " + authNumber);
    	return authNumber;
    }
    
    @Override
	public List<TermsVO> getTermsList() {
		return dao.getTermsList();
	}

    
}