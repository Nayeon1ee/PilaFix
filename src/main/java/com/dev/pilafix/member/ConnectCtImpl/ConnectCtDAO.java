package com.dev.pilafix.member.ConnectCtImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.ConnectCt.ConnectCtVO;

@Repository
public class ConnectCtDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ConnectCtVO> searchCt(String searchKeyword) {
		System.out.println("DAO");
		return sqlSessionTemplate.selectList("ConnectCtDAO.searchCtList",searchKeyword);
	}



	public int connectRequest(Map<String, Object> user) {
		return sqlSessionTemplate.insert("ConnectCtDAO.connectRequest", user);
	}

	

}
