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
	public String getMemberCommunityList(Model model) {
		model.addAttribute("getMemberCommunityList", service.getMemberCommunityList());
		return "member/getMemberCommunityList";
	}
	
	// 상세보기
	@GetMapping("getMemberCommunity.do")
	public String getMemberCommunity(@RequestParam("memberCmNumber") Integer memberCmNumber, Model model) {
		MemberCommunityVO memberCommunity = service.getMemberCommunity(memberCmNumber);
		
		//조회수 증가
		service.updateMemberCommunityViewCnt(memberCmNumber);
		int updatedList = service.updateMemberCommunityViewCnt(memberCommunity.getMemberCmViews());
		
		// 답글 불러오기
		model.addAttribute("memberCommunityReply", service.getMemberCommunityReply(memberCmNumber));
		
		model.addAttribute("memberCommunity", memberCommunity);
		model.addAttribute("updatedList", updatedList);
		model.addAttribute("blameList", service.getBlameList());
		return "member/getMemberCommunity";
	}
	
	// 신고하기
	@PostMapping("insertBlamer.do") 
	public String insertBlamer(@RequestParam("memberCmNumber") int memberCmNumber, int memberCmWriterMemberCode, String memberBlameReasonCode, String memberBlamerIp, HttpServletRequest request, Model model) {
	    
	    Map<String, Object> blame = new HashMap<String, Object>();
	    blame.put("memberCmNumber", memberCmNumber);
	    blame.put("memberCmWriterMemberCode", memberCmWriterMemberCode);
	    blame.put("memberBlamerIp", memberBlamerIp);
	    blame.put("memberBlameReasonCode", memberBlameReasonCode);
	    System.out.println(memberCmWriterMemberCode);

	    service.updateMemberCommunityBlameCnt(memberCmNumber);
	    
	    HttpSession session = request.getSession();
		session.setAttribute("user", 2009);

		int memberCode = (int) session.getAttribute("user");
		model.addAttribute("memberList",memberCode);
		
	    service.insertBlame(blame);
	    return "redirect:getMemberCommunity.do?memberCmNumber=" + memberCmNumber;
	}
	
	// 글쓰기 페이지
	@GetMapping("insertMemberCommunity.do")
	public String insertMemberCommunity() {
		return "member/insertMemberCommunity";
	}

	// 글쓰기 페이지
	@PostMapping("/insertMemberCommunity.do")
	public String insert(MemberCommunityVO vo, HttpServletRequest request) {
		
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
		return "member/updateMemberCommunity";
	}

	// 수정 기능
	@PostMapping("/updateMemberCommunity.do")
	public String update(MemberCommunityVO vo, Model model) {
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
	public String updateMemberCommunityReply(MemberCommunityVO vo, Model model) {
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