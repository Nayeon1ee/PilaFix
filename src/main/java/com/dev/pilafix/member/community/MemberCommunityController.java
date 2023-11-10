package com.dev.pilafix.member.community;

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
	
	@GetMapping("/insertMemberCommunity.do")
	public String insertMemberCommunity() {
		return "member_community/insertMemberCommunity.jsp";
	}
	
	@PostMapping("/insertMemberCommunity.do")
	public String insert(MemberCommunityVO vo) {
		service.insertMemberCommunity(vo);
		return "redirect:getMemberCommunityList.do";
	}
	
	@GetMapping("/updateMemberCommunity.do")
	public String updateMemberCommunity(@RequestParam("seq") Integer seq, Model model) {
		model.addAttribute("memberCommunity", service.getMemberCommunity(seq));
		return "member_community/updateMemberCommunity.jsp";
	}
	
	@PostMapping("/updateMemberCommunity.do")
	public String update(MemberCommunityVO vo, Model model) {
		service.updateMemberCommunity(vo);
		return "redirect:getMemberCommunityList.do";
	}
	
	@GetMapping("/deleteMemberCommunity.do")
	public String delete(int seq) {
		service.deleteMemberCommunity(seq);
		return "redirect:getMemberCommunityList.do";
	}
	
	@GetMapping("/getMemberCommunityList.do")
	public String getMemberCommunityList(Model model) {
		model.addAttribute("CommunityList", service.getMemberCommunityList());
		return "member_community/getMemberCommunityList.jsp";
	}
	
	@GetMapping("/getMemberCommunity.do")
	public String getMemberCommunity(@RequestParam("seq") Integer seq, Model model) {
	    // �Խñ� ��ȸ
	    MemberCommunityVO memberCommunity = service.getMemberCommunity(seq);

	    // ��ȸ�� ����
	    service.updateMemberCommunityViewCnt(seq);

	    // ����Ʈ ������Ʈ (���÷� �޼������ updateList �� ����)
	    int updatedList = service.updateMemberCommunityViewCnt(memberCommunity.getMemberCmViews());

	    model.addAttribute("memberCommunity", memberCommunity);
	    model.addAttribute("updatedList", updatedList); // ������ ����

	    return "member_community/getMemberCommunity.jsp";
	}
	
	@PostMapping("/getMemberCommunity.do")
	public String insertBlamerIp(int memberCmNumber, HttpServletRequest request) {
		String ipAddress = request.getRemoteAddr();
		service.insertBlamerIp(memberCmNumber);
		return "member_community/getMemberCommunity.jsp";
	}

}
