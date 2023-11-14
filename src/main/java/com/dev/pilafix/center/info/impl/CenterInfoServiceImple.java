package com.dev.pilafix.center.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.center.info.CenterInfoService;

@Service
public class CenterInfoServiceImple implements CenterInfoService {
	
	@Autowired
	private CenterInfoDAO dao;
	
	@Override
	public List<CenterInfoVO> getCenterInfoList() {
		return dao.getCenterInfoList();
	}

	@Override
	public CenterInfoVO getCenterInfo(int seq) {
		return dao.getCenterInfo(seq);
	}

	@Override
	public int insertCenterInfo(CenterInfoVO vo) {
		return dao.insertCenterInfo(vo);
	}

	@Override
	public int updateCenterInfo(CenterInfoVO vo) {
		return dao.updateCenterInfo(vo);
	}

	@Override
	public int deleteCenterInfo(int seq) {
		return dao.deleteCenterInfo(seq);
	}

	@Override
	public int updateCenterInfoViewCnt(int cnt) {
		return dao.updateCenterInfoViewCnt(cnt);
	}

}
