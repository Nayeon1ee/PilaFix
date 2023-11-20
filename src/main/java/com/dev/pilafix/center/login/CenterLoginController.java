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
	 * �α��� �׽�Ʈ
	 * @return
	 */
	@GetMapping("/centerLogin.do")
	public String center_login() {
		return "center/center_login";
	}
	/**
	 * �α����Ҷ� ��ȣȭ�� ��й�ȣ�� ���Ͽ� �α���
	 * member.getCsRoleCode �� "ME"�̸� ȸ���� ����������, �ƴϸ� ������ ������������ �̵�
	 * �α��� ���н� ���� �޽���
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
	        
	        // ���ǿ� Map ���� 
	        session.setAttribute("loginCenter", loginCenter);
	        //���� �Ϸ�Ǹ� 
	        
	        return "center/center_index";  
	    } else {
	        redirectAttrs.addFlashAttribute("loginError", "�������� �ʴ� ���̵�ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        return "redirect:centerLogin.do"; 
	    }
	}
}
