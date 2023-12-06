package com.dev.pilafix.member.ConnectCt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ConnectCtController {
	
	@Autowired
	private ConnectCtService service;
	
	/**
	 * 센터연동화면 요청
	 * @return
	 */
	//로그인후 센터연동화면 나옴 이 url은 기능 테스트위한 url이고 나중에 로그인이랑 연결하면 지워야함
	@GetMapping("/ct.do")
	public String ct(){
//		return "member/ctConnect";
		return "member/ctConnect";
	}

	/**
	 * 연동할 센터 검색시 디비가서 키워드에 맞는 센터 검색해서 화면에 뿌려줌 
	 * @param searchKeyword
	 * @return
	 */
	@GetMapping("/searchCt.do")
	@ResponseBody
	public List<ConnectCtVO> searchCt(String searchKeyword){
		System.out.println("화면에서 컨트롤러로 넘어온 검색 키워드" + searchKeyword);
	
		return service.searchCt(searchKeyword);
	}
	
	@PostMapping("connectRequest.do")
	@ResponseBody
	public int connectRequest(HttpSession session,@RequestParam int ctCode){
		//MemberVO member =   (MemberVO) session.getAttribute("member");
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		user.put("ctCode", ctCode);
		int result = service.connectRequest(user);
		System.out.println("#######쿼리문의 결과값"+result);
		return result;
	}
	
	
	/**
	 * 연동 요청 가능 여부 체크 
	 * 
	 * 1. 연동센터 한도 초과 (로그인한 회원의 연동된 센터가 3개)
	 * 2. 기 요청건 존재 여부 확인 
	 * 
	 * @param session
	 * @param lsCode
	 * @return
	 */
	@PostMapping("checkRequest.do")
	@ResponseBody
	@Async
	public Map<String, Integer> checkRequest(HttpSession session, int ctCode) {
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		Map<String, Integer> checkResult = new HashMap<>();
		
		if(loginUser != null) {
			int csMemberCode = (int) loginUser.get("csMemberCode");
			checkResult = service.checkRequest(csMemberCode, ctCode);
			System.out.println("요청 가능 여부 컨트롤러 :"+checkResult);
		}
		return checkResult;
	}	

}