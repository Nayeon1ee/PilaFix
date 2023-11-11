package com.dev.pilafix.member.ConnectCtImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.ConnectCt.ConnectCtVO;

@Repository
public class ConnectCtDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ConnectCtVO> searchCt(String searchKeyword) {
		System.out.println("DAOµµ´Þ");
		return sqlSessionTemplate.selectList("ConnectCtDAO.searchCtList",searchKeyword);
	}

}
