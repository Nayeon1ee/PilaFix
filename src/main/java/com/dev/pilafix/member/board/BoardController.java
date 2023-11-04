package com.dev.pilafix.member.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/insert.do")
	public String insertForm() {
		return "board/insertForm.jsp";
	}

	@PostMapping("/insert.do")
	public String insert(BoardVO vo) {
		service.insertBoard(vo);
		return "board/getBoard";
	}
	
	@PostMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo, Model model) {
		
		return "board/getBoard.jsp";
	}
	
	@GetMapping("/getBoard.do")
	public String getBoard(int seq, Model model) {
		model.addAttribute("board", service.getBoard(seq));
		return "board/getBoard.jsp";
	}
	

	
}
