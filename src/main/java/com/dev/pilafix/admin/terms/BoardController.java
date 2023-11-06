package com.dev.pilafix.admin.terms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;

	@GetMapping("/getBoardList.do")
	public String getBoardList() {
		return "terms/getBoardList";
	}

	@GetMapping("/boardRegister.do")
	public String boardRegisterForm() {
		return "terms/boardRegister.jsp";
	}

	@GetMapping("/updateBoard.do")
	public String updateBoard() {
		return "terms/updateBoard.jsp";
	}
}
