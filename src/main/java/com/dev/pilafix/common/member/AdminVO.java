package com.dev.pilafix.common.member;

public class AdminVO {
	
	private String adCode;
	private String adName;
	private String adContact1;
	private String adContact2;
	private String adContact3;
	private String adId;
	private String adPassword;
	private String accountUsageYn;
	private String roleCode;
	
	//통계
	private int memberCount;
	private int trainerCount;
	private int centerCount;
	private int memberCountCumulated;
	private int trainerCountCumulated;
	private int centerCountCumulated;

	private String ageGroup;
	private int ageCount;
	
	private int menCount;
	private int womenCount;
	
	//지역별 계약 수
	private int seoulCount; //서울
	private int ggCount; //경기
	private int gwCount; //강원
	private int ccCount; //충청
	private int jlCount; //전라도
	private int gsCount; //경상도
	private int jjCount; //제주도

	
	
	public int getCcCount() {
		return ccCount;
	}
	public void setCcCount(int ccCount) {
		this.ccCount = ccCount;
	}
	public int getSeoulCount() {
		return seoulCount;
	}
	public void setSeoulCount(int seoulCount) {
		this.seoulCount = seoulCount;
	}
	public int getGgCount() {
		return ggCount;
	}
	public void setGgCount(int ggCount) {
		this.ggCount = ggCount;
	}
	public int getGwCount() {
		return gwCount;
	}
	public void setGwCount(int gwCount) {
		this.gwCount = gwCount;
	}
	public int getJlCount() {
		return jlCount;
	}
	public void setJlCount(int jlCount) {
		this.jlCount = jlCount;
	}
	public int getGsCount() {
		return gsCount;
	}
	public void setGsCount(int gsCount) {
		this.gsCount = gsCount;
	}
	public int getJjCount() {
		return jjCount;
	}
	public void setJjCount(int jjCount) {
		this.jjCount = jjCount;
	}
	public int getMenCount() {
		return menCount;
	}
	public void setMenCount(int menCount) {
		this.menCount = menCount;
	}
	public int getWomenCount() {
		return womenCount;
	}
	public void setWomenCount(int womenCount) {
		this.womenCount = womenCount;
	}
	public String getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}
	public int getAgeCount() {
		return ageCount;
	}
	public void setAgeCount(int ageCount) {
		this.ageCount = ageCount;
	}
	public int getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}
	public int getTrainerCount() {
		return trainerCount;
	}
	public void setTrainerCount(int trainerCount) {
		this.trainerCount = trainerCount;
	}
	public int getCenterCount() {
		return centerCount;
	}
	public void setCenterCount(int centerCount) {
		this.centerCount = centerCount;
	}
	public int getMemberCountCumulated() {
		return memberCountCumulated;
	}
	public void setMemberCountCumulated(int memberCountCumulated) {
		this.memberCountCumulated = memberCountCumulated;
	}
	public int getTrainerCountCumulated() {
		return trainerCountCumulated;
	}
	public void setTrainerCountCumulated(int trainerCountCumulated) {
		this.trainerCountCumulated = trainerCountCumulated;
	}
	public int getCenterCountCumulated() {
		return centerCountCumulated;
	}
	public void setCenterCountCumulated(int centerCountCumulated) {
		this.centerCountCumulated = centerCountCumulated;
	}
	public String getAdCode() {
		return adCode;
	}
	public void setAdCode(String adCode) {
		this.adCode = adCode;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdContact1() {
		return adContact1;
	}
	public void setAdContact1(String adContact1) {
		this.adContact1 = adContact1;
	}
	public String getAdContact2() {
		return adContact2;
	}
	public void setAdContact2(String adContact2) {
		this.adContact2 = adContact2;
	}
	public String getAdContact3() {
		return adContact3;
	}
	public void setAdContact3(String adContact3) {
		this.adContact3 = adContact3;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPassword() {
		return adPassword;
	}
	public void setAdPassword(String adPassword) {
		this.adPassword = adPassword;
	}
	public String getAccountUsageYn() {
		return accountUsageYn;
	}
	public void setAccountUsageYn(String accountUsageYn) {
		this.accountUsageYn = accountUsageYn;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	@Override
	public String toString() {
		return "AdminVO [adCode=" + adCode + ", adName=" + adName + ", adContact1=" + adContact1 + ", adContact2="
				+ adContact2 + ", adContact3=" + adContact3 + ", adId=" + adId + ", adPassword=" + adPassword
				+ ", accountUsageYn=" + accountUsageYn + ", roleCode=" + roleCode + ", memberCount=" + memberCount
				+ ", trainerCount=" + trainerCount + ", centerCount=" + centerCount + ", memberCountCumulated="
				+ memberCountCumulated + ", trainerCountCumulated=" + trainerCountCumulated + ", centerCountCumulated="
				+ centerCountCumulated + ", ageGroup=" + ageGroup + ", ageCount=" + ageCount + ", menCount=" + menCount
				+ ", womenCount=" + womenCount + ", seoulCount=" + seoulCount + ", ggCount=" + ggCount + ", gwCount="
				+ gwCount + ", ccCount=" + ccCount + ", jlCount=" + jlCount + ", gsCount=" + gsCount + ", jjCount="
				+ jjCount + "]";
	}
	
	
	
	
	

}