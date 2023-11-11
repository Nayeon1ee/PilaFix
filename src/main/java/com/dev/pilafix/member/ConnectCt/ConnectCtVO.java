package com.dev.pilafix.member.ConnectCt;

public class ConnectCtVO {
	private String ctName;
	private String ctAddress;
	private String searchKeyword;
	
	
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
	@Override
	public String toString() {
		return "ConnectCtVO [ctName=" + ctName + ", ctAddress=" + ctAddress + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
	
	
	

}
