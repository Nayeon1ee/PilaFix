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
	
//	@PostMapping("serchFilter.do")
//	@ResponseBody
//	public String serchFilter(@RequestParam String searchType,String searchKeyword,Date startDate,Date endDate) {
//		
//		System.out.println(searchType);
//		System.out.println(searchKeyword);
//		System.out.println(startDate);
//		System.out.println(endDate);
//		return "";
//	}
	@PostMapping("/serchFilter.do")
	public String getFilteringData(String searchType,String searchKeyword,String startDate,String endDate,Model model) {
		Map<String,Object> searchCondition = new HashMap<>();
//		if (searchType=="") { searchCondition.put("searchType", null);} else {searchCondition.put("searchType", searchType);}
//		if (searchType=="") { searchCondition.put("searchKeyword", null);} else {searchCondition.put("searchKeyword", searchKeyword);}
//		if (searchType=="") { searchCondition.put("startDate", null);} else {searchCondition.put("startDate", startDate);}
//		if (searchType=="") { searchCondition.put("endDate", null);} else {searchCondition.put("endDate", endDate);}
		
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