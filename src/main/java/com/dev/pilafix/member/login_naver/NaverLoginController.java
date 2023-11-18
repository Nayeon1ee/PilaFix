package com.dev.pilafix.member.login_naver;

import java.sql.Date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

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
	        session.setAttribute("naverMemberProfile", profileData);
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
//	        	if(member == null) {
//	        		System.out.println("멤버없음");
//	        	}else {
//	        		System.out.println("멤버 있음");
//	        	}
	        	//System.out.println("csRoleCode: " + member.getCsRoleCode());
	        	session.setAttribute("member", member);
	        	if(member != null && "TR".equals(member.getCsRoleCode())) {
	        		System.out.println("강사 페이지메인 url써야함");
	        		return "main.do";
	        	}else{
	        		System.out.println("회원 페이지메인 url써야함");
	        		return "main.do";
	        	}
	        	
	        //디비에 정보 없으면 회원 디비에 정보 넣고(회원가입 시키고) 메인 뿌려줌
	        }else {
	        	//int result = service.insertNaverMember(email);
	        	return "choose.do";
	        }
	       
//	        return "Data received successfully!";
	       // return "redirect:/getNaverMemInfo.do";
	    }
	 
	 // 네이버 로그인시 기존에 회원가입 되어있는 사람일경우 메인 뿌려줌 
	 // 리턴 값 나중에 메인 주소로 변경해야함 
	@GetMapping("/main.do")
		public String main() {
	        return "member/testMain";
	    }
	
	// 기존에 회원가입 안된사람은 회원/강사 선택하는 화면으로 보냄
	@GetMapping("/choose.do")
	public String choose() {
        return "member/chooseRole";
    }
	
	//회원 강사 선택 화면에서 선택하고 확인누르면 이제 디비에 저장
	@PostMapping("/insertNaverMember.do")
	@ResponseBody
	public String insertNaverMember(@RequestBody Map<String, String> role,HttpSession session) {
		//System.out.println("강사회원 선택값: "+role.get("role"));
		
		//String roleCode = role.get("role");
		NaverVO naverMemberProfile = (NaverVO) session.getAttribute("naverMemberProfile");
		//System.out.println("멤버 안의 값 확인 :" + naverMemberProfile.getMobile());
		
		//한번에 받아온 핸드폰 번호 잘라서 각 변수에 담기
		String mobileNumber = naverMemberProfile.getMobile();
		String[] parts = mobileNumber.split("-");
		naverMemberProfile.setNum1(parts[0]);
		naverMemberProfile.setNum2(parts[1]);
		naverMemberProfile.setNum3(parts[2]);
	    System.out.println("확인용 자른 전화번호 다시 가져오기 :"+naverMemberProfile.getNum1()+naverMemberProfile.getNum2()+naverMemberProfile.getNum3());
		//F면 여자 M이면 남자라고 저장하기
		String gender = naverMemberProfile.getGender();
		if ("F".equals(gender)) {
			naverMemberProfile.setnGender("여자");
	    } else if ("M".equals(gender)) {
	    	naverMemberProfile.setnGender("남자");
	    }
		System.out.println("확인용 성별 : "+naverMemberProfile.getnGender());
		//생일 합치기
		String combinedBirth = naverMemberProfile.getBirthyear() + "-" + naverMemberProfile.getBirthday();
		System.out.println("타입 변환전 데이터 : "+combinedBirth);
		
		naverMemberProfile.setBirth(transformDate(combinedBirth));
		System.out.println("확인용 생일 합치기 : " + naverMemberProfile.getBirth());
		
		//회원/강사 선택값 VO에 저장
		naverMemberProfile.setChooseRole(role.get("role"));
		System.out.println("확인용 회원강사 선택값 : "+naverMemberProfile.getChooseRole());
		
		Map<String, Object> naverMember = new HashMap<>();
		naverMember.put("member", naverMemberProfile);
		service.insertNaverMember(naverMember);
        return "main.do";
    }
	public Date transformDate(String combinedBirthc) {
		Date d = Date.valueOf(combinedBirthc);
		return d;
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
