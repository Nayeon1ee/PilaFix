package com.dev.pilafix.admin.terms;

import java.sql.Timestamp;

public class TermsVO {
	private String tmCode;
	private String tmName;
	private String tmDetail;
	private Timestamp tmRegdate;
	private Timestamp tmModifiedDate;
	private boolean tmRequiredYn;
	private boolean tmOpenYn;
	public String getTmCode() {
		return tmCode;
	}
	public void setTmCode(String tmCode) {
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
	public Timestamp getTmRegdate() {
		return tmRegdate;
	}
	public void setTmRegdate(Timestamp tmRegdate) {
		this.tmRegdate = tmRegdate;
	}
	public Timestamp getTmModifiedDate() {
		return tmModifiedDate;
	}
	public void setTmModifiedDate(Timestamp tmModifiedDate) {
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