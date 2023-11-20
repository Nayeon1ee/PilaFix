package com.dev.pilafix.member.community;

import java.util.List;
import java.util.Map;

public interface MemberCommunityService {
	List<MemberCommunityVO> getMemberCommunityList();
	MemberCommunityVO getMemberCommunity(int memberCmNumber);
	int insertMemberCommunity(MemberCommunityVO vo);
	int updateMemberCommunity(MemberCommunityVO vo);
	int deleteMemberCommunity(int memberCmNumber);
	
	int updateMemberCommunityViewCnt(int memberCmNumber);
	
	List<MemberCommunityVO> getBlameList();
	int insertBlame(Map<String, Object> blame);
	
	MemberCommunityVO getMemberCommunityReply(int memberCmNumber);
	int insertMemberCommunityReply(int memberCmNumber);
}
