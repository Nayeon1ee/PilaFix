package com.dev.pilafix.admin.center_manage.impl;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.CenterService;
import com.dev.pilafix.admin.center_manage.CenterVO;
import com.dev.pilafix.admin.center_manage.SendEmailHistoryVO;

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
	public int insertCenter(CenterVO vo) {
		return dao.insertCenter(vo);
	}

	@Override
	public int updateCenter(CenterVO vo) {
		return dao.updateCenter(vo);
	}

	@Override
	public int deleteCenter(int ctCode) {
		return dao.deleteCenter(ctCode);
	}

	@Override
	public int ctIdCheck(String ctId) {
		return dao.ctIdCheck(ctId);
	}
	

	/**
	 * 이메일 발송 및 이력 등록
	 */
    @Override
    public void sendEmailAndInsertSendEmailHistory(CenterVO center) {

        String ownerEmail = center.getOwnerEmail();
        String ctId = center.getCtId();
        String ctPassword = center.getCtPassword();
        String ownerName = center.getOwnerName();
		
		//====이메일 발송======
	    String from = "inayeon1212@gmail.com"; //보내는 사람
	    String title = "[필라픽스] 센터 등록 완료 안내"; // 제목
	    String toSend = ownerEmail; //받는 사람

	    //메일 내용
	    StringBuilder content = new StringBuilder();
	    content.append("<html><body style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>");
	    content.append("<div style='background-color: #ffffff; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>");
	    content.append("<h1 style='color: #333333; text-align: center;'>센터 등록 완료 안내</h1>");
	    content.append("<p style='color: #555555; text-align: center;'>");
	    content.append(ownerName);
	    content.append(" 대표님, ");
	    content.append(center.getCtName());
	    content.append(" 센터 등록이 완료되었습니다.</p>");
	    content.append("<p style='color: #555555; text-align: center;'>아래 계정으로 로그인 후, 비밀번호를 꼭 변경하여 주시기 바랍니다.</p>");
	    content.append("<p style='margin-top: 20px; text-align: center;'><strong>아이디: </strong>");
	    content.append(ctId);
	    content.append("</p><p style='text-align: center;'><strong>비밀번호: </strong>");
	    content.append(ctPassword);
	    content.append("</p>");
	    content.append("<p style='color: #555555; text-align: center;'>필라픽스를 이용해주셔서 감사합니다.</p>");
	    content.append("</div></body></html>");
		
		try {
		    MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

		    messageHelper.setFrom(from); // 보내는사람 (필수)
		    messageHelper.setTo(toSend); // 받는사람 이메일
		    messageHelper.setSubject(title); // 메일제목

		    // HTML 형식의 이메일 내용 설정
		    messageHelper.setText(content.toString(), true); // 메일 내용을 HTML 형식으로 설정

		    mailSender.send(message);
		} catch (Exception e) {
		    System.out.println(e);
		}
		
		//====이메일 발송 이력 등록======
		SendEmailHistoryVO email = new SendEmailHistoryVO();
		email.setMhEmailSendType("센터계정생성");
		email.setMhRecipientName(center.getOwnerName());
		email.setMhRecipientTitle(title);
		email.setMhRecipientContent(content.toString());
		email.setMhRecipientEmail(toSend);
		//이메일 발송 후 성공 여부 판단할 수 있는지? 할 수 있다면 판단해서 
		// email.setSuccessYN 셋해야 함
    }

    
    /**
     * 센터 등록 및 세션 저장 
     */
    @Override
    public void insertCenterAndSetSession(CenterVO center, HttpSession session) {
    	session.setAttribute("center", center);
    	dao.insertCenter(center);
    }

    
    /**
     * 계약 해지 메서드 
     * 파라미터로 받은 ctCode에 해당하는 센터의 계약 해지 true 변경
     */
	@Override
	public void revokeCenter(int ctCode) {
		dao.revokeCenter(ctCode);

	}
	
	/**
	 * 비밀번호 초기화 메서드 
	 */
	@Override
	public void resetPassword(int ctCode) {
		dao.resetPassword(ctCode);
	}	
	

}
