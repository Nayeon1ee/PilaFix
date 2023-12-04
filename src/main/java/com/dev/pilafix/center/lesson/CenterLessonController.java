package com.dev.pilafix.center.lesson;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	
//	@PostMapping("/insertCenterLesson.do")
//	public String insert(CenterLessonVO vo, @RequestBody List<DateListVO> dateList) {        
//	        for (DataListVO data : dataList) {
//	        	System.out.println("Received Data: " + data.toString());
//	        	vo.setList(dataList);
//	        	vo.setLsCode(data.getLsCode());
//
//	            vo.setLsName(data.getLsName());
//	            
//	            vo.setLsType(data.getLsType());
//	           
//	            vo.setLsDate(data.getLsDate());
//	            
//	            vo.setLsTime(data.getLsTime());
//	            
//	            vo.setLsCapacity(data.getLsCapacity());
//	            
//	            vo.setLsCurrentApplicants(data.getLsCurrentApplicants());
//	            
//	            vo.setTrainerMemberCode(data.getTrainerMemberCode());
//	            
//	            vo.setLsContent(data.getLsContent());
//	            
//	            vo.setLsRegistrationDate(data.getLsRegistrationDate());
//	            
//	            vo.setLsCloseYN(data.isLsCloseYN());
//	            
//	            vo.setCenterCode(data.getCenterCode());
//	        }
//	        service.insertCenterLesson(vo);
//	    
//	    return "redirect:getCenterLessonList.do";
//	}
	
	// 게시글 하나만
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

	// 리스트로 받기
//	@RequestMapping(value="/insertCenterLesson.do", method=RequestMethod.POST, consumes="application/x-www-form-urlencoded")
//	@ResponseBody
//	@PostMapping("/insertCenterLesson.do")
//	public String insert(HttpSession session,dataListVO vo, @ModelAttribute List<dataListVO> list) {
//	    Map<String, Object> center = (Map<String, Object>) session.getAttribute("loginCenter");
//	    
//	    if(!center.isEmpty()) {
//	        int centerCode = (int) center.get("ctCode");
//	        
//	        System.out.println("컨트롤러에서 받은 lsCode : " + vo);
//	        vo.setCenterCode(centerCode);
//            service.insertCenterLesson(vo);
//	        
//	        for (CenterLessonVO vo : lessonList) {
//	        	System.out.println("롹인" + lessonList);
//	            vo.setCenterCode(centerCode);
//	            service.insertCenterLesson(vo);
//	        }
//	    }
//	    return "redirect:getCenterLessonList.do";
//	}
	
	@GetMapping("/deleteCenterLesson.do")
	public String delete(String lsCode) {
		service.deleteCenterLesson(lsCode);
		return "redirect:getCenterLessonList.do";
	}
}
