package com.dev.pilafix.member.login_kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.login.impl.MemberLoginDAO;
import com.dev.pilafix.member.login_kakao.impl.KakaoLoginDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoLoginService {

	@Autowired
	private KakaoLoginDAO dao;

	@Autowired
	private MemberLoginDAO memberLoginDAO;

//	public int getMemberCodeByEmail(String authorize_code) {
//	    // 카카오로부터 액세스 토큰 받아오기
//	    String access_Token = getAccessToken(authorize_code);
//
//	    // 카카오에서 받은 정보를 Map에 저장
//	    HashMap<String, Object> userInfo = getuserinfo(access_Token);
//
//	    // 회원 정보 조회
//	    MemberVO member = memberLoginDAO.getMemberByNameAndEmail((String) userInfo.get("nickname"), (String) userInfo.get("email"));
//
//	    // 멤버코드 반환 (멤버가 존재하지 않을 경우 null 처리 필요)
//	    return (member != null) ? member.getCsMemberCode() : -1;
//	}
	
	/**
	 */
//	public KakaoVO getUserInfo(String accessToken) {
//		RestTemplate restTemplate = new RestTemplate();
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Authorization", "Bearer " + accessToken);
//        HttpEntity<String> request = new HttpEntity<>(headers);
//        
//        String url = "https://kapi.kakao.com/v2/user/me";
//        
//        ResponseEntity<KakaoVO> response = restTemplate.exchange(url, HttpMethod.GET, request, KakaoVO.class);
//        return response.getBody();
//	}

	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST
			// BufferedWriter
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=35a67dedd55982379da441c8c23e2904");
//            sb.append("&redirect_uri=http://localhost:8080/pilafix/kakaoLoginTest.do");
			sb.append("&redirect_uri=http://43.202.6.211/pilafix/kakaoLoginTest.do");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			//
			//
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode + "");

			//
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result + "");

			// Gson
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();

		} catch (IOException e) {
			e.printStackTrace();

		}
		return access_Token;
	}

	public KakaoVO getuserinfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String requestURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(requestURL); // 1.url
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// 2.url
			conn.setRequestMethod("GET"); // 3.URL
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode(); //
			System.out.println("responseCode :" + responseCode + "");
			BufferedReader buffer = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while ((line = buffer.readLine()) != null) {
				result += line;
			}

			System.out.println("response body :" + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (Exception e) {
			e.printStackTrace();
		}

		KakaoVO result = dao.findkakao(userInfo);

		System.out.println("S :" + result);

		if (result == null) {

//        	dao.kakaoinsert(userInfo);

			return dao.findkakao(userInfo);

		} else {
			return result;
			// result
		}

	}

}
