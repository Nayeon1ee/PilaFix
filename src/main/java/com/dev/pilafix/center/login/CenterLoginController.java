package com.dev.pilafix.center.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dev.pilafix.common.member.CenterVO;


@Controller
public class CenterLoginController {
	
	@Autowired
	private CenterLoginService service;
	
	/**
	 * 로그인 테스트
	 * @return
	 */
	@GetMapping("/centerLogin.do")
	public String center_login() {
		return "center/center_login";
	}
	/**
	 * 로그인할때 암호화된 비밀번호와 비교하여 로그인
	 * member.getCsRoleCode 가 "ME"이면 회원의 메인페이지, 아니면 강사의 메인페이지로 이동
	 * 로그인 실패시 실패 메시지
	 */
	
	@PostMapping("/centerLogin.do")
	public String centerLogin(@RequestParam("ctId") String ctId,
	                          @RequestParam("ctPassword") String ctPassword,
	                          HttpSession session, RedirectAttributes redirectAttrs) {
	    
	    CenterVO center = service.centerLogin(ctId, ctPassword);
	    
	    if (center != null) {
	        Map<String, Object> loginCenter = new HashMap<>();
	        loginCenter.put("ctCode", center.getCtCode());
	        loginCenter.put("ctName", center.getCtName());
	        
	        // 세션에 Map 저장 
	        session.setAttribute("loginCenter", loginCenter);
	        //가입 완료되면 
	        
	        return "center/center_index";  
	    } else {
	        redirectAttrs.addFlashAttribute("loginError", "존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.");
	        return "redirect:centerLogin.do"; 
	    }
	}
}