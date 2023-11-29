package com.dev.pilafix.member.community;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberCommunityController {
	@Autowired
	private MemberCommunityService service;
	
	// 전체 리스트 확인
	@GetMapping("getMemberCommunityList.do")
	public String getMemberCommunityList(HttpSession session, Model model) {
		
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		if(user != null && !user.isEmpty()) {
			int memberCsNumberCode = (Integer)user.get("csMemberCode");
			model.addAttribute("csNumberCode", memberCsNumberCode);
		} else {
			model.addAttribute("csNumberCode", 0);
		}
		
		model.addAttribute("getMemberCommunityList", service.getMemberCommunityList());
		return "member/member_community";
	}
	
	// 상세보기
	@GetMapping("getMemberCommunity.do")
	public String getMemberCommunity(@RequestParam("memberCmNumber") Integer memberCmNumber, HttpSession session, Model model) {
		MemberCommunityVO memberCommunity = service.getMemberCommunity(memberCmNumber);
		
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		if(user != null && !user.isEmpty()) {
			int memberCsNumberCode = (Integer)user.get("csMemberCode");
			model.addAttribute("csNumberCode", memberCsNumberCode);
			// 답글 불러오기
			model.addAttribute("memberCommunityReply", service.getMemberCommunityReply(memberCmNumber));
			model.addAttribute("blameList", service.getBlameList());
		} else {
			model.addAttribute("csNumberCode", 0);
		}
		
		//조회수 증가
		service.updateMemberCommunityViewCnt(memberCmNumber);
		int updatedList = service.updateMemberCommunityViewCnt(memberCommunity.getMemberCmViews());
		
		
		model.addAttribute("memberCommunity", memberCommunity);
		model.addAttribute("updatedList", updatedList);
		return "member/member_community_detail";
	}
	
	// 신고하기
	@PostMapping("insertBlamer.do") 
	public String insertBlamer(@RequestParam("memberCmNumber") int memberCmNumber, int memberCmWriterMemberCode, String memberBlameReasonCode, String memberBlamerIp, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		int memberBlamerMemberCode = (int)user.get("csMemberCode");
		session.setAttribute("user", memberBlamerMemberCode);
		
		int memberCode = (int) session.getAttribute("user");
		model.addAttribute("memberList",memberCode);
		
	    Map<String, Object> blame = new HashMap<String, Object>();
	    blame.put("memberCmNumber", memberCmNumber);
	    blame.put("memberCmWriterMemberCode", memberCmWriterMemberCode);
	    blame.put("memberBlamerIp", memberBlamerIp);
	    blame.put("memberBlameReasonCode", memberBlameReasonCode);
	    blame.put("memberBlamerMemberCode", memberBlamerMemberCode);
	    System.out.println("확인 중" + memberCmWriterMemberCode);

	    service.updateMemberCommunityBlameCnt(memberCmNumber);
	    
		
	    service.insertBlame(blame);
	    return "redirect:getMemberCommunity.do?memberCmNumber=" + memberCmNumber;
	}
	
	
	
	// 글쓰기 페이지
	@GetMapping("insertMemberCommunity.do")
	public String insertMemberCommunity() {
		return "member/member_community_register";
	}

	// 글쓰기 기능
	@PostMapping("/insertMemberCommunity.do")
	public String insert(MemberCommunityVO vo, HttpServletRequest request, HttpSession session) {
		
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginUser");
		int memberCmWriterMemberCode = (Integer)user.get("csMemberCode");
		vo.setMemberCmWriterMemberCode(memberCmWriterMemberCode);
		System.out.println("확인용" + user.get("csMemberCode"));
		
		//아이피 주소 가져오기
		String cmWriterIp = request.getRemoteAddr();
	    vo.setCmWriterIp(cmWriterIp);
		
	    service.insertMemberCommunity(vo);
		return "redirect:getMemberCommunityList.do";
	}

	// 수정 페이지
	@GetMapping("updateMemberCommunity.do")
	public String updateMemberCommunity(@RequestParam("memberCmNumber") Integer memberCmNumber, Model model) {
		model.addAttribute("memberCommunity", service.getMemberCommunity(memberCmNumber));
		return "member/member_community_edit";
	}

	// 수정 기능
	@PostMapping("/updateMemberCommunity.do")
	public String update(MemberCommunityVO vo) {
		service.updateMemberCommunity(vo);
		return "redirect:getMemberCommunityList.do";
	}

	// 삭제 기능
	@GetMapping("/deleteMemberCommunity.do")
	public String delete(int memberCmNumber) {
		service.deleteMemberCommunity(memberCmNumber);
		return "redirect:getMemberCommunityList.do";
	}

	// 답글 쓰기
	@PostMapping("/insertMemberCommunityReply.do")
	public String insertMemberCommunityReply(MemberCommunityVO vo) {
		service.insertMemberCommunityReply(vo);
		int memberCmNumber = vo.getMemberCmNumber();
		return "redirect:getMemberCommunity.do?memberCmNumber=" + memberCmNumber;
	}
	
	// 답글 수정
	@PostMapping("/updateMemberCommunityReply.do")
	public String updateMemberCommunityReply(MemberCommunityVO vo) {
		service.updateMemberCommunityReply(vo);
		int memberCmNumber = vo.getMemberCmNumber();
		return "redirect:getMemberCommunity.do?memberCmNumber=" + memberCmNumber;
	}
	
	// 답글 삭제 기능
	@GetMapping("/deleteMemberCommunityReply.do")
	public String deleteMemberCommunityReply(MemberCommunityVO vo) {
		service.deleteMemberCommunityReply(vo);
		int memberCmNumber = vo.getMemberCmNumber();
		return "redirect:getMemberCommunity.do?memberCmNumber=" + memberCmNumber;
	}

}