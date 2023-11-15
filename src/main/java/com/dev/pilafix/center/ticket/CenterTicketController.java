package com.dev.pilafix.center.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CenterTicketController {
	
	@Autowired
	private CenterTicketService service;
	
	@GetMapping("/getCenterTicketList.do")
	public String getCenterTicketList(Model model) {
		model.addAttribute("CenterTicketList", service.getCenterTicketList());
		return "center/center_ticket_management";
	}
	
	@GetMapping("/getCenterTicket.do")
	public String getCenterTicket(@RequestParam("seq") String tkCode, Model model) {
		model.addAttribute("centerTicket", service.getCenterTicket(tkCode));
		return "center/center_detail_ticket";
	}
	
	@PostMapping("/updateCenterTicket.do")
	public String updateCenterTicket(CenterTicketVO vo) {
		service.updateCenterTicket(vo);
		return "redirect:getCenterTicketList.do";
	}
	
	@GetMapping("/insertCenterTicket.do")
	public String insertCenterTicket() {
		return "center/center_create_ticket";
	}
	
	@PostMapping("/insertCenterTicket.do")
	public String insert(CenterTicketVO vo) {
		System.out.println(vo.toString());
		service.insertCenterTicket(vo);
		return "redirect:getCenterTicketList.do";
	}
	
	@GetMapping("/deleteCenterTicket.do")
	public String delete(String tkCode) {
		service.deleteCenterTicket(tkCode);
		return "redirect:getCenterTicketList.do";
	}
	
}
