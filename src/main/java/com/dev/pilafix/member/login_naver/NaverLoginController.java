package com.dev.pilafix.member.login_naver;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.common.member.MemberVO;

@Controller
public class NaverLoginController {
	
	@Autowired
	private NaverLoginService service;
	
	@RequestMapping("/naver.do")
    public String naver() {
        return "member/naverLoginTest";
    }
	
	 @RequestMapping(value="/callback.do", method=RequestMethod.GET)
	    public String callBack(){
	        return "member/naverLoginCallback";
	    }
	 
	 @PostMapping("/naverLogin.do")
	 @ResponseBody
	 public String handleProfileData(@RequestBody NaverVO profileData,HttpSession session ) {
	        // Now you can access individual fields of profileData
	        System.out.println("Received profile data: " + profileData.toString());
	        // Process the data as needed
//	        Map<String, Object> naverProfileData = new HashMap<>();
//	        naverProfileData.put("naverProfileData", naverProfileData);
	        String email = profileData.getEmail();
	        //네이버 프로필에서 받아온 값 중에서 아이디가 디비에 존재하는지 확인 (1이면 존재,0이면 없음)
	        int dbIdCheck = service.dbIdCheck(email);
	        System.out.println(dbIdCheck);
	        
	        //아이디 디비에 존재하면 그사람 정보 세션에 담아서 그사람 메인 뿌려주고 
	        if (dbIdCheck > 0) {
	        	MemberVO member =  service.getMember(email);
	        	//여기에서 멤버가 널이냐고 물업고 찍어보기 => 멤버 없다고 나옴
	        	if(member == null) {
	        		System.out.println("멤버없음");
	        	}else {
	        		System.out.println("멤버 있음");
	        	}
	        	//System.out.println("CsRoleCode: " + member.getCsRoleCode());
	        	session.setAttribute("member", member);
	        	if(member != null && "TR".equals(member.getCsRoleCode())) {
	        		System.out.println("강사 페이지메인 url써야함");
	        		return "강사 페이지메인 url써야함";
	        	}else{
	        		System.out.println("회원 페이지메인 url써야함");
	        		return "회원 페이지메인 url써야함";
	        	}
	        	
	        //디비에 정보 없으면 회원 디비에 정보 넣고(회원가입 시키고) 메인 뿌려줌
	        }else {
	        	//service.insertNaverMember(email);
	        	
	        }
	       
	        return "Data received successfully!";
	       // return "redirect:/getNaverMemInfo.do";
	    }
	
	 /**
	 * 네이버로 로그인한 사람 정보가 회원디비에 있으면 그사람정보 가져와서 메인뿌려주고
	 * 디비에 정보 없으면 회원 디비에 정보 넣고(회원가입하고) 메인 뿌려줌
	 * @return
	 */
	 @GetMapping("/getNaverMemInfo.do")
	public String getNaverMemInfo() {
        return "";
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
