package com.dev.pilafix.center.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.login.CenterLoginService;
import com.dev.pilafix.common.member.CenterVO;

@Service
public class CenterLoginServiceImpl implements CenterLoginService {

	@Autowired
	private CenterLoginDAO dao;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@Override
	public CenterVO getLoginCenterCodeName(String ctId) {
		return dao.getLoginCenterCodeName(ctId);
	}

	@Override
	public CenterVO getCenterAllInfoByCtId(String ctId) {
		return dao.getCenterAllInfoByCtId(ctId);
	}

	@Override
	public CenterVO getCenterAllInfoByCode(int ctCode) {
		return dao.getCenterAllInfoByCode(ctCode);
	}

	@Override
	public boolean centerLogin(String ctId, String ctPassword) {
		String storedPassword = dao.getPasswordByCtId(ctId);
		return storedPassword != null && encoder.matches(ctPassword, storedPassword);
	}

	// 로그인하고 기본정보 가져오기
	@Override
	public CenterVO loginAndGetCenter(String ctId, String ctPassword) {
		String storedPassword = dao.getPasswordByCtId(ctId);
		if (storedPassword != null && encoder.matches(ctPassword, storedPassword)) {
			// 로그인 성공, centerVO 객체 반환
			System.out.println("비밀번호일치회원: " + ctId);
			// 로그인 시 필요한 기본 정보
			return dao.getLoginCenterCodeName(ctId);
		} else {
			// 로그인 실패
			return null;
		}
	}

	@Override
	public boolean checkPassword(int ctCode, String currentPassword) {
		CenterVO center = dao.getCenterAllInfoByCode(ctCode);
		if (center != null && center.getCtPassword() != null) {
			return encoder.matches(currentPassword, center.getCtPassword());
		} else {
			return false;
		}
	}

	@Override
	public void updatePassword(int ctCode, String newPassword) {
		String encodedNewPassword = encoder.encode(newPassword);
		dao.updatePasswordCenter(ctCode, encodedNewPassword);

	}

	@Override
	public CenterVO countForBadge(int ctCode) {
		return dao.countForBadge(ctCode);
	}

}