package com.dev.pilafix.member.reserve;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.userguide.UserguideVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;


public interface ReservService {

	List<CenterVO> getConnCenterList(int csMemberCode);

	List<CenterLessonVO> getLessonList(int ctCode, Date today);

	Map<String, Object> getReservDetail(String lsCode, int csMemberCode, int ctCode);

}
