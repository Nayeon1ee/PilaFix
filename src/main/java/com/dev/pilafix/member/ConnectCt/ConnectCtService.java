package com.dev.pilafix.member.ConnectCt;

import java.util.List;

import com.dev.pilafix.member.login.MemberLoginVO;

public interface ConnectCtService {

	List<ConnectCtVO> searchCt(String searchKeyword);

	int connectRequest(MemberLoginVO member, int ctCode);

}
