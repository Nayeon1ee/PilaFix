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
	        //���̹� �����ʿ��� �޾ƿ� �� �߿��� ���̵� ��� �����ϴ��� Ȯ�� (1�̸� ����,0�̸� ����)
	        int dbIdCheck = service.dbIdCheck(email);
	        System.out.println(dbIdCheck);
	        
	        //���̵� ��� �����ϸ� �׻�� ���� ���ǿ� ��Ƽ� �׻�� ���� �ѷ��ְ� 
	        if (dbIdCheck > 0) {
	        	MemberVO member =  service.getMember(email);
	        	//���⿡�� ����� ���̳İ� ������ ���� => ��� ���ٰ� ����
	        	if(member == null) {
	        		System.out.println("�������");
	        	}else {
	        		System.out.println("��� ����");
	        	}
	        	//System.out.println("CsRoleCode: " + member.getCsRoleCode());
	        	session.setAttribute("member", member);
	        	if(member != null && "TR".equals(member.getCsRoleCode())) {
	        		System.out.println("���� ���������� url�����");
	        		return "���� ���������� url�����";
	        	}else{
	        		System.out.println("ȸ�� ���������� url�����");
	        		return "ȸ�� ���������� url�����";
	        	}
	        	
	        //��� ���� ������ ȸ�� ��� ���� �ְ�(ȸ������ ��Ű��) ���� �ѷ���
	        }else {
	        	//service.insertNaverMember(email);
	        	
	        }
	       
	        return "Data received successfully!";
	       // return "redirect:/getNaverMemInfo.do";
	    }
	
	 /**
	 * ���̹��� �α����� ��� ������ ȸ����� ������ �׻������ �����ͼ� ���λѷ��ְ�
	 * ��� ���� ������ ȸ�� ��� ���� �ְ�(ȸ�������ϰ�) ���� �ѷ���
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
