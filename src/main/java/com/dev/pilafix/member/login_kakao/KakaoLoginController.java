package com.dev.pilafix.member.login_kakao;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoLoginController {
	
	@Autowired
	private KakaoLoginService service;
	
	
	@GetMapping("/getkakaologin.do")
	public String getkakaoLogin() {
		return "member/kakaoTest";
	}

	
//	/**
//	 * 클라이언트로부터 전달받은 액세스 토큰을 사용하여 카카오 로그인 서비스를 호출
//	 */
//	@GetMapping("/kakaoTest.do")
//    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session){
//        System.out.println("####### " + code);
//        
//        String access_Token = service.getAccessToken(code);
//        KakaoVO userinfo = service.getuserinfo(access_Token);
//        session.setAttribute("user", userinfo);
//        
//        System.out.println("###access_Token#### : " + access_Token);
//        System.out.println("###nickname#### : " + userinfo.getK_name());
//        System.out.println("###email#### : " + userinfo.getK_email());
//
//       return "redirect:/kakaoLoginTest.do";
//	
//	}
	

    @GetMapping("/kakaoLogin.do")
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) {
        String access_Token = service.getAccessToken(code);
        KakaoVO userinfo = service.getuserinfo(access_Token);

        // 사용자 정보를 세션에 저장
        session.setAttribute("user", userinfo);

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
	
	
//	@PostMapping("/kakaoLoginTest.do")
//	public ResponseEntity<?> kakaoLoginTest(@RequestBody String accessToken) {
//		// accessToken을 사용하여 카카오 API에 사용자 정보 요청
//		KakaoVO kakao = service.getUserInfo(accessToken);
//		return ResponseEntity.ok().body(kakao);
//	}
//	
	
//	@PostMapping("kakaoLoginTest.do")
//    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session){
//        System.out.println("####### " + code);
//        
//        String access_Token = service.getAccessToken(code);
//        KakaoVO userinfo = service.getuserinfo(access_Token);
//        System.out.println("###access_Token#### : " + access_Token);
//        System.out.println("###nickname#### : " + userinfo.getK_name());
//        System.out.println("###email#### : " + userinfo.getK_email());
//
//       return code;
//	
//	}
	
}