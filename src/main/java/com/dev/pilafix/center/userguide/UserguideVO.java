package com.dev.pilafix.center.userguide;

import java.sql.Date;

public class UserguideVO {
	private int ugCode;
	private String ugType;
	private String ugName;
	private String ugContent;
	private Date ugRegistrationDate;
	private Date ugModifiedDate;
	private boolean ugOpenYN;
	

	public int getUgCode() {
		return ugCode;
	}
	public void setUgCode(int ugCode) {
		this.ugCode = ugCode;
	}
	public String getUgType() {
		return ugType;
	}
	public void setUgType(String ugType) {
		this.ugType = ugType;
	}
	public String getUgName() {
		return ugName;
	}
	public void setUgName(String ugName) {
		this.ugName = ugName;
	}
	public String getUgContent() {
		return ugContent;
	}
	public void setUgContent(String ugContent) {
		this.ugContent = ugContent;
	}
	public Date getUgRegistrationDate() {
		return ugRegistrationDate;
	}
	public void setUgRegistrationDate(Date ugRegistrationDate) {
		this.ugRegistrationDate = ugRegistrationDate;
	}
	public Date getUgModifiedDate() {
		return ugModifiedDate;
	}
	public void setUgModifiedDate(Date ugModifiedDate) {
		this.ugModifiedDate = ugModifiedDate;
	}
	public boolean isUgOpenYN() {
		return ugOpenYN;
	}
	public void setUgOpenYN(boolean ugOpenYN) {
		this.ugOpenYN = ugOpenYN;
	}
	@Override
	public String toString() {
		return "UserguideVO [ugCode=" + ugCode + ", ugType=" + ugType + ", ugName=" + ugName + ", ugContent="
				+ ugContent + ", ugRegistrationDate=" + ugRegistrationDate + ", ugModifiedDate=" + ugModifiedDate
				+ ", ugOpenYN=" + ugOpenYN + "]";
	}
	
}
