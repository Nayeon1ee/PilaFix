package com.dev.pilafix.member.community;

import java.util.List;

public interface MemberCommunityService {
	List<MemberCommunityVO> getMemberCommunityList();
	MemberCommunityVO getMemberCommunity(int memberCmNumber);
	int insertMemberCommunity(MemberCommunityVO vo);
	int updateMemberCommunity(MemberCommunityVO vo);
	int deleteMemberCommunity(int seq);
	int updateMemberCommunityViewCnt(int memberCmNumber);
	List<MemberCommunityVO> getBlameList();
	int insertBlame(int memberCmNumber, String ipAddress);
	MemberCommunityVO getMemberCommunityReply(int memberCmNumber);
	int insertMemberCommunityReply(int memberCmNumber);
}
