package com.dev.pilafix.member.ConnectCt;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.pilafix.common.member.MemberVO;


@Controller
public class ConnectCtController {
	@Autowired
	private ConnectCtService service;
	
	/**
	 * ���Ϳ���ȭ�� ��û
	 * @return
	 */
	@GetMapping("/ct.do")
	public String ct(){
		return "member_ctConnect/ctConnect.jsp";
	}

	/**
	 * ������ ���� �˻��� ��񰡼� Ű���忡 �´� ���� �˻��ؼ� ȭ�鿡 �ѷ��� 
	 * @param searchKeyword
	 * @return
	 */
	@GetMapping("/searchCt.do")
	@ResponseBody
	public List<ConnectCtVO> searchCt(String searchKeyword){
		System.out.println("ȭ�鿡�� ��Ʈ�ѷ��� �Ѿ�� �˻� Ű����" + searchKeyword);
		List<ConnectCtVO> searchCenterList = service.searchCt(searchKeyword);
		return searchCenterList;
	}
	
	@PostMapping("connectRequest.do")
	@ResponseBody
	public int connectRequest(HttpSession session,@RequestParam int ctCode){
		MemberVO member =   (MemberVO) session.getAttribute("member");
		int result = service.connectRequest(member,ctCode);
		System.out.println("#######�������� �����"+result);
		return result;
	}

}
