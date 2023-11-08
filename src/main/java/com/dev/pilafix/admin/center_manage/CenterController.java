package com.dev.pilafix.admin.center_manage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CenterController {
	@Autowired
	private CenterService service;
	
	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/getCenterList.do")
	public String getCenterList(Model model) {
		model.addAttribute("centerList", service.getCenterList());
		return "admin_centermanage/getCenterList.jsp";
	}

	@GetMapping("/getCenter.do")
	public String getCenter(int ctCode, Model model) {
		model.addAttribute("center", service.getCenter(ctCode));
		return "admin_centermanage/getCenter.jsp";
	}


	/**
	 * Json 테스트 샘플 
	 * @return
	 */
	@RequestMapping("/jsTest.do")
	@ResponseBody
	public List<CenterVO> jsTest() {
		List<CenterVO> boardList = service.getCenterList();
		return boardList;
	}
	
	@GetMapping("/insertCenter.do")
	public String insertForm() {
		return "admin_centermanage/insertCenter.jsp";
	}

	/**
	 * 센터 등록 및 세션 저장 
	 * @param center
	 * @return
	 * @throws Exception
	 */
    @PostMapping("/insertCenter.do")
    public String insert(@ModelAttribute("center") CenterVO center, HttpSession session) {
    	service.insertCenterAndSetSession(center, session);
        return "redirect:sendEmail.do";
    }
	
	/**
	 * 이메일 발송 및 발송 이력 저장 
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/sendEmail.do")
	public String sendmail(HttpSession session) {
        CenterVO center = (CenterVO) session.getAttribute("center");
        if (center == null) {
            return "redirect:getCenterList.do";
        }

        service.sendEmailAndInsertSendEmailHistory(center);
        session.removeAttribute("center");

        return "redirect:getCenterList.do";
    }
	
}
