package com.dev.pilafix.center.lesson.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.lesson.DataListVO;

@Repository
public class CenterLessonDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterLessonVO> getCenterLessonList(int ctCode) {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getCenterLessonList", ctCode);
	}
	
	public CenterLessonVO getCenterLesson(String lsCode) {
		return sqlSessionTemplate.selectOne("CenterLessonDAO.getCenterLesson", lsCode);
	}
	
	public int insertCenterLesson(CenterLessonVO vo) {
		return sqlSessionTemplate.insert("CenterLessonDAO.insertCenterLesson", vo);
	}
	
//	public int insertCenterLesson(dataListVO vo) {
//		System.out.println("과연" + vo);
//		return sqlSessionTemplate.insert("CenterLessonDAO.insertCenterLesson", vo);
//	}
	
	public int deleteCenterLesson(String lsCode) {
		return sqlSessionTemplate.delete("CenterLessonDAO.deleteCenterLesson", lsCode);
	}
	
	public List<CenterLessonVO> getTrainerCode(int centerCode) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("centerCode", centerCode);
		return sqlSessionTemplate.selectList("CenterLessonDAO.getTrainerCode", centerCode);
	}
}
