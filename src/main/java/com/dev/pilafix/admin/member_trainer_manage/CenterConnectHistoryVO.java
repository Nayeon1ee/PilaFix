package com.dev.pilafix.admin.member_trainer_manage;

import java.sql.Date;

public class CenterConnectHistoryVO {
	private String chCode;
	private int memberCode;
	private String centerCode;
	private Date chDatetime;
	private boolean chCurrentConnectionYN;
	private String disconnection_date;
	private String centerName;
	
	public String getChCode() {
		return chCode;
	}
	public void setChCode(String chCode) {
		this.chCode = chCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getCenterCode() {
		return centerCode;
	}
	public void setCenterCode(String centerCode) {
		this.centerCode = centerCode;
	}
	public Date getChDatetime() {
		return chDatetime;
	}
	public void setChDatetime(Date chDatetime) {
		this.chDatetime = chDatetime;
	}
	public boolean isChCurrentConnectionYN() {
		return chCurrentConnectionYN;
	}
	public void setChCurrentConnectionYN(boolean chCurrentConnectionYN) {
		this.chCurrentConnectionYN = chCurrentConnectionYN;
	}
	public String getDisconnection_date() {
		return disconnection_date;
	}
	public void setDisconnection_date(String disconnection_date) {
		this.disconnection_date = disconnection_date;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	@Override
	public String toString() {
		return "CenterConnectHistoryVO [chCode=" + chCode + ", memberCode=" + memberCode + ", centerCode=" + centerCode
				+ ", chDatetime=" + chDatetime + ", chCurrentConnectionYN=" + chCurrentConnectionYN
				+ ", disconnection_date=" + disconnection_date + ", centerName=" + centerName + "]";
	}
	
	
	

}
