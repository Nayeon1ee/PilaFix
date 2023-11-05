package com.dev.pilafix.center.userguide.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.userguide.UserguideService;
import com.dev.pilafix.center.userguide.UserguideVO;

@Service
public class UserguideServiceImpl implements UserguideService {

	@Autowired
	private UserguideDAO dao;
	
	@Override
	public List<UserguideVO> getUserguideList() {
		return dao.getUserguideList();
	}

	@Override
	public UserguideVO getUserguide(int ugCode) {

		System.out.println("serviceimpl getUserguide µø¿€ ");
//		UserguideVO vo = dao.getUserguide(ugCode);
//		System.out.println(vo.getUgCode());
//		System.out.println(vo.getUgName());
//		System.out.println("===========");
		
		return dao.getUserguide(ugCode);
	}

	@Override
	public int insertUserguide(UserguideVO vo) {
		return dao.insertUserguide(vo);
	}

	@Override
	public int updateUserguide(UserguideVO vo) {
		return dao.updateUserguide(vo);
	}

	@Override
	public int deleteUserguide(int ugCode) {
		return dao.deleteUserguide(ugCode);
	}

}
