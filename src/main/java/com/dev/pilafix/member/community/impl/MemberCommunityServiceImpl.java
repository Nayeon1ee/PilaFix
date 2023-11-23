package com.dev.pilafix.member.community.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.lesson.CenterLessonVO;
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
	public int updateMemberCommunityBlameCnt(int memberCmBlameCount) {
		return dao.updateMemberCommunityBlameCnt(memberCmBlameCount);
	}
	
	@Override
	public List<MemberCommunityVO> getBlameList() {
		return dao.getBlameList();
	}
	
	@Override
	public int insertBlame(Map<String, Object> blame) {
		return dao.insertBlame(blame);
	}

	@Override
	public List<MemberCommunityVO> getMemberCommunityReply(int memberCmNumber) {
		return dao.getMemberCommunityReply(memberCmNumber);
	}

	@Override
	public int insertMemberCommunityReply(MemberCommunityVO vo) {
		return dao.insertMemberCommunityReply(vo);
	}
	
	@Override
	public int updateMemberCommunityReply(MemberCommunityVO vo) {
		return dao.updateMemberCommunityReply(vo);
	}

	@Override
	public int deleteMemberCommunityReply(MemberCommunityVO vo) {
		return dao.deleteMemberCommunityReply(vo);
	}
	
}