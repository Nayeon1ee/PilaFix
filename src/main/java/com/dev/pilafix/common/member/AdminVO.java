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
		return "AdminLoginVO [adCode=" + adCode + ", adName=" + adName + ", adContact1=" + adContact1 + ", adContact2="
				+ adContact2 + ", adContact3=" + adContact3 + ", adId=" + adId + ", adPassword=" + adPassword
				+ ", accountUsageYn=" + accountUsageYn + ", roleCode=" + roleCode + "]";
	}

}