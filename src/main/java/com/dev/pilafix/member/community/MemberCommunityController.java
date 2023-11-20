package com.dev.pilafix.member.community;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	@GetMapping("getMemberCommunityList.do")
	public String getMemberCommunityList(Model model) {
		model.addAttribute("getMemberCommunityList", service.getMemberCommunityList());
		return "member/getMemberCommunityList";
	}

	@GetMapping("getMemberCommunity.do")
	public String getMemberCommunity(@RequestParam("memberCmNumber") Integer memberCmNumber, Model model) {
		// 게시글 조회
		MemberCommunityVO memberCommunity = service.getMemberCommunity(memberCmNumber);

		// 조회수 증가
		service.updateMemberCommunityViewCnt(memberCmNumber);
		int updatedList = service.updateMemberCommunityViewCnt(memberCommunity.getMemberCmViews());
		
		model.addAttribute("memberCommunity", memberCommunity);
		model.addAttribute("updatedList", updatedList);
		model.addAttribute("blameList", service.getBlameList());
		return "member/getMemberCommunity";
	}
	
	@PostMapping("getMemberCommunity.do")
	public String insertMemberCommunity(MemberCommunityVO vo) {
	    service.insertMemberCommunity(vo);
	    return "redirect:getMemberCommunityList";
	}

	@PostMapping("insertBlamer.do") 
	public String insertBlamer(@RequestParam("memberCmNumber") int memberCmNumber, String  memberTargetWriterMemberCode,HttpServletRequest request) {
	    String memberBlamerIp = request.getRemoteAddr();
	    System.out.println("local ip : " + memberBlamerIp);
	    System.out.println("code : " + memberTargetWriterMemberCode);
	    System.out.println("memberCmNumber : " + memberCmNumber);
	    
	    Map<String, Object> blame = new HashMap<String, Object>();
	    blame.put("memberCmNumber", memberCmNumber);
	    blame.put("memberTargetWriterMemberCode", memberTargetWriterMemberCode);
	    blame.put("memberBlamerIp", memberBlamerIp);
	    
	    System.out.println("[Controller] "+blame.get("memberCmWriterMemberCode"));
	    System.out.println("[Controller] "+blame.get("memberTargetWriterMemberCode"));
	    System.out.println("[Controller] "+blame.get("memberCmNumber"));

	    service.insertBlame(blame);
	    
	    return "redirect:getMemberCommunity.do?memberCmNumber=" + memberCmNumber;
	}
	
	@GetMapping("insertMemberCommunity.do")
	public String insertMemberCommunity() {
		return "member/insertMemberCommunity";
	}

	@PostMapping("/insertMemberCommunity.do")
	public String insert(MemberCommunityVO vo) {
		service.insertMemberCommunity(vo);
		return "redirect:getMemberCommunityList.do";
	}

	@GetMapping("updateMemberCommunity.do")
	public String updateMemberCommunity(@RequestParam("memberCmNumber") Integer memberCmNumber, Model model) {
		model.addAttribute("memberCommunity", service.getMemberCommunity(memberCmNumber));
		return "member/updateMemberCommunity";
	}

	@PostMapping("/updateMemberCommunity.do")
	public String update(MemberCommunityVO vo, Model model) {
		service.updateMemberCommunity(vo);
		return "redirect:getMemberCommunityList.do";
	}

	@GetMapping("/deleteMemberCommunity.do")
	public String delete(int memberCmNumber) {
		service.deleteMemberCommunity(memberCmNumber);
		return "redirect:getMemberCommunityList.do";
	}

	@GetMapping("/getMemberCommunityReply.do")
	public String getMemberCommunityReply(@RequestParam("memberCmNumber") Integer memberCmNumber, Model model) {
		model.addAttribute("memberCommunityReply", service.getMemberCommunityReply(memberCmNumber));
		return "member/getMemberCommunity";
	}

	@PostMapping("/insertMemberCommunityReply.do")
	public String insertMemberCommunityReply(@RequestParam("memberCmNumber") int memberCmNumber) {
		service.insertMemberCommunityReply(memberCmNumber);
		return "redirect:getMemberCommunity.do?seq=" + memberCmNumber;
	}

}
