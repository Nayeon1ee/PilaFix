package com.dev.pilafix.member.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.community.MemberCommunityService;
import com.dev.pilafix.member.community.MemberCommunityVO;

@Service
public class MemberCommunityServiceImpl implements MemberCommunityService {
	
	@Autowired
	private MemberCommunityDAO dao;
	
	@Override
	public List<MemberCommunityVO> getMemberCommunityList() {
		return dao.getMemberCommunityList();
	}

	@Override
	public MemberCommunityVO getMemberCommunity(int memberCmNumber) {
		return dao.getMemberCommunity(memberCmNumber);
	}

	@Override
	public int insertMemberCommunity(MemberCommunityVO vo) {
		return dao.insertMemberCommunity(vo);
	}

	@Override
	public int updateMemberCommunity(MemberCommunityVO vo) {
		return dao.updateMemberCommunity(vo);
	}

	@Override
	public int deleteMemberCommunity(int memberCmNumber) {
		return dao.deleteMemberCommunity(memberCmNumber);
	}

	@Override
	public int updateMemberCommunityViewCnt(int memberCmViews) {
		return dao.updateMemberCommunityViewCnt(memberCmViews);
	}
	
	@Override
	public int insertBlamerIp(int memberCmNumber) {
		return dao.insertBlamerIp(memberCmNumber);
	}

	@Override
	public List<MemberCommunityVO> getBlamerIpList() {
		return dao.getBlamerIpList();
	}
}
