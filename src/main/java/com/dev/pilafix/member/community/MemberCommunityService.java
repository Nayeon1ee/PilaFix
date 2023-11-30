package com.dev.pilafix.member.community;

import java.util.List;
import java.util.Map;

import com.dev.pilafix.center.lesson.CenterLessonVO;

public interface MemberCommunityService {
	List<MemberCommunityVO> getMemberCommunityList();
	MemberCommunityVO getMemberCommunity(int memberCmNumber);
	int insertMemberCommunity(MemberCommunityVO vo);
	int updateMemberCommunity(MemberCommunityVO vo);
	int deleteMemberCommunity(int memberCmNumber);
	
	int updateMemberCommunityViewCnt(int memberCmNumber);
	int updateMemberCommunityBlameCnt(int memberCmNumber);
	
	List<MemberCommunityVO> getBlameList();
	int insertBlame(Map<String, Object> blame);
	
	List<MemberCommunityVO> getMemberCommunityReply(int memberCmNumber);
	int insertMemberCommunityReply(MemberCommunityVO vo);
	int insertMemberCommunityReplyReply(MemberCommunityVO vo);
	int deleteMemberCommunityReply(MemberCommunityVO vo);
	
}
