package com.dev.pilafix.center.lesson;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	/**
	 * 게시글 등록 
	 * 
	 * @param session
	 * @param lessonsArray
	 */
	@PostMapping(value = "/insertCenterLesson.do", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void insert(HttpSession session,@RequestBody List<Map<String, Object>> lessonsArray) {
	    Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
	    List<CenterLessonVO> centerLessonList = new ArrayList<>();// CenterLessonVO 객체를 담을 리스트

	    if (!center.isEmpty()) {
	        int centerCode = (int) center.get("ctCode");
	        
	        ObjectMapper objectMapper = new ObjectMapper();// json객체 파싱을 위함 

	        // 수업 데이터 처리
	        for (Map<String, Object> lessonData : lessonsArray) {
	            // json객체 파싱하여 Map을 CenterLessonVO로 변환
	            CenterLessonVO centerLesson = objectMapper.convertValue(lessonData, CenterLessonVO.class);
	            
	            // 센터코드 세팅 
	            centerLesson.setCenterCode(centerCode);
	            
	            // 리스트에 추가
	            centerLessonList.add(centerLesson);
	        }
	     service.insertCenterLesson(centerLessonList);   
	    }
	}
	
	@ResponseBody
	@GetMapping("/getTrainerCode.do")
	public List<CenterLessonVO> getTrainerCode(HttpSession session) {
		Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
		int centerCode = (Integer)center.get("ctCode");
		List<CenterLessonVO> trainerCode = service.getTrainerCode(centerCode);
		return trainerCode;
	}

	@GetMapping("/deleteCenterLesson.do")
	public String delete(String lsCode) {
		service.deleteCenterLesson(lsCode);
		return "redirect:getCenterLessonList.do";
	}
	
	

}
