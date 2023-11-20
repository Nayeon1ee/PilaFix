package com.dev.pilafix.member.ConnectCt;

import java.util.List;

import com.dev.pilafix.common.member.MemberVO;

public interface ConnectCtService {

	List<ConnectCtVO> searchCt(String searchKeyword);

	int connectRequest(MemberVO member, int ctCode);

}