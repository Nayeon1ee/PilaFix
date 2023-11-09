package com.dev.pilafix.admin.terms;

import java.sql.Date;

public class TermsVO {
	private int tmCode;//6자리
	private String tmName;
	private String tmDetail;
	private Date tmRegdate; //DEFAULT NOW()
	private Date tmModifiedDate;//DEFAULT NOW()
	private boolean tmRequiredYn;//필수면 Y 선택이면 N
	private boolean tmOpenYn;
	public int getTmCode() {
		return tmCode;
	}
	public void setTmCode(int tmCode) {
		this.tmCode = tmCode;
	}
	public String getTmName() {
		return tmName;
	}
	public void setTmName(String tmName) {
		this.tmName = tmName;
	}
	public String getTmDetail() {
		return tmDetail;
	}
	public void setTmDetail(String tmDetail) {
		this.tmDetail = tmDetail;
	}
	public Date getTmRegdate() {
		return tmRegdate;
	}
	public void setTmRegdate(Date tmRegdate) {
		this.tmRegdate = tmRegdate;
	}
	public Date getTmModifiedDate() {
		return tmModifiedDate;
	}
	public void setTmModifiedDate(Date tmModifiedDate) {
		this.tmModifiedDate = tmModifiedDate;
	}
	public boolean isTmRequiredYn() {
		return tmRequiredYn;
	}
	public void setTmRequiredYn(boolean tmRequiredYn) {
		this.tmRequiredYn = tmRequiredYn;
	}
	public boolean isTmOpenYn() {
		return tmOpenYn;
	}
	public void setTmOpenYn(boolean tmOpenYn) {
		this.tmOpenYn = tmOpenYn;
	}
	@Override
	public String toString() {
		return "BoardVO [tmCode=" + tmCode + ", tmName=" + tmName + ", tmDetail=" + tmDetail + ", tmRegdate="
				+ tmRegdate + ", tmModifiedDate=" + tmModifiedDate + ", tmRequiredYn=" + tmRequiredYn + ", tmOpenYn="
				+ tmOpenYn + "]";
	}

	
}