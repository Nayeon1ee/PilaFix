package com.dev.pilafix.member.login_naver;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NaverLoginController {
	
	@RequestMapping("/naver.do")
    public String naver() {
        return "member/naverLoginTest";
    }
	
	 @RequestMapping(value="/naverLogin", method=RequestMethod.GET)
	    public String callBack(){
	        return "member/naverLoginCallback";
	    }
	
	 @PostMapping("/saveNaverLogin.do")
	 @ResponseBody
	 public String saveNaverLogin(@RequestParam("n_birthyear") String n_birthyear, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_mobile") String n_mobile) {
		 System.out.println("#############################################");
		    System.out.println(n_birthyear);
		    System.out.println(n_birthday);
		    System.out.println(n_email);
		    System.out.println(n_gender);
		    System.out.println(n_id);
		    System.out.println(n_name);
		    System.out.println(n_mobile);
		    System.out.println("#############################################");
		 
		    NaverVO naver = new NaverVO();
		    naver.setN_birthyear(n_birthyear);
		    naver.setN_birthday(n_birthday);
		    naver.setN_email(n_email);
		    naver.setN_gender(n_gender);
		    naver.setN_id(n_id);
		    naver.setN_name(n_name);
		    naver.setN_mobile(n_mobile);
		    
		    
		    System.out.println("zzzzz =" +naver.getN_email());
		 
		    String result = "no";
		    
		    if(naver!=null) {
		        result = "ok";
		    }
		 
		    return result;
		    
		    }

}
