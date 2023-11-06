package com.dev.pilafix.admin.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.info.InfoVO;

@Repository
public class InfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<InfoVO> getInfoList(){
		return sqlSessionTemplate.selectList("InfoDAO.getInfoList");
	}
	
	public InfoVO getInfo(int seq) {
	    return sqlSessionTemplate.selectOne("InfoDAO.getInfo",seq);
	}
	
	public int insertInfo(InfoVO vo) {
		return sqlSessionTemplate.insert("InfoDAO.insertInfo", vo);
	}
	
	public int updateInfo(InfoVO vo) {
		return sqlSessionTemplate.update("InfoDAO.updateInfo", vo);
	}
	
	public int deleteInfo(int seq) {
		return sqlSessionTemplate.delete("InfoDAO.deleteInfo", seq);
	}
}
