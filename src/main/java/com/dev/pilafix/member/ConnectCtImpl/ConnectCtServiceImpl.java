package com.dev.pilafix.member.ConnectCtImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.ConnectCt.ConnectCtService;
import com.dev.pilafix.member.ConnectCt.ConnectCtVO;

@Service
public class ConnectCtServiceImpl implements ConnectCtService {
	@Autowired
	private ConnectCtDAO dao;
	
	@Override
	public List<ConnectCtVO> searchCt(String searchKeyword) {
		return dao.searchCt(searchKeyword);
	}



	@Override
	public int connectRequest(Map<String, Object> user) {
		return dao.connectRequest(user);
	}
	

}