package com.dev.pilafix.admin.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.info.InfoService;
import com.dev.pilafix.admin.info.InfoVO;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private InfoDAO dao;

	@Override
	public List<InfoVO> getInfoList() {
		return dao.getInfoList();
	}

	@Override
	public InfoVO getInfo(int seq) {
		return dao.getInfo(seq);
	}

	@Override
	public int insertInfo(InfoVO vo) {
		return dao.insertInfo(vo);
	}

	@Override
	public int updateInfo(InfoVO vo) {
		return dao.updateInfo(vo);
	}

	@Override
	public int deleteInfo(int seq) {
		return dao.deleteInfo(seq);
	}

}
