package com.dev.pilafix.member.attend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.attend.AttendVO;

@Repository
public class AttendDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	//test
    public List<AttendVO> getAttendListByMemberCode(int csMemberCode) {
        return sqlSessionTemplate.selectList("AttendDAO.getAttendListByMemberCode",csMemberCode);
    }
	
    
    // 출석 정보 업데이트
    public void updateAttendance(String lessonCode, String memberCode, boolean isAttended) {
        Map<String, Object> params = new HashMap<>();
        params.put("lessonCode", lessonCode);
        params.put("memberCode", memberCode);
        params.put("isAttended", isAttended);
        sqlSessionTemplate.update("AttendDAO.updateAttendance", params);
    }

}
