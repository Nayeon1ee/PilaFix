package com.dev.pilafix.member.reserve;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.sendsmshistory.SendSmsHistoryVO;
import com.dev.pilafix.member.reserve.impl.SmsDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Transactional
public class SMSService {
	
	@Autowired
	private SmsDAO smsDAO;
	
	@Autowired
	private ReservService reservService;
	
	@Value("${coolsms.apiKey}")
    private String apiKey;
 
    @Value("${coolsms.apiSecret}")
    private String apiSecret;
    
    /**
     * 예약 확인 문자 발송
     * 
     * STEP01. 수업 내용 불러와서 내용 작성
     * STEP02. 문자 발송
     * STEP03. 문자발송 이력 등록 
     * 
     * @param lsCode
     * @param session
     */
    public void sendReservationConfirmation(String lsCode, HttpSession session) {
    	Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
        String memberName = (String) loginUser.get("csName");
        String memberPhone = (String) loginUser.get("csPhoneNumber");

        /* STEP01. 수업 내용 불러와서 문자 내용 작성 */
        CenterLessonVO reservLesson = reservService.getLessonDetail(lsCode);
        
        StringBuilder text = new StringBuilder();
        text.append("[필라픽스] ");
        text.append(memberName);
        text.append(" 회원님, ");
        text.append(convertToKoreanTime(reservLesson.getLsTime()));
        text.append(" ");
        text.append(reservLesson.getLsName());
        text.append("수업 예약이 완료되었습니다.");
        String smsContent = text.toString();
        
       
        /* STEP02. 문자 발송 */
    	Message coolsms = new Message(apiKey, apiSecret);
    	
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", memberPhone); //세션에 저장된 현재 로그인한 회원의 연락처 
		params.put("from", "01051275264");
		params.put("type", "SMS");
		params.put("text", smsContent);
		params.put("app_version", "test app 1.2"); 
		
		JSONObject obj = null;
		String failReason=null;
		
//		try {
//			obj = (JSONObject) coolsms.send(params);
//			System.out.println(obj.toString());
//			
//		} catch (CoolsmsException e) {
//			System.out.println(e.getMessage());
//			System.out.println(e.getCode());
//			failReason = e.getMessage(); //실패 사유 저장 
//		} finally {
//			/* STEP03. 문자발송 이력 등록 - 실패 시에도 등록되어야 함 */
//			
//			SendSmsHistoryVO smsHistory = new SendSmsHistoryVO();
//			smsHistory.setShSendCode((String)obj.get("group_id"));
//			smsHistory.setShSendCenterCode(reservLesson.getCenterCode()); //센터코드 저장 
//			smsHistory.setShRecipientName(memberName);
//			smsHistory.setShRecipientPhone(memberPhone);
//			smsHistory.setShRecipientContent(smsContent);
//			System.out.println("smsService까지 옴");
//			if(obj != null && (long)obj.get("success_count")==1) { //json응답이 null이 아니면서 성공 count가 있다면 
//				smsHistory.setShSuccessYn(true);
//			}else {
//				smsHistory.setShSuccessYn(false);
//				smsHistory.setShFailReason(failReason);
//			}
//			smsDAO.saveSMSHistory(smsHistory);
//		}
        
    }

    /**
     * 시간 변환 
     * 
     * @param time
     * @return
     */
    private String convertToKoreanTime(String time) {
        // "AM " 또는 "PM "을 제거
        String timeWithoutPeriod = time.replace("AM ", "").replace("PM ", "");

        String[] hourMinute = timeWithoutPeriod.split(":");
        int hour = Integer.parseInt(hourMinute[0]);
        int minute = Integer.parseInt(hourMinute[1]);

        // 오전/오후 구분
        String timeOfDay = (time.contains("AM")) ? "오전" : "오후";

        // 12시간 형식으로 변환
        if (timeOfDay.equals("오후") && hour < 12) {
            hour += 12;
        }

        return String.format("%s %d:%02d", timeOfDay, hour, minute);
    }



}
