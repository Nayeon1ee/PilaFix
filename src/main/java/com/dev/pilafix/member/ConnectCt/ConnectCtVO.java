package com.dev.pilafix.member.ConnectCt;

public class ConnectCtVO {
	private String ctName;
	private int ctCode;
	private String ctAddress;
	private String searchKeyword;
	
	private int csMemberCode; // ȸ���ڵ� : ȸ���̸��������ȣ 2000���� ���� / ����� ������ 8000���ͽ���
	private String csName; // �̸�
	private String csPhoneNumber1; // ����ó1
	private String csPhoneNumber2; // ����ó2
	private String csPhoneNumber3; // ����ó3
	private String memberPhone; // ��ģ ����ó
	
	
	public int getCtCode() {
		return ctCode;
	}
	public void setCtCode(int ctCode) {
		this.ctCode = ctCode;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getCtAddress() {
		return ctAddress;
	}
	public void setCtAddress(String ctAddress) {
		this.ctAddress = ctAddress;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getCsMemberCode() {
		return csMemberCode;
	}
	public void setCsMemberCode(int csMemberCode) {
		this.csMemberCode = csMemberCode;
	}
	public String getCsName() {
		return csName;
	}
	public void setCsName(String csName) {
		this.csName = csName;
	}
	public String getCsPhoneNumber1() {
		return csPhoneNumber1;
	}
	public void setCsPhoneNumber1(String csPhoneNumber1) {
		this.csPhoneNumber1 = csPhoneNumber1;
	}
	public String getCsPhoneNumber2() {
		return csPhoneNumber2;
	}
	public void setCsPhoneNumber2(String csPhoneNumber2) {
		this.csPhoneNumber2 = csPhoneNumber2;
	}
	public String getCsPhoneNumber3() {
		return csPhoneNumber3;
	}
	public void setCsPhoneNumber3(String csPhoneNumber3) {
		this.csPhoneNumber3 = csPhoneNumber3;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	@Override
	public String toString() {
		return "ConnectCtVO [ctName=" + ctName + ", ctCode=" + ctCode + ", ctAddress=" + ctAddress + ", searchKeyword="
				+ searchKeyword + ", csMemberCode=" + csMemberCode + ", csName=" + csName + ", csPhoneNumber1="
				+ csPhoneNumber1 + ", csPhoneNumber2=" + csPhoneNumber2 + ", csPhoneNumber3=" + csPhoneNumber3
				+ ", memberPhone=" + memberPhone + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
