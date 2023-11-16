package com.dev.pilafix.member.login_naver;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.http.HttpResponse;

@Controller
public class NaverLoginController {
	
	@RequestMapping("/naver.do")
    public String naver() {
        return "member/naverLoginTest";
    }
	
	 @RequestMapping(value="/naver/callback.do", method=RequestMethod.GET)
	    public String callBack(){
	        return "member/naverLoginCallback";
	    }
	 
	 @PostMapping("/naver/naverLogin.do")
	 @ResponseBody
	 public String handleProfileData(@RequestBody NaverVO profileData ) {
	        // Now you can access individual fields of profileData
	        System.out.println("Received profile data: " + profileData.toString());
	        // Process the data as needed

	        // Return a response if necessary
	        return "Data received successfully!";
	    }
	
//	 @PostMapping("/naverLogin.do")
//	 @ResponseBody
//	 public String saveNaverLogin(@RequestParam("n_birthyear") String n_birthyear, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_mobile") String n_mobile) {
//		 System.out.println("#############################################");
//		    System.out.println(n_birthyear);
//		    System.out.println(n_birthday);
//		    System.out.println(n_email);
//		    System.out.println(n_gender);
//		    System.out.println(n_id);
//		    System.out.println(n_name);
//		    System.out.println(n_mobile);
//		    System.out.println("#############################################");
//		 
//		    NaverVO naver = new NaverVO();
//		    naver.setN_birthyear(n_birthyear);
//		    naver.setN_birthday(n_birthday);
//		    naver.setN_email(n_email);
//		    naver.setN_gender(n_gender);
//		    naver.setN_id(n_id);
//		    naver.setN_name(n_name);
//		    naver.setN_mobile(n_mobile);
//		    
//		    
//		    System.out.println("zzzzz =" +naver.getN_email());
//		 // ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
//		    String result = "no";
//		    
//		    if(naver!=null) {
//		    	// naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
//		        result = "ok";
//		    }
//		 
//		    return result;
//		    
//		    }

}
