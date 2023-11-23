package com.dev.pilafix.member.reserve;

import java.util.List;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.common.member.CenterVO;


public interface ReservService {

	List<CenterVO> getConnCenterList(int csMemberCode);

	List<CenterLessonVO> getLessonList(int ctCode);

}
