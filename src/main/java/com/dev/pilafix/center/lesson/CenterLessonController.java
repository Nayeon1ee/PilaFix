package com.dev.pilafix.center.lesson;

import java.util.List;

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
	public String getCenterLessonList(Model model) {
		model.addAttribute("CenterLessonList", service.getCenterLessonList());
		return "center/center_class_management";
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
		//���ǿ��� �α��� ���� �̾ƿ;� �� (�Ʒ� �ڵ�� ����)
//		int centerCode = session.getAttribute("user");
		
		HttpSession session = request.getSession();
		session.setAttribute("user", 111);

		int centerCode = (int) session.getAttribute("user");
		
		model.addAttribute("trainerList", service.getTrainerCode(centerCode));
		return "center/center_create_class";
	}
	
	@ResponseBody
	@GetMapping("/getTrainerCode.do")
	public List<CenterLessonVO> getTrainerCode(int centerCode) {
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
