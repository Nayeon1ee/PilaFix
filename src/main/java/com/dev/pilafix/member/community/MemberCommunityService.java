package com.dev.pilafix.member.community;

import java.util.List;

public interface MemberCommunityService {
	List<MemberCommunityVO> getMemberCommunityList();
	MemberCommunityVO getMemberCommunity(int memberCmNumber);
	int insertMemberCommunity(MemberCommunityVO vo);
	int updateMemberCommunity(MemberCommunityVO vo);
	int deleteMemberCommunity(int seq);
}
