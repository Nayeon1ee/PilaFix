package com.dev.pilafix.center.lesson;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CenterLessonController {
	
	@Autowired
	private CenterLessonService service;
	
	@GetMapping("/getCenterLessonList.do")
	public String getCenterLessonList(HttpSession session, Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		
		if(center != null && !center.isEmpty()) {
			int centerCode = (int)center.get("ctCode");
			model.addAttribute("CenterLessonList", service.getCenterLessonList(centerCode));
			return "center/center_class_management";
			
		}
		return "redirect:centerLogin.do";
	}
	
	@GetMapping("/getCenterLesson.do")
	public String getCenterLesson(@RequestParam("seq") String lsCode, Model model) {
		model.addAttribute("centerLesson", service.getCenterLesson(lsCode));
		return "center/center_detail_class";
	}
	
	@PostMapping("/updateCenterLesson.do")
	public String updateCenterLesson(CenterLessonVO vo) {
		service.updateCenterLesson(vo);
		return "redirect:getCenterLessonList.do";
	}
	
	@GetMapping("/insertCenterLesson.do")
	public String insertCenterLesson(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		session.setAttribute("user", 111);

		int centerCode = (Integer)session.getAttribute("user");
		
		model.addAttribute("trainerList", service.getTrainerCode(centerCode));
		return "center/center_create_class";
	}
	
	@ResponseBody
	@GetMapping("/getTrainerCode.do")
	public List<CenterLessonVO> getTrainerCode(HttpSession session) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		int centerCode = (Integer)center.get("ctCode");
		List<CenterLessonVO> trainerCode = service.getTrainerCode(centerCode);
		return trainerCode;
	}
	
	@PostMapping("/insertCenterLesson.do")
	public String insert(CenterLessonVO vo) {
		System.out.println(vo.toString());
		service.insertCenterLesson(vo);
		return "redirect:getCenterLessonList.do";
	}
	
	@GetMapping("/deleteCenterLesson.do")
	public String delete(String lsCode) {
		service.deleteCenterLesson(lsCode);
		return "redirect:getCenterLessonList.do";
	}
	
}
