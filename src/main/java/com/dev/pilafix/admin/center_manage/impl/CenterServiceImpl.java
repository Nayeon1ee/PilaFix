package com.dev.pilafix.admin.center_manage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.center_manage.CenterService;
import com.dev.pilafix.admin.center_manage.CenterVO;

@Service
public class CenterServiceImpl implements CenterService {
	
	@Autowired
	private CenterDAO dao;

	@Override
	public List<CenterVO> getCenterList() {
		return dao.getCenterList();
	}

	@Override
	public CenterVO getCenter(int ctCode) {
		return dao.getCenter(ctCode);
	}

	@Override
	public int insertCenter(CenterVO vo) {
		return dao.insertCenter(vo);
	}

	@Override
	public int updateCenter(CenterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCenter(int ctCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ctIdCheck(String ctId) {
		return dao.ctIdCheck(ctId);
	}

}
