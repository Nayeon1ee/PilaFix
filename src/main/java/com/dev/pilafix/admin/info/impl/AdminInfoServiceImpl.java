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
	public List<AdminInfoVO> getAdminInfoList() {
		return dao.getAdminInfoList();
	}

	@Override
	public AdminInfoVO getInfo(int seq) {
		return dao.getAdminInfo(seq);
	}

	@Override
	public int insertAdminInfo(AdminInfoVO vo) {
		return dao.insertAdminInfo(vo);
	}

	@Override
	public int updateAdminInfo(AdminInfoVO vo) {
		return dao.updateAdminInfo(vo);
	}

	@Override
	public int deleteAdminInfo(int seq) {
		return dao.deleteAdminInfo(seq);
	}

	@Override
	public int updateAdminInfoViewCnt(int cnt) {
		return dao.updateAdminInfoViewCnt(cnt);
	}

}
