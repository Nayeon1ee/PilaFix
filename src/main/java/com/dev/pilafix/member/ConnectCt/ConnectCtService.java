package com.dev.pilafix.member.ConnectCt;

import java.util.List;
import java.util.Map;

import com.dev.pilafix.common.member.MemberVO;

public interface ConnectCtService {

	List<ConnectCtVO> searchCt(String searchKeyword);


	int connectRequest(Map<String, Object> user);

	Map<String, Integer> checkRequest(int csMemberCode, int ctCode);

}