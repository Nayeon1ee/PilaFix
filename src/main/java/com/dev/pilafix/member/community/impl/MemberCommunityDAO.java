package com.dev.pilafix.member.community.impl;

import java.util.List;

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
	
	public int insertBlamerIp(int memberCmNumber) {
		return sqlSessionTemplate.insert("MemberCommunityDAO.insertBlamerIp", memberCmNumber);
	}
	
	public List<MemberCommunityVO> getBlamerIpList() {
		return sqlSessionTemplate.selectList("MemberCommunityDAO.getBlamerIpList");
	}
	
}
