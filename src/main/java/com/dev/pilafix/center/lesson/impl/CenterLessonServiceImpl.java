package com.dev.pilafix.center.lesson.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.CenterLessonService;
import com.dev.pilafix.center.lesson.CenterLessonVO;
import com.dev.pilafix.center.lesson.DataListVO;

@Service
public class CenterLessonServiceImpl implements CenterLessonService {
	
	@Autowired
	private CenterLessonDAO dao;
	
	@Override
	public List<CenterLessonVO> getCenterLessonList(int ctCode) {
		return dao.getCenterLessonList(ctCode);
	}

	@Override
	public CenterLessonVO getCenterLesson(String lsCode) {
		return dao.getCenterLesson(lsCode);
	}

	@Override
	public int insertCenterLesson(CenterLessonVO vo) {
		return dao.insertCenterLesson(vo);
	}
	
	@Override
	public int deleteCenterLesson(String lsCode) {
		return dao.deleteCenterLesson(lsCode);
	}

	@Override
	public List<CenterLessonVO> getTrainerCode(int centerCode) {
		return dao.getTrainerCode(centerCode);
	}

	@Override
	public void insertCenterLesson(List<CenterLessonVO> centerLessonList) {
		for(CenterLessonVO lesson : centerLessonList) {
			dao.insertCenterLesson(lesson);
		}
	}
}
