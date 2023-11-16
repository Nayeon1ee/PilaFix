package com.dev.pilafix.member.login_naver;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
//	 @PostMapping("/naver/naverLogin.do")
//	 @ResponseBody
//	 public String saveNaverLogin(@RequestParam("birthyear") String birthyear, @RequestParam("birthday") String birthday, @RequestParam("email") String email, @RequestParam("gender") String gender, @RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("mobile") String mobile) {
//		 System.out.println("#############################################");
//		    System.out.println(birthyear);
//		    System.out.println(birthday);
//		    System.out.println(email);
//		    System.out.println(gender);
//		    System.out.println(id);
//		    System.out.println(name);
//		    System.out.println(mobile);
//		    System.out.println("#############################################");
//		 
//		    NaverVO naver = new NaverVO();
//		    naver.setBirthyear(birthyear);
//		    naver.setBirthday(birthday);
//		    naver.setEmail(email);
//		    naver.setGender(gender);
//		    naver.setId(id);
//		    naver.setName(name);
//		    naver.setMobile(mobile);
//		    
//		    
//		    System.out.println("zzzzz =" +naver.getEmail());
//		 // ajax���� ���� ������� ok���� no������ ���� �ٸ� �������� �� �� �ְԲ� result�� �⺻���� "no"�� ����
//		    String result = "no";
//		    
//		    if(naver!=null) {
//		    	// naver�� ������� �ʴ´ٴ°� �����͸� �� �޾ƿԴٴ� ���̹Ƿ� result�� "ok"�� ����
//		        result = "ok";
//		    }
//		 
//		    return result;
//		    
//		    }

}
