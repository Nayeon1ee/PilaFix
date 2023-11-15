package com.dev.pilafix.admin.terms;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.pilafix.admin.center_manage.CenterVO;
import com.dev.pilafix.admin.center_manage.impl.CenterDAO;
import com.dev.pilafix.member.login.MemberSessionService;

@Controller
public class TermsController {
	@Autowired
	private TermsService service;
	
	@Autowired
	private JavaMailSender mailSender;
	

	
	/**
	 * �̿����� ��
	 */
	@GetMapping("/getTerms.do")
	public String getTerms(@RequestParam("tmCode")Integer tmCode, Model model) {
		model.addAttribute("terms", service.getTerms(tmCode));
//		return "terms/getTerms.jsp";
		return "admin/admin_terms_detail";
	}
	

	@GetMapping("/getTermsList.do")
	public String getTermsList(Model model) {
		model.addAttribute("termsList", service.getTermsList());
		return "admin/admin_terms";
	}

	
	@GetMapping("/insertTerms.do")
	public String insertTerms() {
//		return "terms/insertTerms.jsp";
		return "admin/admin_terms_register";
	}

	@PostMapping("/insertTerms.do")
	public String insert(TermsVO vo) {
		service.insertTerms(vo);
		return "redirect:getTermsList.do";
	}

	

	
	
	/**
	 * �̿��� �����ϱ�
	 * ������ ��������� ���� �̸��� �߼� : �߼��̷� �׿�����
	 */
	@GetMapping("/updateTerms.do")
	public String updateTerms(@RequestParam("tmCode") Integer tmCode, Model model) {
		model.addAttribute("terms", service.getTerms(tmCode));
		return "admin/admin_terms_edit";
	}
	
	@PostMapping("/updateTerms.do")
	public String update(TermsVO vo, Model model) {
		service.updateTerms(vo);
		
//		/* �߼��̷¸޼��� ȣ�� ���� �̸��Ϲ߼� ����� ����Ʈ������ */
//		 List<CenterVO> centers = service.getCenterList();
//		    for (CenterVO center : centers) {
//		        service.sendEmailAndInsertSendEmailHistory(center);
//		    }
		return "redirect:getTermsList.do";

	}

	@GetMapping("/deleteTerms.do")
	public String delete(int tmCode) {
		service.deleteTerms(tmCode);
		return "redirect:getTermsList.do";
	}
	
	
	
	
}
