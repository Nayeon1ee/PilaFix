package com.dev.pilafix.center.lesson;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("/insertCenterLesson.do")
	public String insertCenterLesson(HttpSession session, Model model) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		
		if(center != null && !center.isEmpty()) {
			int centerCode = (Integer)center.get("ctCode");
			
			model.addAttribute("trainerList", service.getTrainerCode(centerCode));
			return "center/center_create_class";
		}
		return "redirect:centerLogin.do";
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
	public String insert(HttpSession session, CenterLessonVO vo) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		
		if(!center.isEmpty()) {
			int centerCode = (int)center.get("ctCode");
			vo.setCenterCode(centerCode);
			service.insertCenterLesson(vo);
		}
		return "redirect:getCenterLessonList.do";
	}
	
	@GetMapping("/deleteCenterLesson.do")
	public String delete(String lsCode) {
		service.deleteCenterLesson(lsCode);
		return "redirect:getCenterLessonList.do";
	}
	
	
//	@PostMapping("/insertTest.do")
//	public void insertTest(HttpSession session, @RequestParam("lsName") String lsName,@RequestParam("lsType") String lsType, @RequestParam("dateTimeArray")Object[] datetimeArray ) {
//		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
//		
//		if(!center.isEmpty()) {
//			int centerCode = (int)center.get("ctCode");
//			for(int i = 0 ; i < datetimeArray.length; i++) {
//				CenterLessonVO lesson = new CenterLessonVO();
//				lesson.setLsName(lsName);
//				lesson.setLsType(lsType);
//				System.out.println(datetimeArray.toString());
//			}
////			service.insertCenterLesson(lessons);
//		}
////		return "redirect:getCenterLessonList.do";
//	}
}
