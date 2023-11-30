package com.dev.pilafix.member.mypage;

import java.util.List;

public interface MemberMypageService {

	List<MemberMypageVO> getMyPaymentInfo(int csMemberCode);

}
