package com.dev.pilafix.admin.center_manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CenterController {
	@Autowired
	private CenterService service;

	@GetMapping("/insertCenter.do")
	public String insertForm() {
		return "admin_centermanage/insertCenter.jsp";
	}

	@PostMapping("/insertCenter.do")
	public String insert(CenterVO vo) {
		service.insertCenter(vo);
		return "redirect:getCenterList.do";
	}

	@GetMapping("/getCenterList.do")
	public String getCenterList(Model model) {
		model.addAttribute("centerList", service.getCenterList());
		return "admin_centermanage/getCenterList.jsp";
	}

	@GetMapping("/getCenter.do")
	public String getCenter(int ctCode, Model model) {
		model.addAttribute("center", service.getCenter(ctCode));
		return "admin_centermanage/getCenter.jsp";
	}


	/**
	 * Json 테스트 샘플 
	 * @return
	 */
	@RequestMapping("/jsTest.do")
	@ResponseBody
	public List<CenterVO> jsTest() {
		List<CenterVO> boardList = service.getCenterList();
		return boardList;
	}
	
	/**
	 * 아이디 체크 
	 * 
	 * @param ctId
	 * @return
	 */
	@RequestMapping("/ctIdCheck.do")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String ctId) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.ctIdCheck(ctId);
		map.put("cnt", count);

		return map;
	}
}
