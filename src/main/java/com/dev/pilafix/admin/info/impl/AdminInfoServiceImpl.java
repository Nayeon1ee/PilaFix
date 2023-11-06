package com.dev.pilafix.admin.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.info.AdminInfoService;
import com.dev.pilafix.admin.info.AdminInfoVO;

@Service
public class AdminInfoServiceImpl implements AdminInfoService {
	
	@Autowired
	private AdminInfoDAO dao;

	@Override
	public List<AdminInfoVO> getInfoList() {
		return dao.getInfoList();
	}

	@Override
	public AdminInfoVO getInfo(int seq) {
		return dao.getInfo(seq);
	}

	@Override
	public int insertInfo(AdminInfoVO vo) {
		return dao.insertInfo(vo);
	}

	@Override
	public int updateInfo(AdminInfoVO vo) {
		return dao.updateInfo(vo);
	}

	@Override
	public int deleteInfo(int seq) {
		return dao.deleteInfo(seq);
	}

}
