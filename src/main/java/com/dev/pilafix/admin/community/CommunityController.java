package com.dev.pilafix.admin.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@GetMapping("/getCommunityList.do")
	public String getCommunityList(Model model) {
		model.addAttribute("communityList",service.getCommunityList());
		return "admin/admin_community";
		// jsp파일이 webapp밑에 admin_community폴더 안에 있어서
	}
	
	@GetMapping("/getCommunity.do")
	public String getCommunity(@RequestParam("cmNumber")Integer cmNumber,Model model) {
		model.addAttribute("community",service.getCommunity(cmNumber));
		return "admin/admin_community_detail";
	}
	
	@GetMapping("/deleteCommunity.do")
	public String delete(int cmNumber) {
		service.deleteCommunity(cmNumber);
		return "redirect:/getCommunityList.do"; // .do로 요청해야 위에 getCommunityList.do수행하고 디비가서 바뀐정보로 다시 가져옴
		
	}
	@GetMapping("/updateArticleOpen.do")
	public String updateArticleOpen(int cmNumber) {
		service.updateArticleOpen(cmNumber);
		return "redirect:/getCommunityList.do"; // .do로 요청해야 위에 getCommunityList.do수행하고 디비가서 바뀐정보로 다시 가져옴
		
	}
	
	// 검색필터 (부트스트랩 테이블 ajax안먹어서 조건으로 검색한 값 가지고 페이지 재로드함)
	@PostMapping("/serchFilter.do")
	public String getFilteringData(String searchType,String searchKeyword,String startDate,String endDate,Model model) {
		Map<String,Object> searchCondition = new HashMap<>();
		
		searchCondition.put("searchType", searchType);
		searchCondition.put("searchKeyword", searchKeyword);
		searchCondition.put("startDate", startDate);
		searchCondition.put("endDate", endDate);
		
		System.out.println("셀렉박스값 :"+searchCondition.get("searchType"));
		System.out.println("검색어 :"+searchCondition.get("searchKeyword"));
		System.out.println("날자시작 :"+searchCondition.get("startDate"));
		System.out.println("날짜 끝 :"+searchCondition.get("endDate"));
		
		
		
		model.addAttribute("communityList",  service.getFilteringData(searchCondition));
		
		return "admin/admin_community";
	}
}