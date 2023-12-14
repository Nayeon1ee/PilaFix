package com.dev.pilafix.member.login_kakao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.common.member.MemberVO;

@Controller
public class KakaoLoginController {
	
	@Autowired
	private KakaoLoginService service;
	
	
	@GetMapping("/getkakaologin.do")
	public String getkakaoLogin() {
		return "member/kakaoTest";
	}

	
	//12.14테스트중
//	@GetMapping("/kakaoTest.do")
//    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session){
//        System.out.println("####### " + code);
//        
//        String access_Token = service.getAccessToken(code);
//        KakaoVO userinfo = service.getuserinfo(access_Token);
//        session.setAttribute("user", userinfo);
//        
//        // 기존 사용자 여부 확인
////        boolean isExistingUser = service.checkExistingUser(userinfo);
//        
//        if (isExistingUser) {
//            // 이미 가입된 사용자라면 메인페이지로 리다이렉트
//            return "redirect:/kakaoLogin.do";
//        } else {
//            // 가입되지 않은 사용자라면 추가 정보 입력 페이지로 이동
//            return "redirect:/additionalInfoPage.do";
//        }
//    }
//
//    @GetMapping("/kakaoLoginTest.do")
//    public String kakaoLoginRedirect(HttpSession session) {
//        KakaoVO userinfo = (KakaoVO) session.getAttribute("user");
//        if (userinfo != null) {
//            // 세션 정보 있으면
//            return "member/test_main";
//        } else {
//            // 세션이 없으면
//            return "member/login"; 
//        }
//    }







	

// 카카오 로그인 추가페이지 만들기 위한 주석처리 12.14
	/**
	 * 클라이언트로부터 전달받은 액세스 토큰을 사용하여 카카오 로그인 서비스를 호출
	 */
	@GetMapping("/kakaoTest.do")
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session){
        System.out.println("####### " + code);
        
        String access_Token = service.getAccessToken(code);
        KakaoVO userinfo = service.getuserinfo(access_Token);
        session.setAttribute("user", userinfo);
        
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###nickname#### : " + userinfo.getK_name());
        System.out.println("###email#### : " + userinfo.getK_email());

       return "redirect:/kakaoLoginTest.do";
	
	}
	

	// 로그인 후 리디렉션 처리를 위한 매핑
    @GetMapping("/kakaoLoginTest.do")
    public String kakaoLoginRedirect(HttpSession session) {
        KakaoVO userinfo = (KakaoVO) session.getAttribute("user");
        if (userinfo != null) {
            // 사용자 정보가 있으면, 원하는 페이지로 리디렉션
            return "member/test_main";
        } else {
            // 사용자 정보가 없으면, 로그인 페이지나 에러 페이지로 리디렉션
            return "redirect:/selectMeOrTr.do"; 
        }
    }
	
	

	
}