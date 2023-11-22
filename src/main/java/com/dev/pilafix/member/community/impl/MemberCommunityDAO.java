package com.dev.pilafix.member.community.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.community.MemberCommunityVO;


@Repository
public class MemberCommunityDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberCommunityVO> getMemberCommunityList(){
		return sqlSessionTemplate.selectList("MemberCommunityDAO.getMemberCommunityList");
	}
	
	public MemberCommunityVO getMemberCommunity(int memberCmNumber) {
	    return sqlSessionTemplate.selectOne("MemberCommunityDAO.getMemberCommunity",memberCmNumber);
	}
	
	public int insertMemberCommunity(MemberCommunityVO vo) {
		return sqlSessionTemplate.insert("MemberCommunityDAO.insertMemberCommunity", vo);
	}
	
	public int updateMemberCommunity(MemberCommunityVO vo) {
		return sqlSessionTemplate.update("MemberCommunityDAO.updateMemberCommunity", vo);
	}
	
	public int deleteMemberCommunity(int memberCmNumber) {
		return sqlSessionTemplate.delete("MemberCommunityDAO.deleteMemberCommunity", memberCmNumber);
	}

	public int updateMemberCommunityViewCnt(int memberCmViews) {
		return sqlSessionTemplate.update("MemberCommunityDAO.updateMemberCommunityViewCnt", memberCmViews);
	}
	
	public int updateMemberCommunityBlameCnt(int memberCmBlameCount) {
		return sqlSessionTemplate.update("MemberCommunityDAO.updateMemberCommunityBlameCnt", memberCmBlameCount);
	}
		
	public List<MemberCommunityVO> getBlameList() {
		return sqlSessionTemplate.selectList("MemberCommunityDAO.getBlameList");
	}
	
	public int insertBlame(Map<String, Object> blame) {
		return sqlSessionTemplate.insert("MemberCommunityDAO.insertBlame", blame);
	}
	
	public List<MemberCommunityVO> getMemberCommunityReply(int memberCmNumber) {
		System.out.println("DAO" + memberCmNumber);
	    return sqlSessionTemplate.selectList("MemberCommunityDAO.getMemberCommunityReply", memberCmNumber);
	}
	
	public int insertMemberCommunityReply(MemberCommunityVO vo) {
		return sqlSessionTemplate.insert("MemberCommunityDAO.insertMemberCommunityReply", vo);
	}
	
	public int updateMemberCommunityReply(MemberCommunityVO vo) {
		return sqlSessionTemplate.update("MemberCommunityDAO.updateMemberCommunityReply", vo);
	}
	
	public int deleteMemberCommunityReply(MemberCommunityVO vo) {
		return sqlSessionTemplate.delete("MemberCommunityDAO.deleteMemberCommunityReply", vo);
	}

}