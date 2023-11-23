package com.dev.pilafix.member.reserve;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.CenterVO;

@Controller
public class ReservController {
	
	@Autowired
	private ReservService service;
	
	@GetMapping("reservPage.do")
	public String reservPage(HttpSession session, Model model) {
		// 예약 메인 페이지 
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		
	    if (loginUser != null) {
	    	// 세션에서 회원번호 가져옴 
	    	int csMemberCode = (int) loginUser.get("csMemberCode");

	    	// 꺼내온 회원번호로 ct_code, ct_name이 담긴 list 조회 
	    	List<CenterVO> connCenterList = service.getConnCenterList(csMemberCode);
	    	model.addAttribute("connCenterList",connCenterList);
	    	
	    	// 리스트에서 꺼내와서 첫 번째에 있는 센터 코드 꺼내서 그 센터가 가진 수업 내역 조회 
	    	int ctCode = connCenterList.get(0).getCtCode();
	    	
	    	if(ctCode != 0){ // 첫 번째로 연동된 센터코드가 있다면 
	    		model.addAttribute("lessonList", service.getLessonList(ctCode));
	    	}
	    	
	    	return "member/reserv_test";
	        
	    }else {
	    	return "redirect:memberLogin.do";
	    }
	}
	
	@PostMapping("/getLessonList.do")
	@ResponseBody
	public List<CenterLessonVO> getLessonList(int ctCode,Model model){
		System.out.println("센터코드: " + ctCode);
		List<CenterLessonVO> lessonList = service.getLessonList(ctCode);
		return lessonList;
	}
	
	
	
	
	

}
