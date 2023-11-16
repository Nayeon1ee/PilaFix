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
//	 * Ŭ���̾�Ʈ�κ��� ���޹��� �׼��� ��ū�� ����Ͽ� īī�� �α��� ���񽺸� ȣ��
//	 */
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
	
	// �α��� �� ���𷺼� ó���� ���� ����
    @GetMapping("/kakaoLoginTest.do")
    public String kakaoLoginRedirect(HttpSession session) {
        KakaoVO userinfo = (KakaoVO) session.getAttribute("user");
        if (userinfo != null) {
            // ����� ������ ������, ���ϴ� �������� ���𷺼�
            return "redirect:/memberMyinfo.do";
        } else {
            // ����� ������ ������, �α��� �������� ���� �������� ���𷺼�
            return "redirect:/memberLogin.do"; 
        }
    }
	
	
//	@PostMapping("/kakaoLoginTest.do")
//	public ResponseEntity<?> kakaoLoginTest(@RequestBody String accessToken) {
//		// accessToken�� ����Ͽ� īī�� API�� ����� ���� ��û
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
