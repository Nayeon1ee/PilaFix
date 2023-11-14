package com.dev.pilafix.member.ConnectCtImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.ConnectCt.ConnectCtService;
import com.dev.pilafix.member.ConnectCt.ConnectCtVO;
import com.dev.pilafix.member.login.MemberLoginVO;

@Service
public class ConnectCtServiceImpl implements ConnectCtService {
	@Autowired
	private ConnectCtDAO dao;
	
	@Override
	public List<ConnectCtVO> searchCt(String searchKeyword) {
		return dao.searchCt(searchKeyword);
	}


	@Override
	public int connectRequest(MemberLoginVO member, int ctCode) {
		return dao.connectRequest(member,ctCode);
	}
	

}
