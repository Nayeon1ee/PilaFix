package com.dev.pilafix.admin.login.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.AdminVO;

@Repository
public class AdminLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminVO getAdminLoginInfo(String adCode) {
        return sqlSessionTemplate.selectOne("AdminLoginDAO.getAdminLoginInfo", adCode);
	}

	
	//로그인 이거사용 id조회해서 비밀번호와 맞춰보기
	public String getPasswordByAdId(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.getPasswordByAdId", adId);
	}

	//로그인 후 가져올 관리자코드, 관리자 이름
	public AdminVO getLoginInfoA(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.getLoginInfoA", adId);
	}

	//관리자 비밀번호 변경
	public void updatePasswordAdmin(String adCode, String newPassword) {
		Map<String, Object> params = new HashMap<>();
        params.put("adCode", adCode);
        params.put("newPassword", newPassword);
        sqlSessionTemplate.update("AdminLoginDAO.updatePasswordAdmin", params);
    }
	

	
	
	
	public int insertAdminRegister(AdminVO vo) {
		return sqlSessionTemplate.insert("AdminLoginDAO.insertAdminRegister", vo);
	}
	
	public int adIdCheck(String adId) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.adIdCheck",adId);
	}
	
	public AdminVO getAdminInfo(String adCode) {
        return sqlSessionTemplate.selectOne("AdminLoginDAO.getAdminInfo", adCode);
    }


	public void adminupdatePassword(String adId, String newPassword) {
		Map<String, Object> params = new HashMap<>();
        params.put("adId", adId);
        params.put("newPassword", newPassword);
        sqlSessionTemplate.update("AdminLoginDAO.adminupdatePassword", params);
	}
	
	public int adPasswordCheck(String adPassword) {
		return sqlSessionTemplate.selectOne("AdminLoginDAO.adPasswordCheck",adPassword);
	}

	
	//=================================통계==============================================
	public AdminVO getTotalMemberCount() {
		//회원,강사 수 
		
		return sqlSessionTemplate.selectOne("AdminLoginDAO.getTotalMemberCount");
	}


	public Map<String,Object> getMonthlyContractCount() {
		Map<String,Object> count = new HashMap<String, Object>();
		count.put("contractCount", sqlSessionTemplate.selectList("AdminLoginDAO.getMonthlyContractCount"));
		count.put("revokeCount", sqlSessionTemplate.selectList("AdminLoginDAO.getMonthlyRevokeCount"));
		
		return count;
	}


	public Map<String, Object> countMemberAge() {
		List<AdminVO> memberAgeCount = sqlSessionTemplate.selectList("AdminLoginDAO.countMemberAge");
		
		Map<String,Object> ageCount = new HashMap<String, Object>();
		ageCount.put("teenage", memberAgeCount.get(0));
		ageCount.put("twenty", memberAgeCount.get(1));
		ageCount.put("thirty", memberAgeCount.get(2));
		ageCount.put("fourty", memberAgeCount.get(3));
		ageCount.put("overFifty", memberAgeCount.get(4));
		
		System.out.println(ageCount.get("teenage"));
		return ageCount;
	}
	
	public Map<String,Integer> countGenterRatio(){
		AdminVO count = sqlSessionTemplate.selectOne("AdminLoginDAO.countGenterRatio");
		
		Map<String,Integer> genderCount = new HashMap<String, Integer>();
		genderCount.put("men", count.getMenCount());
		genderCount.put("women", count.getWomenCount());
		
		return genderCount;
	}
	
	public Map<String,Integer> centerRegionCount(){
		AdminVO count = sqlSessionTemplate.selectOne("AdminLoginDAO.centerRegionCount");
		
		Map<String,Integer> regionCount = new HashMap<String, Integer>();
		regionCount.put("seoul", count.getSeoulCount());
		regionCount.put("gg", count.getGgCount());
		regionCount.put("gw", count.getGwCount());
		regionCount.put("cc", count.getCcCount());
		regionCount.put("jl", count.getJlCount());
		regionCount.put("gs", count.getGsCount());
		regionCount.put("jj", count.getJjCount());
		
		return regionCount;
	}
	


	
}
