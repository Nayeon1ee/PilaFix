package com.dev.pilafix.center.lesson.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.center.lesson.CenterLessonVO;

@Repository
public class CenterLessonDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterLessonVO> getCenterLessonList() {
		return sqlSessionTemplate.selectList("CenterLessonDAO.getCenterLessonList");
	}
	
	public CenterLessonVO getCenterLesson(String lsCode) {
		return sqlSessionTemplate.selectOne("CenterLessonDAO.getCenterLesson", lsCode);
	}
	
	public int insertCenterLesson(CenterLessonVO vo) {
		return sqlSessionTemplate.insert("CenterLessonDAO.insertCenterLesson", vo);
	}
	
	public int deleteCenterLesson(String lsCode) {
		return sqlSessionTemplate.delete("CenterLessonDAO.deleteCenterLesson", lsCode);
	}
	
	public int updateCenterLesson(CenterLessonVO vo) {
		return sqlSessionTemplate.update("CenterLessonDAO.updateCenterLesson", vo);
	}
}
