package com.dev.pilafix.member.ticket.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.ticket.CenterTicketVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.member.ticket.MemberTicketService;
import com.dev.pilafix.member.ticket.MemberTicketVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Service
public class MemberTicketServiceImpl implements MemberTicketService {

	@Autowired
	private MemberTicketDAO dao;

	@Override
	public List<CenterVO> getConnCenterList(int csMemberCode) {
		return dao.getConnCenterList(csMemberCode);

	}

	// 해당 센터의 수강권정보 가져옴
	@Override
	public List<CenterTicketVO> getCenterTicketInfo(int ctCode) {
		return dao.getCenterTicketInfo(ctCode);
	}

	// 해당 센터의 해당 수강권의 상세정보 가져오는 메서드
	@Override
	public CenterTicketVO getTicketDetail(String tkCode) {
		return dao.getTicketDetail(tkCode);
	}

	// 센터코드로 해당 센터 이용정책 가져옴
	@Override
	public List<UserguideVO> getCenterTicketGuide(int centerCode) {
		return dao.getCenterTicketGuide(centerCode);
	}

	// 그룹수강권 결제시 그룹수강권 이미 보유중인지 확인하는 것
	@Override
	public String groupTicketCheck(int csCode) {
		return dao.groupTicketCheck(csCode);
	}

	// 개인수강권 결제시 개인수강권 이미 보유중인지 확인하는 것
	@Override
	public String personalTicketCheck(int csCode) {
		return dao.personalTicketCheck(csCode);
	}
	
	
	//결제 테이블에 결제정보 삽입 & 결제하면 회원테이블에 수강권정보 업데이트
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean insertPaymentAndUpdateMemberTicketInfo(MemberTicketVO vo) {
		try {
			dao.insertPaymentinfo(vo);
			dao.updateMemberTicketInfo(vo);
			return true;
			
		} catch (Exception e) {
			// 예외 처리
			throw new RuntimeException("데이터 베이스 업데이트 실패", e);
		}
	}
	
	//토큰 가져오는 메서드
		public String getToken(String apiKey, String secretKey) throws IOException {
	        URL url = new URL("https://api.iamport.kr/users/getToken");
	        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
	 
	        // 요청 방식을 POST로 설정
	        conn.setRequestMethod("POST");
	 
	        // 요청의 Content-Type과 Accept 헤더 설정
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("Accept", "application/json");
	 
	        // 해당 연결을 출력 스트림(요청)으로 사용
	        conn.setDoOutput(true);
	 
	        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
	        JsonObject json = new JsonObject();
	        json.addProperty("imp_key", apiKey);
	        json.addProperty("imp_secret", secretKey);
	 
	        // 출력 스트림으로 해당 conn에 요청
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        bw.write(json.toString()); // json 객체를 문자열 형태로 HTTP 요청 본문에 추가
	        bw.flush(); // BufferedWriter 비우기
	        bw.close(); // BufferedWriter 종료
	 
	        // 입력 스트림으로 conn 요청에 대한 응답 반환
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        Gson gson = new Gson(); // 응답 데이터를 자바 객체로 변환
	        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
	        String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
	        br.close(); // BufferedReader 종료
	 
	        conn.disconnect(); // 연결 종료
	 
	        System.out.println(accessToken);
	        return accessToken;
	    }
		
		//결제 취소 메서드(시스템오류일 겨우 디비갈 필요 없음)
		public void refundRequest(String access_token, String imp_uid) throws IOException {
	        URL url = new URL("https://api.iamport.kr/payments/cancel");
	        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
	 
	        // 요청 방식을 POST로 설정
	        conn.setRequestMethod("POST");
	 
	        // 요청의 Content-Type, Accept, Authorization 헤더 설정
	        conn.setRequestProperty("Content-type", "application/json");
	        conn.setRequestProperty("Accept", "application/json");
	        conn.setRequestProperty("Authorization", access_token);
	 
	        // 해당 연결을 출력 스트림(요청)으로 사용
	        conn.setDoOutput(true);
	 
	        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
	        JsonObject json = new JsonObject();
	        json.addProperty("imp_uid", imp_uid);
	 
	        // 출력 스트림으로 해당 conn에 요청
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        bw.write(json.toString());
	        bw.flush();
	        bw.close();
	 
	        // 입력 스트림으로 conn 요청에 대한 응답 반환
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        br.close();
	        conn.disconnect();
	 
	        //log.info("결제 취소 완료 : 주문 번호 {}", merchant_uid);
	       
	    }
		
		//결제 취소 메서드(사용자 요구에 의한 결제 취소)
				public void refundMemberRequest(String access_token, String imp_uid) throws IOException {
			        URL url = new URL("https://api.iamport.kr/payments/cancel");
			        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			 
			        // 요청 방식을 POST로 설정
			        conn.setRequestMethod("POST");
			 
			        // 요청의 Content-Type, Accept, Authorization 헤더 설정
			        conn.setRequestProperty("Content-type", "application/json");
			        conn.setRequestProperty("Accept", "application/json");
			        conn.setRequestProperty("Authorization", access_token);
			 
			        // 해당 연결을 출력 스트림(요청)으로 사용
			        conn.setDoOutput(true);
			 
			        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
			        JsonObject json = new JsonObject();
			        json.addProperty("imp_uid", imp_uid);
			 
			        // 출력 스트림으로 해당 conn에 요청
			        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			        bw.write(json.toString());
			        bw.flush();
			        bw.close();
			 
			        // 입력 스트림으로 conn 요청에 대한 응답 반환
			        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        br.close();
			        conn.disconnect();
			        
			        
			        //log.info("결제 취소 완료 : 주문 번호 {}", merchant_uid);
			       
			    }

}
