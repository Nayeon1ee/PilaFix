package com.dev.pilafix.member.ConnectCt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ConnectCtController {
	@Autowired
	private ConnectCtService service;
	
	@GetMapping("/ct.do")
	public String ct(){
		return "member_ctConnect/ctConnect.jsp";
	}

	
	@GetMapping("/searchCt.do")
	@ResponseBody
	public List<ConnectCtVO> searchCt(String searchKeyword){
		System.out.println("화면에서 컨트롤러로 넘어온 검색 키워드" + searchKeyword);
		List<ConnectCtVO> searchCenterList = service.searchCt(searchKeyword);
		return searchCenterList;
	}

}
