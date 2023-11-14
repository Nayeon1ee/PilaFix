package com.dev.pilafix.admin.center_manage.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
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
	 * 아이디 중복 체크 
	 */
	@Override
	public int idCheck(String ctId){
		return dao.idCheck(ctId);
	}
	
	/**
	 * 이메일 중복 체크 
	 */
	@Override
	public int emailCheck(String ownerEmail){
		return dao.emailCheck(ownerEmail);
	}

	/**
	 * 이메일 발송 및 이력 등록
	 */
    @Override
    public void sendEmailAndInsertSendEmailHistory(CenterVO center) {
    	
    	int flag = 0;// 발송 성공 여부
    	String errorMessage=""; //에러 시 실패 사유 
    	
        String ownerEmail = center.getOwnerEmail();
        String ctId = center.getCtId();
        String ctPassword = center.getCtPassword();
        String ownerName = center.getOwnerName();
		
		//====이메일 발송======
	    String from = "pilafix1@gmail.com"; //보내는 사람
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
		email.setMhEmailSendType("센터계정생성");
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
     * 센터 등록 및 세션 저장 
     */
    @Override
    public void insertCenterAndSetSession(CenterVO center, HttpSession session) {
    	  
    	//이메일 전송을 위해 세션에 center 객체 저장
    	session.setAttribute("pw", center.getCtPassword()); // 암호화 전 pw 저장 
    	session.setAttribute("center", center);
    	
    	//파일 저장 
//    	MultipartFile file = center.getBusinessRegistrationFile();
//    	String fileName = file.getOriginalFilename();
//    	
//        s3Client.putObject(new PutObjectRequest(bucket, fileName, file.getInputStream(), null)
//                .withCannedAcl(CannedAccessControlList.PublicRead));
//    	
//    	//실제 파일명 
//    	String fileRealName = file.getOriginalFilename();
//		// 확장자 추출
//    	String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//		// 업로드 경로
//    	String uploadFolder = "D:\\test\\upload"; //서버 주소로 변경해야 함 
//		
//		//고유번호 추출
//		String[] uuids = UUID.randomUUID().toString().split("-");
//		
//		//업로드할 파일명 지정
//		StringBuffer uniqueName = new StringBuffer();
//		uniqueName.append("사업자등록증_");
//		uniqueName.append(center.getCtName());
//		uniqueName.append("_");
//		uniqueName.append(uuids[0]); //고유번호
//		
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  
//		//서버 주소 변경 후에 db에 해당 path 저장될 수 있도록 함
//		
//		try {
//			file.transferTo(saveFile); // 실제 파일 저장메서드
//			
//		} catch (IllegalStateException e) {
//			System.out.println("파일 저장 실패");
//			e.printStackTrace();
//		} catch (IOException e) {
//			System.out.println("파일 저장 실패");
//			e.printStackTrace();
//		}
//		center.setBusinessRegistrationFilePath(s3Client.getUrl(bucket, fileName).toString());
    	
    	// 클라이언트에게 pw 전송(세션에 세팅 후 암호화)
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    	String encodedPwd = encoder.encode(center.getCtPassword());
    	center.setCtPassword(encodedPwd);
    	
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
