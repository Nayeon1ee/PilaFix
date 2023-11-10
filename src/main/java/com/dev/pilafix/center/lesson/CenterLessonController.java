package com.dev.pilafix.center.lesson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CenterLessonController {
	
	@Autowired
	private CenterLessonService service;
	
	@GetMapping("/getCenterLessonList.do")
	public String getCenterLessonList(Model model) {
		model.addAttribute("CenterLessonList", service.getCenterLessonList());
		return "center_lesson/getCenterLessonList.jsp";
	}
	
	@GetMapping("/getCenterLesson.do")
	public String getCenterLesson(@RequestParam("seq") String lsCode, Model model) {
		model.addAttribute("centerLesson", service.getCenterLesson(lsCode));
		return "center_lesson/getCenterLesson.jsp";
	}
	
	@GetMapping("/insertCenterLesson.do")
	public String insertCenterLesson() {
		return "center_lesson/insertCenterLesson.jsp";
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
